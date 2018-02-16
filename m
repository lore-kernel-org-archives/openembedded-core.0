Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 01801605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 16:55:54 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id t74so4310651wme.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Feb 2018 08:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JcjTidH+QWF/GfuG86XscBtY+QESga1r53dO9KponSw=;
	b=TPCOzRrvwmT7uWwT0FRXyIYgD6i8tEZYRTdtTz5+EWuCvOhAgf1As/frC+0pOq/maN
	69wC49n7kvDEwG27cGRl+UaYG9teysQO4Q18u/YSI4pyZ19RZ+xkPrx808xycnE2Yz4M
	TRwMXtaPtqDvliXgC7cf1TYkq/ZcTsvmrhr6YGF5QrXDoxz7Zk6AZpclIJohyW1NQyHI
	NSSN7Qftv4HF9l/3+JMep5TLw/3N4xZqUW860UwGV57U2fBnRtFUvThreBxLLlJ08S3Z
	l/TPRyGgy49nwTkbw/dzMqUEJjnjkuaMD+udqN2J4xlkfKTn3XKvKGcUex7IQlXnioGn
	MFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JcjTidH+QWF/GfuG86XscBtY+QESga1r53dO9KponSw=;
	b=JJY4+CydMLOt57slsxfo/U6fOf7+YP+TuxWPE7piM1/TyD/9RrkJe0HO59TLDJPoUp
	3YbLiJIx7x00TUKEWDCIR5FEoxUJ1x6qYThCeSp7HUiTEXYgsw5JfUR6ilNDR47Jw4LA
	zEpp5t277yyZRbXoDzaJKWgDCYgW0QdSNfbD8c17/rihHJoVkyONAZlnuaNgwa1rd+fu
	7HXovnvJPjxjp/ddGIlK5y3lMNpetGyqcdVM7VaXaec+yNmvMfLwxeIVgr2bEdP7LUgl
	nC3dbv1kyUgNKt5/eGkfow35GUnsJyvnGQVBGt2/4VKVF/h/Bn7XD/FTQfAIMld8cYsa
	fUWg==
X-Gm-Message-State: APf1xPDTg2Kc0OpoDort6aOExmX1BWiNPRc1k5s+JuNXGH/bMIsnOS/g
	zkSJVCtMUuHdU2Ozgyl/JcGln5m4ubhFB+7AlYAxoQ==
X-Google-Smtp-Source: AH8x227Z5EmDE5zOSsqHSoPIfRZn7f4cCSXrG/cnw4YL12r8QoAXWSoG6w6nc3sc2kzAFLGq5EQr/6tajC/AePdUFgc=
X-Received: by 10.28.87.1 with SMTP id l1mr5008086wmb.32.1518800155385; Fri,
	16 Feb 2018 08:55:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Fri, 16 Feb 2018 08:55:54 -0800 (PST)
In-Reply-To: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
References: <20180216095628.15414-1-alexander.kanavin@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Feb 2018 17:55:54 +0100
Message-ID: <CA+chaQeEdY8tjp4PMsMCfZNoi2NwGqZoOcOqme9Ju-Ext6FkaQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: update to latest master
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Feb 2018 16:55:55 -0000
Content-Type: multipart/alternative; boundary="001a11442cd4bf280a05655737b7"

--001a11442cd4bf280a05655737b7
Content-Type: text/plain; charset="UTF-8"

Something is a bit wrong with this version:

$ du -hs update-rc.d/0.7-r5/pseudo/*
72K     update-rc.d/0.7-r5/pseudo/files.db
16K     update-rc.d/0.7-r5/pseudo/logs.db
0       update-rc.d/0.7-r5/pseudo/pseudo.lock
31G     update-rc.d/0.7-r5/pseudo/pseudo.log
4.0K    update-rc.d/0.7-r5/pseudo/pseudo.pid
0       update-rc.d/0.7-r5/pseudo/pseudo.socket

$ grep -c "tried to close client 0 (highest is 1)"
update-rc.d/0.7-r5/pseudo/pseudo.log
579655922

All pseudo processes I've seen on various servers which were building with
this change included got stuck until disk space run out..


On Fri, Feb 16, 2018 at 10:56 AM, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> Dropped patches:
> 0001-Use-epoll-API-on-Linux.patch replaced by
> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=
> 0a3e435085046f535074f498a3de75a7704fb14c
> (also add --enable-epoll to configure options)
>
> b6b68db896f9963558334aff7fca61adde4ec10f.patch merged upstream
>
> efe0be279901006f939cd357ccee47b651c786da.patch merged upstream
>
> fastopreply.patch replaced by
> http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=
> 449c234d3030328fb997b309511bb54598848a05
>
> toomanyfiles.patch rebased
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../pseudo/files/0001-Use-epoll-API-on-Linux.patch | 292
> ---------------------
>  .../b6b68db896f9963558334aff7fca61adde4ec10f.patch |  48 ----
>  .../efe0be279901006f939cd357ccee47b651c786da.patch |  99 -------
>  .../pseudo/files/fastopreply.patch                 |  76 ------
>  .../pseudo/files/toomanyfiles.patch                |  44 ++--
>  meta/recipes-devtools/pseudo/pseudo.inc            |   2 +-
>  meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |  16 --
>  meta/recipes-devtools/pseudo/pseudo_git.bb         |  11 +-
>  8 files changed, 34 insertions(+), 554 deletions(-)
>  delete mode 100644 meta/recipes-devtools/pseudo/
> files/0001-Use-epoll-API-on-Linux.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/
> b6b68db896f9963558334aff7fca61adde4ec10f.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/
> efe0be279901006f939cd357ccee47b651c786da.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/files/fastopreply.patch
>  delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> deleted file mode 100644
> index 42557b17a7f..00000000000
> --- a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> +++ /dev/null
> @@ -1,292 +0,0 @@
> -From 9e407e0be01695e7b927f5820ade87ee9602c248 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 15 Sep 2017 17:00:14 +0300
> -Subject: [PATCH] Use epoll API on Linux
> -
> -Also a couple of other modifications due to epoll having
> -a different approach to how the working set of fds is defined
> -and used:
> -1) open_client() returns an index into the array of clients
> -2) close_client() has a protection against being called twice
> -with the same client (which would mess up the active_clients
> -counter)
> -
> -Upstream-Status: Submitted [Seebs CC'd by email]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -
> ----
> - enums/exit_status.in |   3 +
> - pseudo_server.c      | 189 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++-
> - 2 files changed, 190 insertions(+), 2 deletions(-)
> -
> -diff --git a/enums/exit_status.in b/enums/exit_status.in
> -index 6be44d3..88f94cd 100644
> ---- a/enums/exit_status.in
> -+++ b/enums/exit_status.in
> -@@ -18,3 +18,6 @@ listen_fd, "server loop had no valid listen fd"
> - pseudo_loaded, "server couldn't get out of pseudo environment"
> - pseudo_prefix, "couldn't get valid pseudo prefix"
> - pseudo_invocation, "invalid server command arguments"
> -+epoll_create, "epoll_create() failed"
> -+epoll_ctl, "epoll_ctl() failed"
> -+
> -diff --git a/pseudo_server.c b/pseudo_server.c
> -index ff16efd..14d34de 100644
> ---- a/pseudo_server.c
> -+++ b/pseudo_server.c
> -@@ -40,6 +40,12 @@
> - #include "pseudo_client.h"
> - #include "pseudo_db.h"
> -
> -+// This has to come after pseudo includes, as that's where PSEUDO_PORT
> defines are
> -+#ifdef PSEUDO_PORT_LINUX
> -+#include <sys/epoll.h>
> -+#endif
> -+
> -+
> - static int listen_fd = -1;
> -
> - typedef struct {
> -@@ -59,6 +65,7 @@ static int active_clients = 0, highest_client = 0,
> max_clients = 0;
> -
> - #define LOOP_DELAY 2
> - #define DEFAULT_PSEUDO_SERVER_TIMEOUT 30
> -+#define EPOLL_MAX_EVENTS 10
> - int pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
> - static int die_peacefully = 0;
> - static int die_forcefully = 0;
> -@@ -80,6 +87,9 @@ quit_now(int signal) {
> - static int messages = 0, responses = 0;
> - static struct timeval message_time = { .tv_sec = 0 };
> -
> -+#ifdef PSEUDO_PORT_LINUX
> -+static void pseudo_server_loop_epoll(void);
> -+#endif
> - static void pseudo_server_loop(void);
> -
> - /* helper function to make a directory, just like mkdir -p.
> -@@ -369,12 +379,16 @@ pseudo_server_start(int daemonize) {
> -                       kill(ppid, SIGUSR1);
> -               }
> -       }
> -+#ifdef PSEUDO_PORT_LINUX
> -+      pseudo_server_loop_epoll();
> -+#else
> -       pseudo_server_loop();
> -+#endif
> -       return 0;
> - }
> -
> - /* mess with internal tables as needed */
> --static void
> -+static unsigned int
> - open_client(int fd) {
> -       pseudo_client_t *new_clients;
> -       int i;
> -@@ -390,7 +404,7 @@ open_client(int fd) {
> -                       ++active_clients;
> -                       if (i > highest_client)
> -                               highest_client = i;
> --                      return;
> -+                      return i;
> -               }
> -       }
> -
> -@@ -414,9 +428,11 @@ open_client(int fd) {
> -
> -               max_clients += 16;
> -               ++active_clients;
> -+              return max_clients - 16;
> -       } else {
> -               pseudo_diag("error allocating new client, fd %d\n", fd);
> -               close(fd);
> -+              return 0;
> -       }
> - }
> -
> -@@ -433,6 +449,10 @@ close_client(int client) {
> -                       client, highest_client);
> -               return;
> -       }
> -+      if (clients[client].fd == -1) {
> -+              pseudo_debug(PDBGF_SERVER, "client %d already closed\n",
> client);
> -+              return;
> -+      }
> -       close(clients[client].fd);
> -       clients[client].fd = -1;
> -       free(clients[client].tag);
> -@@ -566,6 +586,171 @@ serve_client(int i) {
> -       }
> - }
> -
> -+#ifdef PSEUDO_PORT_LINUX
> -+static void pseudo_server_loop_epoll(void)
> -+{
> -+      struct sockaddr_un client;
> -+      socklen_t len;
> -+        int i;
> -+        int rc;
> -+        int fd;
> -+      int timeout;
> -+      struct epoll_event ev, events[EPOLL_MAX_EVENTS];
> -+      int loop_timeout = pseudo_server_timeout;
> -+
> -+      clients = malloc(16 * sizeof(*clients));
> -+
> -+      clients[0].fd = listen_fd;
> -+      clients[0].pid = getpid();
> -+
> -+      for (i = 1; i < 16; ++i) {
> -+              clients[i].fd = -1;
> -+              clients[i].pid = 0;
> -+              clients[i].tag = NULL;
> -+              clients[i].program = NULL;
> -+      }
> -+
> -+      active_clients = 1;
> -+      max_clients = 16;
> -+      highest_client = 0;
> -+
> -+      pseudo_debug(PDBGF_SERVER, "server loop started.\n");
> -+      if (listen_fd < 0) {
> -+              pseudo_diag("got into loop with no valid listen fd.\n");
> -+              exit(PSEUDO_EXIT_LISTEN_FD);
> -+      }
> -+
> -+      timeout = LOOP_DELAY * 1000;
> -+
> -+      int epollfd = epoll_create1(0);
> -+      if (epollfd == -1) {
> -+              pseudo_diag("epoll_create1() failed.\n");
> -+              exit(PSEUDO_EXIT_EPOLL_CREATE);
> -+      }
> -+      ev.events = EPOLLIN;
> -+      ev.data.u64 = 0;
> -+      if (epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[0].fd, &ev) == -1) {
> -+              pseudo_diag("epoll_ctl() failed with listening socket.\n");
> -+              exit(PSEUDO_EXIT_EPOLL_CTL);
> -+      }
> -+
> -+      pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server started (pid
> %d)", getpid());
> -+
> -+        for (;;) {
> -+              rc = epoll_wait(epollfd, events, EPOLL_MAX_EVENTS,
> timeout);
> -+              if (rc == 0 || (rc == -1 && errno == EINTR)) {
> -+                      /* If there's no clients, start timing out.  If
> there
> -+                       * are active clients, never time out.
> -+                       */
> -+                      if (active_clients == 1) {
> -+                              loop_timeout -= LOOP_DELAY;
> -+                                /* maybe flush database to disk */
> -+                                pdb_maybe_backup();
> -+                              if (loop_timeout <= 0) {
> -+                                      pseudo_debug(PDBGF_SERVER, "no
> more clients, got bored.\n");
> -+                                      die_peacefully = 1;
> -+                              } else {
> -+                                      /* display this if not exiting */
> -+                                      pseudo_debug(PDBGF_SERVER |
> PDBGF_BENCHMARK, "%d messages handled in %.4f seconds, %d responses\n",
> -+                                              messages,
> -+                                              (double)
> message_time.tv_sec +
> -+                                              (double)
> message_time.tv_usec / 1000000.0,
> -+                                                responses);
> -+                              }
> -+                      }
> -+              } else if (rc > 0) {
> -+                      loop_timeout = pseudo_server_timeout;
> -+                      for (i = 0; i < rc; ++i) {
> -+                              if (clients[events[i].data.u64].fd ==
> listen_fd) {
> -+                                      if (!die_forcefully) {
> -+                                              len = sizeof(client);
> -+                                              if ((fd =
> accept(listen_fd, (struct sockaddr *) &client, &len)) != -1) {
> -+                                              /* Don't allow clients to
> end up on fd 2, because glibc's
> -+                                               * malloc debug uses that
> fd unconditionally.
> -+                                               */
> -+                                                      if (fd == 2) {
> -+                                                              int newfd
> = fcntl(fd, F_DUPFD, 3);
> -+                                                              close(fd);
> -+                                                              fd = newfd;
> -+                                                      }
> -+
> pseudo_debug(PDBGF_SERVER, "new client fd %d\n", fd);
> -+                                                      /* A new client
> implicitly cancels any
> -+                                                       * previous
> shutdown request, or a
> -+                                                       * shutdown for
> lack of clients.
> -+                                                       */
> -+
> pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
> -+                                                      die_peacefully = 0;
> -+
> -+                                                      ev.events =
> EPOLLIN;
> -+                                                      ev.data.u64 =
> open_client(fd);
> -+                                                      if (ev.data.u64 !=
> 0 && epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[ev.data.u64].fd, &ev) == -1)
> {
> -+
> pseudo_diag("epoll_ctl() failed with accepted socket.\n");
> -+
> exit(PSEUDO_EXIT_EPOLL_CTL);
> -+                                                      }
> -+                                              } else if (errno ==
> EMFILE) {
> -+
> pseudo_debug(PDBGF_SERVER, "Hit max open files, dropping a client.\n");
> -+                                                      /* In theory there
> is a potential race here where if we close a client,
> -+                                                         it may have
> sent us a fastop message which we don't act upon.
> -+                                                         If we don't
> close a filehandle we'll loop indefinitely thought.
> -+                                                         Only close one
> per loop iteration in the interests of caution */
> -+                                                      for (int j = 1; j
> <= highest_client; ++j) {
> -+                                                              if
> (clients[j].fd != -1) {
> -+
> close_client(j);
> -+
> break;
> -+                                                              }
> -+                                                      }
> -+                                              }
> -+                                      }
> -+                              } else {
> -+                                      struct timeval tv1, tv2;
> -+                                        int rc;
> -+                                      gettimeofday(&tv1, NULL);
> -+                                      rc = serve_client(events[i].data.
> u64);
> -+                                      gettimeofday(&tv2, NULL);
> -+                                      ++messages;
> -+                                        if (rc == 0)
> -+                                                ++responses;
> -+                                      message_time.tv_sec += (tv2.tv_sec
> - tv1.tv_sec);
> -+                                      message_time.tv_usec +=
> (tv2.tv_usec - tv1.tv_usec);
> -+                                      if (message_time.tv_usec < 0) {
> -+                                              message_time.tv_usec +=
> 1000000;
> -+                                              --message_time.tv_sec;
> -+                                      } else while (message_time.tv_usec
> > 1000000) {
> -+                                              message_time.tv_usec -=
> 1000000;
> -+                                              ++message_time.tv_sec;
> -+                                      }
> -+                              }
> -+                              if (die_forcefully)
> -+                                      break;
> -+                      }
> -+                      pseudo_debug(PDBGF_SERVER, "server loop complete
> [%d clients left]\n", active_clients);
> -+              } else {
> -+                      pseudo_diag("epoll_wait failed: %s\n",
> strerror(errno));
> -+                      break;
> -+              }
> -+              if (die_peacefully || die_forcefully) {
> -+                      pseudo_debug(PDBGF_SERVER, "quitting.\n");
> -+                      pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK,
> "server %d exiting: handled %d messages in %.4f seconds\n",
> -+                              getpid(), messages,
> -+                              (double) message_time.tv_sec +
> -+                              (double) message_time.tv_usec / 1000000.0);
> -+                      pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL,
> "server %d exiting: handled %d messages in %.4f seconds",
> -+                              getpid(), messages,
> -+                              (double) message_time.tv_sec +
> -+                              (double) message_time.tv_usec / 1000000.0);
> -+                      /* and at this point, we'll start refusing
> connections */
> -+                      close(clients[0].fd);
> -+                      /* This is a good place to insert a delay for
> -+                       * debugging race conditions during startup. */
> -+                      /* usleep(300000); */
> -+                      exit(0);
> -+              }
> -+      }
> -+
> -+}
> -+
> -+#endif
> -+
> - /* get clients, handle messages, shut down.
> -  * This doesn't actually do any work, it just calls a ton of things which
> -  * do work.
> ---
> -2.14.1
> -
> diff --git a/meta/recipes-devtools/pseudo/files/
> b6b68db896f9963558334aff7fca61adde4ec10f.patch b/meta/recipes-devtools/
> pseudo/files/b6b68db896f9963558334aff7fca61adde4ec10f.patch
> deleted file mode 100644
> index 3045a3b736f..00000000000
> --- a/meta/recipes-devtools/pseudo/files/b6b68db896f9963558334aff7fca61
> adde4ec10f.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From b6b68db896f9963558334aff7fca61adde4ec10f Mon Sep 17 00:00:00 2001
> -From: Seebs <seebs@seebs.net>
> -Date: Thu, 13 Apr 2017 18:12:01 -0500
> -Subject: Prevent bash from segfaulting when unloading pseudo
> -
> -bash's extremely fancy internal awareness of how the environment looks
> -means that, if you directly call the underlying libc "unsetenv" on
> -a variable, bash can end up trying to access a null pointer. Fixing
> -this generically is actually rather hard; you can't really avoid
> -writing to environ on fork() or popen(), even if you change all
> -execv*() functions to use the execv*e() variants. So for now, instead
> -of unsetting the variable, set it to an empty string.
> -
> -Thanks to Saur in IRC for spotting this and helping debug it.
> -
> -Signed-off-by: Seebs <seebs@seebs.net>
> -
> -Upstream-Status: Backport
> -
> -diff --git a/ChangeLog.txt b/ChangeLog.txt
> -index a2d30e9..8ba1ffa 100644
> ---- a/ChangeLog.txt
> -+++ b/ChangeLog.txt
> -@@ -1,3 +1,8 @@
> -+2017-04-13:
> -+      * (seebs) don't unset LD_PRELOAD or the like, because if you
> -+        do that, bash can segfault because it "knows" how many
> -+        fields are in environ.
> -+
> - 2017-02-24:
> -       * (seebs) import posix_acl_default fix from Anton Gerasimov
> -         <anton@advancedtelematic.com>
> -diff --git a/pseudo_util.c b/pseudo_util.c
> -index 172990b..6a1fac2 100644
> ---- a/pseudo_util.c
> -+++ b/pseudo_util.c
> -@@ -844,7 +844,7 @@ void pseudo_dropenv() {
> -               if (ld_preload && strlen(ld_preload)) {
> -                       SETENV(PRELINK_LIBRARIES, ld_preload, 1);
> -               } else {
> --                      UNSETENV(PRELINK_LIBRARIES);
> -+                      SETENV(PRELINK_LIBRARIES, "", 1);
> -               }
> -       }
> - }
> ---
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-devtools/pseudo/files/
> efe0be279901006f939cd357ccee47b651c786da.patch b/meta/recipes-devtools/
> pseudo/files/efe0be279901006f939cd357ccee47b651c786da.patch
> deleted file mode 100644
> index 64fc58c4fe6..00000000000
> --- a/meta/recipes-devtools/pseudo/files/efe0be279901006f939cd357ccee47
> b651c786da.patch
> +++ /dev/null
> @@ -1,99 +0,0 @@
> -From efe0be279901006f939cd357ccee47b651c786da Mon Sep 17 00:00:00 2001
> -From: Seebs <seebs@seebs.net>
> -Date: Fri, 24 Feb 2017 12:47:38 -0600
> -Subject: Don't try to record 0-length posix_acl_default xattrs
> -
> -Based on a submission from Anton Gerasimov <anton@advancedtelematic.com>
> -
> -On some systems, with some kernel configs, "cp -a" apparently tries to
> -set an empty ACL list, with a valid header but no contents, which causes
> -strange and mysterious behavior later if we actually create such an entry.
> -So filter that out, also sanity-check a couple of other things.
> -
> -Signed-off-by: Seebs <seebs@seebs.net>
> -
> -Upstream-Status: Backport
> -
> -diff --git a/ChangeLog.txt b/ChangeLog.txt
> -index ae2a6e9..a2d30e9 100644
> ---- a/ChangeLog.txt
> -+++ b/ChangeLog.txt
> -@@ -1,3 +1,6 @@
> -+2017-02-24:
> -+      * (seebs) import posix_acl_default fix from Anton Gerasimov
> -+        <anton@advancedtelematic.com>
> - 2017-02-01:
> -    * (seebs) handle xattr deletion slightly more carefully.
> -    * (seebs) tag this as 1.8.2
> -diff --git a/ports/linux/xattr/pseudo_wrappers.c
> b/ports/linux/xattr/pseudo_wrappers.c
> -index 46bc053..d69d53e 100644
> ---- a/ports/linux/xattr/pseudo_wrappers.c
> -+++ b/ports/linux/xattr/pseudo_wrappers.c
> -@@ -62,9 +62,9 @@ static int
> - posix_permissions(const acl_header *header, int entries, int *extra, int
> *mode) {
> -       int acl_seen = 0;
> -       if (le32(header->version) != 2) {
> --              pseudo_diag("Fatal: ACL support no available for header
> version %d.\n",
> -+              pseudo_diag("Fatal: ACL support not available for header
> version %d.\n",
> -                       le32(header->version));
> --              return 1;
> -+              return -1;
> -       }
> -       *mode = 0;
> -       *extra = 0;
> -@@ -140,12 +140,38 @@ static int shared_setxattr(const char *path, int
> fd, const char *name, const voi
> -       pseudo_debug(PDBGF_XATTR, "setxattr(%s [fd %d], %s => '%.*s')\n",
> -               path ? path : "<no path>", fd, name, (int) size, (char *)
> value);
> -
> -+      /* Filter out erroneous sizes for POSIX ACL
> -+       *  see posix_acl_xattr_count in include/linux/posix_acl_xattr.h
> of Linux source code */
> -+      /* I don't think there's any posix_acl_* values that aren't in
> this format */
> -+      if (!strncmp(name, "system.posix_acl_", 17)) {
> -+              // ACL is corrupt, issue an error
> -+              if(size < sizeof(acl_header) || (size -
> sizeof(acl_header)) % sizeof(acl_entry) != 0) {
> -+                      pseudo_debug(PDBGF_XATTR, "invalid data size for
> %s: %d\n",
> -+                              name, (int) size);
> -+                      errno = EINVAL;
> -+                      return -1;
> -+              }
> -+
> -+              // ACL is empty, do nothing
> -+              if((size - sizeof(acl_header)) / sizeof(acl_entry) == 0) {
> -+                      /* on some systems, "cp -a" will attempt to clone
> the
> -+                       * posix_acl_default entry for a directory (which
> would specify
> -+                       * default ACLs for new files in that directory),
> but if the
> -+                       * original was empty, we get a header but no
> entries. With
> -+                       * real xattr, that ends up being silently
> discarded, apparently,
> -+                       * so we discard it too.
> -+                       */
> -+                      pseudo_debug(PDBGF_XATTR, "0-length ACL entry
> %s.\n", name);
> -+                      return 0;
> -+              }
> -+      }
> -       /* this may be a plain chmod */
> -       if (!strcmp(name, "system.posix_acl_access")) {
> -               int extra;
> -               int mode;
> -               int entries = (size - sizeof(acl_header)) /
> sizeof(acl_entry);
> --              if (!posix_permissions(value, entries, &extra, &mode)) {
> -+              int res = posix_permissions(value, entries, &extra, &mode);
> -+              if (res == 0) {
> -                       pseudo_debug(PDBGF_XATTR, "posix_acl_access
> translated to mode %04o. Remaining attribute(s): %d.\n",
> -                               mode, extra);
> -                       buf.st_mode = mode;
> -@@ -164,8 +190,12 @@ static int shared_setxattr(const char *path, int fd,
> const char *name, const voi
> -                       if (!extra) {
> -                               return 0;
> -                       }
> -+              } else if (res == -1) {
> -+                      errno = EOPNOTSUPP;
> -+                      return -1;
> -               }
> -       }
> -+
> -       if (!strcmp(name, "user.pseudo_data")) {
> -               pseudo_debug(PDBGF_XATTR | PDBGF_XATTRDB,
> "user.pseudo_data xattribute does not get to go in database.\n");
> -               return -1;
> ---
> -cgit v0.10.2
> -
> diff --git a/meta/recipes-devtools/pseudo/files/fastopreply.patch
> b/meta/recipes-devtools/pseudo/files/fastopreply.patch
> deleted file mode 100644
> index 904c2d04e6a..00000000000
> --- a/meta/recipes-devtools/pseudo/files/fastopreply.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -Ensure FASTOP messages get an ACK reply so that the client can be sure
> the server
> -recieved them. This means if connections are terminated, data isn't lost.
> -
> -RP 2017/9/22
> -
> -Upstream-Status: Submitted
> -
> -Index: pseudo-1.8.2/pseudo_client.c
> -===================================================================
> ---- pseudo-1.8.2.orig/pseudo_client.c
> -+++ pseudo-1.8.2/pseudo_client.c
> -@@ -1331,21 +1331,19 @@ pseudo_client_request(pseudo_msg_t *msg,
> -                * indicating a successful send.
> -                */
> -               pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE, "sent!\n");
> --              if (msg->type != PSEUDO_MSG_FASTOP) {
> --                      response = pseudo_msg_receive(connect_fd);
> --                      if (!response) {
> --                              pseudo_debug(PDBGF_CLIENT, "expected
> response did not occur; retrying\n");
> -+              response = pseudo_msg_receive(connect_fd);
> -+              if (!response) {
> -+                      pseudo_debug(PDBGF_CLIENT, "expected response did
> not occur; retrying\n");
> -+              } else {
> -+                      if (response->type != PSEUDO_MSG_ACK) {
> -+                              pseudo_debug(PDBGF_CLIENT, "got non-ack
> response %d\n", response->type);
> -+                              return 0;
> -+                      } else if (msg->type != PSEUDO_MSG_FASTOP) {
> -+                              pseudo_debug(PDBGF_CLIENT | PDBGF_VERBOSE,
> "got response type %d\n", response->type);
> -+                              return response;
> -                       } else {
> --                              if (response->type != PSEUDO_MSG_ACK) {
> --                                      pseudo_debug(PDBGF_CLIENT, "got
> non-ack response %d\n", response->type);
> --                                      return 0;
> --                              } else {
> --                                      pseudo_debug(PDBGF_CLIENT |
> PDBGF_VERBOSE, "got response type %d\n", response->type);
> --                                      return response;
> --                              }
> -+                              return 0;
> -                       }
> --              } else {
> --                      return 0;
> -               }
> -       }
> -       pseudo_diag("pseudo: server connection persistently failed,
> aborting.\n");
> -Index: pseudo-1.8.2/pseudo_server.c
> -===================================================================
> ---- pseudo-1.8.2.orig/pseudo_server.c
> -+++ pseudo-1.8.2/pseudo_server.c
> -@@ -463,6 +463,11 @@ close_client(int client) {
> -                       --highest_client;
> - }
> -
> -+static pseudo_msg_t server_fastop_reply = {
> -+        .type = PSEUDO_MSG_ACK,
> -+        .op = OP_NONE,
> -+};
> -+
> - /* Actually process a request.
> -  */
> - static int
> -@@ -515,8 +520,14 @@ serve_client(int i) {
> -                * pseudo_server_response.
> -                */
> -               if (in->type != PSEUDO_MSG_SHUTDOWN) {
> --                        if (in->type == PSEUDO_MSG_FASTOP)
> -+                        if (in->type == PSEUDO_MSG_FASTOP) {
> -                                 send_response = 0;
> -+                                /* For fastops we reply now to say we
> got the data */
> -+                                if ((rc = pseudo_msg_send(clients[i].fd,
> &server_fastop_reply, 0, NULL)) != 0) {
> -+                                            pseudo_debug(PDBGF_SERVER,
> "failed to send fastop ack to client %d [%d]: %d (%s)\n",
> -+                                                    i, (int)
> clients[i].pid, rc, strerror(errno));
> -+                                }
> -+                        }
> -                       /* most messages don't need these, but xattr may */
> -                       response_path = 0;
> -                       response_pathlen = -1;
> diff --git a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> index b085a4505d5..bda7e4b2026 100644
> --- a/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> +++ b/meta/recipes-devtools/pseudo/files/toomanyfiles.patch
> @@ -1,3 +1,8 @@
> +From b0b25fbc041a148d1de09f5a6503cd95973ec77c Mon Sep 17 00:00:00 2001
> +From: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Date: Tue, 25 Apr 2017 15:25:54 +0100
> +Subject: [PATCH 3/3] pseudo: Handle too many files deadlock
> +
>  Currently if we max out the maximum number of files, pseudo can deadlock,
> unable to
>  accept new connections yet unable to move forward and unblock the other
> processes
>  waiting either.
> @@ -11,19 +16,23 @@ RP
>
>  Upstream-Status: Submitted [Peter is aware of the issue]
>
> -Index: pseudo-1.8.2/pseudo_server.c
> -===================================================================
> ---- pseudo-1.8.2.orig/pseudo_server.c
> -+++ pseudo-1.8.2/pseudo_server.c
> -@@ -581,6 +581,7 @@ pseudo_server_loop(void) {
> -       int rc;
> -       int fd;
> -       int loop_timeout = pseudo_server_timeout;
> +---
> + pseudo_server.c | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff --git a/pseudo_server.c b/pseudo_server.c
> +index dac3258..15a3e8f 100644
> +--- a/pseudo_server.c
> ++++ b/pseudo_server.c
> +@@ -802,6 +802,7 @@ pseudo_server_loop(void) {
> +       struct sigaction eat_usr2 = {
> +               .sa_handler = set_do_list_clients
> +       };
>  +      int hitmaxfiles;
>
>         clients = malloc(16 * sizeof(*clients));
>
> -@@ -597,6 +598,7 @@ pseudo_server_loop(void) {
> +@@ -820,6 +821,7 @@ pseudo_server_loop(void) {
>         active_clients = 1;
>         max_clients = 16;
>         highest_client = 0;
> @@ -31,9 +40,9 @@ Index: pseudo-1.8.2/pseudo_server.c
>
>         pseudo_debug(PDBGF_SERVER, "server loop started.\n");
>         if (listen_fd < 0) {
> -@@ -663,10 +665,15 @@ pseudo_server_loop(void) {
> -                                               message_time.tv_usec -=
> 1000000;
> -                                               ++message_time.tv_sec;
> +@@ -878,10 +880,15 @@ pseudo_server_loop(void) {
> +                                       } else {
> +                                               serve_client(i);
>                                         }
>  +                              } else if (hitmaxfiles) {
>  +                                      /* Only close one per loop
> iteration in the interests of caution */
> @@ -47,13 +56,16 @@ Index: pseudo-1.8.2/pseudo_server.c
>                         if (!die_forcefully &&
>                             (FD_ISSET(clients[0].fd, &events) ||
>                              FD_ISSET(clients[0].fd, &reads))) {
> -@@ -688,6 +698,9 @@ pseudo_server_loop(void) {
> -                                          */
> -                                         pseudo_server_timeout =
> DEFAULT_PSEUDO_SERVER_TIMEOUT;
> -                                         die_peacefully = 0;
> +@@ -903,6 +910,9 @@ pseudo_server_loop(void) {
> +                                        */
> +                                       pseudo_server_timeout =
> DEFAULT_PSEUDO_SERVER_TIMEOUT;
> +                                       die_peacefully = 0;
>  +                              } else if (errno == EMFILE) {
>  +                                      hitmaxfiles = 1;
>  +                                      pseudo_debug(PDBGF_SERVER, "Hit
> max open files, dropping a client.\n");
>                                 }
>                         }
>                         pseudo_debug(PDBGF_SERVER, "server loop complete
> [%d clients left]\n", active_clients);
> +--
> +2.15.1
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo.inc
> b/meta/recipes-devtools/pseudo/pseudo.inc
> index 18ce9f92596..fb742522f50 100644
> --- a/meta/recipes-devtools/pseudo/pseudo.inc
> +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> @@ -26,7 +26,7 @@ do_configure () {
>  NO32LIBS ??= "1"
>  NO32LIBS_class-nativesdk = "1"
>
> -PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
> +PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback
> --enable-epoll"
>
>  # Compile for the local machine arch...
>  do_compile () {
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> deleted file mode 100644
> index 73ef57231a0..00000000000
> --- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -require pseudo.inc
> -
> -SRC_URI = "http://downloads.yoctoproject.org/releases/
> pseudo/${BPN}-${PV}.tar.bz2 \
> -           file://0001-configure-Prune-PIE-flags.patch \
> -           file://fallback-passwd \
> -           file://fallback-group \
> -           file://moreretries.patch \
> -           file://efe0be279901006f939cd357ccee47b651c786da.patch \
> -           file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
> -           file://fastopreply.patch \
> -           file://toomanyfiles.patch \
> -           file://0001-Use-epoll-API-on-Linux.patch \
> -           "
> -
> -SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
> -SRC_URI[sha256sum] = "ceb456bd47770a37ca20784a91d715
> c5a7601e07e26ab11b0c77e9203ed3d196"
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb
> b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 42c7b2ea572..ac9bd079f8b 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -1,15 +1,14 @@
>  require pseudo.inc
>
> -SRCREV = "02168305b0a19f981ffe857f36eb256ba8810b77"
> -PV = "1.8.2+git${SRCPV}"
> -
> -DEFAULT_PREFERENCE = "-1"
> -
>  SRC_URI = "git://git.yoctoproject.org/pseudo \
>             file://0001-configure-Prune-PIE-flags.patch \
>             file://fallback-passwd \
>             file://fallback-group \
> -           file://moreretries.patch"
> +           file://moreretries.patch \
> +           file://toomanyfiles.patch \
> +           "
>
> +SRCREV = "b6a015aa91d7ab84c2f5466f3b5704f501129cbc"
>  S = "${WORKDIR}/git"
> +PV = "1.9.0+git${SRCPV}"
>
> --
> 2.15.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11442cd4bf280a05655737b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5Tb21ldGhpbmcgaXMgYSBiaXQgd3Jvbmcgd2l0aCB0aGlzIHZl
cnNpb246PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4kIGR1IC1ocyB1cGRhdGUtcmMuZC8wLjct
cjUvcHNldWRvLyo8L2Rpdj48ZGl2PjcyS8KgIMKgIMKgdXBkYXRlLXJjLmQvMC43LXI1L3BzZXVk
by9maWxlcy5kYjwvZGl2PjxkaXY+MTZLwqAgwqAgwqB1cGRhdGUtcmMuZC8wLjctcjUvcHNldWRv
L2xvZ3MuZGI8L2Rpdj48ZGl2PjDCoCDCoCDCoCDCoHVwZGF0ZS1yYy5kLzAuNy1yNS9wc2V1ZG8v
cHNldWRvLmxvY2s8L2Rpdj48ZGl2PjMxR8KgIMKgIMKgdXBkYXRlLXJjLmQvMC43LXI1L3BzZXVk
by9wc2V1ZG8ubG9nPC9kaXY+PGRpdj40LjBLwqAgwqAgdXBkYXRlLXJjLmQvMC43LXI1L3BzZXVk
by9wc2V1ZG8ucGlkPC9kaXY+PGRpdj4wwqAgwqAgwqAgwqB1cGRhdGUtcmMuZC8wLjctcjUvcHNl
dWRvL3BzZXVkby5zb2NrZXQ8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+JCBncmVwIC1j
ICZxdW90O3RyaWVkIHRvIGNsb3NlIGNsaWVudCAwIChoaWdoZXN0IGlzIDEpJnF1b3Q7IHVwZGF0
ZS1yYy5kLzAuNy1yNS9wc2V1ZG8vcHNldWRvLmxvZzwvZGl2PjwvZGl2PjxkaXY+NTc5NjU1OTIy
PGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+QWxsIHBzZXVkbyBwcm9jZXNzZXMgSSYjMzk7
dmUgc2VlbiBvbiB2YXJpb3VzIHNlcnZlcnMgd2hpY2ggd2VyZSBidWlsZGluZyB3aXRoIHRoaXMg
Y2hhbmdlIGluY2x1ZGVkIGdvdCBzdHVjayB1bnRpbCBkaXNrIHNwYWNlIHJ1biBvdXQuLjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjwvZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiPk9uIEZyaSwgRmViIDE2LCAyMDE4IGF0IDEwOjU2IEFNLCBBbGV4
YW5kZXIgS2FuYXZpbiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzphbGV4YW5k
ZXIua2FuYXZpbkBsaW51eC5pbnRlbC5jb20iIHRhcmdldD0iX2JsYW5rIj5hbGV4YW5kZXIua2Fu
YXZpbkBsaW51eC5pbnRlbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3Rl
IGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0
OjFweCAjY2NjIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPkRyb3BwZWQgcGF0Y2hlczo8YnI+DQow
MDAxLVVzZS1lcG9sbC1BUEktb24tTGludXguPHdicj5wYXRjaCByZXBsYWNlZCBieTxicj4NCjxh
IGhyZWY9Imh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL3BzZXVkby9j
b21taXQvP2lkPTBhM2U0MzUwODUwNDZmNTM1MDc0ZjQ5OGEzZGU3NWE3NzA0ZmIxNGMiIHJlbD0i
bm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy88
d2JyPmNnaXQvY2dpdC5jZ2kvcHNldWRvL2NvbW1pdC8/PHdicj5pZD08d2JyPjBhM2U0MzUwODUw
NDZmNTM1MDc0ZjQ5OGEzZGU3NTx3YnI+YTc3MDRmYjE0YzwvYT48YnI+DQooYWxzbyBhZGQgLS1l
bmFibGUtZXBvbGwgdG8gY29uZmlndXJlIG9wdGlvbnMpPGJyPg0KPGJyPg0KYjZiNjhkYjg5NmY5
OTYzNTU4MzM0YWZmN2ZjYTYxPHdicj5hZGRlNGVjMTBmLnBhdGNoIG1lcmdlZCB1cHN0cmVhbTxi
cj4NCjxicj4NCmVmZTBiZTI3OTkwMTAwNmY5MzljZDM1N2NjZWU0Nzx3YnI+YjY1MWM3ODZkYS5w
YXRjaCBtZXJnZWQgdXBzdHJlYW08YnI+DQo8YnI+DQpmYXN0b3ByZXBseS5wYXRjaCByZXBsYWNl
ZCBieTxicj4NCjxhIGhyZWY9Imh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQu
Y2dpL3BzZXVkby9jb21taXQvP2lkPTQ0OWMyMzRkMzAzMDMyOGZiOTk3YjMwOTUxMWJiNTQ1OTg4
NDhhMDUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6Ly9naXQueW9jdG9w
cm9qZWN0Lm9yZy88d2JyPmNnaXQvY2dpdC5jZ2kvcHNldWRvL2NvbW1pdC8/PHdicj5pZD08d2Jy
PjQ0OWMyMzRkMzAzMDMyOGZiOTk3YjMwOTUxMWJiNTx3YnI+NDU5ODg0OGEwNTwvYT48YnI+DQo8
YnI+DQp0b29tYW55ZmlsZXMucGF0Y2ggcmViYXNlZDxicj4NCjxicj4NClNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRlciBLYW5hdmluICZsdDs8YSBocmVmPSJtYWlsdG86YWxleGFuZGVyLmthbmF2aW5A
bGludXguaW50ZWwuY29tIj5hbGV4YW5kZXIua2FuYXZpbkBsaW51eC48d2JyPmludGVsLmNvbTwv
YT4mZ3Q7PGJyPg0KLS0tPGJyPg0KwqAuLi4vcHNldWRvL2ZpbGVzLzAwMDEtVXNlLTx3YnI+ZXBv
bGwtQVBJLW9uLUxpbnV4LnBhdGNoIHwgMjkyIC0tLS0tLS0tLS0tLS0tLS0tLS0tLTxicj4NCsKg
Li4uLzx3YnI+YjZiNjhkYjg5NmY5OTYzNTU4MzM0YWZmN2ZjYTYxPHdicj5hZGRlNGVjMTBmLnBh
dGNoIHzCoCA0OCAtLS0tPGJyPg0KwqAuLi4vPHdicj5lZmUwYmUyNzk5MDEwMDZmOTM5Y2QzNTdj
Y2VlNDc8d2JyPmI2NTFjNzg2ZGEucGF0Y2ggfMKgIDk5IC0tLS0tLS08YnI+DQrCoC4uLi9wc2V1
ZG8vZmlsZXMvZmFzdG9wcmVwbHkuPHdicj5wYXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fMKgIDc2IC0tLS0tLTxicj4NCsKgLi4uL3BzZXVkby9maWxlcy90b29tYW55ZmlsZXMuPHdicj5w
YXRjaMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHzCoCA0NCArKy0tPGJyPg0KwqBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHNldWRvLzx3YnI+cHNldWRvLmluY8KgIMKgIMKgIMKgIMKgIMKgIHzCoCDC
oDIgKy08YnI+DQrCoG1ldGEvcmVjaXBlcy1kZXZ0b29scy9wc2V1ZG8vPGEgaHJlZj0iaHR0cDov
L3BzZXVkb18xLjguMi5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cDx3YnI+
c2V1ZG9fMS44LjIuYmI8L2E+wqAgwqAgwqAgwqB8wqAgMTYgLS08YnI+DQrCoG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9wc2V1ZG8vPGEgaHJlZj0iaHR0cDovL3BzZXVkb19naXQuYmIiIHJlbD0ibm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnA8d2JyPnNldWRvX2dpdC5iYjwvYT7CoCDCoCDCoCDC
oCDCoHzCoCAxMSArLTxicj4NCsKgOCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA1
NTQgZGVsZXRpb25zKC0pPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BzZXVkby88d2JyPmZpbGVzLzAwMDEtVXNlLWVwb2xsLUFQSS1vbi08d2JyPkxpbnV4
LnBhdGNoPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Bz
ZXVkby88d2JyPmZpbGVzLzx3YnI+YjZiNjhkYjg5NmY5OTYzNTU4MzM0YWZmN2ZjYTYxPHdicj5h
ZGRlNGVjMTBmLnBhdGNoPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3BzZXVkby88d2JyPmZpbGVzLzx3YnI+ZWZlMGJlMjc5OTAxMDA2ZjkzOWNkMzU3Y2Nl
ZTQ3PHdicj5iNjUxYzc4NmRhLnBhdGNoPGJyPg0KwqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3BzZXVkby88d2JyPmZpbGVzL2Zhc3RvcHJlcGx5LnBhdGNoPGJyPg0K
wqBkZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3BzZXVkby88YSBocmVm
PSJodHRwOi8vcHNldWRvXzEuOC4yLmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5wPHdicj5zZXVkb18xLjguMi5iYjwvYT48YnI+DQo8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvL2ZpbGVzLzAwMDEtVXNlLWVwb2xsLTx3YnI+QVBJ
LW9uLUxpbnV4LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvL2ZpbGVz
LzAwMDEtVXNlLWVwb2xsLTx3YnI+QVBJLW9uLUxpbnV4LnBhdGNoPGJyPg0KZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0PGJyPg0KaW5kZXggNDI1NTdiMTdhN2YuLjAwMDAwMDAwMDAwPGJyPg0KLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvL2ZpbGVzLzAwMDEtVXNlLWVwb2xs
LTx3YnI+QVBJLW9uLUxpbnV4LnBhdGNoPGJyPg0KKysrIC9kZXYvbnVsbDxicj4NCkBAIC0xLDI5
MiArMCwwIEBAPGJyPg0KLUZyb20gOWU0MDdlMGJlMDE2OTVlN2I5MjdmNTgyMGFkZTg3PHdicj5l
ZTk2MDJjMjQ4IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMTxicj4NCi1Gcm9tOiBBbGV4YW5kZXIg
S2FuYXZpbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXgua2FuYXZpbkBnbWFpbC5jb20iPmFsZXgu
a2FuYXZpbkBnbWFpbC5jb208L2E+Jmd0Ozxicj4NCi1EYXRlOiBGcmksIDE1IFNlcCAyMDE3IDE3
OjAwOjE0ICswMzAwPGJyPg0KLVN1YmplY3Q6IFtQQVRDSF0gVXNlIGVwb2xsIEFQSSBvbiBMaW51
eDxicj4NCi08YnI+DQotQWxzbyBhIGNvdXBsZSBvZiBvdGhlciBtb2RpZmljYXRpb25zIGR1ZSB0
byBlcG9sbCBoYXZpbmc8YnI+DQotYSBkaWZmZXJlbnQgYXBwcm9hY2ggdG8gaG93IHRoZSB3b3Jr
aW5nIHNldCBvZiBmZHMgaXMgZGVmaW5lZDxicj4NCi1hbmQgdXNlZDo8YnI+DQotMSkgb3Blbl9j
bGllbnQoKSByZXR1cm5zIGFuIGluZGV4IGludG8gdGhlIGFycmF5IG9mIGNsaWVudHM8YnI+DQot
MikgY2xvc2VfY2xpZW50KCkgaGFzIGEgcHJvdGVjdGlvbiBhZ2FpbnN0IGJlaW5nIGNhbGxlZCB0
d2ljZTxicj4NCi13aXRoIHRoZSBzYW1lIGNsaWVudCAod2hpY2ggd291bGQgbWVzcyB1cCB0aGUg
YWN0aXZlX2NsaWVudHM8YnI+DQotY291bnRlcik8YnI+DQotPGJyPg0KLVVwc3RyZWFtLVN0YXR1
czogU3VibWl0dGVkIFtTZWVicyBDQyYjMzk7ZCBieSBlbWFpbF08YnI+DQotU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIEthbmF2aW4gJmx0OzxhIGhyZWY9Im1haWx0bzphbGV4LmthbmF2aW5AZ21h
aWwuY29tIj5hbGV4LmthbmF2aW5AZ21haWwuY29tPC9hPiZndDs8YnI+DQotPGJyPg0KLS0tLTxi
cj4NCi0gZW51bXMvPGEgaHJlZj0iaHR0cDovL2V4aXRfc3RhdHVzLmluIiByZWw9Im5vcmVmZXJy
ZXIiIHRhcmdldD0iX2JsYW5rIj5leGl0X3N0YXR1cy5pbjwvYT4gfMKgIMKgMyArPGJyPg0KLSBw
c2V1ZG9fc2VydmVyLmPCoCDCoCDCoCB8IDE4OSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kys8d2JyPisrKysrKysrKysrKysrKysrKysrLTxicj4NCi0gMiBmaWxlcyBjaGFuZ2VkLCAxOTAg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSk8YnI+DQotPGJyPg0KLWRpZmYgLS1naXQgYS9l
bnVtcy88YSBocmVmPSJodHRwOi8vZXhpdF9zdGF0dXMuaW4iIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmV4aXRfc3RhdHVzLmluPC9hPiBiL2VudW1zLzxhIGhyZWY9Imh0dHA6Ly9l
eGl0X3N0YXR1cy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+ZXhpdF9zdGF0
dXMuaW48L2E+PGJyPg0KLWluZGV4IDZiZTQ0ZDMuLjg4Zjk0Y2QgMTAwNjQ0PGJyPg0KLS0tLSBh
L2VudW1zLzxhIGhyZWY9Imh0dHA6Ly9leGl0X3N0YXR1cy5pbiIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+ZXhpdF9zdGF0dXMuaW48L2E+PGJyPg0KLSsrKyBiL2VudW1zLzxhIGhy
ZWY9Imh0dHA6Ly9leGl0X3N0YXR1cy5pbiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFu
ayI+ZXhpdF9zdGF0dXMuaW48L2E+PGJyPg0KLUBAIC0xOCwzICsxOCw2IEBAIGxpc3Rlbl9mZCwg
JnF1b3Q7c2VydmVyIGxvb3AgaGFkIG5vIHZhbGlkIGxpc3RlbiBmZCZxdW90Ozxicj4NCi0gcHNl
dWRvX2xvYWRlZCwgJnF1b3Q7c2VydmVyIGNvdWxkbiYjMzk7dCBnZXQgb3V0IG9mIHBzZXVkbyBl
bnZpcm9ubWVudCZxdW90Ozxicj4NCi0gcHNldWRvX3ByZWZpeCwgJnF1b3Q7Y291bGRuJiMzOTt0
IGdldCB2YWxpZCBwc2V1ZG8gcHJlZml4JnF1b3Q7PGJyPg0KLSBwc2V1ZG9faW52b2NhdGlvbiwg
JnF1b3Q7aW52YWxpZCBzZXJ2ZXIgY29tbWFuZCBhcmd1bWVudHMmcXVvdDs8YnI+DQotK2Vwb2xs
X2NyZWF0ZSwgJnF1b3Q7ZXBvbGxfY3JlYXRlKCkgZmFpbGVkJnF1b3Q7PGJyPg0KLStlcG9sbF9j
dGwsICZxdW90O2Vwb2xsX2N0bCgpIGZhaWxlZCZxdW90Ozxicj4NCi0rPGJyPg0KLWRpZmYgLS1n
aXQgYS9wc2V1ZG9fc2VydmVyLmMgYi9wc2V1ZG9fc2VydmVyLmM8YnI+DQotaW5kZXggZmYxNmVm
ZC4uMTRkMzRkZSAxMDA2NDQ8YnI+DQotLS0tIGEvcHNldWRvX3NlcnZlci5jPGJyPg0KLSsrKyBi
L3BzZXVkb19zZXJ2ZXIuYzxicj4NCi1AQCAtNDAsNiArNDAsMTIgQEA8YnI+DQotICNpbmNsdWRl
ICZxdW90O3BzZXVkb19jbGllbnQuaCZxdW90Ozxicj4NCi0gI2luY2x1ZGUgJnF1b3Q7cHNldWRv
X2RiLmgmcXVvdDs8YnI+DQotPGJyPg0KLSsvLyBUaGlzIGhhcyB0byBjb21lIGFmdGVyIHBzZXVk
byBpbmNsdWRlcywgYXMgdGhhdCYjMzk7cyB3aGVyZSBQU0VVRE9fUE9SVCBkZWZpbmVzIGFyZTxi
cj4NCi0rI2lmZGVmIFBTRVVET19QT1JUX0xJTlVYPGJyPg0KLSsjaW5jbHVkZSAmbHQ7c3lzL2Vw
b2xsLmgmZ3Q7PGJyPg0KLSsjZW5kaWY8YnI+DQotKzxicj4NCi0rPGJyPg0KLSBzdGF0aWMgaW50
IGxpc3Rlbl9mZCA9IC0xOzxicj4NCi08YnI+DQotIHR5cGVkZWYgc3RydWN0IHs8YnI+DQotQEAg
LTU5LDYgKzY1LDcgQEAgc3RhdGljIGludCBhY3RpdmVfY2xpZW50cyA9IDAsIGhpZ2hlc3RfY2xp
ZW50ID0gMCwgbWF4X2NsaWVudHMgPSAwOzxicj4NCi08YnI+DQotICNkZWZpbmUgTE9PUF9ERUxB
WSAyPGJyPg0KLSAjZGVmaW5lIERFRkFVTFRfUFNFVURPX1NFUlZFUl9USU1FT1VUIDMwPGJyPg0K
LSsjZGVmaW5lIEVQT0xMX01BWF9FVkVOVFMgMTA8YnI+DQotIGludCBwc2V1ZG9fc2VydmVyX3Rp
bWVvdXQgPSBERUZBVUxUX1BTRVVET19TRVJWRVJfVElNRU9VVDs8YnI+DQotIHN0YXRpYyBpbnQg
ZGllX3BlYWNlZnVsbHkgPSAwOzxicj4NCi0gc3RhdGljIGludCBkaWVfZm9yY2VmdWxseSA9IDA7
PGJyPg0KLUBAIC04MCw2ICs4Nyw5IEBAIHF1aXRfbm93KGludCBzaWduYWwpIHs8YnI+DQotIHN0
YXRpYyBpbnQgbWVzc2FnZXMgPSAwLCByZXNwb25zZXMgPSAwOzxicj4NCi0gc3RhdGljIHN0cnVj
dCB0aW1ldmFsIG1lc3NhZ2VfdGltZSA9IHsgLnR2X3NlYyA9IDAgfTs8YnI+DQotPGJyPg0KLSsj
aWZkZWYgUFNFVURPX1BPUlRfTElOVVg8YnI+DQotK3N0YXRpYyB2b2lkIHBzZXVkb19zZXJ2ZXJf
bG9vcF9lcG9sbCh2b2lkKTx3YnI+Ozxicj4NCi0rI2VuZGlmPGJyPg0KLSBzdGF0aWMgdm9pZCBw
c2V1ZG9fc2VydmVyX2xvb3Aodm9pZCk7PGJyPg0KLTxicj4NCi0gLyogaGVscGVyIGZ1bmN0aW9u
IHRvIG1ha2UgYSBkaXJlY3RvcnksIGp1c3QgbGlrZSBta2RpciAtcC48YnI+DQotQEAgLTM2OSwx
MiArMzc5LDE2IEBAIHBzZXVkb19zZXJ2ZXJfc3RhcnQoaW50IGRhZW1vbml6ZSkgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGtpbGwocHBpZCwgU0lHVVNSMSk7PGJy
Pg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotKyNp
ZmRlZiBQU0VVRE9fUE9SVF9MSU5VWDxicj4NCi0rwqAgwqAgwqAgcHNldWRvX3NlcnZlcl9sb29w
X2Vwb2xsKCk7PGJyPg0KLSsjZWxzZTxicj4NCi3CoCDCoCDCoCDCoHBzZXVkb19zZXJ2ZXJfbG9v
cCgpOzxicj4NCi0rI2VuZGlmPGJyPg0KLcKgIMKgIMKgIMKgcmV0dXJuIDA7PGJyPg0KLSB9PGJy
Pg0KLTxicj4NCi0gLyogbWVzcyB3aXRoIGludGVybmFsIHRhYmxlcyBhcyBuZWVkZWQgKi88YnI+
DQotLXN0YXRpYyB2b2lkPGJyPg0KLStzdGF0aWMgdW5zaWduZWQgaW50PGJyPg0KLSBvcGVuX2Ns
aWVudChpbnQgZmQpIHs8YnI+DQotwqAgwqAgwqAgwqBwc2V1ZG9fY2xpZW50X3QgKm5ld19jbGll
bnRzOzxicj4NCi3CoCDCoCDCoCDCoGludCBpOzxicj4NCi1AQCAtMzkwLDcgKzQwNCw3IEBAIG9w
ZW5fY2xpZW50KGludCBmZCkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCsrYWN0aXZlX2NsaWVudHM7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKGkgJmd0OyBoaWdoZXN0X2NsaWVudCk8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBoaWdoZXN0X2NsaWVudCA9IGk7PGJyPg0KLS3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gaTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9PGJyPg0KLcKgIMKgIMKgIMKgfTxicj4NCi08YnI+DQotQEAgLTQxNCw5ICs0MjgsMTEg
QEAgb3Blbl9jbGllbnQoaW50IGZkKSB7PGJyPg0KLTxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoG1heF9jbGllbnRzICs9IDE2Ozxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCsrYWN0
aXZlX2NsaWVudHM7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gbWF4X2NsaWVu
dHMgLSAxNjs8YnI+DQotwqAgwqAgwqAgwqB9IGVsc2Ugezxicj4NCi3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBzZXVkb19kaWFnKCZxdW90O2Vycm9yIGFsbG9jYXRpbmcgbmV3IGNsaWVudCwgZmQg
JWRcbiZxdW90OywgZmQpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNsb3NlKGZkKTs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAwOzxicj4NCi3CoCDCoCDCoCDCoH08
YnI+DQotIH08YnI+DQotPGJyPg0KLUBAIC00MzMsNiArNDQ5LDEwIEBAIGNsb3NlX2NsaWVudChp
bnQgY2xpZW50KSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xp
ZW50LCBoaWdoZXN0X2NsaWVudCk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
Ozxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotK8KgIMKgIMKgIGlmIChjbGllbnRzW2NsaWVudF0u
ZmQgPT0gLTEpIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19kZWJ1ZyhQREJH
Rl9TRVJWRVIsICZxdW90O2NsaWVudCAlZCBhbHJlYWR5IGNsb3NlZFxuJnF1b3Q7LCBjbGllbnQp
Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuOzxicj4NCi0rwqAgwqAgwqAgfTxi
cj4NCi3CoCDCoCDCoCDCoGNsb3NlKGNsaWVudHNbY2xpZW50XS5mZCk7PGJyPg0KLcKgIMKgIMKg
IMKgY2xpZW50c1tjbGllbnRdLmZkID0gLTE7PGJyPg0KLcKgIMKgIMKgIMKgZnJlZShjbGllbnRz
W2NsaWVudF0udGFnKTs8YnI+DQotQEAgLTU2Niw2ICs1ODYsMTcxIEBAIHNlcnZlX2NsaWVudChp
bnQgaSkgezxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotIH08YnI+DQotPGJyPg0KLSsjaWZkZWYg
UFNFVURPX1BPUlRfTElOVVg8YnI+DQotK3N0YXRpYyB2b2lkIHBzZXVkb19zZXJ2ZXJfbG9vcF9l
cG9sbCh2b2lkKTxicj4NCi0rezxicj4NCi0rwqAgwqAgwqAgc3RydWN0IHNvY2thZGRyX3VuIGNs
aWVudDs8YnI+DQotK8KgIMKgIMKgIHNvY2tsZW5fdCBsZW47PGJyPg0KLSvCoCDCoCDCoCDCoCBp
bnQgaTs8YnI+DQotK8KgIMKgIMKgIMKgIGludCByYzs8YnI+DQotK8KgIMKgIMKgIMKgIGludCBm
ZDs8YnI+DQotK8KgIMKgIMKgIGludCB0aW1lb3V0Ozxicj4NCi0rwqAgwqAgwqAgc3RydWN0IGVw
b2xsX2V2ZW50IGV2LCBldmVudHNbRVBPTExfTUFYX0VWRU5UU107PGJyPg0KLSvCoCDCoCDCoCBp
bnQgbG9vcF90aW1lb3V0ID0gcHNldWRvX3NlcnZlcl90aW1lb3V0Ozxicj4NCi0rPGJyPg0KLSvC
oCDCoCDCoCBjbGllbnRzID0gbWFsbG9jKDE2ICogc2l6ZW9mKCpjbGllbnRzKSk7PGJyPg0KLSs8
YnI+DQotK8KgIMKgIMKgIGNsaWVudHNbMF0uZmQgPSBsaXN0ZW5fZmQ7PGJyPg0KLSvCoCDCoCDC
oCBjbGllbnRzWzBdLnBpZCA9IGdldHBpZCgpOzxicj4NCi0rPGJyPg0KLSvCoCDCoCDCoCBmb3Ig
KGkgPSAxOyBpICZsdDsgMTY7ICsraSkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xp
ZW50c1tpXS5mZCA9IC0xOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xpZW50c1tpXS5w
aWQgPSAwOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xpZW50c1tpXS50YWcgPSBOVUxM
Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgY2xpZW50c1tpXS5wcm9ncmFtID0gTlVMTDs8
YnI+DQotK8KgIMKgIMKgIH08YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgYWN0aXZlX2NsaWVudHMg
PSAxOzxicj4NCi0rwqAgwqAgwqAgbWF4X2NsaWVudHMgPSAxNjs8YnI+DQotK8KgIMKgIMKgIGhp
Z2hlc3RfY2xpZW50ID0gMDs8YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgcHNldWRvX2RlYnVnKFBE
QkdGX1NFUlZFUiwgJnF1b3Q7c2VydmVyIGxvb3Agc3RhcnRlZC5cbiZxdW90Oyk7PGJyPg0KLSvC
oCDCoCDCoCBpZiAobGlzdGVuX2ZkICZsdDsgMCkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcHNldWRvX2RpYWcoJnF1b3Q7Z290IGludG8gbG9vcCB3aXRoIG5vIHZhbGlkIGxpc3RlbiBm
ZC5cbiZxdW90Oyk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCBleGl0KFBTRVVET19FWElU
X0xJU1RFTl9GRCk7PGJyPg0KLSvCoCDCoCDCoCB9PGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIHRp
bWVvdXQgPSBMT09QX0RFTEFZICogMTAwMDs8YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgaW50IGVw
b2xsZmQgPSBlcG9sbF9jcmVhdGUxKDApOzxicj4NCi0rwqAgwqAgwqAgaWYgKGVwb2xsZmQgPT0g
LTEpIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19kaWFnKCZxdW90O2Vwb2xs
X2NyZWF0ZTEoKSBmYWlsZWQuXG4mcXVvdDspOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAg
ZXhpdChQU0VVRE9fRVhJVF9FUE9MTF9DUkVBVEUpPHdicj47PGJyPg0KLSvCoCDCoCDCoCB9PGJy
Pg0KLSvCoCDCoCDCoCBldi5ldmVudHMgPSBFUE9MTElOOzxicj4NCi0rwqAgwqAgwqAgZXYuZGF0
YS51NjQgPSAwOzxicj4NCi0rwqAgwqAgwqAgaWYgKGVwb2xsX2N0bChlcG9sbGZkLCBFUE9MTF9D
VExfQURELCBjbGllbnRzWzBdLmZkLCAmYW1wO2V2KSA9PSAtMSkgezxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgcHNldWRvX2RpYWcoJnF1b3Q7ZXBvbGxfY3RsKCkgZmFpbGVkIHdpdGggbGlz
dGVuaW5nIHNvY2tldC5cbiZxdW90Oyk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCBleGl0
KFBTRVVET19FWElUX0VQT0xMX0NUTCk7PGJyPg0KLSvCoCDCoCDCoCB9PGJyPg0KLSs8YnI+DQot
K8KgIMKgIMKgIHBkYl9sb2dfbXNnKFNFVkVSSVRZX0lORk8sIE5VTEwsIE5VTEwsIE5VTEwsICZx
dW90O3NlcnZlciBzdGFydGVkIChwaWQgJWQpJnF1b3Q7LCBnZXRwaWQoKSk7PGJyPg0KLSs8YnI+
DQotK8KgIMKgIMKgIMKgIGZvciAoOzspIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIHJj
ID0gZXBvbGxfd2FpdChlcG9sbGZkLCBldmVudHMsIEVQT0xMX01BWF9FVkVOVFMsIHRpbWVvdXQp
Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKHJjID09IDAgfHwgKHJjID09IC0xICZh
bXA7JmFtcDsgZXJybm8gPT0gRUlOVFIpKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAvKiBJZiB0aGVyZSYjMzk7cyBubyBjbGllbnRzLCBzdGFydCB0aW1pbmcgb3V0
LsKgIElmIHRoZXJlPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCog
YXJlIGFjdGl2ZSBjbGllbnRzLCBuZXZlciB0aW1lIG91dC48YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgKi88YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIChhY3RpdmVfY2xpZW50cyA9PSAxKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBsb29wX3RpbWVvdXQgLT0gTE9PUF9ERUxBWTs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8q
IG1heWJlIGZsdXNoIGRhdGFiYXNlIHRvIGRpc2sgKi88YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBkYl9tYXliZV9iYWNrdXAoKTs8YnI+DQot
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChsb29wX3Rp
bWVvdXQgJmx0Oz0gMCkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RlYnVnKFBEQkdGX1NFUlZFUiwgJnF1b3Q7
bm8gbW9yZSBjbGllbnRzLCBnb3QgYm9yZWQuXG4mcXVvdDspOzxicj4NCi0rwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZGllX3BlYWNlZnVs
bHkgPSAxOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfSBlbHNlIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qIGRpc3BsYXkgdGhpcyBpZiBub3QgZXhpdGluZyAqLzxicj4N
Ci0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcHNldWRvX2RlYnVnKFBEQkdGX1NFUlZFUiB8IFBEQkdGX0JFTkNITUFSSywgJnF1b3Q7JWQg
bWVzc2FnZXMgaGFuZGxlZCBpbiAlLjRmIHNlY29uZHMsICVkIHJlc3BvbnNlc1xuJnF1b3Q7LDxi
cj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgbWVzc2FnZXMsPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAoZG91YmxlKSBt
ZXNzYWdlX3RpbWUudHZfc2VjICs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIChkb3VibGUpIG1lc3NhZ2Vf
dGltZS50dl91c2VjIC8gMTAwMDAwMC4wLDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzcG9uc2Vz
KTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIH0gZWxzZSBpZiAocmMgJmd0OyAwKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBsb29wX3RpbWVvdXQgPSBwc2V1ZG9fc2VydmVyX3RpbWVvdXQ7
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBmb3IgKGkgPSAwOyBpICZs
dDsgcmM7ICsraSkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKGNsaWVudHNbZXZlbnRzW2ldLmRhdGEudTY0XS48d2JyPmZkID09IGxpc3Rl
bl9mZCkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgaWYgKCFkaWVfZm9yY2VmdWxseSkgezxicj4NCi0rwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
bGVuID0gc2l6ZW9mKGNsaWVudCk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoKGZkID0gYWNjZXB0
KGxpc3Rlbl9mZCwgKHN0cnVjdCBzb2NrYWRkciAqKSAmYW1wO2NsaWVudCwgJmFtcDtsZW4pKSAh
PSAtMSkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogRG9uJiMzOTt0IGFsbG93IGNsaWVudHMgdG8g
ZW5kIHVwIG9uIGZkIDIsIGJlY2F1c2UgZ2xpYmMmIzM5O3M8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
KiBtYWxsb2MgZGVidWcgdXNlcyB0aGF0IGZkIHVuY29uZGl0aW9uYWxseS48YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgKi88YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChmZCA9PSAyKSB7
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpbnQgbmV3ZmQgPSBm
Y250bChmZCwgRl9EVVBGRCwgMyk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBjbG9zZShmZCk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBmZCA9IG5ld2ZkOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi0r
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RlYnVnKFBEQkdGX1NFUlZFUiwgJnF1b3Q7
bmV3IGNsaWVudCBmZCAlZFxuJnF1b3Q7LCBmZCk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKiBBIG5ldyBjbGllbnQgaW1wbGljaXRseSBjYW5jZWxzIGFueTxicj4NCi0rwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAqIHByZXZpb3VzIHNodXRkb3duIHJlcXVlc3QsIG9yIGE8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBzaHV0ZG93biBmb3IgbGFjayBvZiBjbGll
bnRzLjxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqLzxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgcHNldWRvX3NlcnZlcl90aW1lb3V0ID0gREVGQVVMVF9QU0VVRE9fU0VS
VkVSX1RJTUVPVVQ7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBkaWVfcGVhY2VmdWxs
eSA9IDA7PGJyPg0KLSs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGV2LmV2ZW50cyA9
IEVQT0xMSU47PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBldi5kYXRhLnU2NCA9IG9w
ZW5fY2xpZW50KGZkKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChldi5kYXRh
LnU2NCAhPSAwICZhbXA7JmFtcDsgZXBvbGxfY3RsKGVwb2xsZmQsIEVQT0xMX0NUTF9BREQsIGNs
aWVudHNbZXYuZGF0YS51NjRdLmZkLCAmYW1wO2V2KSA9PSAtMSkgezxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RpYWcoJnF1b3Q7ZXBvbGxfY3RsKCkg
ZmFpbGVkIHdpdGggYWNjZXB0ZWQgc29ja2V0LlxuJnF1b3Q7KTs8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGV4aXQoUFNFVURPX0VYSVRfRVBPTExfQ1RMKTs8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSBp
ZiAoZXJybm8gPT0gRU1GSUxFKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwc2V1
ZG9fZGVidWcoUERCR0ZfU0VSVkVSLCAmcXVvdDtIaXQgbWF4IG9wZW4gZmlsZXMsIGRyb3BwaW5n
IGEgY2xpZW50LlxuJnF1b3Q7KTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIElu
IHRoZW9yeSB0aGVyZSBpcyBhIHBvdGVudGlhbCByYWNlIGhlcmUgd2hlcmUgaWYgd2UgY2xvc2Ug
YSBjbGllbnQsPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGl0IG1heSBoYXZl
IHNlbnQgdXMgYSBmYXN0b3AgbWVzc2FnZSB3aGljaCB3ZSBkb24mIzM5O3QgYWN0IHVwb24uPGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoElmIHdlIGRvbiYjMzk7dCBjbG9zZSBh
IGZpbGVoYW5kbGUgd2UmIzM5O2xsIGxvb3AgaW5kZWZpbml0ZWx5IHRob3VnaHQuPGJyPg0KLSvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoE9ubHkgY2xvc2Ugb25lIHBlciBsb29wIGl0ZXJh
dGlvbiBpbiB0aGUgaW50ZXJlc3RzIG9mIGNhdXRpb24gKi88YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGZvciAoaW50IGogPSAxOyBqICZsdDs9IGhpZ2hlc3RfY2xpZW50OyArK2opIHs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChjbGllbnRzW2pd
LmZkICE9IC0xKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBjbG9zZV9jbGllbnQoaik7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBzdHJ1Y3QgdGltZXZhbCB0djEs
IHR2Mjs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIGludCByYzs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGdldHRpbWVvZmRheSgmYW1wO3R2MSwgTlVM
TCk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCByYyA9IHNlcnZlX2NsaWVudChldmVudHNbaV0uZGF0YS48d2JyPnU2NCk7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBnZXR0aW1lb2ZkYXkoJmFtcDt0djIsIE5VTEwpOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKyttZXNzYWdlczs8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGlmIChyYyA9PSAwKTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKytyZXNwb25zZXM7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBtZXNzYWdlX3RpbWUudHZfc2VjICs9ICh0djIudHZfc2VjIC0gdHYxLnR2X3NlYyk7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBtZXNzYWdlX3RpbWUudHZfdXNlYyArPSAodHYyLnR2X3VzZWMgLSB0djEudHZfdXNlYyk7
PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpZiAobWVzc2FnZV90aW1lLnR2X3VzZWMgJmx0OyAwKSB7PGJyPg0KLSvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBtZXNzYWdlX3RpbWUudHZfdXNlYyArPSAxMDAwMDAwOzxicj4NCi0rwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LS1tZXNzYWdlX3RpbWUudHZfc2VjOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHdoaWxlIChtZXNzYWdlX3RpbWUu
dHZfdXNlYyAmZ3Q7IDEwMDAwMDApIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG1lc3NhZ2VfdGltZS50
dl91c2VjIC09IDEwMDAwMDA7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCArK21lc3NhZ2VfdGltZS50dl9z
ZWM7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZiAoZGllX2ZvcmNlZnVsbHkpPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazs8YnI+DQotK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIHBzZXVkb19kZWJ1ZyhQREJHRl9TRVJWRVIsICZxdW90O3NlcnZlciBsb29wIGNvbXBs
ZXRlIFslZCBjbGllbnRzIGxlZnRdXG4mcXVvdDssIGFjdGl2ZV9jbGllbnRzKTs8YnI+DQotK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCBwc2V1ZG9fZGlhZygmcXVvdDtlcG9sbF93YWl0IGZhaWxlZDogJXNcbiZxdW90
Oywgc3RyZXJyb3IoZXJybm8pKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIGJyZWFrOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgaWYgKGRpZV9wZWFjZWZ1bGx5IHx8IGRpZV9mb3JjZWZ1bGx5KSB7PGJyPg0K
LSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwc2V1ZG9fZGVidWcoUERCR0ZfU0VS
VkVSLCAmcXVvdDtxdWl0dGluZy5cbiZxdW90Oyk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBwc2V1ZG9fZGVidWcoUERCR0ZfU0VSVkVSIHwgUERCR0ZfQkVOQ0hNQVJL
LCAmcXVvdDtzZXJ2ZXIgJWQgZXhpdGluZzogaGFuZGxlZCAlZCBtZXNzYWdlcyBpbiAlLjRmIHNl
Y29uZHNcbiZxdW90Oyw8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIGdldHBpZCgpLCBtZXNzYWdlcyw8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIChkb3VibGUpIG1lc3NhZ2VfdGltZS50dl9zZWMgKzxi
cj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKGRvdWJs
ZSkgbWVzc2FnZV90aW1lLnR2X3VzZWMgLyAxMDAwMDAwLjApOzxicj4NCi0rwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcGRiX2xvZ19tc2coU0VWRVJJVFlfSU5GTywgTlVMTCwgTlVM
TCwgTlVMTCwgJnF1b3Q7c2VydmVyICVkIGV4aXRpbmc6IGhhbmRsZWQgJWQgbWVzc2FnZXMgaW4g
JS40ZiBzZWNvbmRzJnF1b3Q7LDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgZ2V0cGlkKCksIG1lc3NhZ2VzLDxicj4NCi0rwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKGRvdWJsZSkgbWVzc2FnZV90aW1lLnR2X3Nl
YyArPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAo
ZG91YmxlKSBtZXNzYWdlX3RpbWUudHZfdXNlYyAvIDEwMDAwMDAuMCk7PGJyPg0KLSvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBhbmQgYXQgdGhpcyBwb2ludCwgd2UmIzM5O2xs
IHN0YXJ0IHJlZnVzaW5nIGNvbm5lY3Rpb25zICovPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBjbG9zZShjbGllbnRzWzBdLmZkKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qIFRoaXMgaXMgYSBnb29kIHBsYWNlIHRvIGluc2VydCBhIGRl
bGF5IGZvcjxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAqIGRlYnVn
Z2luZyByYWNlIGNvbmRpdGlvbnMgZHVyaW5nIHN0YXJ0dXAuICovPGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiB1c2xlZXAoMzAwMDAwKTsgKi88YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGV4aXQoMCk7PGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCB9PGJyPg0KLSs8YnI+DQotK308YnI+DQotKzxicj4N
Ci0rI2VuZGlmPGJyPg0KLSs8YnI+DQotIC8qIGdldCBjbGllbnRzLCBoYW5kbGUgbWVzc2FnZXMs
IHNodXQgZG93bi48YnI+DQotwqAgKiBUaGlzIGRvZXNuJiMzOTt0IGFjdHVhbGx5IGRvIGFueSB3
b3JrLCBpdCBqdXN0IGNhbGxzIGEgdG9uIG9mIHRoaW5ncyB3aGljaDxicj4NCi3CoCAqIGRvIHdv
cmsuPGJyPg0KLS0tPGJyPg0KLTIuMTQuMTxicj4NCi08YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvL2ZpbGVzLzx3YnI+YjZiNjhkYjg5NmY5OTYzNTU4
MzM0YWZmN2ZjYTYxPHdicj5hZGRlNGVjMTBmLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
Lzx3YnI+cHNldWRvL2ZpbGVzLzx3YnI+YjZiNjhkYjg5NmY5OTYzNTU4MzM0YWZmN2ZjYTYxPHdi
cj5hZGRlNGVjMTBmLnBhdGNoPGJyPg0KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0PGJyPg0KaW5k
ZXggMzA0NWEzYjczNmYuLjAwMDAwMDAwMDAwPGJyPg0KLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzLzx3YnI+cHNldWRvL2ZpbGVzLzx3YnI+YjZiNjhkYjg5NmY5OTYzNTU4MzM0YWZmN2ZjYTYx
PHdicj5hZGRlNGVjMTBmLnBhdGNoPGJyPg0KKysrIC9kZXYvbnVsbDxicj4NCkBAIC0xLDQ4ICsw
LDAgQEA8YnI+DQotRnJvbSBiNmI2OGRiODk2Zjk5NjM1NTgzMzRhZmY3ZmNhNjE8d2JyPmFkZGU0
ZWMxMGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxPGJyPg0KLUZyb206IFNlZWJzICZsdDs8YSBo
cmVmPSJtYWlsdG86c2VlYnNAc2VlYnMubmV0Ij5zZWVic0BzZWVicy5uZXQ8L2E+Jmd0Ozxicj4N
Ci1EYXRlOiBUaHUsIDEzIEFwciAyMDE3IDE4OjEyOjAxIC0wNTAwPGJyPg0KLVN1YmplY3Q6IFBy
ZXZlbnQgYmFzaCBmcm9tIHNlZ2ZhdWx0aW5nIHdoZW4gdW5sb2FkaW5nIHBzZXVkbzxicj4NCi08
YnI+DQotYmFzaCYjMzk7cyBleHRyZW1lbHkgZmFuY3kgaW50ZXJuYWwgYXdhcmVuZXNzIG9mIGhv
dyB0aGUgZW52aXJvbm1lbnQgbG9va3M8YnI+DQotbWVhbnMgdGhhdCwgaWYgeW91IGRpcmVjdGx5
IGNhbGwgdGhlIHVuZGVybHlpbmcgbGliYyAmcXVvdDt1bnNldGVudiZxdW90OyBvbjxicj4NCi1h
IHZhcmlhYmxlLCBiYXNoIGNhbiBlbmQgdXAgdHJ5aW5nIHRvIGFjY2VzcyBhIG51bGwgcG9pbnRl
ci4gRml4aW5nPGJyPg0KLXRoaXMgZ2VuZXJpY2FsbHkgaXMgYWN0dWFsbHkgcmF0aGVyIGhhcmQ7
IHlvdSBjYW4mIzM5O3QgcmVhbGx5IGF2b2lkPGJyPg0KLXdyaXRpbmcgdG8gZW52aXJvbiBvbiBm
b3JrKCkgb3IgcG9wZW4oKSwgZXZlbiBpZiB5b3UgY2hhbmdlIGFsbDxicj4NCi1leGVjdiooKSBm
dW5jdGlvbnMgdG8gdXNlIHRoZSBleGVjdiplKCkgdmFyaWFudHMuIFNvIGZvciBub3csIGluc3Rl
YWQ8YnI+DQotb2YgdW5zZXR0aW5nIHRoZSB2YXJpYWJsZSwgc2V0IGl0IHRvIGFuIGVtcHR5IHN0
cmluZy48YnI+DQotPGJyPg0KLVRoYW5rcyB0byBTYXVyIGluIElSQyBmb3Igc3BvdHRpbmcgdGhp
cyBhbmQgaGVscGluZyBkZWJ1ZyBpdC48YnI+DQotPGJyPg0KLVNpZ25lZC1vZmYtYnk6IFNlZWJz
ICZsdDs8YSBocmVmPSJtYWlsdG86c2VlYnNAc2VlYnMubmV0Ij5zZWVic0BzZWVicy5uZXQ8L2E+
Jmd0Ozxicj4NCi08YnI+DQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydDxicj4NCi08YnI+DQot
ZGlmZiAtLWdpdCBhL0NoYW5nZUxvZy50eHQgYi9DaGFuZ2VMb2cudHh0PGJyPg0KLWluZGV4IGEy
ZDMwZTkuLjhiYTFmZmEgMTAwNjQ0PGJyPg0KLS0tLSBhL0NoYW5nZUxvZy50eHQ8YnI+DQotKysr
IGIvQ2hhbmdlTG9nLnR4dDxicj4NCi1AQCAtMSwzICsxLDggQEA8YnI+DQotKzIwMTctMDQtMTM6
PGJyPg0KLSvCoCDCoCDCoCAqIChzZWVicykgZG9uJiMzOTt0IHVuc2V0IExEX1BSRUxPQUQgb3Ig
dGhlIGxpa2UsIGJlY2F1c2UgaWYgeW91PGJyPg0KLSvCoCDCoCDCoCDCoCBkbyB0aGF0LCBiYXNo
IGNhbiBzZWdmYXVsdCBiZWNhdXNlIGl0ICZxdW90O2tub3dzJnF1b3Q7IGhvdyBtYW55PGJyPg0K
LSvCoCDCoCDCoCDCoCBmaWVsZHMgYXJlIGluIGVudmlyb24uPGJyPg0KLSs8YnI+DQotIDIwMTct
MDItMjQ6PGJyPg0KLcKgIMKgIMKgIMKgKiAoc2VlYnMpIGltcG9ydCBwb3NpeF9hY2xfZGVmYXVs
dCBmaXggZnJvbSBBbnRvbiBHZXJhc2ltb3Y8YnI+DQotwqAgwqAgwqAgwqAgwqAmbHQ7PGEgaHJl
Zj0ibWFpbHRvOmFudG9uQGFkdmFuY2VkdGVsZW1hdGljLmNvbSI+YW50b25AYWR2YW5jZWR0ZWxl
bWF0aWMuY29tPC9hPiZndDs8YnI+DQotZGlmZiAtLWdpdCBhL3BzZXVkb191dGlsLmMgYi9wc2V1
ZG9fdXRpbC5jPGJyPg0KLWluZGV4IDE3Mjk5MGIuLjZhMWZhYzIgMTAwNjQ0PGJyPg0KLS0tLSBh
L3BzZXVkb191dGlsLmM8YnI+DQotKysrIGIvcHNldWRvX3V0aWwuYzxicj4NCi1AQCAtODQ0LDcg
Kzg0NCw3IEBAIHZvaWQgcHNldWRvX2Ryb3BlbnYoKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgaWYgKGxkX3ByZWxvYWQgJmFtcDsmYW1wOyBzdHJsZW4obGRfcHJlbG9hZCkpIHs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBTRVRFTlYoUFJFTElOS19MSUJS
QVJJRVMsIGxkX3ByZWxvYWQsIDEpOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH0gZWxz
ZSB7PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBVTlNFVEVOVihQUkVM
SU5LX0xJQlJBUklFUyk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBT
RVRFTlYoUFJFTElOS19MSUJSQVJJRVMsICZxdW90OyZxdW90OywgMSk7PGJyPg0KLcKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotIH08YnI+DQotLS08YnI+
DQotY2dpdCB2MC4xMC4yPGJyPg0KLTxicj4NCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvPHdicj5wc2V1ZG8vZmlsZXMvPHdicj5lZmUwYmUyNzk5MDEwMDZmOTM5Y2QzNTdjY2Vl
NDc8d2JyPmI2NTFjNzg2ZGEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvPHdicj5wc2V1
ZG8vZmlsZXMvPHdicj5lZmUwYmUyNzk5MDEwMDZmOTM5Y2QzNTdjY2VlNDc8d2JyPmI2NTFjNzg2
ZGEucGF0Y2g8YnI+DQpkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQ8YnI+DQppbmRleCA2NGZjNThj
NGZlNi4uMDAwMDAwMDAwMDA8YnI+DQotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvPHdicj5w
c2V1ZG8vZmlsZXMvPHdicj5lZmUwYmUyNzk5MDEwMDZmOTM5Y2QzNTdjY2VlNDc8d2JyPmI2NTFj
Nzg2ZGEucGF0Y2g8YnI+DQorKysgL2Rldi9udWxsPGJyPg0KQEAgLTEsOTkgKzAsMCBAQDxicj4N
Ci1Gcm9tIGVmZTBiZTI3OTkwMTAwNmY5MzljZDM1N2NjZWU0Nzx3YnI+YjY1MWM3ODZkYSBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDE8YnI+DQotRnJvbTogU2VlYnMgJmx0OzxhIGhyZWY9Im1haWx0
bzpzZWVic0BzZWVicy5uZXQiPnNlZWJzQHNlZWJzLm5ldDwvYT4mZ3Q7PGJyPg0KLURhdGU6IEZy
aSwgMjQgRmViIDIwMTcgMTI6NDc6MzggLTA2MDA8YnI+DQotU3ViamVjdDogRG9uJiMzOTt0IHRy
eSB0byByZWNvcmQgMC1sZW5ndGggcG9zaXhfYWNsX2RlZmF1bHQgeGF0dHJzPGJyPg0KLTxicj4N
Ci1CYXNlZCBvbiBhIHN1Ym1pc3Npb24gZnJvbSBBbnRvbiBHZXJhc2ltb3YgJmx0OzxhIGhyZWY9
Im1haWx0bzphbnRvbkBhZHZhbmNlZHRlbGVtYXRpYy5jb20iPmFudG9uQGFkdmFuY2VkdGVsZW1h
dGljLmNvbTwvYT4mZ3Q7PGJyPg0KLTxicj4NCi1PbiBzb21lIHN5c3RlbXMsIHdpdGggc29tZSBr
ZXJuZWwgY29uZmlncywgJnF1b3Q7Y3AgLWEmcXVvdDsgYXBwYXJlbnRseSB0cmllcyB0bzxicj4N
Ci1zZXQgYW4gZW1wdHkgQUNMIGxpc3QsIHdpdGggYSB2YWxpZCBoZWFkZXIgYnV0IG5vIGNvbnRl
bnRzLCB3aGljaCBjYXVzZXM8YnI+DQotc3RyYW5nZSBhbmQgbXlzdGVyaW91cyBiZWhhdmlvciBs
YXRlciBpZiB3ZSBhY3R1YWxseSBjcmVhdGUgc3VjaCBhbiBlbnRyeS48YnI+DQotU28gZmlsdGVy
IHRoYXQgb3V0LCBhbHNvIHNhbml0eS1jaGVjayBhIGNvdXBsZSBvZiBvdGhlciB0aGluZ3MuPGJy
Pg0KLTxicj4NCi1TaWduZWQtb2ZmLWJ5OiBTZWVicyAmbHQ7PGEgaHJlZj0ibWFpbHRvOnNlZWJz
QHNlZWJzLm5ldCI+c2VlYnNAc2VlYnMubmV0PC9hPiZndDs8YnI+DQotPGJyPg0KLVVwc3RyZWFt
LVN0YXR1czogQmFja3BvcnQ8YnI+DQotPGJyPg0KLWRpZmYgLS1naXQgYS9DaGFuZ2VMb2cudHh0
IGIvQ2hhbmdlTG9nLnR4dDxicj4NCi1pbmRleCBhZTJhNmU5Li5hMmQzMGU5IDEwMDY0NDxicj4N
Ci0tLS0gYS9DaGFuZ2VMb2cudHh0PGJyPg0KLSsrKyBiL0NoYW5nZUxvZy50eHQ8YnI+DQotQEAg
LTEsMyArMSw2IEBAPGJyPg0KLSsyMDE3LTAyLTI0Ojxicj4NCi0rwqAgwqAgwqAgKiAoc2VlYnMp
IGltcG9ydCBwb3NpeF9hY2xfZGVmYXVsdCBmaXggZnJvbSBBbnRvbiBHZXJhc2ltb3Y8YnI+DQot
K8KgIMKgIMKgIMKgICZsdDs8YSBocmVmPSJtYWlsdG86YW50b25AYWR2YW5jZWR0ZWxlbWF0aWMu
Y29tIj5hbnRvbkBhZHZhbmNlZHRlbGVtYXRpYy5jb208L2E+Jmd0Ozxicj4NCi0gMjAxNy0wMi0w
MTo8YnI+DQotwqAgwqAgKiAoc2VlYnMpIGhhbmRsZSB4YXR0ciBkZWxldGlvbiBzbGlnaHRseSBt
b3JlIGNhcmVmdWxseS48YnI+DQotwqAgwqAgKiAoc2VlYnMpIHRhZyB0aGlzIGFzIDEuOC4yPGJy
Pg0KLWRpZmYgLS1naXQgYS9wb3J0cy9saW51eC94YXR0ci9wc2V1ZG9fPHdicj53cmFwcGVycy5j
IGIvcG9ydHMvbGludXgveGF0dHIvcHNldWRvXzx3YnI+d3JhcHBlcnMuYzxicj4NCi1pbmRleCA0
NmJjMDUzLi5kNjlkNTNlIDEwMDY0NDxicj4NCi0tLS0gYS9wb3J0cy9saW51eC94YXR0ci9wc2V1
ZG9fPHdicj53cmFwcGVycy5jPGJyPg0KLSsrKyBiL3BvcnRzL2xpbnV4L3hhdHRyL3BzZXVkb188
d2JyPndyYXBwZXJzLmM8YnI+DQotQEAgLTYyLDkgKzYyLDkgQEAgc3RhdGljIGludDxicj4NCi0g
cG9zaXhfcGVybWlzc2lvbnMoY29uc3QgYWNsX2hlYWRlciAqaGVhZGVyLCBpbnQgZW50cmllcywg
aW50ICpleHRyYSwgaW50ICptb2RlKSB7PGJyPg0KLcKgIMKgIMKgIMKgaW50IGFjbF9zZWVuID0g
MDs8YnI+DQotwqAgwqAgwqAgwqBpZiAobGUzMihoZWFkZXItJmd0O3ZlcnNpb24pICE9IDIpIHs8
YnI+DQotLcKgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19kaWFnKCZxdW90O0ZhdGFsOiBBQ0wg
c3VwcG9ydCBubyBhdmFpbGFibGUgZm9yIGhlYWRlciB2ZXJzaW9uICVkLlxuJnF1b3Q7LDxicj4N
Ci0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RpYWcoJnF1b3Q7RmF0YWw6IEFDTCBzdXBw
b3J0IG5vdCBhdmFpbGFibGUgZm9yIGhlYWRlciB2ZXJzaW9uICVkLlxuJnF1b3Q7LDxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGxlMzIoaGVhZGVyLSZndDt2ZXJzaW9u
KSk7PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gMTs8YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIHJldHVybiAtMTs8YnI+DQotwqAgwqAgwqAgwqB9PGJyPg0KLcKgIMKgIMKg
IMKgKm1vZGUgPSAwOzxicj4NCi3CoCDCoCDCoCDCoCpleHRyYSA9IDA7PGJyPg0KLUBAIC0xNDAs
MTIgKzE0MCwzOCBAQCBzdGF0aWMgaW50IHNoYXJlZF9zZXR4YXR0cihjb25zdCBjaGFyICpwYXRo
LCBpbnQgZmQsIGNvbnN0IGNoYXIgKm5hbWUsIGNvbnN0IHZvaTxicj4NCi3CoCDCoCDCoCDCoHBz
ZXVkb19kZWJ1ZyhQREJHRl9YQVRUUiwgJnF1b3Q7c2V0eGF0dHIoJXMgW2ZkICVkXSwgJXMgPSZn
dDsgJiMzOTslLipzJiMzOTspXG4mcXVvdDssPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
cGF0aCA/IHBhdGggOiAmcXVvdDsmbHQ7bm8gcGF0aCZndDsmcXVvdDssIGZkLCBuYW1lLCAoaW50
KSBzaXplLCAoY2hhciAqKSB2YWx1ZSk7PGJyPg0KLTxicj4NCi0rwqAgwqAgwqAgLyogRmlsdGVy
IG91dCBlcnJvbmVvdXMgc2l6ZXMgZm9yIFBPU0lYIEFDTDxicj4NCi0rwqAgwqAgwqAgwqAqwqAg
c2VlIHBvc2l4X2FjbF94YXR0cl9jb3VudCBpbiBpbmNsdWRlL2xpbnV4L3Bvc2l4X2FjbF94YXR0
ci48d2JyPmggb2YgTGludXggc291cmNlIGNvZGUgKi88YnI+DQotK8KgIMKgIMKgIC8qIEkgZG9u
JiMzOTt0IHRoaW5rIHRoZXJlJiMzOTtzIGFueSBwb3NpeF9hY2xfKiB2YWx1ZXMgdGhhdCBhcmVu
JiMzOTt0IGluIHRoaXMgZm9ybWF0ICovPGJyPg0KLSvCoCDCoCDCoCBpZiAoIXN0cm5jbXAobmFt
ZSwgJnF1b3Q7c3lzdGVtLnBvc2l4X2FjbF8mcXVvdDssIDE3KSkgezxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgLy8gQUNMIGlzIGNvcnJ1cHQsIGlzc3VlIGFuIGVycm9yPGJyPg0KLSvCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZihzaXplICZsdDsgc2l6ZW9mKGFjbF9oZWFkZXIpIHx8IChzaXpl
IC0gc2l6ZW9mKGFjbF9oZWFkZXIpKSAlIHNpemVvZihhY2xfZW50cnkpICE9IDApIHs8YnI+DQot
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19kZWJ1ZyhQREJHRl9YQVRU
UiwgJnF1b3Q7aW52YWxpZCBkYXRhIHNpemUgZm9yICVzOiAlZFxuJnF1b3Q7LDxicj4NCi0rwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgbmFtZSwgKGludCkgc2l6
ZSk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlcnJubyA9IEVJTlZB
TDs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAtMTs8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotKzxicj4NCi0rwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLy8gQUNMIGlzIGVtcHR5LCBkbyBub3RoaW5nPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDC
oCDCoCBpZigoc2l6ZSAtIHNpemVvZihhY2xfaGVhZGVyKSkgLyBzaXplb2YoYWNsX2VudHJ5KSA9
PSAwKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBvbiBzb21l
IHN5c3RlbXMsICZxdW90O2NwIC1hJnF1b3Q7IHdpbGwgYXR0ZW1wdCB0byBjbG9uZSB0aGU8YnI+
DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBwb3NpeF9hY2xfZGVmYXVs
dCBlbnRyeSBmb3IgYSBkaXJlY3RvcnkgKHdoaWNoIHdvdWxkIHNwZWNpZnk8YnI+DQotK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKiBkZWZhdWx0IEFDTHMgZm9yIG5ldyBmaWxl
cyBpbiB0aGF0IGRpcmVjdG9yeSksIGJ1dCBpZiB0aGU8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgKiBvcmlnaW5hbCB3YXMgZW1wdHksIHdlIGdldCBhIGhlYWRlciBi
dXQgbm8gZW50cmllcy4gV2l0aDxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAqIHJlYWwgeGF0dHIsIHRoYXQgZW5kcyB1cCBiZWluZyBzaWxlbnRseSBkaXNjYXJkZWQs
IGFwcGFyZW50bHksPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCog
c28gd2UgZGlzY2FyZCBpdCB0b28uPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCovPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwc2V1ZG9f
ZGVidWcoUERCR0ZfWEFUVFIsICZxdW90OzAtbGVuZ3RoIEFDTCBlbnRyeSAlcy5cbiZxdW90Oywg
bmFtZSk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gMDs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIH08YnI+DQotK8KgIMKgIMKgIH08YnI+DQotwqAg
wqAgwqAgwqAvKiB0aGlzIG1heSBiZSBhIHBsYWluIGNobW9kICovPGJyPg0KLcKgIMKgIMKgIMKg
aWYgKCFzdHJjbXAobmFtZSwgJnF1b3Q7c3lzdGVtLnBvc2l4X2FjbF9hY2Nlc3MmcXVvdDspKSB7
PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50IGV4dHJhOzxicj4NCi3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGludCBtb2RlOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGludCBl
bnRyaWVzID0gKHNpemUgLSBzaXplb2YoYWNsX2hlYWRlcikpIC8gc2l6ZW9mKGFjbF9lbnRyeSk7
PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAoIXBvc2l4X3Blcm1pc3Npb25zKHZhbHVl
LCBlbnRyaWVzLCAmYW1wO2V4dHJhLCAmYW1wO21vZGUpKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCBpbnQgcmVzID0gcG9zaXhfcGVybWlzc2lvbnModmFsdWUsIGVudHJpZXMsICZhbXA7
ZXh0cmEsICZhbXA7bW9kZSk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAocmVzID09
IDApIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwc2V1ZG9fZGVi
dWcoUERCR0ZfWEFUVFIsICZxdW90O3Bvc2l4X2FjbF9hY2Nlc3MgdHJhbnNsYXRlZCB0byBtb2Rl
ICUwNG8uIFJlbWFpbmluZyBhdHRyaWJ1dGUocyk6ICVkLlxuJnF1b3Q7LDxicj4NCi3CoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1vZGUsIGV4dHJhKTs8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBidWYuc3RfbW9kZSA9IG1vZGU7
PGJyPg0KLUBAIC0xNjQsOCArMTkwLDEyIEBAIHN0YXRpYyBpbnQgc2hhcmVkX3NldHhhdHRyKGNv
bnN0IGNoYXIgKnBhdGgsIGludCBmZCwgY29uc3QgY2hhciAqbmFtZSwgY29uc3Qgdm9pPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCFleHRyYSkgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiAwOzxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH08YnI+DQotK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIH0gZWxzZSBpZiAocmVzID09IC0xKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBlcnJubyA9IEVPUE5PVFNVUFA7PGJyPg0KLSvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gLTE7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTxicj4NCi3CoCDCoCDCoCDCoH08YnI+DQotKzxicj4NCi3CoCDCoCDCoCDCoGlmICgh
c3RyY21wKG5hbWUsICZxdW90O3VzZXIucHNldWRvX2RhdGEmcXVvdDspKSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcHNldWRvX2RlYnVnKFBEQkdGX1hBVFRSIHwgUERCR0ZfWEFUVFJE
QiwgJnF1b3Q7dXNlci5wc2V1ZG9fZGF0YSB4YXR0cmlidXRlIGRvZXMgbm90IGdldCB0byBnbyBp
biBkYXRhYmFzZS5cbiZxdW90Oyk7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmV0dXJu
IC0xOzxicj4NCi0tLTxicj4NCi1jZ2l0IHYwLjEwLjI8YnI+DQotPGJyPg0KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVkby9maWxlcy9mYXN0b3ByZXBseS5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVkby9maWxlcy9mYXN0b3ByZXBseS5w
YXRjaDxicj4NCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4IDkwNGMyZDA0ZTZh
Li4wMDAwMDAwMDAwMDxicj4NCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVk
by9maWxlcy9mYXN0b3ByZXBseS5wYXRjaDxicj4NCisrKyAvZGV2L251bGw8YnI+DQpAQCAtMSw3
NiArMCwwIEBAPGJyPg0KLUVuc3VyZSBGQVNUT1AgbWVzc2FnZXMgZ2V0IGFuIEFDSyByZXBseSBz
byB0aGF0IHRoZSBjbGllbnQgY2FuIGJlIHN1cmUgdGhlIHNlcnZlcjxicj4NCi1yZWNpZXZlZCB0
aGVtLiBUaGlzIG1lYW5zIGlmIGNvbm5lY3Rpb25zIGFyZSB0ZXJtaW5hdGVkLCBkYXRhIGlzbiYj
Mzk7dCBsb3N0Ljxicj4NCi08YnI+DQotUlAgMjAxNy85LzIyPGJyPg0KLTxicj4NCi1VcHN0cmVh
bS1TdGF0dXM6IFN1Ym1pdHRlZDxicj4NCi08YnI+DQotSW5kZXg6IHBzZXVkby0xLjguMi9wc2V1
ZG9fY2xpZW50LmM8YnI+DQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT08d2JyPj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PTx3YnI+PT09PT09PT08YnI+DQotLS0tIHBzZXVkby0x
LjguMi5vcmlnL3BzZXVkb188d2JyPmNsaWVudC5jPGJyPg0KLSsrKyBwc2V1ZG8tMS44LjIvcHNl
dWRvX2NsaWVudC5jPGJyPg0KLUBAIC0xMzMxLDIxICsxMzMxLDE5IEBAIHBzZXVkb19jbGllbnRf
cmVxdWVzdChwc2V1ZG9fPHdicj5tc2dfdCAqbXNnLDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAqIGluZGljYXRpbmcgYSBzdWNjZXNzZnVsIHNlbmQuPGJyPg0KLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICovPGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcHNldWRvX2RlYnVnKFBE
QkdGX0NMSUVOVCB8IFBEQkdGX1ZFUkJPU0UsICZxdW90O3NlbnQhXG4mcXVvdDspOzxicj4NCi0t
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKG1zZy0mZ3Q7dHlwZSAhPSBQU0VVRE9fTVNHX0ZBU1RP
UCkgezxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzcG9uc2UgPSBw
c2V1ZG9fbXNnX3JlY2VpdmUoY29ubmVjdF9mZCk8d2JyPjs8YnI+DQotLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmICghcmVzcG9uc2UpIHs8YnI+DQotLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19kZWJ1ZyhQREJHRl9DTElFTlQs
ICZxdW90O2V4cGVjdGVkIHJlc3BvbnNlIGRpZCBub3Qgb2NjdXI7IHJldHJ5aW5nXG4mcXVvdDsp
Ozxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmVzcG9uc2UgPSBwc2V1ZG9fbXNnX3JlY2Vp
dmUoY29ubmVjdF9mZCk8d2JyPjs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIGlmICghcmVz
cG9uc2UpIHs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBzZXVkb19k
ZWJ1ZyhQREJHRl9DTElFTlQsICZxdW90O2V4cGVjdGVkIHJlc3BvbnNlIGRpZCBub3Qgb2NjdXI7
IHJldHJ5aW5nXG4mcXVvdDspOzxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8
YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGlmIChyZXNwb25zZS0mZ3Q7
dHlwZSAhPSBQU0VVRE9fTVNHX0FDSykgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RlYnVnKFBEQkdGX0NMSUVOVCwgJnF1b3Q7Z290
IG5vbi1hY2sgcmVzcG9uc2UgJWRcbiZxdW90OywgcmVzcG9uc2UtJmd0O3R5cGUpOzxicj4NCi0r
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuIDA7PGJy
Pg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgaWYgKG1zZy0mZ3Q7
dHlwZSAhPSBQU0VVRE9fTVNHX0ZBU1RPUCkgezxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcHNldWRvX2RlYnVnKFBEQkdGX0NMSUVOVCB8IFBEQkdG
X1ZFUkJPU0UsICZxdW90O2dvdCByZXNwb25zZSB0eXBlICVkXG4mcXVvdDssIHJlc3BvbnNlLSZn
dDt0eXBlKTs8YnI+DQotK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIHJldHVybiByZXNwb25zZTs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqB9IGVsc2Ugezxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgaWYgKHJlc3BvbnNlLSZndDt0eXBlICE9IFBTRVVET19NU0dfQUNLKSB7PGJyPg0K
LS3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBwc2V1ZG9fZGVidWcoUERCR0ZfQ0xJRU5ULCAmcXVvdDtnb3Qgbm9uLWFjayByZXNwb25zZSAl
ZFxuJnF1b3Q7LCByZXNwb25zZS0mZ3Q7dHlwZSk7PGJyPg0KLS3CoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCByZXR1cm4gMDs8YnI+DQotLcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIH0gZWxzZSB7PGJyPg0K
LS3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCBwc2V1ZG9fZGVidWcoUERCR0ZfQ0xJRU5UIHwgUERCR0ZfVkVSQk9TRSwgJnF1b3Q7Z290IHJl
c3BvbnNlIHR5cGUgJWRcbiZxdW90OywgcmVzcG9uc2UtJmd0O3R5cGUpOzxicj4NCi0twqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJu
IHJlc3BvbnNlOzxicj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgfTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgcmV0dXJuIDA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTxi
cj4NCi0twqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHs8YnI+DQotLcKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHJldHVybiAwOzxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oH08YnI+DQotwqAgwqAgwqAgwqB9PGJyPg0KLcKgIMKgIMKgIMKgcHNldWRvX2RpYWcoJnF1b3Q7
cHNldWRvOiBzZXJ2ZXIgY29ubmVjdGlvbiBwZXJzaXN0ZW50bHkgZmFpbGVkLCBhYm9ydGluZy5c
biZxdW90Oyk7PGJyPg0KLUluZGV4OiBwc2V1ZG8tMS44LjIvcHNldWRvX3NlcnZlci5jPGJyPg0K
LT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PHdicj49PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT08d2JyPj09PT09PT09PGJyPg0KLS0tLSBwc2V1ZG8tMS44LjIub3JpZy9wc2V1ZG9f
PHdicj5zZXJ2ZXIuYzxicj4NCi0rKysgcHNldWRvLTEuOC4yL3BzZXVkb19zZXJ2ZXIuYzxicj4N
Ci1AQCAtNDYzLDYgKzQ2MywxMSBAQCBjbG9zZV9jbGllbnQoaW50IGNsaWVudCkgezxicj4NCi3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC0taGlnaGVzdF9jbGllbnQ7PGJyPg0K
LSB9PGJyPg0KLTxicj4NCi0rc3RhdGljIHBzZXVkb19tc2dfdCBzZXJ2ZXJfZmFzdG9wX3JlcGx5
ID0gezxicj4NCi0rwqAgwqAgwqAgwqAgLnR5cGUgPSBQU0VVRE9fTVNHX0FDSyw8YnI+DQotK8Kg
IMKgIMKgIMKgIC5vcCA9IE9QX05PTkUsPGJyPg0KLSt9Ozxicj4NCi0rPGJyPg0KLSAvKiBBY3R1
YWxseSBwcm9jZXNzIGEgcmVxdWVzdC48YnI+DQotwqAgKi88YnI+DQotIHN0YXRpYyBpbnQ8YnI+
DQotQEAgLTUxNSw4ICs1MjAsMTQgQEAgc2VydmVfY2xpZW50KGludCBpKSB7PGJyPg0KLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICogcHNldWRvX3NlcnZlcl9yZXNwb25zZS48YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoaW4t
Jmd0O3R5cGUgIT0gUFNFVURPX01TR19TSFVURE9XTikgezxicj4NCi0twqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGluLSZndDt0eXBlID09IFBTRVVET19NU0dfRkFTVE9Q
KTxicj4NCi0rwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKGluLSZndDt0
eXBlID09IFBTRVVET19NU0dfRkFTVE9QKSB7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2VuZF9yZXNwb25zZSA9IDA7PGJyPg0KLSvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBGb3IgZmFzdG9w
cyB3ZSByZXBseSBub3cgdG8gc2F5IHdlIGdvdCB0aGUgZGF0YSAqLzxicj4NCi0rwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKChyYyA9IHBzZXVkb19t
c2dfc2VuZChjbGllbnRzW2ldLmZkLCAmYW1wO3NlcnZlcl9mYXN0b3BfcmVwbHksIDAsIE5VTEwp
KSAhPSAwKSB7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwc2V1ZG9fZGVidWcoUERCR0ZfU0VSVkVSLCAmcXVv
dDtmYWlsZWQgdG8gc2VuZCBmYXN0b3AgYWNrIHRvIGNsaWVudCAlZCBbJWRdOiAlZCAoJXMpXG4m
cXVvdDssPGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBpLCAoaW50KSBjbGllbnRzW2ldLnBp
ZCwgcmMsIHN0cmVycm9yKGVycm5vKSk7PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB9PGJyPg0KLSvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCB9PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyog
bW9zdCBtZXNzYWdlcyBkb24mIzM5O3QgbmVlZCB0aGVzZSwgYnV0IHhhdHRyIG1heSAqLzxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3BvbnNlX3BhdGggPSAwOzxi
cj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlc3BvbnNlX3BhdGhsZW4g
PSAtMTs8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRv
L2ZpbGVzL3Rvb21hbnlmaWxlcy48d2JyPnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3
YnI+cHNldWRvL2ZpbGVzL3Rvb21hbnlmaWxlcy48d2JyPnBhdGNoPGJyPg0KaW5kZXggYjA4NWE0
NTA1ZDUuLmJkYTdlNGIyMDI2IDEwMDY0NDxicj4NCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy88d2JyPnBzZXVkby9maWxlcy90b29tYW55ZmlsZXMuPHdicj5wYXRjaDxicj4NCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVkby9maWxlcy90b29tYW55ZmlsZXMuPHdicj5w
YXRjaDxicj4NCkBAIC0xLDMgKzEsOCBAQDxicj4NCitGcm9tIGIwYjI1ZmJjMDQxYTE0OGQxZGUw
OWY1YTY1MDNjZDx3YnI+OTU5NzNlYzc3YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDE8YnI+DQor
RnJvbTogUmljaGFyZCBQdXJkaWUgJmx0OzxhIGhyZWY9Im1haWx0bzpyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnIj5yaWNoYXJkLnB1cmRpZUA8d2JyPmxpbnV4Zm91bmRhdGlvbi5v
cmc8L2E+Jmd0Ozxicj4NCitEYXRlOiBUdWUsIDI1IEFwciAyMDE3IDE1OjI1OjU0ICswMTAwPGJy
Pg0KK1N1YmplY3Q6IFtQQVRDSCAzLzNdIHBzZXVkbzogSGFuZGxlIHRvbyBtYW55IGZpbGVzIGRl
YWRsb2NrPGJyPg0KKzxicj4NCsKgQ3VycmVudGx5IGlmIHdlIG1heCBvdXQgdGhlIG1heGltdW0g
bnVtYmVyIG9mIGZpbGVzLCBwc2V1ZG8gY2FuIGRlYWRsb2NrLCB1bmFibGUgdG88YnI+DQrCoGFj
Y2VwdCBuZXcgY29ubmVjdGlvbnMgeWV0IHVuYWJsZSB0byBtb3ZlIGZvcndhcmQgYW5kIHVuYmxv
Y2sgdGhlIG90aGVyIHByb2Nlc3Nlczxicj4NCsKgd2FpdGluZyBlaXRoZXIuPGJyPg0KQEAgLTEx
LDE5ICsxNiwyMyBAQCBSUDxicj4NCjxicj4NCsKgVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQg
W1BldGVyIGlzIGF3YXJlIG9mIHRoZSBpc3N1ZV08YnI+DQo8YnI+DQotSW5kZXg6IHBzZXVkby0x
LjguMi9wc2V1ZG9fc2VydmVyLmM8YnI+DQotPT09PT09PT09PT09PT09PT09PT09PT09PT09PT08
d2JyPj09PT09PT09PT09PT09PT09PT09PT09PT09PT09PTx3YnI+PT09PT09PT08YnI+DQotLS0t
IHBzZXVkby0xLjguMi5vcmlnL3BzZXVkb188d2JyPnNlcnZlci5jPGJyPg0KLSsrKyBwc2V1ZG8t
MS44LjIvcHNldWRvX3NlcnZlci5jPGJyPg0KLUBAIC01ODEsNiArNTgxLDcgQEAgcHNldWRvX3Nl
cnZlcl9sb29wKHZvaWQpIHs8YnI+DQotwqAgwqAgwqAgwqBpbnQgcmM7PGJyPg0KLcKgIMKgIMKg
IMKgaW50IGZkOzxicj4NCi3CoCDCoCDCoCDCoGludCBsb29wX3RpbWVvdXQgPSBwc2V1ZG9fc2Vy
dmVyX3RpbWVvdXQ7PGJyPg0KKy0tLTxicj4NCisgcHNldWRvX3NlcnZlci5jIHwgMTAgKysrKysr
KysrKzxicj4NCisgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyk8YnI+DQorPGJyPg0K
K2RpZmYgLS1naXQgYS9wc2V1ZG9fc2VydmVyLmMgYi9wc2V1ZG9fc2VydmVyLmM8YnI+DQoraW5k
ZXggZGFjMzI1OC4uMTVhM2U4ZiAxMDA2NDQ8YnI+DQorLS0tIGEvcHNldWRvX3NlcnZlci5jPGJy
Pg0KKysrKyBiL3BzZXVkb19zZXJ2ZXIuYzxicj4NCitAQCAtODAyLDYgKzgwMiw3IEBAIHBzZXVk
b19zZXJ2ZXJfbG9vcCh2b2lkKSB7PGJyPg0KK8KgIMKgIMKgIMKgc3RydWN0IHNpZ2FjdGlvbiBl
YXRfdXNyMiA9IHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuc2FfaGFuZGxlciA9IHNl
dF9kb19saXN0X2NsaWVudHM8YnI+DQorwqAgwqAgwqAgwqB9Ozxicj4NCsKgK8KgIMKgIMKgIGlu
dCBoaXRtYXhmaWxlczs8YnI+DQo8YnI+DQrCoCDCoCDCoCDCoCBjbGllbnRzID0gbWFsbG9jKDE2
ICogc2l6ZW9mKCpjbGllbnRzKSk7PGJyPg0KPGJyPg0KLUBAIC01OTcsNiArNTk4LDcgQEAgcHNl
dWRvX3NlcnZlcl9sb29wKHZvaWQpIHs8YnI+DQorQEAgLTgyMCw2ICs4MjEsNyBAQCBwc2V1ZG9f
c2VydmVyX2xvb3Aodm9pZCkgezxicj4NCsKgIMKgIMKgIMKgIGFjdGl2ZV9jbGllbnRzID0gMTs8
YnI+DQrCoCDCoCDCoCDCoCBtYXhfY2xpZW50cyA9IDE2Ozxicj4NCsKgIMKgIMKgIMKgIGhpZ2hl
c3RfY2xpZW50ID0gMDs8YnI+DQpAQCAtMzEsOSArNDAsOSBAQCBJbmRleDogcHNldWRvLTEuOC4y
L3BzZXVkb19zZXJ2ZXIuYzxicj4NCjxicj4NCsKgIMKgIMKgIMKgIHBzZXVkb19kZWJ1ZyhQREJH
Rl9TRVJWRVIsICZxdW90O3NlcnZlciBsb29wIHN0YXJ0ZWQuXG4mcXVvdDspOzxicj4NCsKgIMKg
IMKgIMKgIGlmIChsaXN0ZW5fZmQgJmx0OyAwKSB7PGJyPg0KLUBAIC02NjMsMTAgKzY2NSwxNSBA
QCBwc2V1ZG9fc2VydmVyX2xvb3Aodm9pZCkgezxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG1lc3NhZ2Vf
dGltZS50dl91c2VjIC09IDEwMDAwMDA7PGJyPg0KLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgKyttZXNzYWdlX3Rp
bWUudHZfc2VjOzxicj4NCitAQCAtODc4LDEwICs4ODAsMTUgQEAgcHNldWRvX3NlcnZlcl9sb29w
KHZvaWQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqB9IGVsc2Ugezxicj4NCivCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNlcnZlX2NsaWVu
dChpKTs8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9PGJyPg0KwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgfSBlbHNlIGlmIChoaXRtYXhmaWxlcykgezxicj4NCsKgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIE9ubHkgY2xv
c2Ugb25lIHBlciBsb29wIGl0ZXJhdGlvbiBpbiB0aGUgaW50ZXJlc3RzIG9mIGNhdXRpb24gKi88
YnI+DQpAQCAtNDcsMTMgKzU2LDE2IEBAIEluZGV4OiBwc2V1ZG8tMS44LjIvcHNldWRvX3NlcnZl
ci5jPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgaWYgKCFkaWVfZm9y
Y2VmdWxseSAmYW1wOyZhbXA7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgKEZEX0lTU0VUKGNsaWVudHNbMF0uZmQsICZhbXA7ZXZlbnRzKSB8fDxicj4NCsKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgRkRfSVNTRVQoY2xpZW50
c1swXS5mZCwgJmFtcDtyZWFkcykpKSB7PGJyPg0KLUBAIC02ODgsNiArNjk4LDkgQEAgcHNldWRv
X3NlcnZlcl9sb29wKHZvaWQpIHs8YnI+DQotwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQotwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwc2V1ZG9fc2Vy
dmVyX3RpbWVvdXQgPSBERUZBVUxUX1BTRVVET19TRVJWRVJfVElNRU9VVDs8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBk
aWVfcGVhY2VmdWxseSA9IDA7PGJyPg0KK0BAIC05MDMsNiArOTEwLDkgQEAgcHNldWRvX3NlcnZl
cl9sb29wKHZvaWQpIHs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgKi88YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwc2V1ZG9fc2VydmVyX3RpbWVvdXQg
PSBERUZBVUxUX1BTRVVET19TRVJWRVJfVElNRU9VVDs8YnI+DQorwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkaWVfcGVhY2VmdWxseSA9
IDA7PGJyPg0KwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
fSBlbHNlIGlmIChlcnJubyA9PSBFTUZJTEUpIHs8YnI+DQrCoCvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBoaXRtYXhmaWxlcyA9IDE7PGJy
Pg0KwqArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgcHNldWRvX2RlYnVnKFBEQkdGX1NFUlZFUiwgJnF1b3Q7SGl0IG1heCBvcGVuIGZpbGVz
LCBkcm9wcGluZyBhIGNsaWVudC5cbiZxdW90Oyk7PGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCsKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIH08YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBw
c2V1ZG9fZGVidWcoUERCR0ZfU0VSVkVSLCAmcXVvdDtzZXJ2ZXIgbG9vcCBjb21wbGV0ZSBbJWQg
Y2xpZW50cyBsZWZ0XVxuJnF1b3Q7LCBhY3RpdmVfY2xpZW50cyk7PGJyPg0KKy0tPGJyPg0KKzIu
MTUuMTxicj4NCis8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+
cHNldWRvL3BzZXVkby5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvPHdicj5wc2V1ZG8vcHNl
dWRvLmluYzxicj4NCmluZGV4IDE4Y2U5ZjkyNTk2Li5mYjc0MjUyMmY1MCAxMDA2NDQ8YnI+DQot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvPHdicj5wc2V1ZG8vcHNldWRvLmluYzxicj4NCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVkby9wc2V1ZG8uaW5jPGJyPg0KQEAg
LTI2LDcgKzI2LDcgQEAgZG9fY29uZmlndXJlICgpIHs8YnI+DQrCoE5PMzJMSUJTID8/PSAmcXVv
dDsxJnF1b3Q7PGJyPg0KwqBOTzMyTElCU19jbGFzcy1uYXRpdmVzZGsgPSAmcXVvdDsxJnF1b3Q7
PGJyPg0KPGJyPg0KLVBTRVVET19FWFRSQV9PUFRTID89ICZxdW90Oy0tZW5hYmxlLWZvcmNlLWFz
eW5jIC0td2l0aG91dC1wYXNzd2QtZmFsbGJhY2smcXVvdDs8YnI+DQorUFNFVURPX0VYVFJBX09Q
VFMgPz0gJnF1b3Q7LS1lbmFibGUtZm9yY2UtYXN5bmMgLS13aXRob3V0LXBhc3N3ZC1mYWxsYmFj
ayAtLWVuYWJsZS1lcG9sbCZxdW90Ozxicj4NCjxicj4NCsKgIyBDb21waWxlIGZvciB0aGUgbG9j
YWwgbWFjaGluZSBhcmNoLi4uPGJyPg0KwqBkb19jb21waWxlICgpIHs8YnI+DQpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvLzxhIGhyZWY9Imh0dHA6Ly9wc2V1
ZG9fMS44LjIuYmIiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPnBzZXVkb18xLjgu
Mi5iYjwvYT4gYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvPHdicj5wc2V1ZG8vPGEgaHJlZj0iaHR0
cDovL3BzZXVkb18xLjguMi5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+cHNl
dWRvXzEuOC4yLmJiPC9hPjxicj4NCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NDxicj4NCmluZGV4
IDczZWY1NzIzMWEwLi4wMDAwMDAwMDAwMDxicj4NCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy88d2JyPnBzZXVkby88YSBocmVmPSJodHRwOi8vcHNldWRvXzEuOC4yLmJiIiByZWw9Im5vcmVm
ZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5wc2V1ZG9fMS44LjIuYmI8L2E+PGJyPg0KKysrIC9kZXYv
bnVsbDxicj4NCkBAIC0xLDE2ICswLDAgQEA8YnI+DQotcmVxdWlyZSBwc2V1ZG8uaW5jPGJyPg0K
LTxicj4NCi1TUkNfVVJJID0gJnF1b3Q7PGEgaHJlZj0iaHR0cDovL2Rvd25sb2Fkcy55b2N0b3By
b2plY3Qub3JnL3JlbGVhc2VzL3BzZXVkby8ke0JQTn0tJHtQVn0udGFyLmJ6MiIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2Rvd25sb2Fkcy48d2JyPnlvY3RvcHJvamVj
dC5vcmcvcmVsZWFzZXMvPHdicj5wc2V1ZG8vJHtCUE59LSR7UFZ9LnRhci5iejI8L2E+IFw8YnI+
DQotwqAgwqAgwqAgwqAgwqAgwqBmaWxlOi8vMDAwMS1jb25maWd1cmUtUHJ1bmUtPHdicj5QSUUt
ZmxhZ3MucGF0Y2ggXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly9mYWxsYmFjay1wYXNz
d2QgXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly9mYWxsYmFjay1ncm91cCBcPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgZmlsZTovL21vcmVyZXRyaWVzLnBhdGNoIFw8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqBmaWxlOi8vPHdicj5lZmUwYmUyNzk5MDEwMDZmOTM5Y2QzNTdjY2VlNDc8d2Jy
PmI2NTFjNzg2ZGEucGF0Y2ggXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly88d2JyPmI2
YjY4ZGI4OTZmOTk2MzU1ODMzNGFmZjdmY2E2MTx3YnI+YWRkZTRlYzEwZi5wYXRjaCBcPGJyPg0K
LcKgIMKgIMKgIMKgIMKgIMKgZmlsZTovL2Zhc3RvcHJlcGx5LnBhdGNoIFw8YnI+DQotwqAgwqAg
wqAgwqAgwqAgwqBmaWxlOi8vdG9vbWFueWZpbGVzLnBhdGNoIFw8YnI+DQotwqAgwqAgwqAgwqAg
wqAgwqBmaWxlOi8vMDAwMS1Vc2UtZXBvbGwtQVBJLW9uLTx3YnI+TGludXgucGF0Y2ggXDxicj4N
Ci3CoCDCoCDCoCDCoCDCoCDCoCZxdW90Ozxicj4NCi08YnI+DQotU1JDX1VSSVttZDVzdW1dID0g
JnF1b3Q7PHdicj43ZDQxZTcyMTg4ZmJlYTFmNjk2YzM5OWMxYTQzNTY8d2JyPjc1JnF1b3Q7PGJy
Pg0KLVNSQ19VUklbc2hhMjU2c3VtXSA9ICZxdW90Ozx3YnI+Y2ViNDU2YmQ0Nzc3MGEzN2NhMjA3
ODRhOTFkNzE1PHdicj5jNWE3NjAxZTA3ZTI2YWIxMWIwYzc3ZTkyMDNlZDM8d2JyPmQxOTYmcXVv
dDs8YnI+DQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRvLzxh
IGhyZWY9Imh0dHA6Ly9wc2V1ZG9fZ2l0LmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5wc2V1ZG9fZ2l0LmJiPC9hPiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy88d2JyPnBzZXVk
by88YSBocmVmPSJodHRwOi8vcHNldWRvX2dpdC5iYiIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+cHNldWRvX2dpdC5iYjwvYT48YnI+DQppbmRleCA0MmM3YjJlYTU3Mi4uYWM5YmQw
NzlmOGIgMTAwNjQ0PGJyPg0KLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzLzx3YnI+cHNldWRv
LzxhIGhyZWY9Imh0dHA6Ly9wc2V1ZG9fZ2l0LmJiIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5wc2V1ZG9fZ2l0LmJiPC9hPjxicj4NCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy88d2JyPnBzZXVkby88YSBocmVmPSJodHRwOi8vcHNldWRvX2dpdC5iYiIgcmVsPSJub3JlZmVy
cmVyIiB0YXJnZXQ9Il9ibGFuayI+cHNldWRvX2dpdC5iYjwvYT48YnI+DQpAQCAtMSwxNSArMSwx
NCBAQDxicj4NCsKgcmVxdWlyZSBwc2V1ZG8uaW5jPGJyPg0KPGJyPg0KLVNSQ1JFViA9ICZxdW90
Ozx3YnI+MDIxNjgzMDViMGExOWY5ODFmZmU4NTdmMzZlYjI1PHdicj42YmE4ODEwYjc3JnF1b3Q7
PGJyPg0KLVBWID0gJnF1b3Q7MS44LjIrZ2l0JHtTUkNQVn0mcXVvdDs8YnI+DQotPGJyPg0KLURF
RkFVTFRfUFJFRkVSRU5DRSA9ICZxdW90Oy0xJnF1b3Q7PGJyPg0KLTxicj4NCsKgU1JDX1VSSSA9
ICZxdW90O2dpdDovLzxhIGhyZWY9Imh0dHA6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9wc2V1ZG8i
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmdpdC55b2N0b3Byb2plY3Qub3JnLzx3
YnI+cHNldWRvPC9hPiBcPGJyPg0KwqAgwqAgwqAgwqAgwqAgwqAgZmlsZTovLzAwMDEtY29uZmln
dXJlLVBydW5lLTx3YnI+UElFLWZsYWdzLnBhdGNoIFw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBm
aWxlOi8vZmFsbGJhY2stcGFzc3dkIFw8YnI+DQrCoCDCoCDCoCDCoCDCoCDCoCBmaWxlOi8vZmFs
bGJhY2stZ3JvdXAgXDxicj4NCi3CoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly9tb3JlcmV0cmllcy5w
YXRjaCZxdW90Ozxicj4NCivCoCDCoCDCoCDCoCDCoCDCoGZpbGU6Ly9tb3JlcmV0cmllcy5wYXRj
aCBcPGJyPg0KK8KgIMKgIMKgIMKgIMKgIMKgZmlsZTovL3Rvb21hbnlmaWxlcy5wYXRjaCBcPGJy
Pg0KK8KgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7PGJyPg0KPGJyPg0KK1NSQ1JFViA9ICZxdW90Ozx3
YnI+YjZhMDE1YWE5MWQ3YWI4NGMyZjU0NjZmM2I1NzA0PHdicj5mNTAxMTI5Y2JjJnF1b3Q7PGJy
Pg0KwqBTID0gJnF1b3Q7JHtXT1JLRElSfS9naXQmcXVvdDs8YnI+DQorUFYgPSAmcXVvdDsxLjku
MCtnaXQke1NSQ1BWfSZxdW90Ozxicj4NCjxzcGFuIGNsYXNzPSJIT0VuWmIiPjxmb250IGNvbG9y
PSIjODg4ODg4Ij48YnI+DQotLTxicj4NCjIuMTUuMTxicj4NCjxicj4NCi0tPGJyPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fPHdicj5fX19fX19fX19fX19fX19fXzxicj4NCk9wZW5l
bWJlZGRlZC1jb3JlIG1haWxpbmcgbGlzdDxicj4NCjxhIGhyZWY9Im1haWx0bzpPcGVuZW1iZWRk
ZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIj5PcGVuZW1iZWRkZWQtY29yZUBsaXN0cy48
d2JyPm9wZW5lbWJlZGRlZC5vcmc8L2E+PGJyPg0KPGEgaHJlZj0iaHR0cDovL2xpc3RzLm9wZW5l
bWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtY29yZSIgcmVsPSJub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvPHdi
cj5tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC08d2JyPmNvcmU8L2E+PGJyPg0KPC9mb250
Pjwvc3Bhbj48L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2Pg0K

--001a11442cd4bf280a05655737b7--
