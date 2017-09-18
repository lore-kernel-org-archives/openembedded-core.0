Return-Path: <liu.ming50@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id D75FD6079E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 14:40:40 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b1so755259qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=ep/KYP2nRD3mEYrWcsPb2dVRiXYo1KU3N+hjEzbDnJ0=;
	b=WCp+9IcWh3oRFcud9b6Lcs7PjVzqxmy3KxjsyRhj+R2nLAqrm2pQoT6DGI/E7vdAKk
	zUfgBSb4CNErwMCPbivypQgzQbKfOzONhccWuWR4B0U41ecq4PVUHcCfy0sPDFckta8K
	qlm208SmxXuuAfpoGiuJR5bJ5/nKDzn5+lw+K1Ke2Iq1dp21a4xiTZcyI1Pm7AMs+5zB
	PXQALJRV7YdxRlpm2AiQTzYj5UTtdekci4PGAR+dg2J2ZqwNDq3uGEver+KHSFAObbgf
	h8RIB3ESNzVIcHDZS6m7grcEeFGBgb0sezvrgsMmH3auScx1jCANnUDNUJrrbjQQDDyM
	/e3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=ep/KYP2nRD3mEYrWcsPb2dVRiXYo1KU3N+hjEzbDnJ0=;
	b=QqwHZrI0IYPPji2LjknTbQWYWhnZyYFvjWv7uAeFFQ5TXx/YJidQZC3lquh6QZqhKS
	jSHq7OOY33f6+sPbQAO9fU6qGP86xdRYq+M78md0xdL0WO09Y5GsLSmhHgKzB+diAw5d
	oHmCJF1a8Io7VlESHOwdB5MXdWNeyLk/VvgHkp7eqypU/eEUKmiYMslvof4iN8n0poNO
	h7Fq0M+IV/fE4D1Hyh6JogTBojWTPW9nQ2kofC/7CfWKP1d7CIKfeIG5p4bQ4EuOtj1a
	WNYmP/RIt6OAhYRIQQxfGV88AjhI9qvB32cyiv6pdgE1vz0om/Xb38sKiIIxGLJ5Rohu
	qBtQ==
X-Gm-Message-State: AHPjjUiwecm8g1DgE6x9EJxKNh1TtLNBJwsWUDSHCBu/PbZCYZ/ZN9Fb
	2hXXCsvdORPurgXjwnN2g9uH3Vd/87Qr6UVPUYcHIQ==
X-Google-Smtp-Source: AOwi7QC/qiK8LpigorWemlMAhvG38aRJU286l7zo3xKNVS8SW3hPLnN1octWq+aQWT6UUBFkqVWMnmS+2nvfaKx/wAk=
X-Received: by 10.200.53.168 with SMTP id k37mr49116610qtb.237.1505745641235; 
	Mon, 18 Sep 2017 07:40:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.41.67 with HTTP; Mon, 18 Sep 2017 07:40:40 -0700 (PDT)
In-Reply-To: <mailman.10873.1505745454.1653.openembedded-core@lists.openembedded.org>
References: <mailman.10873.1505745454.1653.openembedded-core@lists.openembedded.org>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 18 Sep 2017 16:40:40 +0200
Message-ID: <CALatG=7E-HM2pKu_FLnk7YjXyj5bedzPy98r4r7nrrQ6Lgr9Pw@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Openembedded-core Digest, Vol 80, Issue 148
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
X-List-Received-Date: Mon, 18 Sep 2017 14:40:41 -0000
Content-Type: multipart/alternative; boundary="001a113e614e116b6a055977ba9b"

--001a113e614e116b6a055977ba9b
Content-Type: text/plain; charset="UTF-8"

> Busybox can also provide sysctl so there's no hard dependency on procps.

Arha, that is correct, please ignore my patch then.

//Ming Liu

2017-09-18 16:37 GMT+02:00 <openembedded-core-request@lists.openembedded.org
>:

> Send Openembedded-core mailing list submissions to
>         openembedded-core@lists.openembedded.org
>
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.openembedded.org/mailman/listinfo/openembedded-core
> or, via email, send a message with subject or body 'help' to
>         openembedded-core-request@lists.openembedded.org
>
> You can reach the person managing the list at
>         openembedded-core-owner@lists.openembedded.org
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of Openembedded-core digest..."
>
>
> Today's Topics:
>
>    1. [PATCHv2] pseudo: use epoll API on Linux (Alexander Kanavin)
>    2. [pyro][PATCH] goarch.bbclass: Replace logic for setting   GOARM
>       (Will Newton)
>    3. Re: [PATCH 1/2] base-files: profile: Do not assume that the
>       'command' command exists (Mike Looijmans)
>    4. [PATCH] base-files: profile: Get rid of "resize" (Mike Looijmans)
>    5. ? patchtest: failure for "base-files: profile: Do not as..."
>       and 1 more (rev2) (Patchwork)
>    6. Re: [PATCH] init-ifupdown: RDEPENDS on procps (Mike Looijmans)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon, 18 Sep 2017 16:34:10 +0300
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> To: openembedded-core@lists.openembedded.org,   seebs@seebs.net
> Subject: [OE-core] [PATCHv2] pseudo: use epoll API on Linux
> Message-ID: <20170918133410.31388-1-alexander.kanavin@linux.intel.com>
>
> The idea came up here:
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=11309
> and here:
> http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141491.html
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../pseudo/files/0001-Use-epoll-API-on-Linux.patch | 273
> +++++++++++++++++++++
>  meta/recipes-devtools/pseudo/pseudo_1.8.2.bb       |   1 +
>  2 files changed, 274 insertions(+)
>  create mode 100644 meta/recipes-devtools/pseudo/
> files/0001-Use-epoll-API-on-Linux.patch
>
> diff --git a/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> new file mode 100644
> index 00000000000..2e304f9811c
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/0001-Use-epoll-API-on-Linux.patch
> @@ -0,0 +1,273 @@
> +From 55fe7dc646f560bdf79309bc8677902e53686d65 Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Fri, 15 Sep 2017 17:00:14 +0300
> +Subject: [PATCH] Use epoll API on Linux
> +
> +Upstream-Status: Submitted [Seebs CC'd by email]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +
> +
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + enums/exit_status.in |   3 +
> + pseudo_server.c      | 178 ++++++++++++++++++++++++++++++
> ++++++++++++++++++++-
> + 2 files changed, 179 insertions(+), 2 deletions(-)
> +
> +diff --git a/enums/exit_status.in b/enums/exit_status.in
> +index 6be44d3..88f94cd 100644
> +--- a/enums/exit_status.in
> ++++ b/enums/exit_status.in
> +@@ -18,3 +18,6 @@ listen_fd, "server loop had no valid listen fd"
> + pseudo_loaded, "server couldn't get out of pseudo environment"
> + pseudo_prefix, "couldn't get valid pseudo prefix"
> + pseudo_invocation, "invalid server command arguments"
> ++epoll_create, "epoll_create() failed"
> ++epoll_ctl, "epoll_ctl() failed"
> ++
> +diff --git a/pseudo_server.c b/pseudo_server.c
> +index ff16efd..09c43e4 100644
> +--- a/pseudo_server.c
> ++++ b/pseudo_server.c
> +@@ -40,6 +40,12 @@
> + #include "pseudo_client.h"
> + #include "pseudo_db.h"
> +
> ++// This has to come after pseudo includes, as that's where PSEUDO_PORT
> defines are
> ++#ifdef PSEUDO_PORT_LINUX
> ++#include <sys/epoll.h>
> ++#endif
> ++
> ++
> + static int listen_fd = -1;
> +
> + typedef struct {
> +@@ -59,6 +65,7 @@ static int active_clients = 0, highest_client = 0,
> max_clients = 0;
> +
> + #define LOOP_DELAY 2
> + #define DEFAULT_PSEUDO_SERVER_TIMEOUT 30
> ++#define EPOLL_MAX_EVENTS 10
> + int pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
> + static int die_peacefully = 0;
> + static int die_forcefully = 0;
> +@@ -80,7 +87,11 @@ quit_now(int signal) {
> + static int messages = 0, responses = 0;
> + static struct timeval message_time = { .tv_sec = 0 };
> +
> ++#ifdef PSEUDO_PORT_LINUX
> ++static void pseudo_server_loop_epoll(void);
> ++#else
> + static void pseudo_server_loop(void);
> ++#endif
> +
> + /* helper function to make a directory, just like mkdir -p.
> +  * Can't use system() because the child shell would end up trying
> +@@ -369,12 +380,16 @@ pseudo_server_start(int daemonize) {
> +                       kill(ppid, SIGUSR1);
> +               }
> +       }
> ++#ifdef PSEUDO_PORT_LINUX
> ++      pseudo_server_loop_epoll();
> ++#else
> +       pseudo_server_loop();
> ++#endif
> +       return 0;
> + }
> +
> + /* mess with internal tables as needed */
> +-static void
> ++static unsigned int
> + open_client(int fd) {
> +       pseudo_client_t *new_clients;
> +       int i;
> +@@ -390,7 +405,7 @@ open_client(int fd) {
> +                       ++active_clients;
> +                       if (i > highest_client)
> +                               highest_client = i;
> +-                      return;
> ++                      return i;
> +               }
> +       }
> +
> +@@ -414,9 +429,11 @@ open_client(int fd) {
> +
> +               max_clients += 16;
> +               ++active_clients;
> ++              return max_clients - 16;
> +       } else {
> +               pseudo_diag("error allocating new client, fd %d\n", fd);
> +               close(fd);
> ++              return 0;
> +       }
> + }
> +
> +@@ -566,6 +583,162 @@ serve_client(int i) {
> +       }
> + }
> +
> ++#ifdef PSEUDO_PORT_LINUX
> ++static void pseudo_server_loop_epoll(void)
> ++{
> ++      struct sockaddr_un client;
> ++      socklen_t len;
> ++        int i;
> ++        int rc;
> ++        int fd;
> ++      int timeout;
> ++      struct epoll_event ev, events[EPOLL_MAX_EVENTS];
> ++      int loop_timeout = pseudo_server_timeout;
> ++
> ++      clients = malloc(16 * sizeof(*clients));
> ++
> ++      clients[0].fd = listen_fd;
> ++      clients[0].pid = getpid();
> ++
> ++      for (i = 1; i < 16; ++i) {
> ++              clients[i].fd = -1;
> ++              clients[i].pid = 0;
> ++              clients[i].tag = NULL;
> ++              clients[i].program = NULL;
> ++      }
> ++
> ++      active_clients = 1;
> ++      max_clients = 16;
> ++      highest_client = 0;
> ++
> ++      pseudo_debug(PDBGF_SERVER, "server loop started.\n");
> ++      if (listen_fd < 0) {
> ++              pseudo_diag("got into loop with no valid listen fd.\n");
> ++              exit(PSEUDO_EXIT_LISTEN_FD);
> ++      }
> ++
> ++      timeout = LOOP_DELAY * 1000;
> ++
> ++      int epollfd = epoll_create1(0);
> ++      if (epollfd == -1) {
> ++              pseudo_diag("epoll_create1() failed.\n");
> ++              exit(PSEUDO_EXIT_EPOLL_CREATE);
> ++      }
> ++      ev.events = EPOLLIN;
> ++      ev.data.u64 = 0;
> ++      if (epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[0].fd, &ev) == -1) {
> ++              pseudo_diag("epoll_ctl() failed with listening socket.\n");
> ++              exit(PSEUDO_EXIT_EPOLL_CTL);
> ++      }
> ++
> ++      pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, "server started (pid
> %d)", getpid());
> ++
> ++        for (;;) {
> ++              rc = epoll_wait(epollfd, events, EPOLL_MAX_EVENTS,
> timeout);
> ++              if (rc == 0 || (rc == -1 && errno == EINTR)) {
> ++                      /* If there's no clients, start timing out.  If
> there
> ++                       * are active clients, never time out.
> ++                       */
> ++                      if (active_clients == 1) {
> ++                              loop_timeout -= LOOP_DELAY;
> ++                                /* maybe flush database to disk */
> ++                                pdb_maybe_backup();
> ++                              if (loop_timeout <= 0) {
> ++                                      pseudo_debug(PDBGF_SERVER, "no
> more clients, got bored.\n");
> ++                                      die_peacefully = 1;
> ++                              } else {
> ++                                      /* display this if not exiting */
> ++                                      pseudo_debug(PDBGF_SERVER |
> PDBGF_BENCHMARK, "%d messages handled in %.4f seconds, %d responses\n",
> ++                                              messages,
> ++                                              (double)
> message_time.tv_sec +
> ++                                              (double)
> message_time.tv_usec / 1000000.0,
> ++                                                responses);
> ++                              }
> ++                      }
> ++              } else if (rc > 0) {
> ++                      loop_timeout = pseudo_server_timeout;
> ++                      for (i = 0; i < rc; ++i) {
> ++                              if (clients[events[i].data.u64].fd ==
> listen_fd) {
> ++                                      if (!die_forcefully) {
> ++                                              len = sizeof(client);
> ++                                              if ((fd =
> accept(listen_fd, (struct sockaddr *) &client, &len)) != -1) {
> ++                                              /* Don't allow clients to
> end up on fd 2, because glibc's
> ++                                               * malloc debug uses that
> fd unconditionally.
> ++                                               */
> ++                                                      if (fd == 2) {
> ++                                                              int newfd
> = fcntl(fd, F_DUPFD, 3);
> ++                                                              close(fd);
> ++                                                              fd = newfd;
> ++                                                      }
> ++
> pseudo_debug(PDBGF_SERVER, "new client fd %d\n", fd);
> ++                                                      /* A new client
> implicitly cancels any
> ++                                                       * previous
> shutdown request, or a
> ++                                                       * shutdown for
> lack of clients.
> ++                                                       */
> ++
> pseudo_server_timeout = DEFAULT_PSEUDO_SERVER_TIMEOUT;
> ++                                                      die_peacefully = 0;
> ++
> ++                                                      ev.events =
> EPOLLIN;
> ++                                                      ev.data.u64 =
> open_client(fd);
> ++                                                      if (ev.data.u64 !=
> 0 && epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[ev.data.u64].fd, &ev) == -1)
> {
> ++
> pseudo_diag("epoll_ctl() failed with accepted socket.\n");
> ++
> exit(PSEUDO_EXIT_EPOLL_CTL);
> ++                                                      }
> ++                                              } else if (errno ==
> EMFILE) {
> ++                                                      // select() loop
> would drop a client here, we do nothing (for now)
> ++
> pseudo_debug(PDBGF_SERVER, "Hit max open files.\n");
> ++                                              }
> ++                                      }
> ++                              } else {
> ++                                      struct timeval tv1, tv2;
> ++                                        int rc;
> ++                                      gettimeofday(&tv1, NULL);
> ++                                      rc = serve_client(events[i].data.
> u64);
> ++                                      gettimeofday(&tv2, NULL);
> ++                                      ++messages;
> ++                                        if (rc == 0)
> ++                                                ++responses;
> ++                                      message_time.tv_sec += (tv2.tv_sec
> - tv1.tv_sec);
> ++                                      message_time.tv_usec +=
> (tv2.tv_usec - tv1.tv_usec);
> ++                                      if (message_time.tv_usec < 0) {
> ++                                              message_time.tv_usec +=
> 1000000;
> ++                                              --message_time.tv_sec;
> ++                                      } else while (message_time.tv_usec
> > 1000000) {
> ++                                              message_time.tv_usec -=
> 1000000;
> ++                                              ++message_time.tv_sec;
> ++                                      }
> ++                              }
> ++                              if (die_forcefully)
> ++                                      break;
> ++                      }
> ++                      pseudo_debug(PDBGF_SERVER, "server loop complete
> [%d clients left]\n", active_clients);
> ++              } else {
> ++                      pseudo_diag("epoll_wait failed: %s\n",
> strerror(errno));
> ++                      break;
> ++              }
> ++              if (die_peacefully || die_forcefully) {
> ++                      pseudo_debug(PDBGF_SERVER, "quitting.\n");
> ++                      pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK,
> "server %d exiting: handled %d messages in %.4f seconds\n",
> ++                              getpid(), messages,
> ++                              (double) message_time.tv_sec +
> ++                              (double) message_time.tv_usec / 1000000.0);
> ++                      pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL,
> "server %d exiting: handled %d messages in %.4f seconds",
> ++                              getpid(), messages,
> ++                              (double) message_time.tv_sec +
> ++                              (double) message_time.tv_usec / 1000000.0);
> ++                      /* and at this point, we'll start refusing
> connections */
> ++                      close(clients[0].fd);
> ++                      /* This is a good place to insert a delay for
> ++                       * debugging race conditions during startup. */
> ++                      /* usleep(300000); */
> ++                      exit(0);
> ++              }
> ++      }
> ++
> ++}
> ++
> ++#else
> ++
> + /* get clients, handle messages, shut down.
> +  * This doesn't actually do any work, it just calls a ton of things which
> +  * do work.
> +@@ -751,3 +924,4 @@ pseudo_server_loop(void) {
> +       }
> +       pseudo_diag("select failed: %s\n", strerror(errno));
> + }
> ++#endif
> +--
> +2.14.1
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> index 9bcd0318926..81853e95c42 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.8.2.bb
> @@ -8,6 +8,7 @@ SRC_URI = "http://downloads.yoctoproject.org/releases/
> pseudo/${BPN}-${PV}.tar.bz
>             file://efe0be279901006f939cd357ccee47b651c786da.patch \
>             file://b6b68db896f9963558334aff7fca61adde4ec10f.patch \
>             file://toomanyfiles.patch \
> +           file://0001-Use-epoll-API-on-Linux.patch \
>             "
>
>  SRC_URI[md5sum] = "7d41e72188fbea1f696c399c1a435675"
> --
> 2.14.1
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 18 Sep 2017 16:43:56 +0300
> From: Will Newton <will.newton@gmail.com>
> To: openembedded-core@lists.openembedded.org
> Cc: Will Newton <willn@resin.io>, Otavio Salvador
>         <otavio@ossystems.com.br>
> Subject: [OE-core] [pyro][PATCH] goarch.bbclass: Replace logic for
>         setting GOARM
> Message-ID: <20170918134356.16124-1-willn@resin.io>
>
> From: Will Newton <will.newton@gmail.com>
>
> The previous logic applied a regex to TUNE_FEATURES which could
> set the GOARM value to 7 incorrectly, for example when dealing
> with an arm1176 core. Simplify to check for the presence of
> "armv7" instead. At the same time add a check for "armv6" and
> set GOARM to 6 in that case.
>
> (From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3b9c50a336d)
>
> Signed-off-by: Will Newton <willn@resin.io>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/goarch.bbclass | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 4a5b2ec787..12df88f8c4 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -38,8 +38,11 @@ def go_map_arch(a, d):
>
>  def go_map_arm(a, f, d):
>      import re
> -    if re.match('arm.*', a) and re.match('arm.*7.*', f):
> -        return '7'
> +    if re.match('arm.*', a):
> +        if 'armv7' in f:
> +            return '7'
> +        elif 'armv6' in f:
> +            return '6'
>      return ''
>
>  def go_map_os(o, d):
> --
> 2.13.5
>
>
>
> ------------------------------
>
> Message: 3
> Date: Mon, 18 Sep 2017 15:56:25 +0200
> From: Mike Looijmans <mike.looijmans@topic.nl>
> To: <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 1/2] base-files: profile: Do not assume
>         that the 'command' command exists
> Message-ID: <411d4d88-f166-1c4e-2dc4-3009d157b071@topic.nl>
> Content-Type: text/plain; charset="utf-8"; format=flowed
>
> ?On 18-09-17 15:24, Mike Looijmans wrote:
> > On 18-09-17 15:08, Burton, Ross wrote:
> >> On 18 September 2017 at 12:31, Mike Looijmans <mike.looijmans@topic.nl
> >> <mailto:mike.looijmans@topic.nl>> wrote:
> >>
> >>         This is basically the same change as I first sent a patch for in
> >>         April, and
> >>         last pinged this Friday... The only real difference is that
> this one
> >>         misses
> >>         passing error output from resize to /dev/null (which it should
> do to
> >>         handle
> >>         the case where tty exists, but resize does not).
> >>
> >>
> >>     Yeah, indeed.
> >>
> >>
> >> Apologies for missing that patch!
> >>
> >>     Other problem is that "resize" outputs shell script on stdout to be
> >>     executed, so the proper "total" invokation would be:
> >>
> >>        /dev/tty[A-z]*) eval `resize 2>/dev/null` ;;
> >>
> >>     The "eval" part is missing in your version...
> >>
> >>
> >> Who is going to submit the One True patch with all the fixes in?  I
> promise
> >> to merge it.
> >
> > I'll send the one ring, eh, patch, in a few minutes. I'll merge the two
> into a
> > single as well.
>
> On second thought, just use Peter's patch "as is".
>
> I've been experimenting with the "eval" part and it doesn't behave well.
> Tends
> to confuse minicom, create garbage, and in particular when run from
> "profile",
> it seems to result in counterproductive COLUMNS=0 and LINES=0.
>
> I'm actually wondering why the call to "resize" is being done at all. Just
> calling "resize" has no effect, since it outputs the results on stdout as
> shell script, and that is being discarded. Looking at the commit that
> introduced it:
>
> cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)
>
> that already has no effect whatsoever. See the man page for resize:
> https://linux.die.net/man/1/resize
>
> I also would consider running some program's output as shell script a bit
> spooky, it looks like a security hole waiting to be exploited.
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> ------------------------------
>
> Message: 4
> Date: Mon, 18 Sep 2017 16:07:14 +0200
> From: Mike Looijmans <mike.looijmans@topic.nl>
> To: openembedded-core@lists.openembedded.org
> Cc: Mike Looijmans <mike.looijmans@topic.nl>,
>         peter.kjellerstedt@axis.com
> Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
> Message-ID:
>         <1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
>
> The "resize" command actually outputs shell commands to be executed, for
> example:
>
> $ resize
> COLUMNS=102;
> LINES=27;
> export COLUMNS LINES;
>
> The output of "resize" is being discarded to /dev/null so the call has no
> effect whatsoever, and does not change the environment (it cannot change
> the
> environment of its parent). Remove the call and hence solve the messages
> about shells missing "command" or "tty" or "resize".
>
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta/recipes-core/base-files/base-files/profile | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/meta/recipes-core/base-files/base-files/profile
> b/meta/recipes-core/base-files/base-files/profile
> index a062028..cfd0d69 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
>         unset i
>  fi
>
> -if command -v resize >/dev/null && command -v tty >/dev/null; then
> -       # Make sure we are on a serial console (i.e. the device used
> starts with
> -       # /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher
> which
> -       # tries do use ssh
> -       case $(tty) in
> -               /dev/tty[A-z]*) resize >/dev/null;;
> -       esac
> -fi
> -
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>
>  umask 022
> --
> 1.9.1
>
>
>
> ------------------------------
>
> Message: 5
> Date: Mon, 18 Sep 2017 14:30:26 -0000
> From: Patchwork <patchwork@patchwork.openembedded.org>
> To: mike.looijmans@topic.nl
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] ? patchtest: failure for "base-files: profile: Do
>         not as..." and 1 more (rev2)
> Message-ID: <20170918143026.2786.12950@do.openembedded.org>
> Content-Type: text/plain; charset="utf-8"
>
> == Series Details ==
>
> Series: "base-files: profile: Do not as..." and 1 more (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/8967/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             Series does not apply on top of target branch
> [test_series_merge_on_head]
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at cbc396dd10)
>
>
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your
> concerns.
> Otherwise we would appreciate you correcting the issues and submitting a
> new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>
>
>
> ------------------------------
>
> Message: 6
> Date: Mon, 18 Sep 2017 14:47:08 +0200
> From: Mike Looijmans <mike.looijmans@topic.nl>
> To: <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] init-ifupdown: RDEPENDS on procps
> Message-ID: <b29b9784-57af-089a-35b1-4b339ca84fd9@topic.nl>
> Content-Type: text/plain; charset="utf-8"; format=flowed
>
> ?Busybox can also provide sysctl so there's no hard dependency on procps.
>
>
> On 18-09-17 14:43, liu.ming50@gmail.com wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS
> > on procps.
> >
> > Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> > ---
> >   meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > index 733ae41..8774386 100644
> > --- a/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > +++ b/meta/recipes-core/init-ifupdown/init-ifupdown_1.0.bb
> > @@ -35,7 +35,7 @@ do_install_append_qemuall () {
> >   }
> >
> >   PACKAGE_ARCH_qemuall = "${MACHINE_ARCH}"
> > -RDEPENDS_${PN} = "netbase"
> > +RDEPENDS_${PN} = "netbase procps"
> >   RCONFLICTS_${PN} = "netbase (< 1:5.0)"
> >
> >   CONFFILES_${PN} = "${sysconfdir}/network/interfaces"
> >
>
>
>
> Kind regards,
>
> Mike Looijmans
> System Expert
>
> TOPIC Products
> Materiaalweg 4, NL-5681 RJ Best
> Postbus 440, NL-5680 AK Best
> Telefoon: +31 (0) 499 33 69 79
> E-mail: mike.looijmans@topicproducts.com
> Website: www.topicproducts.com
>
> Please consider the environment before printing this e-mail
>
>
>
>
>
> ------------------------------
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> End of Openembedded-core Digest, Vol 80, Issue 148
> **************************************************
>

--001a113e614e116b6a055977ba9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt;=C2=A0<span style=3D"font-size:14px">Busybox can also =
provide sysctl so there&#39;s no hard dependency on procps.</span><div><spa=
n style=3D"font-size:14px"><br></span></div><div><span style=3D"font-size:1=
4px">Arha, that is correct, please ignore my patch then.</span></div><div><=
span style=3D"font-size:14px"><br></span></div><div><span style=3D"font-siz=
e:14px">//Ming Liu</span></div></div><div class=3D"gmail_extra"><br><div cl=
ass=3D"gmail_quote">2017-09-18 16:37 GMT+02:00  <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:openembedded-core-request@lists.openembedded.org" target=3D"_b=
lank">openembedded-core-request@lists.openembedded.org</a>&gt;</span>:<br><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Send Openembedded-core mailing list submissio=
ns to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openembedded-core@lists.opene=
mbedded.org">openembedded-core@lists.<wbr>openembedded.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/<wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openembedded-core-request@lis=
ts.openembedded.org">openembedded-core-request@<wbr>lists.openembedded.org<=
/a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:openembedded-core-owner@lists=
.openembedded.org">openembedded-core-owner@lists.<wbr>openembedded.org</a><=
br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of Openembedded-core digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A01. [PATCHv2] pseudo: use epoll API on Linux (Alexander Kanavin=
)<br>
=C2=A0 =C2=A02. [pyro][PATCH] goarch.bbclass: Replace logic for setting=C2=
=A0 =C2=A0GOARM<br>
=C2=A0 =C2=A0 =C2=A0 (Will Newton)<br>
=C2=A0 =C2=A03. Re: [PATCH 1/2] base-files: profile: Do not assume that the=
<br>
=C2=A0 =C2=A0 =C2=A0 &#39;command&#39; command exists (Mike Looijmans)<br>
=C2=A0 =C2=A04. [PATCH] base-files: profile: Get rid of &quot;resize&quot; =
(Mike Looijmans)<br>
=C2=A0 =C2=A05. ? patchtest: failure for &quot;base-files: profile: Do not =
as...&quot;<br>
=C2=A0 =C2=A0 =C2=A0 and 1 more (rev2) (Patchwork)<br>
=C2=A0 =C2=A06. Re: [PATCH] init-ifupdown: RDEPENDS on procps (Mike Looijma=
ns)<br>
<br>
<br>
------------------------------<wbr>------------------------------<wbr>-----=
-----<br>
<br>
Message: 1<br>
Date: Mon, 18 Sep 2017 16:34:10 +0300<br>
From: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@linux.intel=
.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a>,=C2=A0 =C2=A0<a href=3D"mailto:seebs=
@seebs.net">seebs@seebs.net</a><br>
Subject: [OE-core] [PATCHv2] pseudo: use epoll API on Linux<br>
Message-ID: &lt;<a href=3D"mailto:20170918133410.31388-1-alexander.kanavin@=
linux.intel.com">20170918133410.31388-1-<wbr>alexander.kanavin@linux.intel.=
<wbr>com</a>&gt;<br>
<br>
The idea came up here:<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D11309" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.<wbr>org/sh=
ow_bug.cgi?id=3D11309</a><br>
and here:<br>
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017-A=
ugust/141491.html" rel=3D"noreferrer" target=3D"_blank">http://lists.openem=
bedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141491.html</a=
><br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com">alexander.kanavin@linux.<wbr>intel.com</a>&gt;<br>
---<br>
=C2=A0.../pseudo/files/0001-Use-<wbr>epoll-API-on-Linux.patch | 273 +++++++=
++++++++++++++<br>
=C2=A0meta/recipes-devtools/pseudo/<a href=3D"http://pseudo_1.8.2.bb" rel=
=3D"noreferrer" target=3D"_blank">p<wbr>seudo_1.8.2.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A02 files changed, 274 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/pseudo/<wbr>files/0001-Use-e=
poll-API-on-<wbr>Linux.patch<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>pseudo/files/0001-Use-epoll-<wbr>AP=
I-on-Linux.patch b/meta/recipes-devtools/<wbr>pseudo/files/0001-Use-epoll-<=
wbr>API-on-Linux.patch<br>
new file mode 100644<br>
index 00000000000..2e304f9811c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<wbr>pseudo/files/0001-Use-epoll-<wbr>API-on-Li=
nux.patch<br>
@@ -0,0 +1,273 @@<br>
+From 55fe7dc646f560bdf79309bc867790<wbr>2e53686d65 Mon Sep 17 00:00:00 200=
1<br>
+From: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex=
.kanavin@gmail.com</a>&gt;<br>
+Date: Fri, 15 Sep 2017 17:00:14 +0300<br>
+Subject: [PATCH] Use epoll API on Linux<br>
+<br>
+Upstream-Status: Submitted [Seebs CC&#39;d by email]<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+<br>
+<br>
+Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com">alex.kanavin@gmail.com</a>&gt;<br>
+---<br>
+ enums/<a href=3D"http://exit_status.in" rel=3D"noreferrer" target=3D"_bla=
nk">exit_status.in</a> |=C2=A0 =C2=A03 +<br>
+ pseudo_server.c=C2=A0 =C2=A0 =C2=A0 | 178 ++++++++++++++++++++++++++++++<=
wbr>++++++++++++++++++++-<br>
+ 2 files changed, 179 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/enums/<a href=3D"http://exit_status.in" rel=3D"noreferrer" ta=
rget=3D"_blank">exit_status.in</a> b/enums/<a href=3D"http://exit_status.in=
" rel=3D"noreferrer" target=3D"_blank">exit_status.in</a><br>
+index 6be44d3..88f94cd 100644<br>
+--- a/enums/<a href=3D"http://exit_status.in" rel=3D"noreferrer" target=3D=
"_blank">exit_status.in</a><br>
++++ b/enums/<a href=3D"http://exit_status.in" rel=3D"noreferrer" target=3D=
"_blank">exit_status.in</a><br>
+@@ -18,3 +18,6 @@ listen_fd, &quot;server loop had no valid listen fd&quot=
;<br>
+ pseudo_loaded, &quot;server couldn&#39;t get out of pseudo environment&qu=
ot;<br>
+ pseudo_prefix, &quot;couldn&#39;t get valid pseudo prefix&quot;<br>
+ pseudo_invocation, &quot;invalid server command arguments&quot;<br>
++epoll_create, &quot;epoll_create() failed&quot;<br>
++epoll_ctl, &quot;epoll_ctl() failed&quot;<br>
++<br>
+diff --git a/pseudo_server.c b/pseudo_server.c<br>
+index ff16efd..09c43e4 100644<br>
+--- a/pseudo_server.c<br>
++++ b/pseudo_server.c<br>
+@@ -40,6 +40,12 @@<br>
+ #include &quot;pseudo_client.h&quot;<br>
+ #include &quot;pseudo_db.h&quot;<br>
+<br>
++// This has to come after pseudo includes, as that&#39;s where PSEUDO_POR=
T defines are<br>
++#ifdef PSEUDO_PORT_LINUX<br>
++#include &lt;sys/epoll.h&gt;<br>
++#endif<br>
++<br>
++<br>
+ static int listen_fd =3D -1;<br>
+<br>
+ typedef struct {<br>
+@@ -59,6 +65,7 @@ static int active_clients =3D 0, highest_client =3D 0, m=
ax_clients =3D 0;<br>
+<br>
+ #define LOOP_DELAY 2<br>
+ #define DEFAULT_PSEUDO_SERVER_TIMEOUT 30<br>
++#define EPOLL_MAX_EVENTS 10<br>
+ int pseudo_server_timeout =3D DEFAULT_PSEUDO_SERVER_TIMEOUT;<br>
+ static int die_peacefully =3D 0;<br>
+ static int die_forcefully =3D 0;<br>
+@@ -80,7 +87,11 @@ quit_now(int signal) {<br>
+ static int messages =3D 0, responses =3D 0;<br>
+ static struct timeval message_time =3D { .tv_sec =3D 0 };<br>
+<br>
++#ifdef PSEUDO_PORT_LINUX<br>
++static void pseudo_server_loop_epoll(void)<wbr>;<br>
++#else<br>
+ static void pseudo_server_loop(void);<br>
++#endif<br>
+<br>
+ /* helper function to make a directory, just like mkdir -p.<br>
+=C2=A0 * Can&#39;t use system() because the child shell would end up tryin=
g<br>
+@@ -369,12 +380,16 @@ pseudo_server_start(int daemonize) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kill(ppid, SIGUSR1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++#ifdef PSEUDO_PORT_LINUX<br>
++=C2=A0 =C2=A0 =C2=A0 pseudo_server_loop_epoll();<br>
++#else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_server_loop();<br>
++#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+<br>
+ /* mess with internal tables as needed */<br>
+-static void<br>
++static unsigned int<br>
+ open_client(int fd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_client_t *new_clients;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
+@@ -390,7 +405,7 @@ open_client(int fd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0++active_clients;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (i &gt; highest_client)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0highest_client =3D i;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+@@ -414,9 +429,11 @@ open_client(int fd) {<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0max_clients +=3D 16=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0++active_clients;<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return max_clients - 16;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_diag(&quot;e=
rror allocating new client, fd %d\n&quot;, fd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0close(fd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
+@@ -566,6 +583,162 @@ serve_client(int i) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ }<br>
+<br>
++#ifdef PSEUDO_PORT_LINUX<br>
++static void pseudo_server_loop_epoll(void)<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 struct sockaddr_un client;<br>
++=C2=A0 =C2=A0 =C2=A0 socklen_t len;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 int fd;<br>
++=C2=A0 =C2=A0 =C2=A0 int timeout;<br>
++=C2=A0 =C2=A0 =C2=A0 struct epoll_event ev, events[EPOLL_MAX_EVENTS];<br>
++=C2=A0 =C2=A0 =C2=A0 int loop_timeout =3D pseudo_server_timeout;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 clients =3D malloc(16 * sizeof(*clients));<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 clients[0].fd =3D listen_fd;<br>
++=C2=A0 =C2=A0 =C2=A0 clients[0].pid =3D getpid();<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 for (i =3D 1; i &lt; 16; ++i) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clients[i].fd =3D -1;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clients[i].pid =3D 0;<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clients[i].tag =3D NULL;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clients[i].program =3D N=
ULL;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 active_clients =3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 max_clients =3D 16;<br>
++=C2=A0 =C2=A0 =C2=A0 highest_client =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pseudo_debug(PDBGF_SERVER, &quot;server loop started=
.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 if (listen_fd &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_diag(&quot;got in=
to loop with no valid listen fd.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(PSEUDO_EXIT_LISTEN_=
FD);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 timeout =3D LOOP_DELAY * 1000;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 int epollfd =3D epoll_create1(0);<br>
++=C2=A0 =C2=A0 =C2=A0 if (epollfd =3D=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_diag(&quot;epoll_=
create1() failed.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(PSEUDO_EXIT_EPOLL_C=
REATE)<wbr>;<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 ev.events =3D EPOLLIN;<br>
++=C2=A0 =C2=A0 =C2=A0 ev.data.u64 =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 if (epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[0].fd,=
 &amp;ev) =3D=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_diag(&quot;epoll_=
ctl() failed with listening socket.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(PSEUDO_EXIT_EPOLL_C=
TL);<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, &quot;s=
erver started (pid %d)&quot;, getpid());<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (;;) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D epoll_wait(epollf=
d, events, EPOLL_MAX_EVENTS, timeout);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc =3D=3D 0 || (rc =
=3D=3D -1 &amp;&amp; errno =3D=3D EINTR)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* If there&#39;s no clients, start timing out.=C2=A0 If there<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* are active clients, never time out.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (active_clients =3D=3D 1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 loop_timeout -=3D LOOP_DELAY;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* maybe flush database to disk */<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pdb_maybe_backup();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (loop_timeout &lt;=3D 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(PD=
BGF_SERVER, &quot;no more clients, got bored.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die_peacefully =
=3D 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* display this=
 if not exiting */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(PD=
BGF_SERVER | PDBGF_BENCHMARK, &quot;%d messages handled in %.4f seconds, %d=
 responses\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 messages,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (double) message_time.tv_sec +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 (double) message_time.tv_usec / 1000000.0,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 responses);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (rc &gt; 0) {<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 loop_timeout =3D pseudo_server_timeout;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for (i =3D 0; i &lt; rc; ++i) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clients[events[i].data.u64].<wbr>fd =3D=
=3D listen_fd) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!die_forcef=
ully) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 len =3D sizeof(client);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if ((fd =3D accept(listen_fd, (struct sockaddr *) &amp;client=
, &amp;len)) !=3D -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /* Don&#39;t allow clients to end up on fd 2, because glibc&#=
39;s<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0* malloc debug uses that fd unconditionally.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (fd =3D=3D 2) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int n=
ewfd =3D fcntl(fd, F_DUPFD, 3);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close=
(fd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fd =
=3D newfd;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(PDBGF_SERVER, &quot;=
new client fd %d\n&quot;, fd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* A new client implicitly cancel=
s any<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* previous shutdown request=
, or a<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* shutdown for lack of clie=
nts.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_server_timeout =3D DEFAULT=
_PSEUDO_SERVER_TIMEOUT;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die_peacefully =3D 0;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ev.events =3D EPOLLIN;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ev.data.u64 =3D open_client(fd);<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ev.data.u64 !=3D 0 &amp;&amp;=
 epoll_ctl(epollfd, EPOLL_CTL_ADD, clients[ev.data.u64].fd, &amp;ev) =3D=3D=
 -1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseud=
o_diag(&quot;epoll_ctl() failed with accepted socket.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(=
PSEUDO_EXIT_EPOLL_CTL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 } else if (errno =3D=3D EMFILE) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // select() loop would drop a cli=
ent here, we do nothing (for now)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pseudo_debug(PDBGF_SERVER, &quot;=
Hit max open files.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct timeval =
tv1, tv2;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rc;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gettimeofday(&a=
mp;tv1, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rc =3D serve_cl=
ient(events[i].data.<wbr>u64);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gettimeofday(&a=
mp;tv2, NULL);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ++messages;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rc =
=3D=3D 0)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 ++responses;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_time.tv=
_sec +=3D (tv2.tv_sec - tv1.tv_sec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 message_time.tv=
_usec +=3D (tv2.tv_usec - tv1.tv_usec);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (message_tim=
e.tv_usec &lt; 0) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 message_time.tv_usec +=3D 1000000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 --message_time.tv_sec;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else while (m=
essage_time.tv_usec &gt; 1000000) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 message_time.tv_usec -=3D 1000000;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 ++message_time.tv_sec;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (die_forcefully)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pseudo_debug(PDBGF_SERVER, &quot;server loop complete [%d clients left]=
\n&quot;, active_clients);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pseudo_diag(&quot;epoll_wait failed: %s\n&quot;, strerror(errno));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (die_peacefully || di=
e_forcefully) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pseudo_debug(PDBGF_SERVER, &quot;quitting.\n&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pseudo_debug(PDBGF_SERVER | PDBGF_BENCHMARK, &quot;server %d exiting: h=
andled %d messages in %.4f seconds\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getpid(), messages,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) message_time.tv_sec +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) message_time.tv_usec / 1000000.0);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pdb_log_msg(SEVERITY_INFO, NULL, NULL, NULL, &quot;server %d exiting: h=
andled %d messages in %.4f seconds&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 getpid(), messages,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) message_time.tv_sec +<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (double) message_time.tv_usec / 1000000.0);=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* and at this point, we&#39;ll start refusing connections */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 close(clients[0].fd);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* This is a good place to insert a delay for<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0* debugging race conditions during startup. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* usleep(300000); */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 exit(0);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 }<br>
++<br>
++}<br>
++<br>
++#else<br>
++<br>
+ /* get clients, handle messages, shut down.<br>
+=C2=A0 * This doesn&#39;t actually do any work, it just calls a ton of thi=
ngs which<br>
+=C2=A0 * do work.<br>
+@@ -751,3 +924,4 @@ pseudo_server_loop(void) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pseudo_diag(&quot;select failed: %s\n&quot;, st=
rerror(errno));<br>
+ }<br>
++#endif<br>
+--<br>
+2.14.1<br>
+<br>
diff --git a/meta/recipes-devtools/<wbr>pseudo/<a href=3D"http://pseudo_1.8=
.2.bb" rel=3D"noreferrer" target=3D"_blank">pseudo_1.8.2.bb</a> b/meta/reci=
pes-devtools/<wbr>pseudo/<a href=3D"http://pseudo_1.8.2.bb" rel=3D"noreferr=
er" target=3D"_blank">pseudo_1.8.2.bb</a><br>
index 9bcd0318926..81853e95c42 100644<br>
--- a/meta/recipes-devtools/<wbr>pseudo/<a href=3D"http://pseudo_1.8.2.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_1.8.2.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>pseudo/<a href=3D"http://pseudo_1.8.2.bb" =
rel=3D"noreferrer" target=3D"_blank">pseudo_1.8.2.bb</a><br>
@@ -8,6 +8,7 @@ SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.=
org/releases/pseudo/${BPN}-${PV}.tar.bz" rel=3D"noreferrer" target=3D"_blan=
k">http://downloads.<wbr>yoctoproject.org/releases/<wbr>pseudo/${BPN}-${PV}=
.tar.bz</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<wbr>efe0be279901006f939cd=
357ccee47<wbr>b651c786da.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://<wbr>b6b68db896f9963558334=
aff7fca61<wbr>adde4ec10f.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://toomanyfiles.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Use-epoll-API-on-<wbr=
>Linux.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[md5sum] =3D &quot;<wbr>7d41e72188fbea1f696c399c1a4356<wbr>75&=
quot;<br>
--<br>
2.14.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Mon, 18 Sep 2017 16:43:56 +0300<br>
From: Will Newton &lt;<a href=3D"mailto:will.newton@gmail.com">will.newton@=
gmail.com</a>&gt;<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Will Newton &lt;<a href=3D"mailto:willn@resin.io">willn@resin.io</a>&gt=
;, Otavio Salvador<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:otavio@ossystems.com.br">=
otavio@ossystems.com.br</a>&gt;<br>
Subject: [OE-core] [pyro][PATCH] goarch.bbclass: Replace logic for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 setting GOARM<br>
Message-ID: &lt;<a href=3D"mailto:20170918134356.16124-1-willn@resin.io">20=
170918134356.16124-1-willn@<wbr>resin.io</a>&gt;<br>
<br>
From: Will Newton &lt;<a href=3D"mailto:will.newton@gmail.com">will.newton@=
gmail.com</a>&gt;<br>
<br>
The previous logic applied a regex to TUNE_FEATURES which could<br>
set the GOARM value to 7 incorrectly, for example when dealing<br>
with an arm1176 core. Simplify to check for the presence of<br>
&quot;armv7&quot; instead. At the same time add a check for &quot;armv6&quo=
t; and<br>
set GOARM to 6 in that case.<br>
<br>
(From OE-Core rev: 07b60c15e9ef650940afdde37bf3f3<wbr>b9c50a336d)<br>
<br>
Signed-off-by: Will Newton &lt;<a href=3D"mailto:willn@resin.io">willn@resi=
n.io</a>&gt;<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@<wbr>linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/goarch.bbclass | 7 +++++--<br>
=C2=A01 file changed, 5 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass<br>
index 4a5b2ec787..12df88f8c4 100644<br>
--- a/meta/classes/goarch.bbclass<br>
+++ b/meta/classes/goarch.bbclass<br>
@@ -38,8 +38,11 @@ def go_map_arch(a, d):<br>
<br>
=C2=A0def go_map_arm(a, f, d):<br>
=C2=A0 =C2=A0 =C2=A0import re<br>
-=C2=A0 =C2=A0 if re.match(&#39;arm.*&#39;, a) and re.match(&#39;arm.*7.*&#=
39;, f):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;7&#39;<br>
+=C2=A0 =C2=A0 if re.match(&#39;arm.*&#39;, a):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &#39;armv7&#39; in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;7&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 elif &#39;armv6&#39; in f:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;6&#39;<br>
=C2=A0 =C2=A0 =C2=A0return &#39;&#39;<br>
<br>
=C2=A0def go_map_os(o, d):<br>
--<br>
2.13.5<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Mon, 18 Sep 2017 15:56:25 +0200<br>
From: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.lo=
oijmans@topic.nl</a>&gt;<br>
To: &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">openemb=
edded-core@lists.<wbr>openembedded.org</a>&gt;<br>
Subject: Re: [OE-core] [PATCH 1/2] base-files: profile: Do not assume<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 that the &#39;command&#39; command exists<br>
Message-ID: &lt;<a href=3D"mailto:411d4d88-f166-1c4e-2dc4-3009d157b071@topi=
c.nl">411d4d88-f166-1c4e-2dc4-<wbr>3009d157b071@topic.nl</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;; format=3Dflowed<br>
<br>
?On 18-09-17 15:24, Mike Looijmans wrote:<br>
&gt; On 18-09-17 15:08, Burton, Ross wrote:<br>
&gt;&gt; On 18 September 2017 at 12:31, Mike Looijmans &lt;<a href=3D"mailt=
o:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a><br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:mike.looijmans@topic.nl">mike.looijma=
ns@topic.<wbr>nl</a>&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is basically the same change=
 as I first sent a patch for in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0April, and<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0last pinged this Friday... The on=
ly real difference is that this one<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0misses<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0passing error output from resize =
to /dev/null (which it should do to<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handle<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the case where tty exists, but re=
size does not).<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Yeah, indeed.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Apologies for missing that patch!<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Other problem is that &quot;resize&quot; output=
s shell script on stdout to be<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0executed, so the proper &quot;total&quot; invok=
ation would be:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 /dev/tty[A-z]*) eval `resize 2&gt;/dev/=
null` ;;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0The &quot;eval&quot; part is missing in your ve=
rsion...<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Who is going to submit the One True patch with all the fixes in?=
=C2=A0 I promise<br>
&gt;&gt; to merge it.<br>
&gt;<br>
&gt; I&#39;ll send the one ring, eh, patch, in a few minutes. I&#39;ll merg=
e the two into a<br>
&gt; single as well.<br>
<br>
On second thought, just use Peter&#39;s patch &quot;as is&quot;.<br>
<br>
I&#39;ve been experimenting with the &quot;eval&quot; part and it doesn&#39=
;t behave well. Tends<br>
to confuse minicom, create garbage, and in particular when run from &quot;p=
rofile&quot;,<br>
it seems to result in counterproductive COLUMNS=3D0 and LINES=3D0.<br>
<br>
I&#39;m actually wondering why the call to &quot;resize&quot; is being done=
 at all. Just<br>
calling &quot;resize&quot; has no effect, since it outputs the results on s=
tdout as<br>
shell script, and that is being discarded. Looking at the commit that<br>
introduced it:<br>
<br>
cc6360f4c4d9 (base-files: set dynamic COLUMNS via resize command)<br>
<br>
that already has no effect whatsoever. See the man page for resize:<br>
<a href=3D"https://linux.die.net/man/1/resize" rel=3D"noreferrer" target=3D=
"_blank">https://linux.die.net/man/1/<wbr>resize</a><br>
<br>
I also would consider running some program&#39;s output as shell script a b=
it<br>
spooky, it looks like a security hole waiting to be exploited.<br>
<br>
<br>
<br>
Kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
TOPIC Products<br>
Materiaalweg 4, NL-5681 RJ Best<br>
Postbus 440, NL-5680 AK Best<br>
Telefoon: <a href=3D"tel:%2B31%20%280%29%20499%2033%2069%2079" value=3D"+31=
499336979">+31 (0) 499 33 69 79</a><br>
E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com">mike.looijmans@=
topicproducts.<wbr>com</a><br>
Website: <a href=3D"http://www.topicproducts.com" rel=3D"noreferrer" target=
=3D"_blank">www.topicproducts.com</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Mon, 18 Sep 2017 16:07:14 +0200<br>
From: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.lo=
oijmans@topic.nl</a>&gt;<br>
To: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Cc: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.looi=
jmans@topic.nl</a>&gt;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:peter.kjellerstedt@axis.com">=
peter.kjellerstedt@axis.com</a><br>
Subject: [OE-core] [PATCH] base-files: profile: Get rid of &quot;resize&quo=
t;<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:1505743634-13500-1-git-se=
nd-email-mike.looijmans@topic.nl">1505743634-13500-1-git-send-<wbr>email-mi=
ke.looijmans@topic.nl</a>&gt;<br>
<br>
The &quot;resize&quot; command actually outputs shell commands to be execut=
ed, for<br>
example:<br>
<br>
$ resize<br>
COLUMNS=3D102;<br>
LINES=3D27;<br>
export COLUMNS LINES;<br>
<br>
The output of &quot;resize&quot; is being discarded to /dev/null so the cal=
l has no<br>
effect whatsoever, and does not change the environment (it cannot change th=
e<br>
environment of its parent). Remove the call and hence solve the messages<br=
>
about shells missing &quot;command&quot; or &quot;tty&quot; or &quot;resize=
&quot;.<br>
<br>
Signed-off-by: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl=
">mike.looijmans@topic.nl</a>&gt;<br>
---<br>
=C2=A0meta/recipes-core/base-files/<wbr>base-files/profile | 9 ---------<br=
>
=C2=A01 file changed, 9 deletions(-)<br>
<br>
diff --git a/meta/recipes-core/base-<wbr>files/base-files/profile b/meta/re=
cipes-core/base-<wbr>files/base-files/profile<br>
index a062028..cfd0d69 100644<br>
--- a/meta/recipes-core/base-<wbr>files/base-files/profile<br>
+++ b/meta/recipes-core/base-<wbr>files/base-files/profile<br>
@@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unset i<br>
=C2=A0fi<br>
<br>
-if command -v resize &gt;/dev/null &amp;&amp; command -v tty &gt;/dev/null=
; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# Make sure we are on a serial console (i.e. th=
e device used starts with<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# /dev/tty[A-z]), otherwise we confuse e.g. the=
 eclipse launcher which<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# tries do use ssh<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0case $(tty) in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/dev/tty[A-z]*) res=
ize &gt;/dev/null;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0esac<br>
-fi<br>
-<br>
=C2=A0export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM<br>
<br>
=C2=A0umask 022<br>
--<br>
1.9.1<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 5<br>
Date: Mon, 18 Sep 2017 14:30:26 -0000<br>
From: Patchwork &lt;<a href=3D"mailto:patchwork@patchwork.openembedded.org"=
>patchwork@patchwork.<wbr>openembedded.org</a>&gt;<br>
To: <a href=3D"mailto:mike.looijmans@topic.nl">mike.looijmans@topic.nl</a><=
br>
Cc: <a href=3D"mailto:openembedded-core@lists.openembedded.org">openembedde=
d-core@lists.<wbr>openembedded.org</a><br>
Subject: [OE-core] ? patchtest: failure for &quot;base-files: profile: Do<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 not as...&quot; and 1 more (rev2)<br>
Message-ID: &lt;<a href=3D"mailto:20170918143026.2786.12950@do.openembedded=
.org">20170918143026.2786.12950@do.<wbr>openembedded.org</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<br>
<br>
=3D=3D Series Details =3D=3D<br>
<br>
Series: &quot;base-files: profile: Do not as...&quot; and 1 more (rev2)<br>
Revision: 2<br>
URL=C2=A0 =C2=A0: <a href=3D"https://patchwork.openembedded.org/series/8967=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.<wbr>openembedded=
.org/series/8967/</a><br>
State : failure<br>
<br>
=3D=3D Summary =3D=3D<br>
<br>
<br>
Thank you for submitting this patch series to OpenEmbedded Core. This is<br=
>
an automated response. Several tests have been executed on the proposed<br>
series by patchtest resulting in the following failures:<br>
<br>
<br>
<br>
* Issue=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Series does not appl=
y on top of target branch [test_series_merge_on_head]<br>
=C2=A0 Suggested fix=C2=A0 =C2=A0 Rebase your series on top of targeted bra=
nch<br>
=C2=A0 Targeted branch=C2=A0 master (currently at cbc396dd10)<br>
<br>
<br>
<br>
If you believe any of these test results are incorrect, please reply to the=
<br>
mailing list (<a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.<wbr>openembedded.org</a>) raising your concerns.<br=
>
Otherwise we would appreciate you correcting the issues and submitting a ne=
w<br>
version of the patchset if applicable. Please ensure you add/increment the<=
br>
version number when sending the new version (i.e. [PATCH] -&gt; [PATCH v2] =
-&gt;<br>
[PATCH v3] -&gt; ...).<br>
<br>
---<br>
Test framework: <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/patcht=
est" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/<wbr>=
cgit/cgit.cgi/patchtest</a><br>
Test suite:=C2=A0 =C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/cgit/=
cgit.cgi/patchtest-oe" rel=3D"noreferrer" target=3D"_blank">http://git.yoct=
oproject.org/<wbr>cgit/cgit.cgi/patchtest-oe</a><br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 6<br>
Date: Mon, 18 Sep 2017 14:47:08 +0200<br>
From: Mike Looijmans &lt;<a href=3D"mailto:mike.looijmans@topic.nl">mike.lo=
oijmans@topic.nl</a>&gt;<br>
To: &lt;<a href=3D"mailto:openembedded-core@lists.openembedded.org">openemb=
edded-core@lists.<wbr>openembedded.org</a>&gt;<br>
Subject: Re: [OE-core] [PATCH] init-ifupdown: RDEPENDS on procps<br>
Message-ID: &lt;<a href=3D"mailto:b29b9784-57af-089a-35b1-4b339ca84fd9@topi=
c.nl">b29b9784-57af-089a-35b1-<wbr>4b339ca84fd9@topic.nl</a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;; format=3Dflowed<br>
<br>
?Busybox can also provide sysctl so there&#39;s no hard dependency on procp=
s.<br>
<br>
<br>
On 18-09-17 14:43, <a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail=
.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">liu.ming50@=
gmail.com</a>&gt;<br>
&gt;<br>
&gt; sysctl is being called in /etc/init.d/networking, so it needs RDEPENDS=
<br>
&gt; on procps.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com">li=
u.ming50@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://ini=
t-ifupdown_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.b=
b</a> | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://in=
it-ifupdown_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.=
bb</a> b/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifupdo=
wn_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><br=
>
&gt; index 733ae41..8774386 100644<br>
&gt; --- a/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifup=
down_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><=
br>
&gt; +++ b/meta/recipes-core/init-<wbr>ifupdown/<a href=3D"http://init-ifup=
down_1.0.bb" rel=3D"noreferrer" target=3D"_blank">init-ifupdown_1.0.bb</a><=
br>
&gt; @@ -35,7 +35,7 @@ do_install_append_qemuall () {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0PACKAGE_ARCH_qemuall =3D &quot;${MACHINE_ARCH}&quot;<br>
&gt; -RDEPENDS_${PN} =3D &quot;netbase&quot;<br>
&gt; +RDEPENDS_${PN} =3D &quot;netbase procps&quot;<br>
&gt;=C2=A0 =C2=A0RCONFLICTS_${PN} =3D &quot;netbase (&lt; 1:5.0)&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0CONFFILES_${PN} =3D &quot;${sysconfdir}/network/<wbr>inter=
faces&quot;<br>
&gt;<br>
<br>
<br>
<br>
Kind regards,<br>
<br>
Mike Looijmans<br>
System Expert<br>
<br>
TOPIC Products<br>
Materiaalweg 4, NL-5681 RJ Best<br>
Postbus 440, NL-5680 AK Best<br>
Telefoon: +31 (0) 499 33 69 79<br>
E-mail: <a href=3D"mailto:mike.looijmans@topicproducts.com">mike.looijmans@=
topicproducts.<wbr>com</a><br>
Website: <a href=3D"http://www.topicproducts.com" rel=3D"noreferrer" target=
=3D"_blank">www.topicproducts.com</a><br>
<br>
Please consider the environment before printing this e-mail<br>
<br>
<br>
<br>
<br>
<br>
------------------------------<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br>
<br>
End of Openembedded-core Digest, Vol 80, Issue 148<br>
******************************<wbr>********************<br>
</font></span></blockquote></div><br></div>

--001a113e614e116b6a055977ba9b--
