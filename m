Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 52A87747DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 May 2018 14:37:35 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id q3-v6so14292823wrj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2018 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+kWAUa1ivhfZajH/OqgJIj/H34rhcnVPiLKikT3ZORg=;
	b=etKcyWOW+7QU1YV4xbqjiLf4QCzCFRfusxlhbdMePJVy/AxOXgBwB52pkMJqbPIq/V
	e6s5f8BQuckwH4UCPks1tu6I5a1U0SfafSZYzN0t+Bx9lVsNXdfYTnsCJ5KMhtQXYDUM
	glUHvS12/iF64OUUX3ptYCmHCXZ6YGI7Re6KSibPWbfdA51gPZLXd6ChcAiyDXtaf4VM
	JOoSEPtn6okKCtrlasO6i9k+Akhl7cplSEJ5YPk0mebrPoKBto89VuegPxYsxW3NVyJO
	Vw/umpqYwlsYtNyMle9dIW7PXc+mkjTsI6a0yM9tcYDACdr1WL4sBtF0Q+LHZQK1304B
	JlVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+kWAUa1ivhfZajH/OqgJIj/H34rhcnVPiLKikT3ZORg=;
	b=DAScGSD0I/P0APA+EA6HiK23Ll4d5K0V4aKtNmTHDdbC/CDFBLSOk5P54OIFyl3jlb
	nL7zOVNaAyaiDEbhZSBDD6Y6qOzfuBeCMiaIXvEf8JQeq2qsheQ0g8lpzYBU16qwfayx
	P1ogonPixutjSGgKxDKdk5yMYO9jaS1J5piwLN9a2I7kBKaPbVHx1nlrP5B8BPbM34pu
	JIB0LRpSHEthLqVImyDGYdY372VgiRppYOaB2p4TmysreMDjKdJyWzqFkWTkjOh+W/nQ
	fjq741cvjpQW/sHMvTNcNmfWP6BnANi08MI1cjRAlTPco641sRaSjP3buoKaxMrIf2Xb
	yB4g==
X-Gm-Message-State: ALQs6tAUFdYisJo8lxo4rO5+neQdkYeC1ntAqbpT+tz0fM64v3KOu25p
	P6W3gsB6blR33QQMxEa4QTNk0A==
X-Google-Smtp-Source: AB8JxZrOIeaL1NOI+97B+zneQ9Zf7GxSkpqEaMV9wMjIoGA//1K9qxGJq0BPQejMW6D82G80eKVWqg==
X-Received: by 2002:adf:972c:: with SMTP id
	r41-v6mr16419419wrb.79.1525271856497; 
	Wed, 02 May 2018 07:37:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	r200sm17775257wmb.39.2018.05.02.07.37.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 02 May 2018 07:37:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2018 14:37:32 +0000
Message-Id: <20180502143733.6303-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180502143733.6303-1-Martin.Jansa@gmail.com>
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] qemu: upgrade to 2.12.0
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
X-List-Received-Date: Wed, 02 May 2018 14:37:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 ...4-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 -------------------
 ...-connect-socket-to-a-spawned-command.patch | 52 +++++++-------
 .../qemu/qemu/disable-grabs.patch             | 43 ++++++------
 meta/recipes-devtools/qemu/qemu/memfd.patch   | 57 ----------------
 .../qemu/qemu/qemu-2.5.0-cflags.patch         | 15 ++++-
 .../qemu/{qemu_2.11.1.bb => qemu_2.12.0.bb}   |  6 +-
 7 files changed, 65 insertions(+), 177 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
 rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb => qemu_2.12.0.bb} (87%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 00399ae820..8b5214ed96 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -28,7 +28,7 @@ BINUVERSION ?= "2.30%"
 GDBVERSION ?= "8.0%"
 GLIBCVERSION ?= "2.27%"
 LINUXLIBCVERSION ?= "4.15%"
-QEMUVERSION ?= "2.11%"
+QEMUVERSION ?= "2.12%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
deleted file mode 100644
index f90cae694c..0000000000
--- a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
-From: Victor Kamensky <kamensky@cisco.com>
-Date: Fri, 23 Mar 2018 18:26:45 +0000
-Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
- DISAS_EXIT
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In OE project 4.15 linux kernel boot hang was observed under
-single cpu aarch64 qemu. Kernel code was in a loop waiting for
-vtimer arrival, spinning in TC generated blocks, while interrupt
-was pending unprocessed. This happened because when qemu tried to
-handle vtimer interrupt target had interrupts disabled, as
-result flag indicating TCG exit, cpu->icount_decr.u16.high,
-was cleared but arm_cpu_exec_interrupt function did not call
-arm_cpu_do_interrupt to process interrupt. Later when target
-reenabled interrupts, it happened without exit into main loop, so
-following code that waited for result of interrupt execution
-run in infinite loop.
-
-To solve the problem instructions that operate on CPU sys state
-(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
-should be considered as DISAS_EXIT variant, and should be
-forced to exit back to main loop so qemu will have a chance
-processing pending CPU state updates, including pending
-interrupts.
-
-This change brings consistency with how DISAS_UPDATE is treated
-in aarch32 case.
-
-CC: Peter Maydell <peter.maydell@linaro.org>
-CC: Alex Bennée <alex.bennee@linaro.org>
-CC: qemu-stable@nongnu.org
-Suggested-by: Peter Maydell <peter.maydell@linaro.org>
-Signed-off-by: Victor Kamensky <kamensky@cisco.com>
-Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
-Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
-Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
-Upstream-Status: Backport
----
- target/arm/translate-a64.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
-index 31ff047..327513e 100644
---- a/target/arm/translate-a64.c
-+++ b/target/arm/translate-a64.c
-@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
-         case DISAS_UPDATE:
-             gen_a64_set_pc_im(dc->pc);
-             /* fall through */
--        case DISAS_JUMP:
--            tcg_gen_lookup_and_goto_ptr();
--            break;
-         case DISAS_EXIT:
-             tcg_gen_exit_tb(0);
-             break;
-+        case DISAS_JUMP:
-+            tcg_gen_lookup_and_goto_ptr();
-+            break;
-         case DISAS_NORETURN:
-         case DISAS_SWI:
-             break;
--- 
-2.7.4
-
diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
index 6e6bf95c18..f1cf53a8c5 100644
--- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
+++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-command.patch
@@ -1,4 +1,4 @@
-From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 2001
+From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mon Sep 17 00:00:00 2001
 From: Alistair Francis <alistair.francis@xilinx.com>
 Date: Thu, 21 Dec 2017 11:35:16 -0800
 Subject: [PATCH] chardev: connect socket to a spawned command
@@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]
 
 Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 ---
- chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++++++++++++++++++++---
- chardev/char.c        |  3 ++
- qapi/char.json        |  5 +++
- 3 files changed, 90 insertions(+), 4 deletions(-)
+ chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++++++++++++++
+ chardev/char.c        |   3 ++
+ qapi/char.json        |   5 +++
+ 3 files changed, 110 insertions(+)
 
 diff --git a/chardev/char-socket.c b/chardev/char-socket.c
-index 53eda8ef00..f566107c35 100644
+index 159e69c3b1..84778cf31a 100644
 --- a/chardev/char-socket.c
 +++ b/chardev/char-socket.c
-@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
+@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
      return false;
  }
  
@@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644
  static void qmp_chardev_open_socket(Chardev *chr,
                                      ChardevBackend *backend,
                                      bool *be_opened,
-@@ -859,6 +921,9 @@
+@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
  {
      SocketChardev *s = SOCKET_CHARDEV(chr);
      ChardevSocket *sock = backend->u.socket.data;
@@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644
      bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
      bool is_listen      = sock->has_server  ? sock->server  : true;
      bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
-@@ -925,7 +990,14 @@
-     } else if (reconnect > 0) {
+@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
          s->reconnect_time = reconnect;
      }
--
+ 
 +#ifndef _WIN32
 +    if (cmd) {
 +        chardev_open_socket_cmd(chr, cmd, errp);
@@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644
 +        *be_opened = true;
 +    } else
 +#endif
-     if (s->reconnect_time) {
-         sioc = qio_channel_socket_new();
-         tcp_chr_set_client_ioc_name(chr, sioc);
-@@ -985,10 +1057,26 @@
-     const char *host = qemu_opt_get(opts, "host");
+     /* If reconnect_time is set, will do that in chr_machine_done. */
+     if (!s->reconnect_time) {
+         if (s->is_listen) {
+@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      const char *port = qemu_opt_get(opts, "port");
+     const char *fd = qemu_opt_get(opts, "fd");
      const char *tls_creds = qemu_opt_get(opts, "tls-creds");
 +#ifndef _WIN32
 +    const char *cmd = qemu_opt_get(opts, "cmd");
@@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644
      SocketAddressLegacy *addr;
      ChardevSocket *sock;
  
-     backend->type = CHARDEV_BACKEND_KIND_SOCKET;
 +#ifndef _WIN32
 +    if (cmd) {
 +        /*
@@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644
 +        }
 +    } else
 +#endif
-     if (!path) {
-         if (!host) {
-             error_setg(errp, "chardev: socket: no host given");
-@@ -1021,13 +1109,24 @@
-     sock->has_reconnect = true;
++
+     if ((!!path + !!fd + !!host) != 1) {
+         error_setg(errp,
+                    "Exactly one of 'path', 'fd' or 'host' required");
+@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, ChardevBackend *backend,
      sock->reconnect = reconnect;
      sock->tls_creds = g_strdup(tls_creds);
+ 
 +#ifndef _WIN32
 +    sock->cmd = g_strdup(cmd);
 +#endif
- 
++ 
      addr = g_new0(SocketAddressLegacy, 1);
 +#ifndef _WIN32
 +    if (path || cmd) {
@@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644
 +#else
          q_unix->path = g_strdup(path);
 +#endif
-     } else {
+     } else if (host) {
          addr->type = SOCKET_ADDRESS_LEGACY_KIND_INET;
          addr->u.inet.data = g_new(InetSocketAddress, 1);
 diff --git a/chardev/char.c b/chardev/char.c
-index 2ae4f465ec..5d52cd5de5 100644
+index 76d866e6fe..9747d51d7c 100644
 --- a/chardev/char.c
 +++ b/chardev/char.c
 @@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts = {
@@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644
                                       '*server'    : 'bool',
                                       '*wait'      : 'bool',
 -- 
-2.14.1
+2.17.0
+
diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
index 77117890f4..e29c011a6f 100644
--- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
+++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
@@ -1,3 +1,11 @@
+From a31c5c695cb716310257f1fc60a06b821e74fe7f Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 18 Sep 2013 14:04:54 +0100
+Subject: [PATCH] sdl.c: allow user to disable pointer grabs
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 When the pointer enters the Qemu window it calls SDL_WM_GrabInput, which calls
 XGrabPointer in a busyloop until it returns GrabSuccess. However if there's already
 a pointer grab (screen is locked, a menu is open) then qemu will hang until the
@@ -11,35 +19,30 @@ them in a conditional that can be set by the autobuilder environment, preserving
 the current grabbing behaviour for everyone else.
 
 Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Wed, 18 Sep 2013 14:04:54 +0100
-Subject: [PATCH] sdl.c: allow user to disable pointer grabs
-
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Eric Bénard <eric@eukrea.com>
+
 ---
- ui/sdl.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
+ ui/sdl.c | 13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
 
-Index: qemu-2.11.1/ui/sdl.c
-===================================================================
---- qemu-2.11.1.orig/ui/sdl.c
-+++ qemu-2.11.1/ui/sdl.c
-@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
- static int scaling_active = 0;
- static Notifier mouse_mode_notifier;
- static int idle_counter;
+diff --git a/ui/sdl.c b/ui/sdl.c
+index a5fd503..ab8d1b1 100644
+--- a/ui/sdl.c
++++ b/ui/sdl.c
+@@ -68,6 +68,11 @@ static int idle_counter;
+ static const guint16 *keycode_map;
+ static size_t keycode_maplen;
+ 
 +#ifndef True
 +#define True 1
 +#endif
 +static doing_grabs = True;
- 
++
  #define SDL_REFRESH_INTERVAL_BUSY 10
  #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
-@@ -431,14 +435,16 @@ static void sdl_grab_start(void)
+                             / SDL_REFRESH_INTERVAL_BUSY + 1)
+@@ -398,14 +403,16 @@ static void sdl_grab_start(void)
          }
      } else
          sdl_hide_cursor();
@@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c
      gui_grab = 0;
      sdl_show_cursor();
      sdl_update_caption();
-@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
+@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds, DisplayOptions *o)
       * This requires SDL >= 1.2.14. */
      setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
  
diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch b/meta/recipes-devtools/qemu/qemu/memfd.patch
deleted file mode 100644
index 62e8d3800b..0000000000
--- a/meta/recipes-devtools/qemu/qemu/memfd.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
-From: Paolo Bonzini <pbonzini@redhat.com>
-Date: Tue, 28 Nov 2017 11:51:27 +0100
-Subject: [PATCH] memfd: fix configure test
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Recent glibc added memfd_create in sys/mman.h.  This conflicts with
-the definition in util/memfd.c:
-
-    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error: static declaration of memfd_create follows non-static declaration
-
-Fix the configure test, and remove the sys/memfd.h inclusion since the
-file actually does not exist---it is a typo in the memfd_create(2) man
-page.
-
-Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
-Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
----
- configure    | 2 +-
- util/memfd.c | 4 +---
- 2 files changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/configure b/configure
-index 9c8aa5a98b..99ccc1725a 100755
---- a/configure
-+++ b/configure
-@@ -3923,7 +3923,7 @@ fi
- # check if memfd is supported
- memfd=no
- cat > $TMPC << EOF
--#include <sys/memfd.h>
-+#include <sys/mman.h>
- 
- int main(void)
- {
-diff --git a/util/memfd.c b/util/memfd.c
-index 4571d1aba8..412e94a405 100644
---- a/util/memfd.c
-+++ b/util/memfd.c
-@@ -31,9 +31,7 @@
- 
- #include "qemu/memfd.h"
- 
--#ifdef CONFIG_MEMFD
--#include <sys/memfd.h>
--#elif defined CONFIG_LINUX
-+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
- #include <sys/syscall.h>
- #include <asm/unistd.h>
- 
--- 
-2.11.0
diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
index eb99d14639..360519f1a1 100644
--- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
+++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
@@ -1,8 +1,19 @@
+From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mon Sep 17 00:00:00 2001
+From: Stephen Arnold <sarnold@vctlabs.com>
+Date: Sun, 12 Jun 2016 18:09:56 -0700
+Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment
+
 Upstream-Status: Pending
 
+---
+ configure | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/configure b/configure
+index 69e05fb..12fc3d8 100755
 --- a/configure
 +++ b/configure
-@@ -4468,10 +4468,6 @@ fi
+@@ -5413,10 +5413,6 @@ write_c_skeleton
  if test "$gcov" = "yes" ; then
    CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
    LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
@@ -12,4 +23,4 @@ Upstream-Status: Pending
 -  CFLAGS="-O2 $CFLAGS"
  fi
  
- ##########################################
+ if test "$have_asan" = "yes"; then
diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
similarity index 87%
rename from meta/recipes-devtools/qemu/qemu_2.11.1.bb
rename to meta/recipes-devtools/qemu/qemu_2.12.0.bb
index f4b7d69fca..63590fc9eb 100644
--- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
@@ -20,8 +20,6 @@ SRC_URI = "http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
            file://chardev-connect-socket-to-a-spawned-command.patch \
            file://apic-fixup-fallthrough-to-PIC.patch \
            file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
-           file://memfd.patch \
-           file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+\..*)\.tar"
 
@@ -31,8 +29,8 @@ SRC_URI_append_class-native = " \
             file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
             "
 
-SRC_URI[md5sum] = "61cf862b6007eba4ac98247776af2e27"
-SRC_URI[sha256sum] = "d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7aeef7605dfaaf81732ccb"
+SRC_URI[md5sum] = "122fd7cdf241ff7eb1e42c0b503b5d1b"
+SRC_URI[sha256sum] = "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c"
 
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
-- 
2.17.0


