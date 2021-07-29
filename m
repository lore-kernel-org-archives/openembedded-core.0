Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web10.9502.1627565865726291010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 06:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qDDfIcNx;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id nd39so10785074ejc.5
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tUa5DdK4JWMyFyxlHjfBBtgBUqkx2Ptmaeb/5aTw0hM=;
        b=qDDfIcNx3q1eZvsDQjgncI4iwHF+gFzfz2Qj9snfWRGdSTPHGRaDB584qm1ASOe64n
         Pjoh803I/8/SRlmHJaa/S8MWPCoO+UBBy3z1Pjzz4WGeKtt/pv8acyyom7WpT/8IftBB
         pxne4+KlXGzwmO8LFjhfP2v0C7+V1tcjRXJhVZx/YfKkC8MSuNjQXv6ivE7seSAZh6pI
         v6ZlGEQEK2l3jgzd4BwovEpD3JJcieBtAdnUIEJ/daCTlRBJp4zVef589+trU7dkxMYk
         8VrWXT35OmbI0dVeQTZGFcZVn4xP8OZqXU1yRnTjhbnjBHt1Oyy7Elf4t6W5C+mfB3+e
         +p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUa5DdK4JWMyFyxlHjfBBtgBUqkx2Ptmaeb/5aTw0hM=;
        b=iFD1ympkzfHfTfzDQzyZ8SvC6wxSzpEygtXcQGuXaFsB2tMke+UdfiBld1YVJ2EtWe
         GtVXU2dsiQx+Mj3XKlIYUcl9wVOJEIWCO1OS7Mzr1C6lft03yPdG6o/7Ilqo5wjoJl31
         8G4RDEXl8qbJLKkJXfMtGZOFk94IgTTMa+yGvvmTQkCda22Hc2+5D5MKJJK7uLH5J/R0
         aAW+kuocnPGatHyeVRo17m4dAZ2MmXWFYbied8jEoMnuOjcAOxWj0bGBK09QghM2uMHp
         75YhQTjR4RbQHbIMzYz2Cwfw1/+dHLfEPTD3MCyBrppoIRUxtWt9X7aD6TTqsB7xHeo6
         wxVA==
X-Gm-Message-State: AOAM533lF5aQvcpLW7VZWqB+QZfbnkBZ/EN97DTaDm322JrPRKKqAKhc
	L0SCP6ztsk93vQeHE+1aS5J+amPsZrvtnq4H75Y=
X-Google-Smtp-Source: ABdhPJyZcF5bKg5EdOZ1j1/hWZfMigL7FZXqqhwfv6flHtyJloIfqMyY1yQY1dJ5gyDt8Sg2A70jjtDBgn9H+i2+PxE=
X-Received: by 2002:a17:906:d7b2:: with SMTP id pk18mr3144626ejb.541.1627565864016;
 Thu, 29 Jul 2021 06:37:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210722224508.51967-1-alex.kanavin@gmail.com> <20210722224508.51967-2-alex.kanavin@gmail.com>
In-Reply-To: <20210722224508.51967-2-alex.kanavin@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Thu, 29 Jul 2021 15:37:33 +0200
Message-ID: <CA+chaQeGNy_8NQfcwA+Qn1ZFfWXPbL9_+pts64oeet4rSw0WcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/8] systemd: update 248.3 -> 249.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002c5e2e05c84335f3"

--0000000000002c5e2e05c84335f3
Content-Type: text/plain; charset="UTF-8"

FYI: This introduces new build failure with ld-is-gold in DISTRO_FEATURES:

| [17/21] Generating linuxx64.elf.stub with a custom command
| FAILED: src/boot/efi/linuxx64.elf.stub
|
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld
-o src/boot/efi/linuxx64.elf.stub -T
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds
-shared -Bsymbolic -nostdlib -znocombreloc --build-id=sha1 -L
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/crt0-efi-x86_64.o
src/boot/efi/string-util-fundamental.c.o src/boot/efi/disk.c.o
src/boot/efi/graphics.c.o src/boot/efi/measure.c.o src/boot/efi/pe.c.o
src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/boot/efi/linux.c.o
src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnuefi
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.1.1/libgcc.a
|
/OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld:
internal error in segment_precedes, at ../../gold/layout.cc:3721
| [18/21] Generating boot.c.o with a custom command

On Fri, Jul 23, 2021 at 12:45 AM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> jinja is now required:
>
> https://github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704
>
> Drop 0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch as it is a
> backport.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...md-boot_248.3.bb => systemd-boot_249.1.bb} |  2 +-
>  meta/recipes-core/systemd/systemd.inc         |  4 +-
>  ...tall-dependency-links-at-install-tim.patch | 38 +++++++++---------
>  ...comp-Check-for-__NR_ppoll-before-use.patch | 39 -------------------
>  .../{systemd_248.3.bb => systemd_249.1.bb}    |  7 ++--
>  5 files changed, 25 insertions(+), 65 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_248.3.bb =>
> systemd-boot_249.1.bb} (98%)
>  delete mode 100644
> meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
>  rename meta/recipes-core/systemd/{systemd_248.3.bb => systemd_249.1.bb}
> (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_248.3.bb
> b/meta/recipes-core/systemd/systemd-boot_249.1.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd-boot_248.3.bb
> rename to meta/recipes-core/systemd/systemd-boot_249.1.bb
> index 249e620f4e..2c0bec4eda 100644
> --- a/meta/recipes-core/systemd/systemd-boot_248.3.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_249.1.bb
> @@ -3,7 +3,7 @@ FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
>
>  require conf/image-uefi.conf
>
> -DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
> +DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native
> python3-jinja2-native"
>
>  inherit meson pkgconfig gettext
>  inherit deploy
> diff --git a/meta/recipes-core/systemd/systemd.inc
> b/meta/recipes-core/systemd/systemd.inc
> index 0524a25008..0e92a72bb7 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,8 +14,8 @@ LICENSE = "GPLv2 & LGPLv2.1"
>  LIC_FILES_CHKSUM =
> "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>
>  file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>
> -SRCREV = "37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76"
> -SRCBRANCH = "v248-stable"
> +SRCREV = "764b74113e36ac5219a4b82a05f311b5a92136ce"
> +SRCBRANCH = "v249-stable"
>  SRC_URI = "git://
> github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}
> <http://github.com/systemd/systemd-stable.git;protocol=git;branch=$%7BSRCBRANCH%7D>
> \
>  "
>
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index 8dd22eeb7b..d3af734e06 100644
> ---
> a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++
> b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -1,4 +1,4 @@
> -From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001
> +From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001
>  From: Chen Qi <Qi.Chen@windriver.com>
>  Date: Thu, 21 Feb 2019 16:23:24 +0800
>  Subject: [PATCH] binfmt: Don't install dependency links at install time
> for
> @@ -25,11 +25,11 @@ Signed-off-by: Scott Murray <scott.murray@konsulko.com
> >
>   units/systemd-binfmt.service.in         | 4 ++++
>   3 files changed, 9 insertions(+), 4 deletions(-)
>
> -Index: systemd-stable/units/meson.build
> -===================================================================
> ---- systemd-stable.orig/units/meson.build
> -+++ systemd-stable/units/meson.build
> -@@ -55,8 +55,7 @@ units = [
> +diff --git a/units/meson.build b/units/meson.build
> +index 17e9ead9c1..e5502be620 100644
> +--- a/units/meson.build
> ++++ b/units/meson.build
> +@@ -59,8 +59,7 @@ units = [
>           ['poweroff.target',                     '',
>            (with_runlevels ? 'runlevel0.target' : '')],
>           ['printer.target',                      ''],
> @@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build
>           ['proc-sys-fs-binfmt_misc.mount',       'ENABLE_BINFMT'],
>           ['reboot.target',                       '',
>            'ctrl-alt-del.target' + (with_runlevels ? ' runlevel6.target' :
> '')],
> -@@ -166,8 +165,7 @@ in_units = [
> -         ['rc-local.service',                     'HAVE_SYSV_COMPAT'],
> +@@ -178,8 +177,7 @@ in_units = [
>           ['rescue.service',                       ''],
> +         ['serial-getty@.service',                ''],
>           ['systemd-backlight@.service',           'ENABLE_BACKLIGHT'],
>  -        ['systemd-binfmt.service',               'ENABLE_BINFMT',
>  -         'sysinit.target.wants/'],
> @@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build
>           ['systemd-bless-boot.service',           'ENABLE_EFI
> HAVE_BLKID'],
>           ['systemd-boot-check-no-failures.service', ''],
>           ['systemd-coredump@.service',            'ENABLE_COREDUMP'],
> -Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> -===================================================================
> ---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount
> -+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount
> -@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=/proc/sys/
> +diff --git a/units/proc-sys-fs-binfmt_misc.automount
> b/units/proc-sys-fs-binfmt_misc.automount
> +index 172c8757ab..f65d8930c6 100644
> +--- a/units/proc-sys-fs-binfmt_misc.automount
> ++++ b/units/proc-sys-fs-binfmt_misc.automount
> +@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=/proc/sys/
>
>   [Automount]
>   Where=/proc/sys/fs/binfmt_misc
>  +
>  +[Install]
>  +WantedBy=sysinit.target
> -Index: systemd-stable/units/systemd-binfmt.service.in
> -===================================================================
> ---- systemd-stable.orig/units/systemd-binfmt.service.in
> -+++ systemd-stable/units/systemd-binfmt.service.in
> +diff --git a/units/systemd-binfmt.service.in b/units/
> systemd-binfmt.service.in
> +index fdafce7ff7..4efc05e495 100644
> +--- a/units/systemd-binfmt.service.in
> ++++ b/units/systemd-binfmt.service.in
>  @@ -14,6 +14,7 @@ Documentation=
> https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
>   Documentation=
> https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>   DefaultDependencies=no
> @@ -73,8 +73,8 @@ Index: systemd-stable/units/systemd-binfmt.service.in
>   After=proc-sys-fs-binfmt_misc.mount
>   Before=sysinit.target shutdown.target
>  @@ -30,3 +31,6 @@ RemainAfterExit=yes
> - ExecStart=@rootlibexecdir@/systemd-binfmt
> - ExecStop=@rootlibexecdir@/systemd-binfmt --unregister
> + ExecStart={{ROOTLIBEXECDIR}}/systemd-binfmt
> + ExecStop={{ROOTLIBEXECDIR}}/systemd-binfmt --unregister
>   TimeoutSec=90s
>  +
>  +[Install]
> diff --git
> a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
> b/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
> deleted file mode 100644
> index 0ba5fa2547..0000000000
> ---
> a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 027ac2ad0695bb506460f9dd7e57149b71055887 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 8 Jun 2021 23:21:01 -0700
> -Subject: [PATCH] test-seccomp: Check for __NR_ppoll before use
> -
> -some newer architectures like riscv32 do not have __NR_ppoll from get go
> -
> -Upstream-Status: Submitted [https://github.com/systemd/systemd/pull/19858
> ]
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - src/test/test-seccomp.c | 5 +++--
> - 1 file changed, 3 insertions(+), 2 deletions(-)
> -
> -diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c
> -index b1f917eb54..daac0fcea8 100644
> ---- a/src/test/test-seccomp.c
> -+++ b/src/test/test-seccomp.c
> -@@ -832,7 +832,7 @@ static void test_load_syscall_filter_set_raw(void) {
> -                 assert_se(s = hashmap_new(NULL));
> - #if defined __NR_poll && __NR_poll >= 0
> -                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1),
> INT_TO_PTR(-1)) >= 0);
> --#else
> -+#elif defined __NR_ppoll
> -                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1),
> INT_TO_PTR(-1)) >= 0);
> - #endif
> -
> -@@ -849,7 +849,8 @@ static void test_load_syscall_filter_set_raw(void) {
> -                 assert_se(s = hashmap_new(NULL));
> - #if defined __NR_poll && __NR_poll >= 0
> -                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_poll + 1),
> INT_TO_PTR(EILSEQ)) >= 0);
> --#else
> -+#elif defined __NR_ppoll
> -+                assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1),
> INT_TO_PTR(-1)) >= 0);
> -                 assert_se(hashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1),
> INT_TO_PTR(EILSEQ)) >= 0);
> - #endif
> -
> ---
> -2.32.0
> -
> diff --git a/meta/recipes-core/systemd/systemd_248.3.bb
> b/meta/recipes-core/systemd/systemd_249.1.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_248.3.bb
> rename to meta/recipes-core/systemd/systemd_249.1.bb
> index f5022a99c2..9bfb12249c 100644
> --- a/meta/recipes-core/systemd/systemd_248.3.bb
> +++ b/meta/recipes-core/systemd/systemd_249.1.bb
> @@ -4,7 +4,7 @@ PROVIDES = "udev"
>
>  PE = "1"
>
> -DEPENDS = "intltool-native gperf-native libcap util-linux"
> +DEPENDS = "intltool-native gperf-native libcap util-linux
> python3-jinja2-native"
>
>  SECTION = "base/shell"
>
> @@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d
> update-alternatives qemu
>  # that we don't build both udev and systemd in world builds.
>  REQUIRED_DISTRO_FEATURES = "systemd"
>
> -SRC_URI += " \
> -           file://touchscreen.rules \
> +SRC_URI += "file://touchscreen.rules \
>             file://00-create-volatile.conf \
>             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback',
> 'file://org.freedesktop.hostname1_no_polkit.conf', '', d)} \
>             ${@bb.utils.contains('PACKAGECONFIG',
> 'polkit_hostnamed_fallback', 'file://00-hostnamed-network-user.conf', '',
> d)} \
> @@ -26,7 +25,6 @@ SRC_URI += " \
>             file://0003-implment-systemd-sysv-install-for-OE.patch \
>
> file://0001-systemd.pc.in-use-ROOTPREFIX-without-suffixed-slash.patch \
>             file://0001-test-parse-argument-Include-signal.h.patch \
> -           file://0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch
> \
>             "
>
>  # patches needed by musl
> @@ -687,6 +685,7 @@ FILES_udev += "${base_sbindir}/udevd \
>                 ${rootlibexecdir}/udev/rules.d/78-sound-card.rules \
>                 ${rootlibexecdir}/udev/rules.d/80-drivers.rules \
>                 ${rootlibexecdir}/udev/rules.d/80-net-setup-link.rules \
> +               ${rootlibexecdir}/udev/rules.d/81-net-dhcp.rules \
>                 ${rootlibexecdir}/udev/rules.d/90-vconsole.rules \
>                 ${rootlibexecdir}/udev/rules.d/README \
>                 ${sysconfdir}/udev \
> --
> 2.31.1
>
>
> 
>
>

--0000000000002c5e2e05c84335f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FYI: This introduces new build failure with ld-is-gold in =
DISTRO_FEATURES:<div><br></div><div>| [17/21] Generating linuxx64.elf.stub =
with a custom command<br>| FAILED: src/boot/efi/linuxx64.elf.stub<br>| /OE/=
build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe=
-sysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld -o src/boot/efi/=
linuxx64.elf.stub -T /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/sys=
temd-boot/249.1-r0/recipe-sysroot/usr/lib/elf_x86_64_efi.lds -shared -Bsymb=
olic -nostdlib -znocombreloc --build-id=3Dsha1 -L /OE/build/oe-core/tmp-gli=
bc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-sysroot/usr/lib /OE/=
build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe=
-sysroot/usr/lib/crt0-efi-x86_64.o src/boot/efi/string-util-fundamental.c.o=
 src/boot/efi/disk.c.o src/boot/efi/graphics.c.o src/boot/efi/measure.c.o s=
rc/boot/efi/pe.c.o src/boot/efi/secure-boot.c.o src/boot/efi/util.c.o src/b=
oot/efi/linux.c.o src/boot/efi/splash.c.o src/boot/efi/stub.c.o -lefi -lgnu=
efi /OE/build/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r=
0/recipe-sysroot/usr/lib/../lib/x86_64-oe-linux/11.1.1/libgcc.a<br>| /OE/bu=
ild/oe-core/tmp-glibc/work/core2-64-oe-linux/systemd-boot/249.1-r0/recipe-s=
ysroot-native/usr/bin/x86_64-oe-linux/x86_64-oe-linux-ld: internal error in=
 segment_precedes, at ../../gold/layout.cc:3721<br>| [18/21] Generating boo=
t.c.o with a custom command<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 23, 2021 at 12:45 AM Alexa=
nder Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">jinja is now required:<br>
<a href=3D"https://github.com/systemd/systemd/commit/e0698c66f4569c91e3fdd=
54ca77449698ae38704" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/systemd/systemd/commit/e0698c66f4569c91e3fdd54ca77449698ae38704</a><br>
<br>
Drop 0001-test-seccomp-Check-for-__NR_ppoll-before-use.patch as it is a ba=
ckport.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.=
com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://md-boot_248.3.bb" rel=3D"noreferrer" target=3D"=
_blank">md-boot_248.3.bb</a> =3D&gt; <a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a>} |=C2=A0 =
2 +-<br>
=C2=A0meta/recipes-core/systemd/systemd.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 4 +-<br>
=C2=A0...tall-dependency-links-at-install-tim.patch | 38 +++++++++--------=
-<br>
=C2=A0...comp-Check-for-__NR_ppoll-before-use.patch | 39 -----------------=
--<br>
=C2=A0.../{<a href=3D"http://systemd_248.3.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_248.3.bb</a> =3D&gt; <a href=3D"http://systemd_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd_249.1.bb</a>}=C2=A0 =C2=A0 =
|=C2=A0 7 ++--<br>
=C2=A05 files changed, 25 insertions(+), 65 deletions(-)<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd-boot_248=
.3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a> =3D&g=
t; <a href=3D"http://systemd-boot_249.1.bb" rel=3D"noreferrer" target=3D"_b=
lank">systemd-boot_249.1.bb</a>} (98%)<br>
=C2=A0delete mode 100644 meta/recipes-core/systemd/systemd/0001-test-secco=
mp-Check-for-__NR_ppoll-before-use.patch<br>
=C2=A0rename meta/recipes-core/systemd/{<a href=3D"http://systemd_248.3.bb=
" rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a> =3D&gt; <a href=
=
=3D"http://systemd_249.1.bb" rel=3D"noreferrer" target=3D"_blank">systemd_=
249.1.bb</a>} (99%)<br>
<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_248.=
3.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a> b/meta=
/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.bb" rel=3D"noref=
errer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
similarity index 98%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd-boot_248.3=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.b=
b" rel=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
index 249e620f4e..2c0bec4eda 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_248.3.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-boot_248.3.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_249.1.bb" r=
el=3D"noreferrer" target=3D"_blank">systemd-boot_249.1.bb</a><br>
@@ -3,7 +3,7 @@ FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd:&quot;<=
br>
<br>
=C2=A0require conf/image-uefi.conf<br>
<br>
-DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-native&=
quot;<br>
+DEPENDS =3D &quot;intltool-native libcap util-linux gnu-efi gperf-native =
python3-jinja2-native&quot;<br>
<br>
=C2=A0inherit meson pkgconfig gettext<br>
=C2=A0inherit deploy<br>
diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sys=
temd/systemd.inc<br>
index 0524a25008..0e92a72bb7 100644<br>
--- a/meta/recipes-core/systemd/systemd.inc<br>
+++ b/meta/recipes-core/systemd/systemd.inc<br>
@@ -14,8 +14,8 @@ LICENSE =3D &quot;GPLv2 &amp; LGPLv2.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE.GPL2;md5=3D751419260aa9544=
99f7abaabaa882bbe \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd255951079008b364516c&quot;<br>
<br>
-SRCREV =3D &quot;37c4cfde0ce613f0f00544d3f4e2e72bf93d9c76&quot;<br>
-SRCBRANCH =3D &quot;v248-stable&quot;<br>
+SRCREV =3D &quot;764b74113e36ac5219a4b82a05f311b5a92136ce&quot;<br>
+SRCBRANCH =3D &quot;v249-stable&quot;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/systemd/systemd=
-stable.git;protocol=3Dgit;branch=3D$%7BSRCBRANCH%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/systemd/systemd-stable.git;protocol=3Dgit;branch=
=
=3D${SRCBRANCH}</a> \<br>
=C2=A0&quot;<br>
<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-d=
ependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/00=
01-binfmt-Don-t-install-dependency-links-at-install-tim.patch<br>
index 8dd22eeb7b..d3af734e06 100644<br>
--- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependen=
cy-links-at-install-tim.patch<br>
+++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependen=
cy-links-at-install-tim.patch<br>
@@ -1,4 +1,4 @@<br>
-From 564830719be2017c4953589d50f21a9e856a4ecc Mon Sep 17 00:00:00 2001<br=
>
+From 08cd165f5db0e68a499b80c4b1744a4206948259 Mon Sep 17 00:00:00 2001<br=
>
=C2=A0From: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D=
"_blank">Qi.Chen@windriver.com</a>&gt;<br>
=C2=A0Date: Thu, 21 Feb 2019 16:23:24 +0800<br>
=C2=A0Subject: [PATCH] binfmt: Don&#39;t install dependency links at insta=
ll time for<br>
@@ -25,11 +25,11 @@ Signed-off-by: Scott Murray &lt;<a href=3D"mailto:scot=
t.murray@konsulko.com" target=3D"_blank">scott.murray@konsulko.com</a>&gt;<=
br>
=C2=A0 units/<a href=3D"http://systemd-binfmt.service.in" rel=3D"noreferre=
r" target=3D"_blank">systemd-binfmt.service.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 4 ++++<br>
=C2=A0 3 files changed, 9 insertions(+), 4 deletions(-)<br>
<br>
-Index: systemd-stable/units/meson.build<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-stable.orig/units/meson.build<br>
-+++ systemd-stable/units/meson.build<br>
-@@ -55,8 +55,7 @@ units =3D [<br>
+diff --git a/units/meson.build b/units/meson.build<br>
+index 17e9ead9c1..e5502be620 100644<br>
+--- a/units/meson.build<br>
++++ b/units/meson.build<br>
+@@ -59,8 +59,7 @@ units =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;poweroff.target&#39;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#3=
9;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(with_runlevels ? &#39;runlevel0.=
target&#39; : &#39;&#39;)],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;printer.target&#39;,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;]=
,<br>
@@ -39,9 +39,9 @@ Index: systemd-stable/units/meson.build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;proc-sys-fs-binfmt_misc.mount&#39=
;,=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BINFMT&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;reboot.target&#39;,=C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ctrl-alt-del.target&#39; + (=
with_runlevels ? &#39; runlevel6.target&#39; : &#39;&#39;)],<br>
-@@ -166,8 +165,7 @@ in_units =3D [<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;rc-local.service&#39;,=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;HAV=
E_SYSV_COMPAT&#39;],<br>
+@@ -178,8 +177,7 @@ in_units =3D [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;rescue.service&#39;,=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;=
&#39;],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[&#39;serial-getty@.service&#39;,=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-backlight@.service&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BACKLIGHT&#39;],<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-binfmt.service&#39;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_BINFMT&#39=
;,<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;sysinit.target.wants/&#39;],=
<br>
@@ -49,21 +49,21 @@ Index: systemd-stable/units/meson.build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-bless-boot.service&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;ENABLE_EFI HAVE_BLKID&#39;],=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-boot-check-no-failures.se=
rvice&#39;, &#39;&#39;],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&#39;systemd-coredump@.service&#39;,=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;ENABLE_COREDUMP&#39;],<br>
-Index: systemd-stable/units/proc-sys-fs-binfmt_misc.automount<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-stable.orig/units/proc-sys-fs-binfmt_misc.automount<br>
-+++ systemd-stable/units/proc-sys-fs-binfmt_misc.automount<br>
-@@ -18,3 +18,6 @@ ConditionPathIsReadWrite=3D/proc/sys/<br>
+diff --git a/units/proc-sys-fs-binfmt_misc.automount b/units/proc-sys-fs-=
binfmt_misc.automount<br>
+index 172c8757ab..f65d8930c6 100644<br>
+--- a/units/proc-sys-fs-binfmt_misc.automount<br>
++++ b/units/proc-sys-fs-binfmt_misc.automount<br>
+@@ -19,3 +19,6 @@ ConditionPathIsReadWrite=3D/proc/sys/<br>
<br>
=C2=A0 [Automount]<br>
=C2=A0 Where=3D/proc/sys/fs/binfmt_misc<br>
=C2=A0+<br>
=C2=A0+[Install]<br>
=C2=A0+WantedBy=3Dsysinit.target<br>
-Index: systemd-stable/units/<a href=3D"http://systemd-binfmt.service.in" =
rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- systemd-stable.orig/units/<a href=3D"http://systemd-binfmt.service.in=
" rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><br>
-+++ systemd-stable/units/<a href=3D"http://systemd-binfmt.service.in" rel=
=
=3D"noreferrer" target=3D"_blank">systemd-binfmt.service.in</a><br>
+diff --git a/units/<a href=3D"http://systemd-binfmt.service.in" rel=3D"no=
referrer" target=3D"_blank">systemd-binfmt.service.in</a> b/units/<a href=
=3D"http://systemd-binfmt.service.in" rel=3D"noreferrer" target=3D"_blank"=
>systemd-binfmt.service.in</a><br>
+index fdafce7ff7..4efc05e495 100644<br>
+--- a/units/<a href=3D"http://systemd-binfmt.service.in" rel=3D"noreferre=
r" target=3D"_blank">systemd-binfmt.service.in</a><br>
++++ b/units/<a href=3D"http://systemd-binfmt.service.in" rel=3D"noreferre=
r" target=3D"_blank">systemd-binfmt.service.in</a><br>
=C2=A0@@ -14,6 +14,7 @@ Documentation=3D<a href=3D"https://www.kernel.org/=
doc/html/latest/admin-guide/binfmt-misc.htm" rel=3D"noreferrer" target=3D"_=
blank">https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm</=
a><br>
=C2=A0 Documentation=3D<a href=3D"https://www.freedesktop.org/wiki/Softwar=
e/systemd/APIFileSystems" rel=3D"noreferrer" target=3D"_blank">https://www.=
freedesktop.org/wiki/Software/systemd/APIFileSystems</a><br>
=C2=A0 DefaultDependencies=3Dno<br>
@@ -73,8 +73,8 @@ Index: systemd-stable/units/<a href=3D"http://systemd-bi=
nfmt.service.in" rel=3D"noreferrer" target=3D"_blank">systemd-binfmt.servic=
e.in</a><br>
=C2=A0 After=3Dproc-sys-fs-binfmt_misc.mount<br>
=C2=A0 Before=3Dsysinit.target shutdown.target<br>
=C2=A0@@ -30,3 +31,6 @@ RemainAfterExit=3Dyes<br>
- ExecStart=3D@rootlibexecdir@/systemd-binfmt<br>
- ExecStop=3D@rootlibexecdir@/systemd-binfmt --unregister<br>
+ ExecStart=3D{{ROOTLIBEXECDIR}}/systemd-binfmt<br>
+ ExecStop=3D{{ROOTLIBEXECDIR}}/systemd-binfmt --unregister<br>
=C2=A0 TimeoutSec=3D90s<br>
=C2=A0+<br>
=C2=A0+[Install]<br>
diff --git a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for=
-__NR_ppoll-before-use.patch b/meta/recipes-core/systemd/systemd/0001-test-=
seccomp-Check-for-__NR_ppoll-before-use.patch<br>
deleted file mode 100644<br>
index 0ba5fa2547..0000000000<br>
--- a/meta/recipes-core/systemd/systemd/0001-test-seccomp-Check-for-__NR_p=
poll-before-use.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From 027ac2ad0695bb506460f9dd7e57149b71055887 Mon Sep 17 00:00:00 2001<br=
>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank=
">raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 8 Jun 2021 23:21:01 -0700<br>
-Subject: [PATCH] test-seccomp: Check for __NR_ppoll before use<br>
-<br>
-some newer architectures like riscv32 do not have __NR_ppoll from get go<=
br>
-<br>
-Upstream-Status: Submitted [<a href=3D"https://github.com/systemd/systemd=
/pull/19858" rel=3D"noreferrer" target=3D"_blank">https://github.com/system=
d/systemd/pull/19858</a>]<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- src/test/test-seccomp.c | 5 +++--<br>
- 1 file changed, 3 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/src/test/test-seccomp.c b/src/test/test-seccomp.c<br>
-index b1f917eb54..daac0fcea8 100644<br>
---- a/src/test/test-seccomp.c<br>
-+++ b/src/test/test-seccomp.c<br>
-@@ -832,7 +832,7 @@ static void test_load_syscall_filter_set_raw(void) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(s=
 =3D hashmap_new(NULL));<br>
- #if defined __NR_poll &amp;&amp; __NR_poll &gt;=3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(h=
ashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(-1)) &gt;=3D 0);<br>
--#else<br>
-+#elif defined __NR_ppoll<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(h=
ashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) &gt;=3D 0);<br=
>
- #endif<br>
- <br>
-@@ -849,7 +849,8 @@ static void test_load_syscall_filter_set_raw(void) {<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(s=
 =3D hashmap_new(NULL));<br>
- #if defined __NR_poll &amp;&amp; __NR_poll &gt;=3D 0<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(h=
ashmap_put(s, UINT32_TO_PTR(__NR_poll + 1), INT_TO_PTR(EILSEQ)) &gt;=3D 0);=
<br>
--#else<br>
-+#elif defined __NR_ppoll<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 assert_se(hashma=
p_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(-1)) &gt;=3D 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert_se(h=
ashmap_put(s, UINT32_TO_PTR(__NR_ppoll + 1), INT_TO_PTR(EILSEQ)) &gt;=3D 0)=
;<br>
- #endif<br>
- <br>
--- <br>
-2.32.0<br>
-<br>
diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_248.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a> b/meta/recipes-c=
ore/systemd/<a href=3D"http://systemd_249.1.bb" rel=3D"noreferrer" target=
=3D"_blank">systemd_249.1.bb</a><br>
similarity index 99%<br>
rename from meta/recipes-core/systemd/<a href=3D"http://systemd_248.3.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
rename to meta/recipes-core/systemd/<a href=3D"http://systemd_249.1.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_249.1.bb</a><br>
index f5022a99c2..9bfb12249c 100644<br>
--- a/meta/recipes-core/systemd/<a href=3D"http://systemd_248.3.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_248.3.bb</a><br>
+++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_249.1.bb" rel=3D=
"noreferrer" target=3D"_blank">systemd_249.1.bb</a><br>
@@ -4,7 +4,7 @@ PROVIDES =3D &quot;udev&quot;<br>
<br>
=C2=A0PE =3D &quot;1&quot;<br>
<br>
-DEPENDS =3D &quot;intltool-native gperf-native libcap util-linux&quot;<br=
>
+DEPENDS =3D &quot;intltool-native gperf-native libcap util-linux python3-=
jinja2-native&quot;<br>
<br>
=C2=A0SECTION =3D &quot;base/shell&quot;<br>
<br>
@@ -14,8 +14,7 @@ inherit useradd pkgconfig meson perlnative update-rc.d u=
pdate-alternatives qemu<br>
=C2=A0# that we don&#39;t build both udev and systemd in world builds.<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;systemd&quot;<br>
<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://touchscreen.rules \<br>
+SRC_URI +=3D &quot;file://touchscreen.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://00-create-volatile.conf \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file://org.freedesk=
top.hostname1_no_polkit.conf&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;PACKAG=
ECONFIG&#39;, &#39;polkit_hostnamed_fallback&#39;, &#39;file://00-hostnamed=
-network-user.conf&#39;, &#39;&#39;, d)} \<br>
@@ -26,7 +25,6 @@ SRC_URI +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-implment-systemd-sys=
v-install-for-OE.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-systemd.pc.in-use-RO=
OTPREFIX-without-suffixed-slash.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test-parse-argument-=
Include-signal.h.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-test-seccomp-Check-f=
or-__NR_ppoll-before-use.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# patches needed by musl<br>
@@ -687,6 +685,7 @@ FILES_udev +=3D &quot;${base_sbindir}/udevd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/=
udev/rules.d/78-sound-card.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/=
udev/rules.d/80-drivers.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/=
udev/rules.d/80-net-setup-link.rules \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${rootlibexecdir}/=
udev/rules.d/81-net-dhcp.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/=
udev/rules.d/90-vconsole.rules \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${rootlibexecdir}/=
udev/rules.d/README \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sysconfdir}/udev=
 \<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000002c5e2e05c84335f3--
