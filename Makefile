DOCKER_COMPOSE=docker-compose

.PHONY: all ps logs up restart rebuild recreate stop down

all: ps

ps: 
	$(DOCKER_COMPOSE) ps

logs:
	$(DOCKER_COMPOSE) logs -f --tail 100

up:
	$(DOCKER_COMPOSE) up -d
	sleep 2
	$(DOCKER_COMPOSE) ps

restart:
	$(DOCKER_COMPOSE) restart
	skeep 2
	$(DOCKER_COMPOSE) ps

rebuild:
	$(DOCKER_COMPOSE) up -d --build
	sleep 2
	$(DOCKER_COMPOSE) ps

recreate: 
	$(DOCKER_COMPOSE) up -d --build --force-recreate
	sleep 2
	$(DOCKER_COMPOSE) ps 

stop:
	$(DOCKER_COMPOSE) stop

down:
	$(DOCKER_COMPOSE) down
