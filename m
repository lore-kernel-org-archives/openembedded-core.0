Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DAB2674734
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 09:09:50 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o78-v6so38554158wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 02:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zanPqFLvlNb0LEbJChuFtfLk2L1BtXuFyF1Yjn0QEhg=;
	b=QGS3V2mkcY/w5LOoM0x4BCoxmZ4W2C7HbhVi4kwMHuaBIegzGoCnQQ5jGQd7scyvrm
	JJQv/9ziNeDpsG8uV1FgHnVLQoCHU4oRlVrRDihJPBE52es7VmHKk6/AAUq6RaXqGLXw
	dzWb+g3g5z9eyXqSbuThT5XWbqsFCvDUmwbrwLDpFWGToxcr2nS6/C8nisR6nhQmzb2Q
	uHq6IKTuByyY+NA/fmIlmNLoAF02D2io9tbK+h0E9ox04HQ9s/7wQeMspCHD6dDUwCXR
	tE3cmhlufeGezF2eEiKPR4JspxWnzGANjlkbCE4Aco2CftIexfHfweuZFALDGlNkOriv
	6ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zanPqFLvlNb0LEbJChuFtfLk2L1BtXuFyF1Yjn0QEhg=;
	b=m8t0SVxl4XPIObVa/xpMZLLe6OP1yCIfg6eBJoQZwGPb11ZmeB9ZKTJxI7aE4HlhoY
	t3TQsqDPmFAj18bIcttcfcBJqgZmla+dBaV48rxzRp7ixg8hcVshYgrCKrYOOT1npepx
	PiHmziKIvjoZBkPYZzC0TW/kE2vz1cjk2kLfb/NPxxbN6dWJpFYOzAwvfcoKL/UPsKdM
	NPhMfEXI74ZGxuF7aUYg9Dz+FruyREoaZK3WwbGf6PvkdIoFfuVHFn3WiW3H0jQTdCAt
	qBJTL8SOfliCzk34hbjx7Y2Q3KtYg1ISqHUGRPSE2/+GW7TJY9j+gr2FLGtwGiK6wkbB
	Mr/g==
X-Gm-Message-State: ALKqPweaW27FXGuCz5R4OTfTrWls1VkCvIwnkcrHvMICmZNIV4b3kWBQ
	RbqvLo3GLqmo/wdbhab46NJY3QNz6iORQ7oDEno=
X-Google-Smtp-Source: ADUXVKK93BkjQsusVfpGSqaSIDHc1gFyeTX8laApHGGpHMRpHk+JbzyYWUWcYBw2m9JUzsUFPm9MNJEghdritOt4EuE=
X-Received: by 2002:a1c:4249:: with SMTP id
	p70-v6mr10863039wma.17.1527584991038; 
	Tue, 29 May 2018 02:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180502143733.6303-1-Martin.Jansa@gmail.com>
	<20180502143733.6303-2-Martin.Jansa@gmail.com>
	<CAJTo0LYvdpORbNFs4-gOn0QyPSZ3W8nQkZbX7w=C9t_WvTgCRw@mail.gmail.com>
In-Reply-To: <CAJTo0LYvdpORbNFs4-gOn0QyPSZ3W8nQkZbX7w=C9t_WvTgCRw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 May 2018 11:10:01 +0200
Message-ID: <CA+chaQcHdrPsQCJ94t+ifiiKfguuRirNQxY9c-KLfBeXEZqxrw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 29 May 2018 09:09:51 -0000
Content-Type: multipart/alternative; boundary="000000000000c15310056d549834"

--000000000000c15310056d549834
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This hang should have been fixed by:
meta/recipes-devtools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x8=
6-target.patch

which was added with previous upgrade to 2.11.0:

commit d6d0d99569e0d8b62a61e27d389e7939af45bab9
Author: Alistair Francis <alistair.francis@xilinx.com>
Date:   Wed Jan 17 13:39:06 2018 -0800

    qemu: Bump to version 2.11.0

and my update only shifted the chunk by 2 lines in:

commit a742584f253e25b97729abe19ca9e4fa2809ea2e
Author: Martin Jansa <martin.jansa@gmail.com>
Date:   Wed May 2 14:37:33 2018 +0000

    qemu: refresh patches with devtool

and the patch is still being applied. I was waiting for
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/ to reproduce it,
but it seems that Khem is working on some bigger overhaul of the jobs and
it's not ready yet, I'll try to reproduce it locally now and if I can
reproduce it, then I'll try to just remove this patch, because the upstream
didn't accept it very well in:
http://lists.gnu.org/archive/html/qemu-devel/2018-01/msg04185.html
and the discussion there died few months ago.

Regards,

On Fri, May 18, 2018 at 11:59 PM Burton, Ross <ross.burton@intel.com> wrote=
:

> This is causing the AB to hang when built for qemux86 with musl whilst
> building webkitgtk during the gobject-introspection qemu-i386 calls,
> qemu enters an infinite loop.
>
> I've not yet reproduced locally to try and get a log out of qemu, but
> it has happened on the autobuilder repeatedly.
>
> Ross
>
> On 2 May 2018 at 15:37, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/distro/include/tcmode-default.inc   |  2 +-
> >  ...4-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 -------------------
> >  ...-connect-socket-to-a-spawned-command.patch | 52 +++++++-------
> >  .../qemu/qemu/disable-grabs.patch             | 43 ++++++------
> >  meta/recipes-devtools/qemu/qemu/memfd.patch   | 57 ----------------
> >  .../qemu/qemu/qemu-2.5.0-cflags.patch         | 15 ++++-
> >  .../qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}   |  6 +-
> >  7 files changed, 65 insertions(+), 177 deletions(-)
> >  delete mode 100644
> meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDATE=
-as-variant-of-D.patch
> >  delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch
> >  rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}
> (87%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc
> b/meta/conf/distro/include/tcmode-default.inc
> > index 00399ae820..8b5214ed96 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -28,7 +28,7 @@ BINUVERSION ?=3D "2.30%"
> >  GDBVERSION ?=3D "8.0%"
> >  GLIBCVERSION ?=3D "2.27%"
> >  LINUXLIBCVERSION ?=3D "4.15%"
> > -QEMUVERSION ?=3D "2.11%"
> > +QEMUVERSION ?=3D "2.12%"
> >
> >  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
> >  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> > diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> b/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> > deleted file mode 100644
> > index f90cae694c..0000000000
> > ---
> a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DISAS_UPDA=
TE-as-variant-of-D.patch
> > +++ /dev/null
> > @@ -1,67 +0,0 @@
> > -From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 2001
> > -From: Victor Kamensky <kamensky@cisco.com>
> > -Date: Fri, 23 Mar 2018 18:26:45 +0000
> > -Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of
> > - DISAS_EXIT
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -In OE project 4.15 linux kernel boot hang was observed under
> > -single cpu aarch64 qemu. Kernel code was in a loop waiting for
> > -vtimer arrival, spinning in TC generated blocks, while interrupt
> > -was pending unprocessed. This happened because when qemu tried to
> > -handle vtimer interrupt target had interrupts disabled, as
> > -result flag indicating TCG exit, cpu->icount_decr.u16.high,
> > -was cleared but arm_cpu_exec_interrupt function did not call
> > -arm_cpu_do_interrupt to process interrupt. Later when target
> > -reenabled interrupts, it happened without exit into main loop, so
> > -following code that waited for result of interrupt execution
> > -run in infinite loop.
> > -
> > -To solve the problem instructions that operate on CPU sys state
> > -(i.e enable/disable interrupt), and marked as DISAS_UPDATE,
> > -should be considered as DISAS_EXIT variant, and should be
> > -forced to exit back to main loop so qemu will have a chance
> > -processing pending CPU state updates, including pending
> > -interrupts.
> > -
> > -This change brings consistency with how DISAS_UPDATE is treated
> > -in aarch32 case.
> > -
> > -CC: Peter Maydell <peter.maydell@linaro.org>
> > -CC: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > -CC: qemu-stable@nongnu.org
> > -Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > -Signed-off-by: Victor Kamensky <kamensky@cisco.com>
> > -Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > -Message-id: 1521526368-1996-1-git-send-email-kamensky@cisco.com
> > -Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > -Upstream-Status: Backport
> > ----
> > - target/arm/translate-a64.c | 6 +++---
> > - 1 file changed, 3 insertions(+), 3 deletions(-)
> > -
> > -diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> > -index 31ff047..327513e 100644
> > ---- a/target/arm/translate-a64.c
> > -+++ b/target/arm/translate-a64.c
> > -@@ -13378,12 +13378,12 @@ static void
> aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
> > -         case DISAS_UPDATE:
> > -             gen_a64_set_pc_im(dc->pc);
> > -             /* fall through */
> > --        case DISAS_JUMP:
> > --            tcg_gen_lookup_and_goto_ptr();
> > --            break;
> > -         case DISAS_EXIT:
> > -             tcg_gen_exit_tb(0);
> > -             break;
> > -+        case DISAS_JUMP:
> > -+            tcg_gen_lookup_and_goto_ptr();
> > -+            break;
> > -         case DISAS_NORETURN:
> > -         case DISAS_SWI:
> > -             break;
> > ---
> > -2.7.4
> > -
> > diff --git
> a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> > index 6e6bf95c18..f1cf53a8c5 100644
> > ---
> a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> > +++
> b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spawned-com=
mand.patch
> > @@ -1,4 +1,4 @@
> > -From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 2001
> > +From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mon Sep 17 00:00:00 2001
> >  From: Alistair Francis <alistair.francis@xilinx.com>
> >  Date: Thu, 21 Dec 2017 11:35:16 -0800
> >  Subject: [PATCH] chardev: connect socket to a spawned command
> > @@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]
> >
> >  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> >  ---
> > - chardev/char-socket.c | 86
> ++++++++++++++++++++++++++++++++++++++++++++++++---
> > - chardev/char.c        |  3 ++
> > - qapi/char.json        |  5 +++
> > - 3 files changed, 90 insertions(+), 4 deletions(-)
> > + chardev/char-socket.c | 102 +++++++++++++++++++++++++++++++++++++++++=
+
> > + chardev/char.c        |   3 ++
> > + qapi/char.json        |   5 +++
> > + 3 files changed, 110 insertions(+)
> >
> >  diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> > -index 53eda8ef00..f566107c35 100644
> > +index 159e69c3b1..84778cf31a 100644
> >  --- a/chardev/char-socket.c
> >  +++ b/chardev/char-socket.c
> > -@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer
> opaque)
> > +@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(gpointer
> opaque)
> >       return false;
> >   }
> >
> > @@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644
> >   static void qmp_chardev_open_socket(Chardev *chr,
> >                                       ChardevBackend *backend,
> >                                       bool *be_opened,
> > -@@ -859,6 +921,9 @@
> > +@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
> >   {
> >       SocketChardev *s =3D SOCKET_CHARDEV(chr);
> >       ChardevSocket *sock =3D backend->u.socket.data;
> > @@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644
> >       bool do_nodelay     =3D sock->has_nodelay ? sock->nodelay : false=
;
> >       bool is_listen      =3D sock->has_server  ? sock->server  : true;
> >       bool is_telnet      =3D sock->has_telnet  ? sock->telnet  : false=
;
> > -@@ -925,7 +990,14 @@
> > -     } else if (reconnect > 0) {
> > +@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chardev *ch=
r,
> >           s->reconnect_time =3D reconnect;
> >       }
> > --
> > +
> >  +#ifndef _WIN32
> >  +    if (cmd) {
> >  +        chardev_open_socket_cmd(chr, cmd, errp);
> > @@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644
> >  +        *be_opened =3D true;
> >  +    } else
> >  +#endif
> > -     if (s->reconnect_time) {
> > -         sioc =3D qio_channel_socket_new();
> > -         tcp_chr_set_client_ioc_name(chr, sioc);
> > -@@ -985,10 +1057,26 @@
> > -     const char *host =3D qemu_opt_get(opts, "host");
> > +     /* If reconnect_time is set, will do that in chr_machine_done. */
> > +     if (!s->reconnect_time) {
> > +         if (s->is_listen) {
> > +@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts
> *opts, ChardevBackend *backend,
> >       const char *port =3D qemu_opt_get(opts, "port");
> > +     const char *fd =3D qemu_opt_get(opts, "fd");
> >       const char *tls_creds =3D qemu_opt_get(opts, "tls-creds");
> >  +#ifndef _WIN32
> >  +    const char *cmd =3D qemu_opt_get(opts, "cmd");
> > @@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644
> >       SocketAddressLegacy *addr;
> >       ChardevSocket *sock;
> >
> > -     backend->type =3D CHARDEV_BACKEND_KIND_SOCKET;
> >  +#ifndef _WIN32
> >  +    if (cmd) {
> >  +        /*
> > @@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644
> >  +        }
> >  +    } else
> >  +#endif
> > -     if (!path) {
> > -         if (!host) {
> > -             error_setg(errp, "chardev: socket: no host given");
> > -@@ -1021,13 +1109,24 @@
> > -     sock->has_reconnect =3D true;
> > ++
> > +     if ((!!path + !!fd + !!host) !=3D 1) {
> > +         error_setg(errp,
> > +                    "Exactly one of 'path', 'fd' or 'host' required");
> > +@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts
> *opts, ChardevBackend *backend,
> >       sock->reconnect =3D reconnect;
> >       sock->tls_creds =3D g_strdup(tls_creds);
> > +
> >  +#ifndef _WIN32
> >  +    sock->cmd =3D g_strdup(cmd);
> >  +#endif
> > -
> > ++
> >       addr =3D g_new0(SocketAddressLegacy, 1);
> >  +#ifndef _WIN32
> >  +    if (path || cmd) {
> > @@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644
> >  +#else
> >           q_unix->path =3D g_strdup(path);
> >  +#endif
> > -     } else {
> > +     } else if (host) {
> >           addr->type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;
> >           addr->u.inet.data =3D g_new(InetSocketAddress, 1);
> >  diff --git a/chardev/char.c b/chardev/char.c
> > -index 2ae4f465ec..5d52cd5de5 100644
> > +index 76d866e6fe..9747d51d7c 100644
> >  --- a/chardev/char.c
> >  +++ b/chardev/char.c
> >  @@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {
> > @@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644
> >                                        '*server'    : 'bool',
> >                                        '*wait'      : 'bool',
> >  --
> > -2.14.1
> > +2.17.0
> > +
> > diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> > index 77117890f4..e29c011a6f 100644
> > --- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch
> > @@ -1,3 +1,11 @@
> > +From a31c5c695cb716310257f1fc60a06b821e74fe7f Mon Sep 17 00:00:00 2001
> > +From: Ross Burton <ross.burton@intel.com>
> > +Date: Wed, 18 Sep 2013 14:04:54 +0100
> > +Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +
> >  When the pointer enters the Qemu window it calls SDL_WM_GrabInput,
> which calls
> >  XGrabPointer in a busyloop until it returns GrabSuccess. However if
> there's already
> >  a pointer grab (screen is locked, a menu is open) then qemu will hang
> until the
> > @@ -11,35 +19,30 @@ them in a conditional that can be set by the
> autobuilder environment, preserving
> >  the current grabbing behaviour for everyone else.
> >
> >  Upstream-Status: Pending
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 2001
> > -From: Ross Burton <ross.burton@intel.com>
> > -Date: Wed, 18 Sep 2013 14:04:54 +0100
> > -Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> > -
> >  Signed-off-by: Ross Burton <ross.burton@intel.com>
> >  Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> > +
> >  ---
> > - ui/sdl.c | 12 ++++++++++--
> > - 1 file changed, 10 insertions(+), 2 deletions(-)
> > + ui/sdl.c | 13 +++++++++++--
> > + 1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > -Index: qemu-2.11.1/ui/sdl.c
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- qemu-2.11.1.orig/ui/sdl.c
> > -+++ qemu-2.11.1/ui/sdl.c
> > -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
> > - static int scaling_active =3D 0;
> > - static Notifier mouse_mode_notifier;
> > - static int idle_counter;
> > +diff --git a/ui/sdl.c b/ui/sdl.c
> > +index a5fd503..ab8d1b1 100644
> > +--- a/ui/sdl.c
> > ++++ b/ui/sdl.c
> > +@@ -68,6 +68,11 @@ static int idle_counter;
> > + static const guint16 *keycode_map;
> > + static size_t keycode_maplen;
> > +
> >  +#ifndef True
> >  +#define True 1
> >  +#endif
> >  +static doing_grabs =3D True;
> > -
> > ++
> >   #define SDL_REFRESH_INTERVAL_BUSY 10
> >   #define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAULT \
> > -@@ -431,14 +435,16 @@ static void sdl_grab_start(void)
> > +                             / SDL_REFRESH_INTERVAL_BUSY + 1)
> > +@@ -398,14 +403,16 @@ static void sdl_grab_start(void)
> >           }
> >       } else
> >           sdl_hide_cursor();
> > @@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c
> >       gui_grab =3D 0;
> >       sdl_show_cursor();
> >       sdl_update_caption();
> > -@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,
> > +@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds,
> DisplayOptions *o)
> >        * This requires SDL >=3D 1.2.14. */
> >       setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
> >
> > diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch
> b/meta/recipes-devtools/qemu/qemu/memfd.patch
> > deleted file mode 100644
> > index 62e8d3800b..0000000000
> > --- a/meta/recipes-devtools/qemu/qemu/memfd.patch
> > +++ /dev/null
> > @@ -1,57 +0,0 @@
> > -Upstream-Status: Backport
> > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > -
> > -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 2001
> > -From: Paolo Bonzini <pbonzini@redhat.com>
> > -Date: Tue, 28 Nov 2017 11:51:27 +0100
> > -Subject: [PATCH] memfd: fix configure test
> > -MIME-Version: 1.0
> > -Content-Type: text/plain; charset=3DUTF-8
> > -Content-Transfer-Encoding: 8bit
> > -
> > -Recent glibc added memfd_create in sys/mman.h.  This conflicts with
> > -the definition in util/memfd.c:
> > -
> > -    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error:
> static declaration of memfd_create follows non-static declaration
> > -
> > -Fix the configure test, and remove the sys/memfd.h inclusion since the
> > -file actually does not exist---it is a typo in the memfd_create(2) man
> > -page.
> > -
> > -Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > ----
> > - configure    | 2 +-
> > - util/memfd.c | 4 +---
> > - 2 files changed, 2 insertions(+), 4 deletions(-)
> > -
> > -diff --git a/configure b/configure
> > -index 9c8aa5a98b..99ccc1725a 100755
> > ---- a/configure
> > -+++ b/configure
> > -@@ -3923,7 +3923,7 @@ fi
> > - # check if memfd is supported
> > - memfd=3Dno
> > - cat > $TMPC << EOF
> > --#include <sys/memfd.h>
> > -+#include <sys/mman.h>
> > -
> > - int main(void)
> > - {
> > -diff --git a/util/memfd.c b/util/memfd.c
> > -index 4571d1aba8..412e94a405 100644
> > ---- a/util/memfd.c
> > -+++ b/util/memfd.c
> > -@@ -31,9 +31,7 @@
> > -
> > - #include "qemu/memfd.h"
> > -
> > --#ifdef CONFIG_MEMFD
> > --#include <sys/memfd.h>
> > --#elif defined CONFIG_LINUX
> > -+#if defined CONFIG_LINUX && !defined CONFIG_MEMFD
> > - #include <sys/syscall.h>
> > - #include <asm/unistd.h>
> > -
> > ---
> > -2.11.0
> > diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> > index eb99d14639..360519f1a1 100644
> > --- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> > +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch
> > @@ -1,8 +1,19 @@
> > +From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mon Sep 17 00:00:00 2001
> > +From: Stephen Arnold <sarnold@vctlabs.com>
> > +Date: Sun, 12 Jun 2016 18:09:56 -0700
> > +Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some
> environment
> > +
> >  Upstream-Status: Pending
> >
> > +---
> > + configure | 4 ----
> > + 1 file changed, 4 deletions(-)
> > +
> > +diff --git a/configure b/configure
> > +index 69e05fb..12fc3d8 100755
> >  --- a/configure
> >  +++ b/configure
> > -@@ -4468,10 +4468,6 @@ fi
> > +@@ -5413,10 +5413,6 @@ write_c_skeleton
> >   if test "$gcov" =3D "yes" ; then
> >     CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
> >     LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> > @@ -12,4 +23,4 @@ Upstream-Status: Pending
> >  -  CFLAGS=3D"-O2 $CFLAGS"
> >   fi
> >
> > - ##########################################
> > + if test "$have_asan" =3D "yes"; then
> > diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> > similarity index 87%
> > rename from meta/recipes-devtools/qemu/qemu_2.11.1.bb
> > rename to meta/recipes-devtools/qemu/qemu_2.12.0.bb
> > index f4b7d69fca..63590fc9eb 100644
> > --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> > +++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> > @@ -20,8 +20,6 @@ SRC_URI =3D "
> http://wiki.qemu-project.org/download/${BP}.tar.bz2 \
> >             file://chardev-connect-socket-to-a-spawned-command.patch \
> >             file://apic-fixup-fallthrough-to-PIC.patch \
> >
>  file://linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
> > -           file://memfd.patch \
> > -
>  file://0001-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch \
> >             "
> >  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+\..*)\.tar"
> >
> > @@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D " \
> >              file://cpus.c-qemu_cpu_kick_thread_debugging.patch \
> >              "
> >
> > -SRC_URI[md5sum] =3D "61cf862b6007eba4ac98247776af2e27"
> > -SRC_URI[sha256sum] =3D
> "d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7aeef7605dfaaf81732ccb"
> > +SRC_URI[md5sum] =3D "122fd7cdf241ff7eb1e42c0b503b5d1b"
> > +SRC_URI[sha256sum] =3D
> "c9f4a147bc915d24df9784affc611a115f42d24720a89210b479f1ba7a3f679c"
> >
> >  COMPATIBLE_HOST_mipsarchn32 =3D "null"
> >  COMPATIBLE_HOST_mipsarchn64 =3D "null"
> > --
> > 2.17.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000c15310056d549834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This hang should have been fixed by:<div>meta/recipes-devt=
ools/qemu/qemu/linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch<br=
></div><div><br></div><div>which was added with previous upgrade to 2.11.0:=
</div><div><br></div><div><div>commit d6d0d99569e0d8b62a61e27d389e7939af45b=
ab9</div><div>Author: Alistair Francis &lt;<a href=3D"mailto:alistair.franc=
is@xilinx.com">alistair.francis@xilinx.com</a>&gt;</div><div>Date:=C2=A0 =
=C2=A0Wed Jan 17 13:39:06 2018 -0800</div><div><br></div><div>=C2=A0 =C2=A0=
 qemu: Bump to version 2.11.0</div></div><div><br></div><div>and my update =
only shifted the chunk by 2 lines in:</div><div><br></div><div><div>commit =
a742584f253e25b97729abe19ca9e4fa2809ea2e</div><div>Author: Martin Jansa &lt=
;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;</=
div><div>Date:=C2=A0 =C2=A0Wed May 2 14:37:33 2018 +0000</div><div><br></di=
v><div>=C2=A0 =C2=A0 qemu: refresh patches with devtool</div></div><div><br=
></div><div>and the patch is still being applied. I was waiting for=C2=A0<a=
 href=3D"http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/">http:/=
/jenkins.nas-admin.org/view/OE/job/oe_world_qemux86/</a> to reproduce it, b=
ut it seems that Khem is working on some bigger overhaul of the jobs and it=
&#39;s not ready yet, I&#39;ll try to reproduce it locally now and if I can=
 reproduce it, then I&#39;ll try to just remove this patch, because the ups=
tream didn&#39;t accept it very well in:</div><div><a href=3D"http://lists.=
gnu.org/archive/html/qemu-devel/2018-01/msg04185.html">http://lists.gnu.org=
/archive/html/qemu-devel/2018-01/msg04185.html</a><br></div><div>and the di=
scussion there died few months ago.</div><div><br></div><div>Regards,</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Fri, May 18, 2018 =
at 11:59 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.=
burton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Thi=
s is causing the AB to hang when built for qemux86 with musl whilst<br>
building webkitgtk during the gobject-introspection qemu-i386 calls,<br>
qemu enters an infinite loop.<br>
<br>
I&#39;ve not yet reproduced locally to try and get a log out of qemu, but<b=
r>
it has happened on the autobuilder repeatedly.<br>
<br>
Ross<br>
<br>
On 2 May 2018 at 15:37, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gma=
il.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.c=
om" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/tcmode-default.inc=C2=A0 =C2=A0|=C2=A0 =
2 +-<br>
&gt;=C2=A0 ...4-treat-DISAS_UPDATE-as-variant-of-D.patch | 67 -------------=
------<br>
&gt;=C2=A0 ...-connect-socket-to-a-spawned-command.patch | 52 +++++++------=
-<br>
&gt;=C2=A0 .../qemu/qemu/disable-grabs.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 43 ++++++------<br>
&gt;=C2=A0 meta/recipes-devtools/qemu/qemu/memfd.patch=C2=A0 =C2=A0| 57 ---=
-------------<br>
&gt;=C2=A0 .../qemu/qemu/qemu-2.5.0-cflags.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 15 ++++-<br>
&gt;=C2=A0 .../qemu/{<a href=3D"http://qemu_2.11.1.bb" rel=3D"noreferrer" t=
arget=3D"_blank">qemu_2.11.1.bb</a> =3D&gt; <a href=3D"http://qemu_2.12.0.b=
b" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a>}=C2=A0 =C2=A0|=
=C2=A0 6 +-<br>
&gt;=C2=A0 7 files changed, 65 insertions(+), 177 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-arm-tran=
slate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt;=C2=A0 delete mode 100644 meta/recipes-devtools/qemu/qemu/memfd.patch<b=
r>
&gt;=C2=A0 rename meta/recipes-devtools/qemu/{<a href=3D"http://qemu_2.11.1=
.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a> =3D&gt; <a hre=
f=3D"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.12.=
0.bb</a>} (87%)<br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/d=
istro/include/tcmode-default.inc<br>
&gt; index 00399ae820..8b5214ed96 100644<br>
&gt; --- a/meta/conf/distro/include/tcmode-default.inc<br>
&gt; +++ b/meta/conf/distro/include/tcmode-default.inc<br>
&gt; @@ -28,7 +28,7 @@ BINUVERSION ?=3D &quot;2.30%&quot;<br>
&gt;=C2=A0 GDBVERSION ?=3D &quot;8.0%&quot;<br>
&gt;=C2=A0 GLIBCVERSION ?=3D &quot;2.27%&quot;<br>
&gt;=C2=A0 LINUXLIBCVERSION ?=3D &quot;4.15%&quot;<br>
&gt; -QEMUVERSION ?=3D &quot;2.11%&quot;<br>
&gt; +QEMUVERSION ?=3D &quot;2.12%&quot;<br>
&gt;<br>
&gt;=C2=A0 PREFERRED_VERSION_gcc ?=3D &quot;${GCCVERSION}&quot;<br>
&gt;=C2=A0 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D &quot;${GCCVERSI=
ON}&quot;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-tr=
eat-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/00=
01-arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch<br>
&gt; deleted file mode 100644<br>
&gt; index f90cae694c..0000000000<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu/0001-arm-translate-a64-treat-DIS=
AS_UPDATE-as-variant-of-D.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,67 +0,0 @@<br>
&gt; -From a75a52d62418dafe462be4fe30485501d1010bb9 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.com" targe=
t=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; -Date: Fri, 23 Mar 2018 18:26:45 +0000<br>
&gt; -Subject: [PATCH] arm/translate-a64: treat DISAS_UPDATE as variant of<=
br>
&gt; - DISAS_EXIT<br>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -In OE project 4.15 linux kernel boot hang was observed under<br>
&gt; -single cpu aarch64 qemu. Kernel code was in a loop waiting for<br>
&gt; -vtimer arrival, spinning in TC generated blocks, while interrupt<br>
&gt; -was pending unprocessed. This happened because when qemu tried to<br>
&gt; -handle vtimer interrupt target had interrupts disabled, as<br>
&gt; -result flag indicating TCG exit, cpu-&gt;icount_decr.u16.high,<br>
&gt; -was cleared but arm_cpu_exec_interrupt function did not call<br>
&gt; -arm_cpu_do_interrupt to process interrupt. Later when target<br>
&gt; -reenabled interrupts, it happened without exit into main loop, so<br>
&gt; -following code that waited for result of interrupt execution<br>
&gt; -run in infinite loop.<br>
&gt; -<br>
&gt; -To solve the problem instructions that operate on CPU sys state<br>
&gt; -(i.e enable/disable interrupt), and marked as DISAS_UPDATE,<br>
&gt; -should be considered as DISAS_EXIT variant, and should be<br>
&gt; -forced to exit back to main loop so qemu will have a chance<br>
&gt; -processing pending CPU state updates, including pending<br>
&gt; -interrupts.<br>
&gt; -<br>
&gt; -This change brings consistency with how DISAS_UPDATE is treated<br>
&gt; -in aarch32 case.<br>
&gt; -<br>
&gt; -CC: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" tar=
get=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; -CC: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org" ta=
rget=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
&gt; -CC: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-=
stable@nongnu.org</a><br>
&gt; -Suggested-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linar=
o.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; -Signed-off-by: Victor Kamensky &lt;<a href=3D"mailto:kamensky@cisco.c=
om" target=3D"_blank">kamensky@cisco.com</a>&gt;<br>
&gt; -Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderso=
n@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
&gt; -Message-id: <a href=3D"mailto:1521526368-1996-1-git-send-email-kamens=
ky@cisco.com" target=3D"_blank">1521526368-1996-1-git-send-email-kamensky@c=
isco.com</a><br>
&gt; -Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@lina=
ro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; -Upstream-Status: Backport<br>
&gt; ----<br>
&gt; - target/arm/translate-a64.c | 6 +++---<br>
&gt; - 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c<=
br>
&gt; -index 31ff047..327513e 100644<br>
&gt; ---- a/target/arm/translate-a64.c<br>
&gt; -+++ b/target/arm/translate-a64.c<br>
&gt; -@@ -13378,12 +13378,12 @@ static void aarch64_tr_tb_stop(DisasContext=
Base *dcbase, CPUState *cpu)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_UPDATE:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gen_a64_set_pc_im(dc-=
&gt;pc);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fall through */<br=
>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_pt=
r();<br>
&gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_EXIT:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcg_gen_exit_tb(0);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case DISAS_JUMP:<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_lookup_and_goto_pt=
r();<br>
&gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_NORETURN:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case DISAS_SWI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; ---<br>
&gt; -2.7.4<br>
&gt; -<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to=
-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/chardev-connect-=
socket-to-a-spawned-command.patch<br>
&gt; index 6e6bf95c18..f1cf53a8c5 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spaw=
ned-command.patch<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu/chardev-connect-socket-to-a-spaw=
ned-command.patch<br>
&gt; @@ -1,4 +1,4 @@<br>
&gt; -From 3bb3100c22eb30146a69656480bdffeef8663575 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From a7690b02df70e0d3957e6eaa1e1cf92595839fbb Mon Sep 17 00:00:00 200=
1<br>
&gt;=C2=A0 From: Alistair Francis &lt;<a href=3D"mailto:alistair.francis@xi=
linx.com" target=3D"_blank">alistair.francis@xilinx.com</a>&gt;<br>
&gt;=C2=A0 Date: Thu, 21 Dec 2017 11:35:16 -0800<br>
&gt;=C2=A0 Subject: [PATCH] chardev: connect socket to a spawned command<br=
>
&gt; @@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]=
<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Patrick Ohly &lt;<a href=3D"mailto:patrick.ohly@i=
ntel.com" target=3D"_blank">patrick.ohly@intel.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - chardev/char-socket.c | 86 +++++++++++++++++++++++++++++++++++++++++=
+++++++---<br>
&gt; - chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++<br>
&gt; - qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++<br>
&gt; - 3 files changed, 90 insertions(+), 4 deletions(-)<br>
&gt; + chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++++++++++++=
++<br>
&gt; + chardev/char.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 ++<br>
&gt; + qapi/char.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +++<br>
&gt; + 3 files changed, 110 insertions(+)<br>
&gt;<br>
&gt;=C2=A0 diff --git a/chardev/char-socket.c b/chardev/char-socket.c<br>
&gt; -index 53eda8ef00..f566107c35 100644<br>
&gt; +index 159e69c3b1..84778cf31a 100644<br>
&gt;=C2=A0 --- a/chardev/char-socket.c<br>
&gt;=C2=A0 +++ b/chardev/char-socket.c<br>
&gt; -@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointe=
r opaque)<br>
&gt; +@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(gpointe=
r opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt; @@ -123,7 +123,7 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 =C2=A0static void qmp_chardev_open_socket(Chardev *chr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Charde=
vBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool *=
be_opened,<br>
&gt; -@@ -859,6 +921,9 @@<br>
&gt; +@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev *chr=
,<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketChardev *s =3D SOCKET_CHARDEV(chr);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevSocket *sock =3D backend-&gt;u.socket=
.data;<br>
&gt; @@ -133,11 +133,10 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool do_nodelay=C2=A0 =C2=A0 =C2=A0=3D sock-=
&gt;has_nodelay ? sock-&gt;nodelay : false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_listen=C2=A0 =C2=A0 =C2=A0 =3D sock-=
&gt;has_server=C2=A0 ? sock-&gt;server=C2=A0 : true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool is_telnet=C2=A0 =C2=A0 =C2=A0 =3D sock-=
&gt;has_telnet=C2=A0 ? sock-&gt;telnet=C2=A0 : false;<br>
&gt; -@@ -925,7 +990,14 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else if (reconnect &gt; 0) {<br>
&gt; +@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chardev *c=
hr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;reconnect_time =3D recon=
nect;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; --<br>
&gt; +<br>
&gt;=C2=A0 +#ifndef _WIN32<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if (cmd) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 chardev_open_socket_cmd(chr, cmd, e=
rrp);<br>
&gt; @@ -146,12 +145,12 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 *be_opened =3D true;<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 } else<br>
&gt;=C2=A0 +#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (s-&gt;reconnect_time) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sioc =3D qio_channel_socket_new();<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tcp_chr_set_client_ioc_name(chr, si=
oc);<br>
&gt; -@@ -985,10 +1057,26 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0const char *host =3D qemu_opt_get(opts, &quot;hos=
t&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* If reconnect_time is set, will do that in chr_=
machine_done. */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!s-&gt;reconnect_time) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;is_listen) {<br>
&gt; +@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts *op=
ts, ChardevBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *port =3D qemu_opt_get(opts, &quo=
t;port&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *fd =3D qemu_opt_get(opts, &quot;fd&qu=
ot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *tls_creds =3D qemu_opt_get(opts,=
 &quot;tls-creds&quot;);<br>
&gt;=C2=A0 +#ifndef _WIN32<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 const char *cmd =3D qemu_opt_get(opts, &quot;cmd&=
quot;);<br>
&gt; @@ -159,7 +158,6 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0SocketAddressLegacy *addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ChardevSocket *sock;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0backend-&gt;type =3D CHARDEV_BACKEND_KIND_SOCKET;=
<br>
&gt;=C2=A0 +#ifndef _WIN32<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if (cmd) {<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; @@ -173,17 +171,18 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 } else<br>
&gt;=C2=A0 +#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if (!path) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!host) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quo=
t;chardev: socket: no host given&quot;);<br>
&gt; -@@ -1021,13 +1109,24 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sock-&gt;has_reconnect =3D true;<br>
&gt; ++<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if ((!!path + !!fd + !!host) !=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;Exactly one of &#39;path&#39;, &#39;fd&#39; or &#39;host&#39; requir=
ed&quot;);<br>
&gt; +@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts *o=
pts, ChardevBackend *backend,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sock-&gt;reconnect =3D reconnect;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sock-&gt;tls_creds =3D g_strdup(tls_creds);<=
br>
&gt; +<br>
&gt;=C2=A0 +#ifndef _WIN32<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 sock-&gt;cmd =3D g_strdup(cmd);<br>
&gt;=C2=A0 +#endif<br>
&gt; -<br>
&gt; ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D g_new0(SocketAddressLegacy, 1);<br>
&gt;=C2=A0 +#ifndef _WIN32<br>
&gt;=C2=A0 +=C2=A0 =C2=A0 if (path || cmd) {<br>
&gt; @@ -198,11 +197,11 @@ index 53eda8ef00..f566107c35 100644<br>
&gt;=C2=A0 +#else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q_unix-&gt;path =3D g_strdup(p=
ath);<br>
&gt;=C2=A0 +#endif<br>
&gt; -=C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0} else if (host) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;type =3D SOCKET_ADDRE=
SS_LEGACY_KIND_INET;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr-&gt;u.inet.data =3D g_new=
(InetSocketAddress, 1);<br>
&gt;=C2=A0 diff --git a/chardev/char.c b/chardev/char.c<br>
&gt; -index 2ae4f465ec..5d52cd5de5 100644<br>
&gt; +index 76d866e6fe..9747d51d7c 100644<br>
&gt;=C2=A0 --- a/chardev/char.c<br>
&gt;=C2=A0 +++ b/chardev/char.c<br>
&gt;=C2=A0 @@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {<br>
&gt; @@ -239,4 +238,5 @@ index ae19dcd1ed..6de0f29bcd 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
*server&#39;=C2=A0 =C2=A0 : &#39;bool&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
*wait&#39;=C2=A0 =C2=A0 =C2=A0 : &#39;bool&#39;,<br>
&gt;=C2=A0 --<br>
&gt; -2.14.1<br>
&gt; +2.17.0<br>
&gt; +<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch b/met=
a/recipes-devtools/qemu/qemu/disable-grabs.patch<br>
&gt; index 77117890f4..e29c011a6f 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu/disable-grabs.patch<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu/disable-grabs.patch<br>
&gt; @@ -1,3 +1,11 @@<br>
&gt; +From a31c5c695cb716310257f1fc60a06b821e74fe7f Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; +Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
&gt; +Subject: [PATCH] sdl.c: allow user to disable pointer grabs<br>
&gt; +MIME-Version: 1.0<br>
&gt; +Content-Type: text/plain; charset=3DUTF-8<br>
&gt; +Content-Transfer-Encoding: 8bit<br>
&gt; +<br>
&gt;=C2=A0 When the pointer enters the Qemu window it calls SDL_WM_GrabInpu=
t, which calls<br>
&gt;=C2=A0 XGrabPointer in a busyloop until it returns GrabSuccess. However=
 if there&#39;s already<br>
&gt;=C2=A0 a pointer grab (screen is locked, a menu is open) then qemu will=
 hang until the<br>
&gt; @@ -11,35 +19,30 @@ them in a conditional that can be set by the autob=
uilder environment, preserving<br>
&gt;=C2=A0 the current grabbing behaviour for everyone else.<br>
&gt;<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -From 4b1988ecb01a178269ec0513a75f2ec620c7ef6a Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -Date: Wed, 18 Sep 2013 14:04:54 +0100<br>
&gt; -Subject: [PATCH] sdl.c: allow user to disable pointer grabs<br>
&gt; -<br>
&gt;=C2=A0 Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt;=C2=A0 Signed-off-by: Eric B=C3=A9nard &lt;<a href=3D"mailto:eric@eukre=
a.com" target=3D"_blank">eric@eukrea.com</a>&gt;<br>
&gt; +<br>
&gt;=C2=A0 ---<br>
&gt; - ui/sdl.c | 12 ++++++++++--<br>
&gt; - 1 file changed, 10 insertions(+), 2 deletions(-)<br>
&gt; + ui/sdl.c | 13 +++++++++++--<br>
&gt; + 1 file changed, 11 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; -Index: qemu-2.11.1/ui/sdl.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- qemu-2.11.1.orig/ui/sdl.c<br>
&gt; -+++ qemu-2.11.1/ui/sdl.c<br>
&gt; -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;<br>
&gt; - static int scaling_active =3D 0;<br>
&gt; - static Notifier mouse_mode_notifier;<br>
&gt; - static int idle_counter;<br>
&gt; +diff --git a/ui/sdl.c b/ui/sdl.c<br>
&gt; +index a5fd503..ab8d1b1 100644<br>
&gt; +--- a/ui/sdl.c<br>
&gt; ++++ b/ui/sdl.c<br>
&gt; +@@ -68,6 +68,11 @@ static int idle_counter;<br>
&gt; + static const guint16 *keycode_map;<br>
&gt; + static size_t keycode_maplen;<br>
&gt; +<br>
&gt;=C2=A0 +#ifndef True<br>
&gt;=C2=A0 +#define True 1<br>
&gt;=C2=A0 +#endif<br>
&gt;=C2=A0 +static doing_grabs =3D True;<br>
&gt; -<br>
&gt; ++<br>
&gt;=C2=A0 =C2=A0#define SDL_REFRESH_INTERVAL_BUSY 10<br>
&gt;=C2=A0 =C2=A0#define SDL_MAX_IDLE_COUNT (2 * GUI_REFRESH_INTERVAL_DEFAU=
LT \<br>
&gt; -@@ -431,14 +435,16 @@ static void sdl_grab_start(void)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/ SDL_REFRESH_INTERVAL_BUSY + 1)<br>
&gt; +@@ -398,14 +403,16 @@ static void sdl_grab_start(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_hide_cursor();<br>
&gt; @@ -58,7 +61,7 @@ Index: qemu-2.11.1/ui/sdl.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0gui_grab =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_show_cursor();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0sdl_update_caption();<br>
&gt; -@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds,<br>
&gt; +@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds, D=
isplayOptions *o)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * This requires SDL &gt;=3D 1.2.14. */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0setenv(&quot;SDL_DISABLE_LOCK_KEYS&quot;, &q=
uot;1&quot;, 1);<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/memfd.patch b/meta/recipe=
s-devtools/qemu/qemu/memfd.patch<br>
&gt; deleted file mode 100644<br>
&gt; index 62e8d3800b..0000000000<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu/memfd.patch<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,57 +0,0 @@<br>
&gt; -Upstream-Status: Backport<br>
&gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.co=
m" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; -<br>
&gt; -From 75e5b70e6b5dcc4f2219992d7cffa462aa406af0 Mon Sep 17 00:00:00 200=
1<br>
&gt; -From: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=
=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; -Date: Tue, 28 Nov 2017 11:51:27 +0100<br>
&gt; -Subject: [PATCH] memfd: fix configure test<br>
&gt; -MIME-Version: 1.0<br>
&gt; -Content-Type: text/plain; charset=3DUTF-8<br>
&gt; -Content-Transfer-Encoding: 8bit<br>
&gt; -<br>
&gt; -Recent glibc added memfd_create in sys/mman.h.=C2=A0 This conflicts w=
ith<br>
&gt; -the definition in util/memfd.c:<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:1=
2: error: static declaration of memfd_create follows non-static declaration=
<br>
&gt; -<br>
&gt; -Fix the configure test, and remove the sys/memfd.h inclusion since th=
e<br>
&gt; -file actually does not exist---it is a typo in the memfd_create(2) ma=
n<br>
&gt; -page.<br>
&gt; -<br>
&gt; -Cc: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@red=
hat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; -Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.co=
m" target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; ----<br>
&gt; - configure=C2=A0 =C2=A0 | 2 +-<br>
&gt; - util/memfd.c | 4 +---<br>
&gt; - 2 files changed, 2 insertions(+), 4 deletions(-)<br>
&gt; -<br>
&gt; -diff --git a/configure b/configure<br>
&gt; -index 9c8aa5a98b..99ccc1725a 100755<br>
&gt; ---- a/configure<br>
&gt; -+++ b/configure<br>
&gt; -@@ -3923,7 +3923,7 @@ fi<br>
&gt; - # check if memfd is supported<br>
&gt; - memfd=3Dno<br>
&gt; - cat &gt; $TMPC &lt;&lt; EOF<br>
&gt; --#include &lt;sys/memfd.h&gt;<br>
&gt; -+#include &lt;sys/mman.h&gt;<br>
&gt; -<br>
&gt; - int main(void)<br>
&gt; - {<br>
&gt; -diff --git a/util/memfd.c b/util/memfd.c<br>
&gt; -index 4571d1aba8..412e94a405 100644<br>
&gt; ---- a/util/memfd.c<br>
&gt; -+++ b/util/memfd.c<br>
&gt; -@@ -31,9 +31,7 @@<br>
&gt; -<br>
&gt; - #include &quot;qemu/memfd.h&quot;<br>
&gt; -<br>
&gt; --#ifdef CONFIG_MEMFD<br>
&gt; --#include &lt;sys/memfd.h&gt;<br>
&gt; --#elif defined CONFIG_LINUX<br>
&gt; -+#if defined CONFIG_LINUX &amp;&amp; !defined CONFIG_MEMFD<br>
&gt; - #include &lt;sys/syscall.h&gt;<br>
&gt; - #include &lt;asm/unistd.h&gt;<br>
&gt; -<br>
&gt; ---<br>
&gt; -2.11.0<br>
&gt; diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch b=
/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch<br>
&gt; index eb99d14639..360519f1a1 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch<br>
&gt; +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.5.0-cflags.patch<br>
&gt; @@ -1,8 +1,19 @@<br>
&gt; +From 6702ec74a7ba90b99efedde260c9f08b75d5516d Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Stephen Arnold &lt;<a href=3D"mailto:sarnold@vctlabs.com" targe=
t=3D"_blank">sarnold@vctlabs.com</a>&gt;<br>
&gt; +Date: Sun, 12 Jun 2016 18:09:56 -0700<br>
&gt; +Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some en=
vironment<br>
&gt; +<br>
&gt;=C2=A0 Upstream-Status: Pending<br>
&gt;<br>
&gt; +---<br>
&gt; + configure | 4 ----<br>
&gt; + 1 file changed, 4 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/configure b/configure<br>
&gt; +index 69e05fb..12fc3d8 100755<br>
&gt;=C2=A0 --- a/configure<br>
&gt;=C2=A0 +++ b/configure<br>
&gt; -@@ -4468,10 +4468,6 @@ fi<br>
&gt; +@@ -5413,10 +5413,6 @@ write_c_skeleton<br>
&gt;=C2=A0 =C2=A0if test &quot;$gcov&quot; =3D &quot;yes&quot; ; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;-fprofile-arcs -ftest-coverage -g $C=
FLAGS&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0LDFLAGS=3D&quot;-fprofile-arcs -ftest-coverage $LDF=
LAGS&quot;<br>
&gt; @@ -12,4 +23,4 @@ Upstream-Status: Pending<br>
&gt;=C2=A0 -=C2=A0 CFLAGS=3D&quot;-O2 $CFLAGS&quot;<br>
&gt;=C2=A0 =C2=A0fi<br>
&gt;<br>
&gt; - ##########################################<br>
&gt; + if test &quot;$have_asan&quot; =3D &quot;yes&quot;; then<br>
&gt; diff --git a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.=
bb" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a> b/meta/recipes-=
devtools/qemu/<a href=3D"http://qemu_2.12.0.bb" rel=3D"noreferrer" target=
=3D"_blank">qemu_2.12.0.bb</a><br>
&gt; similarity index 87%<br>
&gt; rename from meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.b=
b" rel=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a><br>
&gt; rename to meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.12.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a><br>
&gt; index f4b7d69fca..63590fc9eb 100644<br>
&gt; --- a/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.11.1.bb" rel=
=3D"noreferrer" target=3D"_blank">qemu_2.11.1.bb</a><br>
&gt; +++ b/meta/recipes-devtools/qemu/<a href=3D"http://qemu_2.12.0.bb" rel=
=3D"noreferrer" target=3D"_blank">qemu_2.12.0.bb</a><br>
&gt; @@ -20,8 +20,6 @@ SRC_URI =3D &quot;<a href=3D"http://wiki.qemu-projec=
t.org/download/$%7BBP%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">http=
://wiki.qemu-project.org/download/${BP}.tar.bz2</a> \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://chardev-connect-=
socket-to-a-spawned-command.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://apic-fixup-fallt=
hrough-to-PIC.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://linux-user-Fix-w=
ebkitgtk-hangs-on-32-bit-x86-target.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://memfd.patch \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-arm-translate-a6=
4-treat-DISAS_UPDATE-as-variant-of-D.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+\..*)\.tar=
&quot;<br>
&gt;<br>
&gt; @@ -31,8 +29,8 @@ SRC_URI_append_class-native =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cpus.c-qemu_cpu=
_kick_thread_debugging.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;<br>
&gt; -SRC_URI[md5sum] =3D &quot;61cf862b6007eba4ac98247776af2e27&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;d9df2213ceed32e91dab7bc9dd19c1af83f91ba7=
2c7aeef7605dfaaf81732ccb&quot;<br>
&gt; +SRC_URI[md5sum] =3D &quot;122fd7cdf241ff7eb1e42c0b503b5d1b&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;c9f4a147bc915d24df9784affc611a115f42d247=
20a89210b479f1ba7a3f679c&quot;<br>
&gt;<br>
&gt;=C2=A0 COMPATIBLE_HOST_mipsarchn32 =3D &quot;null&quot;<br>
&gt;=C2=A0 COMPATIBLE_HOST_mipsarchn64 =3D &quot;null&quot;<br>
&gt; --<br>
&gt; 2.17.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000c15310056d549834--
