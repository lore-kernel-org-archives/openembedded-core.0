Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id EFCB474BC7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 15:38:23 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id c9-v6so36819334iob.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 08:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QlACbcYKNgW6kacx4mrn2EuxHW2SZd+XaKiT0Jm/C8Q=;
	b=vE98aRZwEJUeuQgsM9kR2CJMi3vnlCvvFo8OSfsMtLsCLzorEk2ctf9rm8P3lYtbQq
	4ccO9oyEO4c6R6IqgCJqvFaJxAS39C23DU1BxkphKni/Fa8KTtsJXGlYtK46THEv+tRy
	HdsjkfOzsF5Tc3TBJec4IXzYD8koQsZmNJqEs2nlsp3D9MRtpKmEh4ThSp4HNnXevYWy
	OIiJW1nvdzpn13HCP2QjdGiEwF6Z9p3tP9UE7e4vumi0h6kLTd3zdZVToyfrQZvQfsB8
	UMwakZ9wvn6rhsOsjN4ESlW0tEWc3f+FlwuIAUNApJ9sMbDOevI2KbU0T37Tb9z1TpVU
	/luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QlACbcYKNgW6kacx4mrn2EuxHW2SZd+XaKiT0Jm/C8Q=;
	b=pIMZp+AYTXfskRGWm2sQPAzIVx4ut2drKVE8DvqKQslRgiWNImWDV+ac6QWDNiGm0t
	yxo/17dd1gyUJQ4FXscjUx+sUvxvEMLVB5ZHr3j8yL/pa8mYwLTOCtznC70p+dewJdR/
	0+WIDwsZ1wLKlGXuNW8/Am3nhKGaIhfm99fVeZTp5QxT6cjWBR8X9SB5mNrIciwojiHT
	qXI8Ym3kQsc8vncKbcOz37FwPNGawoiQeGgCXdrTTDa/682SpHSt/i4jtXVAKdIaaxd8
	LY60NVzdM9vCfLQaaDPF1wMlARl2nH3ib9zOroRe1R/X1lQJr/pev0yEC02kpJEbqvjW
	SrPA==
X-Gm-Message-State: ALQs6tA3oLZGI1It15r00O5US6vBDddPORr1ecD3YgFUzWKw5/gUGUwq
	xgCTowEGBwXuhaWecWKd8MbSpxBFEFWH7ATLp0iHuw==
X-Google-Smtp-Source: AB8JxZrrVUitB3Hv2q6v5OGy4g6nl6rFO3FAoBckAyh7jOBVEK5UAliyaffQ4FI1WpUeKnuzyaGaY8vLOaOvZARnOKg=
X-Received: by 2002:a6b:752:: with SMTP id
	79-v6mr50835362ioh.216.1525880304655; 
	Wed, 09 May 2018 08:38:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 9 May 2018 08:38:04 -0700 (PDT)
In-Reply-To: <20180502143733.6303-2-Martin.Jansa@gmail.com>
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
	<20180502143733.6303-2-Martin.Jansa@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 16:38:04 +0100
Message-ID: <CAJTo0LaJNCzWjNEsJw42_io2mC3iyDMoZ33SVj8huJLQQ7urhQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemu: upgrade to 2.12.0
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
X-List-Received-Date: Wed, 09 May 2018 15:38:24 -0000
Content-Type: multipart/alternative; boundary="0000000000008775e4056bc7b12b"

--0000000000008775e4056bc7b12b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This fails if x11 isn't in DISTRO_FEATURES but SDL is enabled as ui/sdl.c
-> ui/x_keymap.h -> Xlib.h.  I guess the best solution here would be to
guard sdl in the default PACKAGECONFIG with x11 DISTRO_FEATURE checks, and
explicitly depend on libx11.

As discussed on IRC we should probably also move to libsdl2 as libsdl 1.2
is 'historic' now.

Ross

On 2 May 2018 at 15:37, Martin Jansa <martin.jansa@gmail.com> wrote:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  ...4-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 -------------------
>  ...-connect-socket-to-a-spawned-command.patch | 52 +++++++-------
>  .../qemu/qemu/disable-grabs.patch             | 43 ++++++------
>  meta/recipes-devtools/qemu/qemu/memfd.patch   | 57 ----------------
>  .../qemu/qemu/qemu-2.5.0-cflags.patch         | 15 ++++-
>  .../qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}   |  6 +-
>  7 files changed, 65 insertions(+), 177 deletions(-)
>  delete mode 100644 meta/recipes-devtools/qemu/
> qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
>  rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}
> (87%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> index 00399ae820..8b5214ed96 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -28,7 +28,7 @@ BINUVERSION ?=3D "2.30%"
>  GDBVERSION ?=3D "8.0%"
>  GLIBCVERSION ?=3D "2.27%"
>  LINUXLIBCVERSION ?=3D "4.15%"
> -QEMUVERSION ?=3D "2.11%"
> +QEMUVERSION ?=3D "2.12%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-
> treat-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/
> qemu/0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
> deleted file mode 100644
> index f90cae694c..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-
> treat-DISAS_UPDATE-as-variant-of-D.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
> -From: Victor Kamensky <kamensky@cisco.com>
> -Date: Fri, 23 Mar 2018 18:26:45 +0000
> -Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
> - DISAS_EXIT
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -In OE project 4.15 linux kernel boot hang was observed under
> -single cpu aarch64 qemu. Kernel code was in a loop waiting for
> -vtimer arrival, spinning in TC generated blocks, while interrupt
> -was pending unprocessed. This happened because when qemu tried to
> -handle vtimer interrupt target had interrupts disabled, as
> -result flag indicating TCG exit, cpu->icount_decr.u16.high,
> -was cleared but arm_cpu_exec_interrupt function did not call
> -arm_cpu_do_interrupt to process interrupt. Later when target
> -reenabled interrupts, it happened without exit into main loop, so
> -following code that waited for result of interrupt execution
> -run in infinite loop.
> -
> -To solve the problem instructions that operate on CPU sys state
> -(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
> -should be considered as DISAS_EXIT variant, and should be
> -forced to exit back to main loop so qemu will have a chance
> -processing pending CPU state updates, including pending
> -interrupts.
> -
> -This change brings consistency with how DISAS_UPDATE is treated
> -in aarch32 case.
> -
> -CC: Peter Maydell <peter.maydell@linaro.org>
> -CC: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> -CC: qemu-stable@nongnu.org
> -Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> -Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> -Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
> -Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> -Upstream-Status: Backport
> ----
> - target/arm/translate-a64.c | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> -index 31ff047..327513e 100644
> ---- a/target/arm/translate-a64.c
> -+++ b/target/arm/translate-a64.c
> -@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContextBas=
e
> *dcbase, CPUState *cpu)
> -         case DISAS_UPDATE:
> -             gen_a64_set_pc_im(dc->pc);
> -             /* fall through */
> --        case DISAS_JUMP:
> --            tcg_gen_lookup_and_goto_ptr();
> --            break;
> -         case DISAS_EXIT:
> -             tcg_gen_exit_tb(0);
> -             break;
> -+        case DISAS_JUMP:
> -+            tcg_gen_lookup_and_goto_ptr();
> -+            break;
> -         case DISAS_NORETURN:
> -         case DISAS_SWI:
> -             break;
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-=
spawned-command.patch
> b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-
> to-a-spawned-command.patch
> index 6e6bf95c18..f1cf53a8c5 100644
> --- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-
> to-a-spawned-command.patch
> +++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-
> to-a-spawned-command.patch
> @@ -1,4 +1,4 @@
> -From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 2001
> +From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Thu, 21 Dec 2017 11:35:16 -0800
>  Subject: [PATCH] chardev: connect socket to a spawned command
> @@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>  ---
> - chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++
> ++++++++++++++++++---
> - chardev/char.c        |  3 ++
> - qapi/char.json        |  5 +++
> - 3 files changed, 90 insertions(+), 4 deletions(-)
> + chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++++++++++++++
> + chardev/char.c        |   3 ++
> + qapi/char.json        |   5 +++
> + 3 files changed, 110 insertions(+)
>
>  diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> -index 53eda8ef00..f566107c35 100644
> +index 159e69c3b1..84778cf31a 100644
>  --- a/chardev/char-socket.c
>  +++ b/chardev/char-socket.c
> -@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer
> opaque)
> +@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(gpointer
> opaque)
>       return false;
>   }
>
> @@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644
>   static void qmp_chardev_open_socket(Chardev *chr,
>                                       ChardevBackend *backend,
>                                       bool *be_opened,
> -@@ -859,6 +921,9 @@
> +@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
>   {
>       SocketChardev *s =3D SOCKET_CHARDEV(chr);
>       ChardevSocket *sock =3D backend->u.socket.data;
> @@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644
>       bool do_nodelay     =3D sock->has_nodelay ? sock->nodelay : false;
>       bool is_listen      =3D sock->has_server  ? sock->server  : true;
>       bool is_telnet      =3D sock->has_telnet  ? sock->telnet  : false;
> -@@ -925,7 +990,14 @@
> -     } else if (reconnect > 0) {
> +@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
>           s->reconnect_time =3D reconnect;
>       }
> --
> +
>  +#ifndef _WIN32
>  +    if (cmd) {
>  +        chardev_open_socket_cmd(chr, cmd, errp);
> @@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644
>  +        *be_opened =3D true;
>  +    } else
>  +#endif
> -     if (s->reconnect_time) {
> -         sioc =3D qio_channel_socket_new();
> -         tcp_chr_set_client_ioc_name(chr, sioc);
> -@@ -985,10 +1057,26 @@
> -     const char *host =3D qemu_opt_get(opts, "host");
> +     /* If reconnect_time is set, will do that in chr_machine_done. */
> +     if (!s->reconnect_time) {
> +         if (s->is_listen) {
> +@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts,
> ChardevBackend *backend,
>       const char *port =3D qemu_opt_get(opts, "port");
> +     const char *fd =3D qemu_opt_get(opts, "fd");
>       const char *tls_creds =3D qemu_opt_get(opts, "tls-creds");
>  +#ifndef _WIN32
>  +    const char *cmd =3D qemu_opt_get(opts, "cmd");
> @@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644
>       SocketAddressLegacy *addr;
>       ChardevSocket *sock;
>
> -     backend->type =3D CHARDEV_BACKEND_KIND_SOCKET;
>  +#ifndef _WIN32
>  +    if (cmd) {
>  +        /*
> @@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644
>  +        }
>  +    } else
>  +#endif
> -     if (!path) {
> -         if (!host) {
> -             error_setg(errp, "chardev: socket: no host given");
> -@@ -1021,13 +1109,24 @@
> -     sock->has_reconnect =3D true;
> ++
> +     if ((!!path + !!fd + !!host) !=3D 1) {
> +         error_setg(errp,
> +                    "Exactly one of 'path', 'fd' or 'host' required");
> +@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
,
> ChardevBackend *backend,
>       sock->reconnect =3D reconnect;
>       sock->tls_creds =3D g_strdup(tls_creds);
> +
>  +#ifndef _WIN32
>  +    sock->cmd =3D g_strdup(cmd);
>  +#endif
> -
> ++
>       addr =3D g_new0(SocketAddressLegacy, 1);
>  +#ifndef _WIN32
>  +    if (path || cmd) {
> @@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644
>  +#else
>           q_unix->path =3D g_strdup(path);
>  +#endif
> -     } else {
> +     } else if (host) {
>           addr->type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;
>           addr->u.inet.data =3D g_new(InetSocketAddress, 1);
>  diff --git a/chardev/char.c b/chardev/char.c
> -index 2ae4f465ec..5d52cd5de5 100644
> +index 76d866e6fe..9747d51d7c 100644
>  --- a/chardev/char.c
>  +++ b/chardev/char.c
>  @@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {
> @@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644
>                                        '*server'    : 'bool',
>                                        '*wait'      : 'bool',
>  --
> -2.14.1
> +2.17.0
> +
> diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> index 77117890f4..e29c011a6f 100644
> --- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> +++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> @@ -1,3 +1,11 @@
> +From a31c5c695cb716310257f1fc60a06b821e74fe7f Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Wed, 18 Sep 2013 14:04:54 +0100
> +Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
>  When the pointer enters the Qemu window it calls SDL_WM_GrabInput, which
> calls
>  XGrabPointer in a busyloop until it returns GrabSuccess. However if
> there's already
>  a pointer grab (screen is locked, a menu is open) then qemu will hang
> until the
> @@ -11,35 +19,30 @@ them in a conditional that can be set by the
> autobuilder environment, preserving
>  the current grabbing behaviour for everyone else.
>
>  Upstream-Status: Pending
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com>
> -Date: Wed, 18 Sep 2013 14:04:54 +0100
> -Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> -
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> +
>  ---
> - ui/sdl.c | 12 ++++++++++--
> - 1 file changed, 10 insertions(+), 2 deletions(-)
> + ui/sdl.c | 13 +++++++++++--
> + 1 file changed, 11 insertions(+), 2 deletions(-)
>
> -Index: qemu-2.11.1/ui/sdl.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- qemu-2.11.1.orig/ui/sdl.c
> -+++ qemu-2.11.1/ui/sdl.c
> -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
> - static int scaling_active =3D 0;
> - static Notifier mouse_mode_notifier;
> - static int idle_counter;
> +diff --git a/ui/sdl.c b/ui/sdl.c
> +index a5fd503..ab8d1b1 100644
> +--- a/ui/sdl.c
> ++++ b/ui/sdl.c
> +@@ -68,6 +68,11 @@ static int idle_counter;
> + static const guint16 *keycode_map;
> + static size_t keycode_maplen;
> +
>  +#ifndef True
>  +#define True 1
>  +#endif
>  +static doing_grabs =3D True;
> -
> ++
>   #define SDL_REFRESH_INTERVAL_BUSY 10
>   #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
> -@@ -431,14 +435,16 @@ static void sdl_grab_start(void)
> +                             / SDL_REFRESH_INTERVAL_BUSY + 1)
> +@@ -398,14 +403,16 @@ static void sdl_grab_start(void)
>           }
>       } else
>           sdl_hide_cursor();
> @@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c
>       gui_grab =3D 0;
>       sdl_show_cursor();
>       sdl_update_caption();
> -@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
> +@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds,
> DisplayOptions *o)
>        * This requires SDL >=3D 1.2.14. */
>       setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
>
> diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch
> b/meta/recipes-devtools/qemu/qemu/memfd.patch
> deleted file mode 100644
> index 62e8d3800b..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/memfd.patch
> +++ /dev/null
> @@ -1,57 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
> -From: Paolo Bonzini <pbonzini@redhat.com>
> -Date: Tue, 28 Nov 2017 11:51:27 +0100
> -Subject: [PATCH] memfd: fix configure test
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -Recent glibc added memfd_create in sys/mman.h.  This conflicts with
> -the definition in util/memfd.c:
> -
> -    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error:
> static declaration of memfd_create follows non-static declaration
> -
> -Fix the configure test, and remove the sys/memfd.h inclusion since the
> -file actually does not exist---it is a typo in the memfd_create(2) man
> -page.
> -
> -Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ----
> - configure    | 2 +-
> - util/memfd.c | 4 +---
> - 2 files changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure b/configure
> -index 9c8aa5a98b..99ccc1725a 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3923,7 +3923,7 @@ fi
> - # check if memfd is supported
> - memfd=3Dno
> - cat > $TMPC << EOF
> --#include <sys/memfd.h>
> -+#include <sys/mman.h>
> -
> - int main(void)
> - {
> -diff --git a/util/memfd.c b/util/memfd.c
> -index 4571d1aba8..412e94a405 100644
> ---- a/util/memfd.c
> -+++ b/util/memfd.c
> -@@ -31,9 +31,7 @@
> -
> - #include "qemu/memfd.h"
> -
> --#ifdef CONFIG_MEMFD
> --#include <sys/memfd.h>
> --#elif defined CONFIG_LINUX
> -+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
> - #include <sys/syscall.h>
> - #include <asm/unistd.h>
> -
> ---
> -2.11.0
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> index eb99d14639..360519f1a1 100644
> --- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> @@ -1,8 +1,19 @@
> +From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mon Sep 17 00:00:00 2001
> +From: Stephen Arnold <sarnold@vctlabs.com>
> +Date: Sun, 12 Jun 2016 18:09:56 -0700
> +Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some
> environment
> +
>  Upstream-Status: Pending
>
> +---
> + configure | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 69e05fb..12fc3d8 100755
>  --- a/configure
>  +++ b/configure
> -@@ -4468,10 +4468,6 @@ fi
> +@@ -5413,10 +5413,6 @@ write_c_skeleton
>   if test "$gcov" =3D "yes" ; then
>     CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
>     LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> @@ -12,4 +23,4 @@ Upstream-Status: Pending
>  -  CFLAGS=3D"-O2 $CFLAGS"
>   fi
>
> - ##########################################
> + if test "$have_asan" =3D "yes"; then
> diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> similarity index 87%
> rename from meta/recipes-devtools/qemu/qemu_2.11.1.bb
> rename to meta/recipes-devtools/qemu/qemu_2.12.0.bb
> index f4b7d69fca..63590fc9eb 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> @@ -20,8 +20,6 @@ SRC_URI =3D "http://wiki.qemu-project.org/
> download/${BP}.tar.bz2 \
>             file://chardev-connect-socket-to-a-spawned-command.patch \
>             file://apic-fixup-fallthrough-to-PIC.patch \
>             file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.pa=
tch
> \
> -           file://memfd.patch \
> -           file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-o=
f-D.patch
> \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+\..*)\.tar"
>
> @@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D " \
>              file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
>              "
>
> -SRC_URI[md5sum] =3D "61cf862b6007eba4ac98247776af2e27"
> -SRC_URI[sha256sum] =3D "d9df2213ceed32e91dab7bc9dd19c1
> af83f91ba72c7aeef7605dfaaf81732ccb"
> +SRC_URI[md5sum] =3D "122fd7cdf241ff7eb1e42c0b503b5d1b"
> +SRC_URI[sha256sum] =3D "c9f4a147bc915d24df9784affc611a
> 115f42d24720a89210b479f1ba7a3f679c"
>
>  COMPATIBLE_HOST_mipsarchn32 =3D "null"
>  COMPATIBLE_HOST_mipsarchn64 =3D "null"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000008775e4056bc7b12b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This fails if x11 isn&#39;t in DISTRO_FEATURES but SDL is =
enabled as ui/sdl.c -&gt; ui/x_keymap.h -&gt; Xlib.h.=C2=A0 I guess the bes=
t solution here would be to guard sdl in the default PACKAGECONFIG with x11=
 DISTRO_FEATURE checks, and explicitly depend on libx11.<div><br></div><div=
>As discussed on IRC we should probably also move to libsdl2 as libsdl 1.2 =
is &#39;historic&#39; now.</div><div><br></div><div>Ross</div></div><div cl=
ass=3D"gmail_extra"><br><div class=3D"gmail_quote">On 2 May 2018 at 15:37, =
Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com=
" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:M=
artin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/<wbr>tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
=C2=A0...4-treat-DISAS_UPDATE-as-<wbr>variant-of-D.patch | 67 -------------=
------<br>
=C2=A0...-connect-socket-to-a-<wbr>spawned-command.patch | 52 +++++++------=
-<br>
=C2=A0.../qemu/qemu/disable-grabs.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 43 ++++++------<br>
=C2=A0meta/recipes-devtools/qemu/<wbr>qemu/memfd.patch=C2=A0 =C2=A0| 57 ---=
-------------<br>
=C2=A0.../qemu/qemu/qemu-2.5.0-<wbr>cflags.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 15 ++++-<br>
=C2=A0.../qemu/{<a href=3D"http://qemu_2.11.1.bb" rel=3D"noreferrer" target=
=3D"_blank">qemu_2.11.1.bb</a> =3D&gt; <a href=3D"http://qemu_2.12.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a>}=C2=A0 =C2=A0|=C2=A0 =
6 +-<br>
=C2=A07 files changed, 65 insertions(+), 177 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/0001-arm-tran=
slate-a64-<wbr>treat-DISAS_UPDATE-as-variant-<wbr>of-D.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/qemu/<wbr>qemu/memfd.patch<b=
r>
=C2=A0rename meta/recipes-devtools/qemu/{<a href=3D"http://qemu_2.11.1.bb" =
rel=3D"noreferrer" target=3D"_blank">qe<wbr>mu_2.11.1.bb</a> =3D&gt; <a hre=
f=3D"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.=
0.bb</a>} (87%)<br>
<br>
diff --git a/meta/conf/distro/include/<wbr>tcmode-default.inc b/meta/conf/d=
istro/include/<wbr>tcmode-default.inc<br>
index 00399ae820..8b5214ed96 100644<br>
--- a/meta/conf/distro/include/<wbr>tcmode-default.inc<br>
+++ b/meta/conf/distro/include/<wbr>tcmode-default.inc<br>
@@ -28,7 +28,7 @@ BINUVERSION ?=3D &quot;2.30%&quot;<br>
=C2=A0GDBVERSION ?=3D &quot;8.0%&quot;<br>
=C2=A0GLIBCVERSION ?=3D &quot;2.27%&quot;<br>
=C2=A0LINUXLIBCVERSION ?=3D &quot;4.15%&quot;<br>
-QEMUVERSION ?=3D &quot;2.11%&quot;<br>
+QEMUVERSION ?=3D &quot;2.12%&quot;<br>
<br>
=C2=A0PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>
=C2=A0PREFERRED_VERSION_gcc-cross-${<wbr>TARGET_ARCH} ?=3D &quot;${GCCVERSI=
ON}&quot;<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/0001-arm-translate-a64-<w=
br>treat-DISAS_UPDATE-as-variant-<wbr>of-D.patch b/meta/recipes-devtools/qe=
mu/<wbr>qemu/0001-arm-translate-a64-<wbr>treat-DISAS_UPDATE-as-variant-<wbr=
>of-D.patch<br>
deleted file mode 100644<br>
index f90cae694c..0000000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/0001-arm-translate-a64-<wbr>trea=
t-DISAS_UPDATE-as-variant-<wbr>of-D.patch<br>
+++ /dev/null<br>
@@ -1,67 +0,0 @@<br>
-From a75a52d62418dafe462be4fe304855<wbr>01d1010bb9 Mon Sep 17 00:00:00 200=
1<br>
-From: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com">kamensky@c=
isco.com</a>&gt;<br>
-Date: Fri, 23 Mar 2018 18:26:45 +0000<br>
-Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of<br>
- DISAS_EXIT<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-In OE project 4.15 linux kernel boot hang was observed under<br>
-single cpu aarch64 qemu. Kernel code was in a loop waiting for<br>
-vtimer arrival, spinning in TC generated blocks, while interrupt<br>
-was pending unprocessed. This happened because when qemu tried to<br>
-handle vtimer interrupt target had interrupts disabled, as<br>
-result flag indicating TCG exit, cpu-&gt;icount_decr.u16.high,<br>
-was cleared but arm_cpu_exec_interrupt function did not call<br>
-arm_cpu_do_interrupt to process interrupt. Later when target<br>
-reenabled interrupts, it happened without exit into main loop, so<br>
-following code that waited for result of interrupt execution<br>
-run in infinite loop.<br>
-<br>
-To solve the problem instructions that operate on CPU sys state<br>
-(i.e enable/disable interrupt), and marked as DISAS_UPDATE,<br>
-should be considered as DISAS_EXIT variant, and should be<br>
-forced to exit back to main loop so qemu will have a chance<br>
-processing pending CPU state updates, including pending<br>
-interrupts.<br>
-<br>
-This change brings consistency with how DISAS_UPDATE is treated<br>
-in aarch32 case.<br>
-<br>
-CC: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.ma=
ydell@linaro.org</a>&gt;<br>
-CC: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.be=
nnee@linaro.org</a>&gt;<br>
-CC: <a href=3D"mailto:qemu-stable@nongnu.org">qemu-stable@nongnu.org</a><b=
r>
-Suggested-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
-Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com">k=
amensky@cisco.com</a>&gt;<br>
-Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lin=
aro.org">richard.henderson@linaro.org</a>&gt;<br>
-Message-id: <a href=3D"mailto:1521526368-1996-1-git-send-email-kamensky@ci=
sco.com">1521526368-1996-1-git-send-<wbr>email-kamensky@cisco.com</a><br>
-Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.or=
g">peter.maydell@linaro.org</a>&gt;<br>
-Upstream-Status: Backport<br>
----<br>
- target/arm/translate-a64.c | 6 +++---<br>
- 1 file changed, 3 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c<br>
-index 31ff047..327513e 100644<br>
---- a/target/arm/translate-a64.c<br>
-+++ b/target/arm/translate-a64.c<br>
-@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(<wbr>DisasContext=
Base *dcbase, CPUState *cpu)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_UPDATE:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_a64_set_pc_im(dc-&gt;p=
c);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fall through */<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<=
br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_EXIT:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_exit_tb(0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_ptr();<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_NORETURN:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_SWI:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
--- <br>
-2.7.4<br>
-<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/chardev-connect-socket-<w=
br>to-a-spawned-command.patch b/meta/recipes-devtools/qemu/<wbr>qemu/charde=
v-connect-socket-<wbr>to-a-spawned-command.patch<br>
index 6e6bf95c18..f1cf53a8c5 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/chardev-connect-socket-<wbr>to-a=
-spawned-command.patch<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/chardev-connect-socket-<wbr>to-a=
-spawned-command.patch<br>
@@ -1,4 +1,4 @@<br>
-From 3bb3100c22eb30146a69656480bdff<wbr>eef8663575 Mon Sep 17 00:00:00 200=
1<br>
+From a7690b02df70e0d3957e6eaa1e1cf9<wbr>2595839fbb Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xilinx.=
com">alistair.francis@xilinx.com</a>&gt;<br>
=C2=A0Date: Thu, 21 Dec 2017 11:35:16 -0800<br>
=C2=A0Subject: [PATCH] chardev: connect socket to a spawned command<br>
@@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@intel.=
com">patrick.ohly@intel.com</a>&gt;<br>
=C2=A0---<br>
- chardev/char-socket.c | 86 ++++++++++++++++++++++++++++++<wbr>+++++++++++=
+++++++---<br>
- chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
- qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
- 3 files changed, 90 insertions(+), 4 deletions(-)<br>
+ chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++<wbr>++++++++++=
++<br>
+ chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++<br>
+ qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +++<br>
+ 3 files changed, 110 insertions(+)<br>
<br>
=C2=A0diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
-index 53eda8ef00..f566107c35 100644<br>
+index 159e69c3b1..84778cf31a 100644<br>
=C2=A0--- a/chardev/char-socket.c<br>
=C2=A0+++ b/chardev/char-socket.c<br>
-@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(<wbr>gpointe=
r opaque)<br>
+@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(<wbr>gpointe=
r opaque)<br>
=C2=A0 =C2=A0 =C2=A0 return false;<br>
=C2=A0 }<br>
<br>
@@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0 static void qmp_chardev_open_socket(<wbr>Chardev *chr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ChardevBackend =
*backend,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bool *be_opened=
,<br>
-@@ -859,6 +921,9 @@<br>
+@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(<wbr>Chardev *chr=
,<br>
=C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 SocketChardev *s =3D SOCKET_CHARDEV(chr);<br>
=C2=A0 =C2=A0 =C2=A0 ChardevSocket *sock =3D backend-&gt;u.socket.data;<br>
@@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0 =C2=A0 =C2=A0 bool do_nodelay=C2=A0 =C2=A0 =C2=A0=3D sock-&gt;has_no=
delay ? sock-&gt;nodelay : false;<br>
=C2=A0 =C2=A0 =C2=A0 bool is_listen=C2=A0 =C2=A0 =C2=A0 =3D sock-&gt;has_se=
rver=C2=A0 ? sock-&gt;server=C2=A0 : true;<br>
=C2=A0 =C2=A0 =C2=A0 bool is_telnet=C2=A0 =C2=A0 =C2=A0 =3D sock-&gt;has_te=
lnet=C2=A0 ? sock-&gt;telnet=C2=A0 : false;<br>
-@@ -925,7 +990,14 @@<br>
-=C2=A0 =C2=A0 =C2=A0} else if (reconnect &gt; 0) {<br>
+@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(<wbr>Chardev *c=
hr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;reconnect_time =3D reconnect;<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
+ <br>
=C2=A0+#ifndef _WIN32<br>
=C2=A0+=C2=A0 =C2=A0 if (cmd) {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_open_socket_cmd(chr, cmd, errp);=
<br>
@@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *be_opened =3D true;<br>
=C2=A0+=C2=A0 =C2=A0 } else<br>
=C2=A0+#endif<br>
-=C2=A0 =C2=A0 =C2=A0if (s-&gt;reconnect_time) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sioc =3D qio_channel_socket_new();<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(<wbr>chr, si=
oc);<br>
-@@ -985,10 +1057,26 @@<br>
-=C2=A0 =C2=A0 =C2=A0const char *host =3D qemu_opt_get(opts, &quot;host&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0/* If reconnect_time is set, will do that in chr_machi=
ne_done. */<br>
+=C2=A0 =C2=A0 =C2=A0if (!s-&gt;reconnect_time) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;is_listen) {<br>
+@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts, C=
hardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 const char *port =3D qemu_opt_get(opts, &quot;port&quo=
t;);<br>
+=C2=A0 =C2=A0 =C2=A0const char *fd =3D qemu_opt_get(opts, &quot;fd&quot;);=
<br>
=C2=A0 =C2=A0 =C2=A0 const char *tls_creds =3D qemu_opt_get(opts, &quot;tls=
-creds&quot;);<br>
=C2=A0+#ifndef _WIN32<br>
=C2=A0+=C2=A0 =C2=A0 const char *cmd =3D qemu_opt_get(opts, &quot;cmd&quot;=
);<br>
@@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0 =C2=A0 =C2=A0 SocketAddressLegacy *addr;<br>
=C2=A0 =C2=A0 =C2=A0 ChardevSocket *sock;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0backend-&gt;type =3D CHARDEV_BACKEND_KIND_SOCKET;<br>
=C2=A0+#ifndef _WIN32<br>
=C2=A0+=C2=A0 =C2=A0 if (cmd) {<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
@@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0+=C2=A0 =C2=A0 } else<br>
=C2=A0+#endif<br>
-=C2=A0 =C2=A0 =C2=A0if (!path) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!host) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;cha=
rdev: socket: no host given&quot;);<br>
-@@ -1021,13 +1109,24 @@<br>
-=C2=A0 =C2=A0 =C2=A0sock-&gt;has_reconnect =3D true;<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0if ((!!path + !!fd + !!host) !=3D 1) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quo=
t;Exactly one of &#39;path&#39;, &#39;fd&#39; or &#39;host&#39; required&qu=
ot;);<br>
+@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts, =
ChardevBackend *backend,<br>
=C2=A0 =C2=A0 =C2=A0 sock-&gt;reconnect =3D reconnect;<br>
=C2=A0 =C2=A0 =C2=A0 sock-&gt;tls_creds =3D g_strdup(tls_creds);<br>
+ <br>
=C2=A0+#ifndef _WIN32<br>
=C2=A0+=C2=A0 =C2=A0 sock-&gt;cmd =3D g_strdup(cmd);<br>
=C2=A0+#endif<br>
- <br>
++ <br>
=C2=A0 =C2=A0 =C2=A0 addr =3D g_new0(SocketAddressLegacy, 1);<br>
=C2=A0+#ifndef _WIN32<br>
=C2=A0+=C2=A0 =C2=A0 if (path || cmd) {<br>
@@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644<br>
=C2=A0+#else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 q_unix-&gt;path =3D g_strdup(path);<br>
=C2=A0+#endif<br>
-=C2=A0 =C2=A0 =C2=A0} else {<br>
+=C2=A0 =C2=A0 =C2=A0} else if (host) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;type =3D SOCKET_ADDRESS_LEGACY_=
KIND_<wbr>INET;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addr-&gt;u.inet.data =3D g_new(InetSocke=
tAddress, 1);<br>
=C2=A0diff --git a/chardev/char.c b/chardev/char.c<br>
-index 2ae4f465ec..5d52cd5de5 100644<br>
+index 76d866e6fe..9747d51d7c 100644<br>
=C2=A0--- a/chardev/char.c<br>
=C2=A0+++ b/chardev/char.c<br>
=C2=A0@@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
@@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*ser=
ver&#39;=C2=A0 =C2=A0 : &#39;bool&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;*wai=
t&#39;=C2=A0 =C2=A0 =C2=A0 : &#39;bool&#39;,<br>
=C2=A0-- <br>
-2.14.1<br>
+2.17.0<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/disable-grabs.patch b/met=
a/recipes-devtools/qemu/<wbr>qemu/disable-grabs.patch<br>
index 77117890f4..e29c011a6f 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/disable-grabs.patch<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/disable-grabs.patch<br>
@@ -1,3 +1,11 @@<br>
+From a31c5c695cb716310257f1fc60a06b<wbr>821e74fe7f Mon Sep 17 00:00:00 200=
1<br>
+From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt;<br>
+Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
+Subject: [PATCH] sdl.c: allow user to disable pointer grabs<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
=C2=A0When the pointer enters the Qemu window it calls SDL_WM_GrabInput, wh=
ich calls<br>
=C2=A0XGrabPointer in a busyloop until it returns GrabSuccess. However if t=
here&#39;s already<br>
=C2=A0a pointer grab (screen is locked, a menu is open) then qemu will hang=
 until the<br>
@@ -11,35 +19,30 @@ them in a conditional that can be set by the autobuilde=
r environment, preserving<br>
=C2=A0the current grabbing behaviour for everyone else.<br>
<br>
=C2=A0Upstream-Status: Pending<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-From 4b1988ecb01a178269ec0513a75f2e<wbr>c620c7ef6a Mon Sep 17 00:00:00 200=
1<br>
-From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton=
@intel.com</a>&gt;<br>
-Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
-Subject: [PATCH] sdl.c: allow user to disable pointer grabs<br>
-<br>
=C2=A0Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m">ross.burton@intel.com</a>&gt;<br>
=C2=A0Signed-off-by: Eric B=C3=A9nard &lt;<a href=3D"mailto:eric@eukrea.com=
">eric@eukrea.com</a>&gt;<br>
+<br>
=C2=A0---<br>
- ui/sdl.c | 12 ++++++++++--<br>
- 1 file changed, 10 insertions(+), 2 deletions(-)<br>
+ ui/sdl.c | 13 +++++++++++--<br>
+ 1 file changed, 11 insertions(+), 2 deletions(-)<br>
<br>
-Index: qemu-2.11.1/ui/sdl.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- qemu-2.11.1.orig/ui/sdl.c<br>
-+++ qemu-2.11.1/ui/sdl.c<br>
-@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;<br>
- static int scaling_active =3D 0;<br>
- static Notifier mouse_mode_notifier;<br>
- static int idle_counter;<br>
+diff --git a/ui/sdl.c b/ui/sdl.c<br>
+index a5fd503..ab8d1b1 100644<br>
+--- a/ui/sdl.c<br>
++++ b/ui/sdl.c<br>
+@@ -68,6 +68,11 @@ static int idle_counter;<br>
+ static const guint16 *keycode_map;<br>
+ static size_t keycode_maplen;<br>
+ <br>
=C2=A0+#ifndef True<br>
=C2=A0+#define True 1<br>
=C2=A0+#endif<br>
=C2=A0+static doing_grabs =3D True;<br>
- <br>
++<br>
=C2=A0 #define SDL_REFRESH_INTERVAL_BUSY 10<br>
=C2=A0 #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \<br>
-@@ -431,14 +435,16 @@ static void sdl_grab_start(void)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ SDL_REFRESH_INTERVAL_BUSY + 1)<br>
+@@ -398,14 +403,16 @@ static void sdl_grab_start(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 } else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sdl_hide_cursor();<br>
@@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c<br>
=C2=A0 =C2=A0 =C2=A0 gui_grab =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 sdl_show_cursor();<br>
=C2=A0 =C2=A0 =C2=A0 sdl_update_caption();<br>
-@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,<br>
+@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds, Displa=
yOptions *o)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0* This requires SDL &gt;=3D 1.2.14. */<br>
=C2=A0 =C2=A0 =C2=A0 setenv(&quot;SDL_DISABLE_LOCK_KEYS&quot;<wbr>, &quot;1=
&quot;, 1);<br>
<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/memfd.patch b/meta/recipe=
s-devtools/qemu/<wbr>qemu/memfd.patch<br>
deleted file mode 100644<br>
index 62e8d3800b..0000000000<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/memfd.patch<br>
+++ /dev/null<br>
@@ -1,57 +0,0 @@<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ro=
ss.burton@intel.com</a>&gt;<br>
-<br>
-From 75e5b70e6b5dcc4f2219992d7cffa4<wbr>62aa406af0 Mon Sep 17 00:00:00 200=
1<br>
-From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@re=
dhat.com</a>&gt;<br>
-Date: Tue, 28 Nov 2017 11:51:27 +0100<br>
-Subject: [PATCH] memfd: fix configure test<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-Recent glibc added memfd_create in sys/mman.h.=C2=A0 This conflicts with<b=
r>
-the definition in util/memfd.c:<br>
-<br>
-=C2=A0 =C2=A0 /builddir/build/BUILD/qemu-2.<wbr>11.0-rc1/util/memfd.c:40:1=
2: error: static declaration of memfd_create follows non-static declaration=
<br>
-<br>
-Fix the configure test, and remove the sys/memfd.h inclusion since the<br>
-file actually does not exist---it is a typo in the memfd_create(2) man<br>
-page.<br>
-<br>
-Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.c=
om">marcandre.lureau@redhat.com</a>&gt;<br>
-Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pb=
onzini@redhat.com</a>&gt;<br>
----<br>
- configure=C2=A0 =C2=A0 | 2 +-<br>
- util/memfd.c | 4 +---<br>
- 2 files changed, 2 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/configure b/configure<br>
-index 9c8aa5a98b..99ccc1725a 100755<br>
---- a/configure<br>
-+++ b/configure<br>
-@@ -3923,7 +3923,7 @@ fi<br>
- # check if memfd is supported<br>
- memfd=3Dno<br>
- cat &gt; $TMPC &lt;&lt; EOF<br>
--#include &lt;sys/memfd.h&gt;<br>
-+#include &lt;sys/mman.h&gt;<br>
- <br>
- int main(void)<br>
- {<br>
-diff --git a/util/memfd.c b/util/memfd.c<br>
-index 4571d1aba8..412e94a405 100644<br>
---- a/util/memfd.c<br>
-+++ b/util/memfd.c<br>
-@@ -31,9 +31,7 @@<br>
- <br>
- #include &quot;qemu/memfd.h&quot;<br>
- <br>
--#ifdef CONFIG_MEMFD<br>
--#include &lt;sys/memfd.h&gt;<br>
--#elif defined CONFIG_LINUX<br>
-+#if defined CONFIG_LINUX &amp;&amp; !defined CONFIG_MEMFD<br>
- #include &lt;sys/syscall.h&gt;<br>
- #include &lt;asm/unistd.h&gt;<br>
- <br>
--- <br>
-2.11.0<br>
diff --git a/meta/recipes-devtools/qemu/<wbr>qemu/qemu-2.5.0-cflags.patch b=
/meta/recipes-devtools/qemu/<wbr>qemu/qemu-2.5.0-cflags.patch<br>
index eb99d14639..360519f1a1 100644<br>
--- a/meta/recipes-devtools/qemu/<wbr>qemu/qemu-2.5.0-cflags.patch<br>
+++ b/meta/recipes-devtools/qemu/<wbr>qemu/qemu-2.5.0-cflags.patch<br>
@@ -1,8 +1,19 @@<br>
+From 6702ec74a7ba90b99efedde260c9f0<wbr>8b75d5516d Mon Sep 17 00:00:00 200=
1<br>
+From: Stephen Arnold &lt;<a href=3D"mailto:sarnold@vctlabs.com">sarnold@vc=
tlabs.com</a>&gt;<br>
+Date: Sun, 12 Jun 2016 18:09:56 -0700<br>
+Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environ=
ment<br>
+<br>
=C2=A0Upstream-Status: Pending<br>
<br>
+---<br>
+ configure | 4 ----<br>
+ 1 file changed, 4 deletions(-)<br>
+<br>
+diff --git a/configure b/configure<br>
+index 69e05fb..12fc3d8 100755<br>
=C2=A0--- a/configure<br>
=C2=A0+++ b/configure<br>
-@@ -4468,10 +4468,6 @@ fi<br>
+@@ -5413,10 +5413,6 @@ write_c_skeleton<br>
=C2=A0 if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
=C2=A0 =C2=A0 CFLAGS=3D&quot;-fprofile-arcs -ftest-coverage -g $CFLAGS&quot=
;<br>
=C2=A0 =C2=A0 LDFLAGS=3D&quot;-fprofile-arcs -ftest-coverage $LDFLAGS&quot;=
<br>
@@ -12,4 +23,4 @@ Upstream-Status: Pending<br>
=C2=A0-=C2=A0 CFLAGS=3D&quot;-O2 $CFLAGS&quot;<br>
=C2=A0 fi<br>
<br>
- ##############################<wbr>############<br>
+ if test &quot;$have_asan&quot; =3D &quot;yes&quot;; then<br>
diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" r=
el=3D"noreferrer" target=3D"_blank">q<wbr>emu_2.11.1.bb</a> b/meta/recipes-=
devtools/qemu/<a href=3D"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=
=3D"_blank">q<wbr>emu_2.12.0.bb</a><br>
similarity index 87%<br>
rename from meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" re=
l=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.11.1.bb</a><br>
rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.12.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qem<wbr>u_2.12.0.bb</a><br>
index f4b7d69fca..63590fc9eb 100644<br>
--- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">q<wbr>emu_2.11.1.bb</a><br>
+++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.12.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">q<wbr>emu_2.12.0.bb</a><br>
@@ -20,8 +20,6 @@ SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-project.org=
/download/${BP}.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http://wiki.q=
emu-project.org/<wbr>download/${BP}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://chardev-connect-socket-<wb=
r>to-a-spawned-command.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://apic-fixup-fallthrough-<wb=
r>to-PIC.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux-user-Fix-<wbr>webkit=
gtk-hangs-on-32-bit-x86-<wbr>target.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://memfd.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-arm-translate-a64-<wb=
r>treat-DISAS_UPDATE-as-variant-<wbr>of-D.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+\..*)\.tar&quot=
;<br>
<br>
@@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://cpus.c-qemu_cpu_kick=
_<wbr>thread_debugging.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>61cf862b6007eba4ac98247776af2e<wbr>27&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>d9df2213ceed32e91dab7bc9dd19c1<wbr>af83f=
91ba72c7aeef7605dfaaf8173<wbr>2ccb&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>122fd7cdf241ff7eb1e42c0b503b5d<wbr>1b&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>c9f4a147bc915d24df9784affc611a<wbr>115f4=
2d24720a89210b479f1ba7a3f<wbr>679c&quot;<br>
<br>
=C2=A0COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
=C2=A0COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.17.0<br>
<br>
-- <br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--0000000000008775e4056bc7b12b--
