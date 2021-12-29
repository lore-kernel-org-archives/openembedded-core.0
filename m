Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD04CC433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 03:27:15 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.46872.1640748434923428531
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aQoZMErD;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id kc16so18137073qvb.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Dec 2021 19:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+/H+g6Q4rJHDNRBtcvW4+bZwIlxrJyMhIeOizmyARQ0=;
        b=aQoZMErD+rWnDji1SxX59DJpuddAZzMQpJOencLQV3DB9HnKjr8xVHe/dfZag7a8yL
         6QpDNFEDoVv7a7pnjBIz+8DdlS17V6QooZtjFSWVuqHcVADXKuqp3ymxRycP2GqQzZJn
         kKI/4WAhEfy/ZJhsjQr6QmuumpgiuQ2hCd9/gVoNCaEaUooscklHgyJjy0jqQ4RADpwf
         HpidfOCSXJxzEkRsUk2/0tVtbM07ZPuY3f8YgcH+g4xdGZDzYNrtotrgAHNGu4VgdNba
         NPWn9GB4e/B0fDdPbHDtzdm7S/DKnOHrmsfmyRLyDMmBso1mL+KyF9HP2JLsePHoDOt7
         ctzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+/H+g6Q4rJHDNRBtcvW4+bZwIlxrJyMhIeOizmyARQ0=;
        b=X7ddcvlUX0UozD4Es+o6bZ3PkwSDydfWVf24OTuUTGZsIv3vPdtK3SrL0WRQzyNBPP
         jDYgpckRpvA0zrBpij3ls695j47sG1GHY9VheZzykNOG9w66DRWu2gFVNbtXb+GlVKus
         uO5xbgQTB8o6wvGl2P7997fmqshOQy47+wnTrTwJqUyc0tMcqfzFnvF9pyMYs749koqe
         7mBwe0KkUw4CFsBO6WT25sOkf0sIlPVac4JAd4jXZ1g06oLcNh2LY2kczeQmLUOK/s9W
         o2VmEKs7ihxurcz2gWN9TsCWmICcJBihLfw3Xlczp5qBqFPyB+iCYAxeCqT57NKsz7GA
         AeAg==
X-Gm-Message-State: AOAM532OtmWVdBTjtyEDhiuqYLZNOQ3DgGihAPq3vkZ/mIBJwmccJP4/
	33FMP8UU7J39TniVNx6iUn9Iy0MCGOY2sddycpjf5aCW8agliw==
X-Google-Smtp-Source: 
 ABdhPJzxssuErtyKflc/8tFIHCoH40T0AyYP2BNNlOtI6soXiZ6YSlkpgDv8NJA4tZ0xQATgpEGKFZPVjo6RF7NH5dI=
X-Received: by 2002:a05:6214:c4d:: with SMTP id
 r13mr22586984qvj.63.1640748433601;
 Tue, 28 Dec 2021 19:27:13 -0800 (PST)
MIME-Version: 1.0
References: <20211219232626.940899-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211219232626.940899-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Dec 2021 19:26:47 -0800
Message-ID: 
 <CAMKF1soVmyWyfwR7MgmfxXU7gxyEcihVqnYy5MSAJ_r+Nuvukw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] qemu: Upgrade 6.1.0 -> 6.2.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Dec 2021 03:27:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160048

I am seeing that it now fails to build for riscv64 target where it
fails to configure

ERROR: Unknown CPU family riscv, see
https://wiki.yoctoproject.org/wiki/Meson/UnknownCPU for directions.

ERROR: meson setup failed

On Sun, Dec 19, 2021 at 3:26 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Add config option for pulseaudio
> Change audio to default mode since quoting of list of devices is broken in meson
> Drop patch where code changed completed upstream
> Refresh other patches
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/distro/include/tcmode-default.inc   |  2 +-
>  ...u-native_6.1.0.bb => qemu-native_6.2.0.bb} |  0
>  ...e_6.1.0.bb => qemu-system-native_6.2.0.bb} |  0
>  meta/recipes-devtools/qemu/qemu.inc           |  6 ++--
>  ...nux-user-Replace-__u64-with-uint64_t.patch | 31 -------------------
>  ...d-use-relative-path-to-refer-to-file.patch | 13 +++++---
>  ...-connect-socket-to-a-spawned-command.patch | 30 +++++++++---------
>  .../qemu/{qemu_6.1.0.bb => qemu_6.2.0.bb}     |  0
>  8 files changed, 27 insertions(+), 55 deletions(-)
>  rename meta/recipes-devtools/qemu/{qemu-native_6.1.0.bb => qemu-native_6.2.0.bb} (100%)
>  rename meta/recipes-devtools/qemu/{qemu-system-native_6.1.0.bb => qemu-system-native_6.2.0.bb} (100%)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch
>  rename meta/recipes-devtools/qemu/{qemu_6.1.0.bb => qemu_6.2.0.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index d858869bbd5..49e99af8f25 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -22,7 +22,7 @@ BINUVERSION ?= "2.37%"
>  GDBVERSION ?= "11.%"
>  GLIBCVERSION ?= "2.34"
>  LINUXLIBCVERSION ?= "5.15%"
> -QEMUVERSION ?= "6.1%"
> +QEMUVERSION ?= "6.2%"
>  GOVERSION ?= "1.17%"
>  # This can not use wildcards like 8.0.% since it is also used in mesa to denote
>  # llvm version being used, so always bump it with llvm recipe version bump
> diff --git a/meta/recipes-devtools/qemu/qemu-native_6.1.0.bb b/meta/recipes-devtools/qemu/qemu-native_6.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu-native_6.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu-native_6.2.0.bb
> diff --git a/meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu-system-native_6.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu-system-native_6.2.0.bb
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index 584c9482e93..fe838276be1 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -26,12 +26,11 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://mmap2.patch \
>             file://determinism.patch \
>             file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
> -           file://0001-linux-user-Replace-__u64-with-uint64_t.patch \
>             file://0001-riscv-Set-5.4-as-minimum-kernel-version-for-riscv32.patch \
>             "
>  UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> -SRC_URI[sha256sum] = "eebc089db3414bbeedf1e464beda0a7515aad30f73261abc246c9b27503a3c96"
> +SRC_URI[sha256sum] = "68e15d8e45ac56326e0b9a4afa8b49a3dfe8aba3488221d098c84698bca65b45"
>
>  SRC_URI:append:class-target = " file://cross.patch"
>  SRC_URI:append:class-nativesdk = " file://cross.patch"
> @@ -173,7 +172,7 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt,"
>  PACKAGECONFIG[nettle] = "--enable-nettle,--disable-nettle,nettle"
>  PACKAGECONFIG[libusb] = "--enable-libusb,--disable-libusb,libusb1"
>  PACKAGECONFIG[fdt] = "--enable-fdt,--disable-fdt,dtc"
> -PACKAGECONFIG[alsa] = "--audio-drv-list='oss alsa',,alsa-lib"
> +PACKAGECONFIG[alsa] = "--audio-drv-list=default,,alsa-lib"
>  PACKAGECONFIG[glx] = "--enable-opengl,--disable-opengl,virtual/libgl"
>  PACKAGECONFIG[lzo] = "--enable-lzo,--disable-lzo,lzo"
>  PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl"
> @@ -200,6 +199,7 @@ PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
>  # libnfs is currently provided by meta-kodi
>  PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
>  PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
> +PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
>
>  INSANE_SKIP:${PN} = "arch"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch b/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch
> deleted file mode 100644
> index 3d5c890b0fb..00000000000
> --- a/meta/recipes-devtools/qemu/qemu/0001-linux-user-Replace-__u64-with-uint64_t.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 5cc7b63299602d0aa8b57c684bbd9829856d54ad Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 8 Nov 2021 11:39:26 -0800
> -Subject: [PATCH] linux-user: Replace __u64 with uint64_t
> -
> -uint64_t is available in all userspaces via compiler include stdint.h
> -therefore use it instead of __u64 which is linux internal type, it fixes
> -build on some platforms eg. aarch64 systems using musl C library
> -
> -Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01955.html]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - linux-user/host/aarch64/hostdep.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/linux-user/host/aarch64/hostdep.h b/linux-user/host/aarch64/hostdep.h
> -index a8d41a21ad..34d934f665 100644
> ---- a/linux-user/host/aarch64/hostdep.h
> -+++ b/linux-user/host/aarch64/hostdep.h
> -@@ -25,7 +25,7 @@ extern char safe_syscall_end[];
> - static inline void rewind_if_in_safe_syscall(void *puc)
> - {
> -     ucontext_t *uc = puc;
> --    __u64 *pcreg = &uc->uc_mcontext.pc;
> -+    uint64_t *pcreg = &uc->uc_mcontext.pc;
> -
> -     if (*pcreg > (uintptr_t)safe_syscall_start
> -         && *pcreg < (uintptr_t)safe_syscall_end) {
> ---
> -2.33.1
> -
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
> index d5e1ab4d511..fcef1291817 100644
> --- a/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0001-tests-meson.build-use-relative-path-to-refer-to-file.patch
> @@ -16,16 +16,19 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
>   tests/meson.build   | 2 +-
>   1 files changed, 1 insertions(+), 1 deletion(-)
>
> -Index: qemu-6.0.0/tests/unit/meson.build
> +Index: qemu-6.2.0/tests/unit/meson.build
>  ===================================================================
> ---- qemu-6.0.0.orig/tests/unit/meson.build
> -+++ qemu-6.0.0/tests/unit/meson.build
> -@@ -42,7 +42,7 @@ tests = {
> +--- qemu-6.2.0.orig/tests/unit/meson.build
> ++++ qemu-6.2.0/tests/unit/meson.build
> +@@ -44,9 +44,9 @@ tests = {
>     'test-keyval': [testqapi],
>     'test-logging': [],
>     'test-uuid': [],
> --  'ptimer-test': ['ptimer-test-stubs.c', meson.source_root() / 'hw/core/ptimer.c'],
> +-  'ptimer-test': ['ptimer-test-stubs.c', meson.project_source_root() / 'hw/core/ptimer.c'],
>  +  'ptimer-test': ['ptimer-test-stubs.c', '../../hw/core/ptimer.c'],
>     'test-qapi-util': [],
> +-  'test-smp-parse': [qom, meson.project_source_root() / 'hw/core/machine-smp.c'],
> ++  'test-smp-parse': [qom, '../../hw/core/machine-smp.c'],
>   }
>
> + if have_system or have_tools
> diff --git a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
> index 05dc849dada..cf8b0e7a452 100644
> --- a/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0006-chardev-connect-socket-to-a-spawned-command.patch
> @@ -51,10 +51,10 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>   qapi/char.json        |   5 +++
>   3 files changed, 109 insertions(+)
>
> -Index: qemu-6.0.0/chardev/char-socket.c
> +Index: qemu-6.2.0/chardev/char-socket.c
>  ===================================================================
> ---- qemu-6.0.0.orig/chardev/char-socket.c
> -+++ qemu-6.0.0/chardev/char-socket.c
> +--- qemu-6.2.0.orig/chardev/char-socket.c
> ++++ qemu-6.2.0/chardev/char-socket.c
>  @@ -1362,6 +1362,67 @@ static bool qmp_chardev_validate_socket(
>       return true;
>   }
> @@ -133,7 +133,7 @@ Index: qemu-6.0.0/chardev/char-socket.c
>       bool do_nodelay     = sock->has_nodelay ? sock->nodelay : false;
>       bool is_listen      = sock->has_server  ? sock->server  : true;
>       bool is_telnet      = sock->has_telnet  ? sock->telnet  : false;
> -@@ -1446,6 +1510,14 @@ static void qmp_chardev_open_socket(Char
> +@@ -1440,6 +1504,14 @@ static void qmp_chardev_open_socket(Char
>
>       update_disconnected_filename(s);
>
> @@ -148,7 +148,7 @@ Index: qemu-6.0.0/chardev/char-socket.c
>       if (s->is_listen) {
>           if (qmp_chardev_open_socket_server(chr, is_telnet || is_tn3270,
>                                              is_waitconnect, errp) < 0) {
> -@@ -1465,6 +1537,9 @@ static void qemu_chr_parse_socket(QemuOp
> +@@ -1459,6 +1531,9 @@ static void qemu_chr_parse_socket(QemuOp
>       const char *host = qemu_opt_get(opts, "host");
>       const char *port = qemu_opt_get(opts, "port");
>       const char *fd = qemu_opt_get(opts, "fd");
> @@ -158,7 +158,7 @@ Index: qemu-6.0.0/chardev/char-socket.c
>   #ifdef CONFIG_LINUX
>       bool tight = qemu_opt_get_bool(opts, "tight", true);
>       bool abstract = qemu_opt_get_bool(opts, "abstract", false);
> -@@ -1472,6 +1547,20 @@ static void qemu_chr_parse_socket(QemuOp
> +@@ -1466,6 +1541,20 @@ static void qemu_chr_parse_socket(QemuOp
>       SocketAddressLegacy *addr;
>       ChardevSocket *sock;
>
> @@ -179,7 +179,7 @@ Index: qemu-6.0.0/chardev/char-socket.c
>       if ((!!path + !!fd + !!host) != 1) {
>           error_setg(errp,
>                      "Exactly one of 'path', 'fd' or 'host' required");
> -@@ -1522,13 +1611,24 @@ static void qemu_chr_parse_socket(QemuOp
> +@@ -1516,13 +1605,24 @@ static void qemu_chr_parse_socket(QemuOp
>       sock->tls_creds = g_strdup(qemu_opt_get(opts, "tls-creds"));
>       sock->has_tls_authz = qemu_opt_get(opts, "tls-authz");
>       sock->tls_authz = g_strdup(qemu_opt_get(opts, "tls-authz"));
> @@ -194,7 +194,7 @@ Index: qemu-6.0.0/chardev/char-socket.c
>       if (path) {
>  +#endif
>           UnixSocketAddress *q_unix;
> -         addr->type = SOCKET_ADDRESS_LEGACY_KIND_UNIX;
> +         addr->type = SOCKET_ADDRESS_TYPE_UNIX;
>           q_unix = addr->u.q_unix.data = g_new0(UnixSocketAddress, 1);
>  +#ifndef _WIN32
>  +        q_unix->path = cmd ? g_strdup_printf("cmd:%s", cmd) : g_strdup(path);
> @@ -204,11 +204,11 @@ Index: qemu-6.0.0/chardev/char-socket.c
>   #ifdef CONFIG_LINUX
>           q_unix->has_tight = true;
>           q_unix->tight = tight;
> -Index: qemu-6.0.0/chardev/char.c
> +Index: qemu-6.2.0/chardev/char.c
>  ===================================================================
> ---- qemu-6.0.0.orig/chardev/char.c
> -+++ qemu-6.0.0/chardev/char.c
> -@@ -840,6 +840,9 @@ QemuOptsList qemu_chardev_opts = {
> +--- qemu-6.2.0.orig/chardev/char.c
> ++++ qemu-6.2.0/chardev/char.c
> +@@ -836,6 +836,9 @@ QemuOptsList qemu_chardev_opts = {
>               .name = "path",
>               .type = QEMU_OPT_STRING,
>           },{
> @@ -218,10 +218,10 @@ Index: qemu-6.0.0/chardev/char.c
>               .name = "host",
>               .type = QEMU_OPT_STRING,
>           },{
> -Index: qemu-6.0.0/qapi/char.json
> +Index: qemu-6.2.0/qapi/char.json
>  ===================================================================
> ---- qemu-6.0.0.orig/qapi/char.json
> -+++ qemu-6.0.0/qapi/char.json
> +--- qemu-6.2.0.orig/qapi/char.json
> ++++ qemu-6.2.0/qapi/char.json
>  @@ -250,6 +250,10 @@
>   #
>   # @addr: socket address to listen on (server=true)
> diff --git a/meta/recipes-devtools/qemu/qemu_6.1.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/qemu/qemu_6.1.0.bb
> rename to meta/recipes-devtools/qemu/qemu_6.2.0.bb
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159850): https://lists.openembedded.org/g/openembedded-core/message/159850
> Mute This Topic: https://lists.openembedded.org/mt/87846474/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

