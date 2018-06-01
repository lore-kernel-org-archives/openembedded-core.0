Return-Path: <alistair23@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id E30B56058D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 16:46:26 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id o9-v6so15746274lfk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y4sHA59w+YLjxa1346DW4jkfS0LxKDGB0a6GC5ENCME=;
	b=KL59Oty3CB56laEUHBLTBS86yg09jXve4CAYR4Y8RHTNP9LbvQgdz3i4YAgb5+RAnz
	HNVQdySx7+sWAxdJFoCItfnAeQ2T1Z3ol9O6kE+QghetRqcw/BUEkXGjnp0uxS56HCcW
	fmzZ9Be3wb4BWqB7xc1e6pUjF41gNQB++he3Pj9t7KUW0UY+LBgGN2UlBBoL0qZjiYIH
	5KPmFY39kmrPpn/Iky/Aq3dw+pndCEVZ6eVF0g7CRQ+xA4hdgdMRTJ6X9xb31kXPCifm
	PWgWCrzS5QRpsTTrvN8lLb7q4q08zCK/1Jkvb5XacwbTJpt82eBoGRbKwHOfb+zzzp62
	w1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y4sHA59w+YLjxa1346DW4jkfS0LxKDGB0a6GC5ENCME=;
	b=e4ar2S5QIAO5YJAijsayilwxOEGjwRg8LanyFamMzBhIMBHV3z4SPtysoNAHitfljV
	Y7mwqnsjkil95gEqFKYpbKJZwJ6u54+wd4yvSKqSr10VTd4Ya0tYh8sVGNZxrGD4ijCX
	E0a3YbaNdi76dorVB3CF7fTzojOGJxI3g5O7q1UjrPL4yoyrVaFGcs+h9t3JCbg6ezQ+
	drFmlhfqQohcR4DqdXaqM6HRyx4V9GDfS+4reMx1eIB61UtgsIk5D0dt8cznDpmS2gqO
	boOxV7YSGOWEu5V9/XKifdPKiYuzB9mQvud4TT4Bw4QVN+Eg4R+sdh8MbCBfaaeRtz5k
	gEzw==
X-Gm-Message-State: ALKqPwcxbzE7TZ9TURfRGVUvi5uBwygH9qrpEmxXknXNdSqNpO/73bTn
	3o4B6H9qsWBf4SJGwvQQKN+zyTlmEQhZ912HWKr3GA==
X-Google-Smtp-Source: ADUXVKLIMNn4lBT1Rqh+tjRDJhLNgI9l6a3nM4LGIBpALFW3v6vii3fWtuacDzi9pd6V+qpYFylVIIVT6s3m1VKzFVo=
X-Received: by 2002:a2e:9187:: with SMTP id f7-v6mr5335151ljg.98.1527871586946;
	Fri, 01 Jun 2018 09:46:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:98c6:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 09:45:56 -0700 (PDT)
In-Reply-To: <fa6c5390789513943a26f2914dc851849a692c20.1527848868.git.Martin.Jansa@gmail.com>
References: <cover.1527848868.git.Martin.Jansa@gmail.com>
	<fa6c5390789513943a26f2914dc851849a692c20.1527848868.git.Martin.Jansa@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 1 Jun 2018 09:45:56 -0700
Message-ID: <CAKmqyKOZT4B2DDBd9Va9JpjvwLzJD3UBXQ+_bOK+zU3vcnxbqA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH 2/4] qemu: upgrade to 2.12.0
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
X-List-Received-Date: Fri, 01 Jun 2018 16:46:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 1, 2018 at 3:29 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> From: Martin Jansa <martin.jansa@gmail.com>
>
> * drop patches which are now included upstream
> * revert "linux-user: fix mmap/munmap/mprotect/mremap/shma" which is
>   causing
>   0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
>   to stop working and qemu-i386 hanging during gobject-introspection in
>   webkitgtk when building for qemux86 with musl
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

This fixes the hang for me.

Alistair

> ---
>  meta/conf/distro/include/tcmode-default.inc   |   2 +-
>  ...-allow-user-to-disable-pointer-grabs.patch |  23 +--
>  ...emu-Add-missing-wacom-HID-descriptor.patch |   6 +-
>  ...test-which-runs-all-unit-test-cases-.patch |   6 +-
>  ...n-environment-space-to-boot-loader-q.patch |   6 +-
>  .../qemu/0005-qemu-disable-Valgrind.patch     |   6 +-
>  ...-searched-during-user-mode-emulation.patch |   4 +-
>  ...ld.bfd-fix-cflags-and-set-some-envir.patch |   8 +-
>  ...-connect-socket-to-a-spawned-command.patch |  60 ++++----
>  .../0009-apic-fixup-fallthrough-to-PIC.patch  |   6 +-
>  ...webkitgtk-hangs-on-32-bit-x86-target.patch |   6 +-
>  ...r-fix-mmap-munmap-mprotect-mremap-sh.patch | 141 ++++++++++++++++++
>  .../qemu/0011-memfd-fix-configure-test.patch  |  54 -------
>  ...4-treat-DISAS_UPDATE-as-variant-of-D.patch |  64 --------
>  ...-libcap-header-issue-on-some-distro.patch} |   4 +-
>  ...messages-when-qemi_cpu_kick_thread-.patch} |  10 +-
>  ...2Queue-pointers-in-post_load-routine.patch |  60 --------
>  .../qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb}   |  12 +-
>  18 files changed, 220 insertions(+), 258 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0011-Revert-linux-use=
r-fix-mmap-munmap-mprotect-mremap-sh.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0011-memfd-fix-config=
ure-test.patch
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0012-arm-translate-a6=
4-treat-DISAS_UPDATE-as-variant-of-D.patch
>  rename meta/recipes-devtools/qemu/qemu/{0014-fix-libcap-header-issue-on-=
some-distro.patch =3D> 0012-fix-libcap-header-issue-on-some-distro.patch} (=
96%)
>  rename meta/recipes-devtools/qemu/qemu/{0015-cpus.c-Add-error-messages-w=
hen-qemi_cpu_kick_thread-.patch =3D> 0013-cpus.c-Add-error-messages-when-qe=
mi_cpu_kick_thread-.patch} (87%)
>  delete mode 100644 meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Que=
ue-pointers-in-post_load-routine.patch
>  rename meta/recipes-devtools/qemu/{qemu_2.11.1.bb =3D> qemu_2.12.0.bb} (=
80%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 4b58df0459..48383d4ac0 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -28,7 +28,7 @@ BINUVERSION ?=3D "2.30%"
>  GDBVERSION ?=3D "8.1%"
>  GLIBCVERSION ?=3D "2.27%"
>  LINUXLIBCVERSION ?=3D "4.15%"
> -QEMUVERSION ?=3D "2.11%"
> +QEMUVERSION ?=3D "2.12%"
>
>  PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
>  PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-dis=
able-pointer-grabs.patch b/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow=
-user-to-disable-pointer-grabs.patch
> index add5d8b02f..b8a9206fee 100644
> --- a/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-po=
inter-grabs.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0001-sdl.c-allow-user-to-disable-po=
inter-grabs.patch
> @@ -1,4 +1,4 @@
> -From 273e1af49d3e0a58bb9464369deb2652f243e649 Mon Sep 17 00:00:00 2001
> +From 18fb45c34a473c4ba247bb82bcea94b7c3ba493a Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Wed, 18 Sep 2013 14:04:54 +0100
>  Subject: [PATCH] sdl.c: allow user to disable pointer grabs
> @@ -22,25 +22,26 @@ Upstream-Status: Pending
>  Signed-off-by: Ross Burton <ross.burton@intel.com>
>  Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
>  ---
> - ui/sdl.c | 12 ++++++++++--
> - 1 file changed, 10 insertions(+), 2 deletions(-)
> + ui/sdl.c | 13 +++++++++++--
> + 1 file changed, 11 insertions(+), 2 deletions(-)
>
>  diff --git a/ui/sdl.c b/ui/sdl.c
> -index 7b71a9a..29ce1b9 100644
> +index a5fd503c25..ab8d1b1eb1 100644
>  --- a/ui/sdl.c
>  +++ b/ui/sdl.c
> -@@ -63,6 +63,10 @@ static SDL_PixelFormat host_format;
> - static int scaling_active =3D 0;
> - static Notifier mouse_mode_notifier;
> - static int idle_counter;
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
> @@ -59,7 +60,7 @@ index 7b71a9a..29ce1b9 100644
>       gui_grab =3D 0;
>       sdl_show_cursor();
>       sdl_update_caption();
> -@@ -986,6 +992,8 @@ void sdl_display_init(DisplayState *ds, int full_scr=
een, int no_frame)
> +@@ -945,6 +952,8 @@ static void sdl1_display_init(DisplayState *ds, Disp=
layOptions *o)
>        * This requires SDL >=3D 1.2.14. */
>       setenv("SDL_DISABLE_LOCK_KEYS", "1", 1);
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-=
HID-descriptor.patch b/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missin=
g-wacom-HID-descriptor.patch
> index 281803ecb5..90e4b800b5 100644
> --- a/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-des=
criptor.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0002-qemu-Add-missing-wacom-HID-des=
criptor.patch
> @@ -1,4 +1,4 @@
> -From a42726e017605ed3ca2b3fc2b1cc8d01ccf34730 Mon Sep 17 00:00:00 2001
> +From 41603f745caaecdc7c9d760fb7d2df01ccc60128 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Thu, 27 Nov 2014 14:04:29 +0000
>  Subject: [PATCH] qemu: Add missing wacom HID descriptor
> @@ -14,11 +14,11 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
>  Upstream-Status: Submitted
>  2014/11/27
>  ---
> - hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++-
> + hw/usb/dev-wacom.c | 94 +++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 93 insertions(+), 1 deletion(-)
>
>  diff --git a/hw/usb/dev-wacom.c b/hw/usb/dev-wacom.c
> -index bf70013..2f6e129 100644
> +index bf70013059..2f6e129732 100644
>  --- a/hw/usb/dev-wacom.c
>  +++ b/hw/usb/dev-wacom.c
>  @@ -72,6 +72,89 @@ static const USBDescStrings desc_strings =3D {
> diff --git a/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-wh=
ich-runs-all-unit-test-cases-.patch b/meta/recipes-devtools/qemu/qemu/0003-=
Add-subpackage-ptest-which-runs-all-unit-test-cases-.patch
> index dc073000c9..0d43271c47 100644
> --- a/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-run=
s-all-unit-test-cases-.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0003-Add-subpackage-ptest-which-run=
s-all-unit-test-cases-.patch
> @@ -1,4 +1,4 @@
> -From fda1eee8bc717528d57f6ff454f72c5325043c31 Mon Sep 17 00:00:00 2001
> +From a9a669448ba6f1b295427e271d99f61736fc5189 Mon Sep 17 00:00:00 2001
>  From: Juro Bystricky <juro.bystricky@intel.com>
>  Date: Thu, 31 Aug 2017 11:06:56 -0700
>  Subject: [PATCH] Add subpackage -ptest which runs all unit test cases fo=
r
> @@ -14,10 +14,10 @@ Signed-off-by: Juro Bystricky <juro.bystricky@intel.c=
om>
>   1 file changed, 8 insertions(+)
>
>  diff --git a/tests/Makefile.include b/tests/Makefile.include
> -index c002352..f557c26 100644
> +index 3b9a5e31a2..dfbcd728d7 100644
>  --- a/tests/Makefile.include
>  +++ b/tests/Makefile.include
> -@@ -935,4 +935,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
> +@@ -972,4 +972,12 @@ all: $(QEMU_IOTESTS_HELPERS-y)
>   -include $(wildcard tests/*.d)
>   -include $(wildcard tests/libqos/*.d)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-envir=
onment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0004-=
qemu-Add-addition-environment-space-to-boot-loader-q.patch
> index 4f28e1676b..5152dcafe5 100644
> --- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Add-addition-environment-=
space-to-boot-loader-q.patch
> @@ -1,4 +1,4 @@
> -From ad70fdcaf75084da2e02474c61d1d441ca100ab2 Mon Sep 17 00:00:00 2001
> +From dd4404a334a545e9beafa1b1e41b3a8f35ef31a9 Mon Sep 17 00:00:00 2001
>  From: Jason Wessel <jason.wessel@windriver.com>
>  Date: Fri, 28 Mar 2014 17:42:43 +0800
>  Subject: [PATCH] qemu: Add addition environment space to boot loader
> @@ -18,10 +18,10 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
> -index ec6af4a..6e76166 100644
> +index f6513a4fd5..d5efafb1e8 100644
>  --- a/hw/mips/mips_malta.c
>  +++ b/hw/mips/mips_malta.c
> -@@ -61,7 +61,7 @@
> +@@ -62,7 +62,7 @@
>
>   #define ENVP_ADDR             0x80002000l
>   #define ENVP_NB_ENTRIES               16
> diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.p=
atch b/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
> index b9e01834ef..70baf0fb09 100644
> --- a/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-disable-Valgrind.patch
> @@ -1,4 +1,4 @@
> -From e85ee3cc9988172662d6969af01f23fa8ffd5262 Mon Sep 17 00:00:00 2001
> +From 4475b3d97371e588540333988a97d7df3ec2c65a Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@intel.com>
>  Date: Tue, 20 Oct 2015 22:19:08 +0100
>  Subject: [PATCH] qemu: disable Valgrind
> @@ -12,10 +12,10 @@ Signed-off-by: Ross Burton <ross.burton@intel.com>
>   1 file changed, 9 deletions(-)
>
>  diff --git a/configure b/configure
> -index 0c6e757..c30fd45 100755
> +index 0a19b033bc..69e05fb6c0 100755
>  --- a/configure
>  +++ b/configure
> -@@ -4741,15 +4741,6 @@ fi
> +@@ -4895,15 +4895,6 @@ fi
>   # check if we have valgrind/valgrind.h
>
>   valgrind_h=3Dno
> diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-search=
ed-during-user-mode-emulation.patch b/meta/recipes-devtools/qemu/qemu/0006-=
qemu-Limit-paths-searched-during-user-mode-emulation.patch
> index 9315f8561a..a9d798cef6 100644
> --- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-duri=
ng-user-mode-emulation.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Limit-paths-searched-duri=
ng-user-mode-emulation.patch
> @@ -1,4 +1,4 @@
> -From c79c48a79710d0e2ef68062435596ac455cd9f71 Mon Sep 17 00:00:00 2001
> +From c532bcdae8259b0f71723cda331ded4dbb0fa908 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Wed, 9 Mar 2016 22:49:02 +0000
>  Subject: [PATCH] qemu: Limit paths searched during user mode emulation
> @@ -24,7 +24,7 @@ Upstream-Status: Pending
>   1 file changed, 22 insertions(+), 22 deletions(-)
>
>  diff --git a/util/path.c b/util/path.c
> -index 7f9fc27..a416cd4 100644
> +index 7f9fc272fb..a416cd4ac2 100644
>  --- a/util/path.c
>  +++ b/util/path.c
>  @@ -15,6 +15,7 @@ struct pathelem
> diff --git a/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-=
fix-cflags-and-set-some-envir.patch b/meta/recipes-devtools/qemu/qemu/0007-=
qemu-native-set-ld.bfd-fix-cflags-and-set-some-envir.patch
> index ad52f37d9b..12456bb5c1 100644
> --- a/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cfl=
ags-and-set-some-envir.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0007-qemu-native-set-ld.bfd-fix-cfl=
ags-and-set-some-envir.patch
> @@ -1,4 +1,4 @@
> -From 4b21a8db60c32f93df56e6111bb926c91680d6f2 Mon Sep 17 00:00:00 2001
> +From 2d29d52b6f755758cfca6af0bcfd78091e16a7bc Mon Sep 17 00:00:00 2001
>  From: Stephen Arnold <sarnold@vctlabs.com>
>  Date: Sun, 12 Jun 2016 18:09:56 -0700
>  Subject: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some envir=
onment
> @@ -9,10 +9,10 @@ Upstream-Status: Pending
>   1 file changed, 4 deletions(-)
>
>  diff --git a/configure b/configure
> -index c30fd45..b5312f4 100755
> +index 69e05fb6c0..12fc3d8bdc 100755
>  --- a/configure
>  +++ b/configure
> -@@ -5115,10 +5115,6 @@ fi
> +@@ -5413,10 +5413,6 @@ write_c_skeleton
>   if test "$gcov" =3D "yes" ; then
>     CFLAGS=3D"-fprofile-arcs -ftest-coverage -g $CFLAGS"
>     LDFLAGS=3D"-fprofile-arcs -ftest-coverage $LDFLAGS"
> @@ -22,4 +22,4 @@ index c30fd45..b5312f4 100755
>  -  CFLAGS=3D"-O2 $CFLAGS"
>   fi
>
> - ##########################################
> + if test "$have_asan" =3D "yes"; then
> diff --git a/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-=
to-a-spawned-command.patch b/meta/recipes-devtools/qemu/qemu/0008-chardev-c=
onnect-socket-to-a-spawned-command.patch
> index f0c0fa19b4..2afe4e9376 100644
> --- a/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-sp=
awned-command.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0008-chardev-connect-socket-to-a-sp=
awned-command.patch
> @@ -1,4 +1,4 @@
> -From 55c9510311b7481a0c8f3f71b3ce130cc25563f9 Mon Sep 17 00:00:00 2001
> +From 20a09bb18907e67565c54fc505a741cbbef53f7f Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Thu, 21 Dec 2017 11:35:16 -0800
>  Subject: [PATCH] chardev: connect socket to a spawned command
> @@ -45,16 +45,16 @@ Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
>  ---
> - chardev/char-socket.c | 99 ++++++++++++++++++++++++++++++++++++++++++++=
+++++++
> - chardev/char.c        |  3 ++
> - qapi/char.json        |  5 +++
> - 3 files changed, 107 insertions(+)
> + chardev/char-socket.c | 102 ++++++++++++++++++++++++++++++++++++++++++
> + chardev/char.c        |   3 ++
> + qapi/char.json        |   5 +++
> + 3 files changed, 110 insertions(+)
>
>  diff --git a/chardev/char-socket.c b/chardev/char-socket.c
> -index 53eda8e..6c63555 100644
> +index 159e69c3b1..84778cf31a 100644
>  --- a/chardev/char-socket.c
>  +++ b/chardev/char-socket.c
> -@@ -852,6 +852,68 @@ static gboolean socket_reconnect_timeout(gpointer o=
paque)
> +@@ -934,6 +934,68 @@ static gboolean socket_reconnect_timeout(gpointer o=
paque)
>       return false;
>   }
>
> @@ -123,7 +123,7 @@ index 53eda8e..6c63555 100644
>   static void qmp_chardev_open_socket(Chardev *chr,
>                                       ChardevBackend *backend,
>                                       bool *be_opened,
> -@@ -859,6 +921,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
> +@@ -941,6 +1003,9 @@ static void qmp_chardev_open_socket(Chardev *chr,
>   {
>       SocketChardev *s =3D SOCKET_CHARDEV(chr);
>       ChardevSocket *sock =3D backend->u.socket.data;
> @@ -133,24 +133,24 @@ index 53eda8e..6c63555 100644
>       bool do_nodelay     =3D sock->has_nodelay ? sock->nodelay : false;
>       bool is_listen      =3D sock->has_server  ? sock->server  : true;
>       bool is_telnet      =3D sock->has_telnet  ? sock->telnet  : false;
> -@@ -925,7 +990,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
> -     } else if (reconnect > 0) {
> +@@ -1008,6 +1073,14 @@ static void qmp_chardev_open_socket(Chardev *chr,
>           s->reconnect_time =3D reconnect;
>       }
> +
>  +#ifndef _WIN32
>  +    if (cmd) {
>  +        chardev_open_socket_cmd(chr, cmd, errp);
> -
> ++
>  +        /* everything ready (or failed permanently) before we return */
>  +        *be_opened =3D true;
>  +    } else
>  +#endif
> -     if (s->reconnect_time) {
> -         sioc =3D qio_channel_socket_new();
> -         tcp_chr_set_client_ioc_name(chr, sioc);
> -@@ -985,10 +1057,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts,=
 ChardevBackend *backend,
> -     const char *host =3D qemu_opt_get(opts, "host");
> +     /* If reconnect_time is set, will do that in chr_machine_done. */
> +     if (!s->reconnect_time) {
> +         if (s->is_listen) {
> +@@ -1065,9 +1138,26 @@ static void qemu_chr_parse_socket(QemuOpts *opts,=
 ChardevBackend *backend,
>       const char *port =3D qemu_opt_get(opts, "port");
> +     const char *fd =3D qemu_opt_get(opts, "fd");
>       const char *tls_creds =3D qemu_opt_get(opts, "tls-creds");
>  +#ifndef _WIN32
>  +    const char *cmd =3D qemu_opt_get(opts, "cmd");
> @@ -158,7 +158,6 @@ index 53eda8e..6c63555 100644
>       SocketAddressLegacy *addr;
>       ChardevSocket *sock;
>
> -     backend->type =3D CHARDEV_BACKEND_KIND_SOCKET;
>  +#ifndef _WIN32
>  +    if (cmd) {
>  +        /*
> @@ -172,17 +171,18 @@ index 53eda8e..6c63555 100644
>  +        }
>  +    } else
>  +#endif
> -     if (!path) {
> -         if (!host) {
> -             error_setg(errp, "chardev: socket: no host given");
> -@@ -1021,13 +1109,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
, ChardevBackend *backend,
> -     sock->has_reconnect =3D true;
> ++
> +     if ((!!path + !!fd + !!host) !=3D 1) {
> +         error_setg(errp,
> +                    "Exactly one of 'path', 'fd' or 'host' required");
> +@@ -1112,12 +1202,24 @@ static void qemu_chr_parse_socket(QemuOpts *opts=
, ChardevBackend *backend,
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
> @@ -197,25 +197,25 @@ index 53eda8e..6c63555 100644
>  +#else
>           q_unix->path =3D g_strdup(path);
>  +#endif
> -     } else {
> +     } else if (host) {
>           addr->type =3D SOCKET_ADDRESS_LEGACY_KIND_INET;
>           addr->u.inet.data =3D g_new(InetSocketAddress, 1);
>  diff --git a/chardev/char.c b/chardev/char.c
> -index 2ae4f46..5d52cd5 100644
> +index 76d866e6fe..9747d51d7c 100644
>  --- a/chardev/char.c
>  +++ b/chardev/char.c
> -@@ -793,6 +793,9 @@ QemuOptsList qemu_chardev_opts =3D {
> +@@ -792,6 +792,9 @@ QemuOptsList qemu_chardev_opts =3D {
> +         },{
>               .name =3D "path",
>               .type =3D QEMU_OPT_STRING,
> -         },{
> ++        },{
>  +            .name =3D "cmd",
>  +            .type =3D QEMU_OPT_STRING,
> -+        },{
> +         },{
>               .name =3D "host",
>               .type =3D QEMU_OPT_STRING,
> -         },{
>  diff --git a/qapi/char.json b/qapi/char.json
> -index ae19dcd..6de0f29 100644
> +index ae19dcd1ed..6de0f29bcd 100644
>  --- a/qapi/char.json
>  +++ b/qapi/char.json
>  @@ -241,6 +241,10 @@
> diff --git a/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-=
to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-=
to-PIC.patch
> index 915bfdac58..5969d93870 100644
> --- a/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.=
patch
> +++ b/meta/recipes-devtools/qemu/qemu/0009-apic-fixup-fallthrough-to-PIC.=
patch
> @@ -1,4 +1,4 @@
> -From 945f428016f278fa8e38bc8d153397c3195f85a5 Mon Sep 17 00:00:00 2001
> +From 5046c21efdbc7413cddd5c5dbd9e1d53258d3e8c Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Tue, 26 Feb 2013 11:43:28 -0500
>  Subject: [PATCH] apic: fixup fallthrough to PIC
> @@ -29,10 +29,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/hw/intc/apic.c b/hw/intc/apic.c
> -index fe15fb6..8352c39 100644
> +index 6fda52b86c..cd7291962d 100644
>  --- a/hw/intc/apic.c
>  +++ b/hw/intc/apic.c
> -@@ -591,7 +591,7 @@ int apic_accept_pic_intr(DeviceState *dev)
> +@@ -603,7 +603,7 @@ int apic_accept_pic_intr(DeviceState *dev)
>       APICCommonState *s =3D APIC(dev);
>       uint32_t lvt0;
>
> diff --git a/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgt=
k-hangs-on-32-bit-x86-target.patch b/meta/recipes-devtools/qemu/qemu/0010-l=
inux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
> index ceb3980fc5..e110f63345 100644
> --- a/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs=
-on-32-bit-x86-target.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0010-linux-user-Fix-webkitgtk-hangs=
-on-32-bit-x86-target.patch
> @@ -1,4 +1,4 @@
> -From 4333b2b269d997a719e19f00d044105e17700be2 Mon Sep 17 00:00:00 2001
> +From 3cd92c7a885e4997ef6843313298c1d748d6ca39 Mon Sep 17 00:00:00 2001
>  From: Alistair Francis <alistair.francis@xilinx.com>
>  Date: Wed, 17 Jan 2018 10:51:49 -0800
>  Subject: [PATCH] linux-user: Fix webkitgtk hangs on 32-bit x86 target
> @@ -18,10 +18,10 @@ Signed-off-by: Alistair Francis <alistair.francis@xil=
inx.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/linux-user/main.c b/linux-user/main.c
> -index 146ee3e..1332b5c 100644
> +index 8907a84114..ea42c43610 100644
>  --- a/linux-user/main.c
>  +++ b/linux-user/main.c
> -@@ -78,7 +78,7 @@ do {                                                  =
                  \
> +@@ -79,7 +79,7 @@ do {                                                  =
                  \
>         (TARGET_LONG_BITS =3D=3D 32 || defined(TARGET_ABI32))
>   /* There are a number of places where we assign reserved_va to a variab=
le
>      of type abi_ulong and expect it to fit.  Avoid the last page.  */
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-m=
map-munmap-mprotect-mremap-sh.patch b/meta/recipes-devtools/qemu/qemu/0011-=
Revert-linux-user-fix-mmap-munmap-mprotect-mremap-sh.patch
> new file mode 100644
> index 0000000000..41626eb87c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0011-Revert-linux-user-fix-mmap-mun=
map-mprotect-mremap-sh.patch
> @@ -0,0 +1,141 @@
> +From 3ed26be2091436296933ed2146f7269c791c7bfe Mon Sep 17 00:00:00 2001
> +From: Martin Jansa <martin.jansa@lge.com>
> +Date: Fri, 1 Jun 2018 08:41:07 +0000
> +Subject: [PATCH] Revert "linux-user: fix mmap/munmap/mprotect/mremap/shm=
at"
> +
> +Causes qemu-i386 to hang during gobject-introspection in webkitgtk build
> +when musl is used on qemux86 - the same issue as
> +0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch
> +was fixing in 2.11.0 release, but with this patch the fix no longer work=
ed
> +as discussed here:
> +http://lists.openembedded.org/pipermail/openembedded-core/2018-May/15030=
2.html
> +http://lists.openembedded.org/pipermail/openembedded-core/2018-June/1513=
82.html
> +
> +This reverts commit ebf9a3630c911d0cfc9c20f7cafe9ba4f88cf583.
> +
> +Upstream-Status: Pending
> +---
> + include/exec/cpu-all.h  |  6 +-----
> + include/exec/cpu_ldst.h | 16 +++++++++-------
> + linux-user/mmap.c       | 17 ++++-------------
> + linux-user/syscall.c    |  5 +----
> + 4 files changed, 15 insertions(+), 29 deletions(-)
> +
> +diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> +index f4fa94e966..0b141683f0 100644
> +--- a/include/exec/cpu-all.h
> ++++ b/include/exec/cpu-all.h
> +@@ -159,12 +159,8 @@ extern unsigned long guest_base;
> + extern int have_guest_base;
> + extern unsigned long reserved_va;
> +
> +-#if HOST_LONG_BITS <=3D TARGET_VIRT_ADDR_SPACE_BITS
> +-#define GUEST_ADDR_MAX (~0ul)
> +-#else
> +-#define GUEST_ADDR_MAX (reserved_va ? reserved_va - 1 : \
> ++#define GUEST_ADDR_MAX (reserved_va ? reserved_va : \
> +                                     (1ul << TARGET_VIRT_ADDR_SPACE_BITS=
) - 1)
> +-#endif
> + #else
> +
> + #include "exec/hwaddr.h"
> +diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
> +index 5de8c8a5af..191f2e962a 100644
> +--- a/include/exec/cpu_ldst.h
> ++++ b/include/exec/cpu_ldst.h
> +@@ -51,13 +51,15 @@
> + /* All direct uses of g2h and h2g need to go away for usermode softmmu.=
  */
> + #define g2h(x) ((void *)((unsigned long)(target_ulong)(x) + guest_base)=
)
> +
> +-#define guest_addr_valid(x) ((x) <=3D GUEST_ADDR_MAX)
> +-#define h2g_valid(x) guest_addr_valid((unsigned long)(x) - guest_base)
> +-
> +-static inline int guest_range_valid(unsigned long start, unsigned long =
len)
> +-{
> +-    return len - 1 <=3D GUEST_ADDR_MAX && start <=3D GUEST_ADDR_MAX - l=
en + 1;
> +-}
> ++#if HOST_LONG_BITS <=3D TARGET_VIRT_ADDR_SPACE_BITS
> ++#define h2g_valid(x) 1
> ++#else
> ++#define h2g_valid(x) ({ \
> ++    unsigned long __guest =3D (unsigned long)(x) - guest_base; \
> ++    (__guest < (1ul << TARGET_VIRT_ADDR_SPACE_BITS)) && \
> ++    (!reserved_va || (__guest < reserved_va)); \
> ++})
> ++#endif
> +
> + #define h2g_nocheck(x) ({ \
> +     unsigned long __ret =3D (unsigned long)(x) - guest_base; \
> +diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> +index 9168a2051c..de85669aab 100644
> +--- a/linux-user/mmap.c
> ++++ b/linux-user/mmap.c
> +@@ -80,7 +80,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, in=
t prot)
> +         return -TARGET_EINVAL;
> +     len =3D TARGET_PAGE_ALIGN(len);
> +     end =3D start + len;
> +-    if (!guest_range_valid(start, len)) {
> ++    if (end < start) {
> +         return -TARGET_ENOMEM;
> +     }
> +     prot &=3D PROT_READ | PROT_WRITE | PROT_EXEC;
> +@@ -482,8 +482,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len,=
 int prot,
> +        * It can fail only on 64-bit host with 32-bit target.
> +        * On any other target/host host mmap() handles this error correc=
tly.
> +        */
> +-        if (!guest_range_valid(start, len)) {
> +-            errno =3D ENOMEM;
> ++        if ((unsigned long)start + len - 1 > (abi_ulong) -1) {
> ++            errno =3D EINVAL;
> +             goto fail;
> +         }
> +
> +@@ -623,10 +623,8 @@ int target_munmap(abi_ulong start, abi_ulong len)
> +     if (start & ~TARGET_PAGE_MASK)
> +         return -TARGET_EINVAL;
> +     len =3D TARGET_PAGE_ALIGN(len);
> +-    if (len =3D=3D 0 || !guest_range_valid(start, len)) {
> ++    if (len =3D=3D 0)
> +         return -TARGET_EINVAL;
> +-    }
> +-
> +     mmap_lock();
> +     end =3D start + len;
> +     real_start =3D start & qemu_host_page_mask;
> +@@ -681,13 +679,6 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulon=
g old_size,
> +     int prot;
> +     void *host_addr;
> +
> +-    if (!guest_range_valid(old_addr, old_size) ||
> +-        ((flags & MREMAP_FIXED) &&
> +-         !guest_range_valid(new_addr, new_size))) {
> +-        errno =3D ENOMEM;
> +-        return -1;
> +-    }
> +-
> +     mmap_lock();
> +
> +     if (flags & MREMAP_FIXED) {
> +diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> +index 643b8833de..271f215147 100644
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -4919,9 +4919,6 @@ static inline abi_ulong do_shmat(CPUArchState *cpu=
_env,
> +             return -TARGET_EINVAL;
> +         }
> +     }
> +-    if (!guest_range_valid(shmaddr, shm_info.shm_segsz)) {
> +-        return -TARGET_EINVAL;
> +-    }
> +
> +     mmap_lock();
> +
> +@@ -7497,7 +7494,7 @@ static int open_self_maps(void *cpu_env, int fd)
> +         }
> +         if (h2g_valid(min)) {
> +             int flags =3D page_get_flags(h2g(min));
> +-            max =3D h2g_valid(max - 1) ? max : (uintptr_t)g2h(GUEST_ADD=
R_MAX) + 1;
> ++            max =3D h2g_valid(max - 1) ? max : (uintptr_t)g2h(GUEST_ADD=
R_MAX);
> +             if (page_check_range(h2g(min), max - min, flags) =3D=3D -1)=
 {
> +                 continue;
> +             }
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-tes=
t.patch b/meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-test.pat=
ch
> deleted file mode 100644
> index 880cb980a0..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0011-memfd-fix-configure-test.patch
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -From 0c8af3f651a125d636a71d93bafd35ff5240431a Mon Sep 17 00:00:00 2001
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
> -    /builddir/build/BUILD/qemu-2.11.0-rc1/util/memfd.c:40:12: error: sta=
tic declaration of memfd_create follows non-static declaration
> -
> -Fix the configure test, and remove the sys/memfd.h inclusion since the
> -file actually does not exist---it is a typo in the memfd_create(2) man
> -page.
> -
> -Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ----
> - configure    | 2 +-
> - util/memfd.c | 4 +---
> - 2 files changed, 2 insertions(+), 4 deletions(-)
> -
> -diff --git a/configure b/configure
> -index b5312f4..ec12f36 100755
> ---- a/configure
> -+++ b/configure
> -@@ -3920,7 +3920,7 @@ fi
> - # check if memfd is supported
> - memfd=3Dno
> - cat > $TMPC << EOF
> --#include <sys/memfd.h>
> -+#include <sys/mman.h>
> -
> - int main(void)
> - {
> -diff --git a/util/memfd.c b/util/memfd.c
> -index 4571d1a..412e94a 100644
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
> diff --git a/meta/recipes-devtools/qemu/qemu/0012-arm-translate-a64-treat=
-DISAS_UPDATE-as-variant-of-D.patch b/meta/recipes-devtools/qemu/qemu/0012-=
arm-translate-a64-treat-DISAS_UPDATE-as-variant-of-D.patch
> deleted file mode 100644
> index be92502095..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0012-arm-translate-a64-treat-DISAS_=
UPDATE-as-variant-of-D.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -From 7354b9b24c36ee712bb6e881d39504bf1b6a4c8b Mon Sep 17 00:00:00 2001
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
> -index 625ef2d..c381091 100644
> ---- a/target/arm/translate-a64.c
> -+++ b/target/arm/translate-a64.c
> -@@ -11384,12 +11384,12 @@ static void aarch64_tr_tb_stop(DisasContextBas=
e *dcbase, CPUState *cpu)
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
> diff --git a/meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue=
-on-some-distro.patch b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-hea=
der-issue-on-some-distro.patch
> similarity index 96%
> rename from meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue-=
on-some-distro.patch
> rename to meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on=
-some-distro.patch
> index b662a41508..aa24f7294e 100644
> --- a/meta/recipes-devtools/qemu/qemu/0014-fix-libcap-header-issue-on-som=
e-distro.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0012-fix-libcap-header-issue-on-som=
e-distro.patch
> @@ -1,4 +1,4 @@
> -From 47fdb0b6e2e393194a8c81544c647fdd997aec7f Mon Sep 17 00:00:00 2001
> +From bb9e48e331eee06d7bac1dce809c70191d1a3b4d Mon Sep 17 00:00:00 2001
>  From: Hongxu Jia <hongxu.jia@windriver.com>
>  Date: Tue, 12 Mar 2013 09:54:06 +0800
>  Subject: [PATCH] fix libcap header issue on some distro
> @@ -59,7 +59,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
>  diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> -index 8e48500..6490030 100644
> +index 6f132c5ff1..8329950c26 100644
>  --- a/fsdev/virtfs-proxy-helper.c
>  +++ b/fsdev/virtfs-proxy-helper.c
>  @@ -13,7 +13,6 @@
> diff --git a/meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-messag=
es-when-qemi_cpu_kick_thread-.patch b/meta/recipes-devtools/qemu/qemu/0013-=
cpus.c-Add-error-messages-when-qemi_cpu_kick_thread-.patch
> similarity index 87%
> rename from meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-message=
s-when-qemi_cpu_kick_thread-.patch
> rename to meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-=
when-qemi_cpu_kick_thread-.patch
> index a5621caa95..8a9141acde 100644
> --- a/meta/recipes-devtools/qemu/qemu/0015-cpus.c-Add-error-messages-when=
-qemi_cpu_kick_thread-.patch
> +++ b/meta/recipes-devtools/qemu/qemu/0013-cpus.c-Add-error-messages-when=
-qemi_cpu_kick_thread-.patch
> @@ -1,4 +1,4 @@
> -From db914e0f93a32b6731a636517002ecadc207718b Mon Sep 17 00:00:00 2001
> +From edc8dba74c7a4a2121d76c982be0074183bf080a Mon Sep 17 00:00:00 2001
>  From: =3D?UTF-8?q?An=3DC3=3DADbal=3D20Lim=3DC3=3DB3n?=3D <anibal.limon@l=
inux.intel.com>
>  Date: Wed, 12 Aug 2015 15:11:30 -0500
>  Subject: [PATCH] cpus.c: Add error messages when qemi_cpu_kick_thread fa=
ils.
> @@ -19,10 +19,10 @@ Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@l=
inux.intel.com>
>   create mode 100644 custom_debug.h
>
>  diff --git a/cpus.c b/cpus.c
> -index 114c29b..c3dd2e0 100644
> +index 38eba8bff3..b84a60a4f3 100644
>  --- a/cpus.c
>  +++ b/cpus.c
> -@@ -1510,6 +1510,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
> +@@ -1690,6 +1690,8 @@ static void *qemu_tcg_cpu_thread_fn(void *arg)
>       return NULL;
>   }
>
> @@ -31,7 +31,7 @@ index 114c29b..c3dd2e0 100644
>   static void qemu_cpu_kick_thread(CPUState *cpu)
>   {
>   #ifndef _WIN32
> -@@ -1522,6 +1524,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
> +@@ -1702,6 +1704,9 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
>       err =3D pthread_kill(cpu->thread->thread, SIG_IPI);
>       if (err) {
>           fprintf(stderr, "qemu:%s: %s", __func__, strerror(err));
> @@ -43,7 +43,7 @@ index 114c29b..c3dd2e0 100644
>   #else /* _WIN32 */
>  diff --git a/custom_debug.h b/custom_debug.h
>  new file mode 100644
> -index 0000000..f029e45
> +index 0000000000..f029e45547
>  --- /dev/null
>  +++ b/custom_debug.h
>  @@ -0,0 +1,24 @@
> diff --git a/meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Queue-poin=
ters-in-post_load-routine.patch b/meta/recipes-devtools/qemu/qemu/0013-ps2-=
check-PS2Queue-pointers-in-post_load-routine.patch
> deleted file mode 100644
> index d2bdf6b017..0000000000
> --- a/meta/recipes-devtools/qemu/qemu/0013-ps2-check-PS2Queue-pointers-in=
-post_load-routine.patch
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -From 065061dca34fa5b91be6dce9a87a8755d8826c78 Mon Sep 17 00:00:00 2001
> -From: Prasad J Pandit <pjp@fedoraproject.org>
> -Date: Thu, 16 Nov 2017 13:21:55 +0530
> -Subject: [PATCH] ps2: check PS2Queue pointers in post_load routine
> -
> -During Qemu guest migration, a destination process invokes ps2
> -post_load function. In that, if 'rptr' and 'count' values were
> -invalid, it could lead to OOB access or infinite loop issue.
> -Add check to avoid it.
> -
> -Reported-by: Cyrille Chatras <cyrille.chatras@orange.com>
> -Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> -Message-id: 20171116075155.22378-1-ppandit@redhat.com
> -Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> -
> -CVE: CVE-2017-16845
> -Upstream-Status: Backport
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ----
> - hw/input/ps2.c | 21 +++++++++------------
> - 1 file changed, 9 insertions(+), 12 deletions(-)
> -
> -diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> -index f388a23..de171a2 100644
> ---- a/hw/input/ps2.c
> -+++ b/hw/input/ps2.c
> -@@ -1225,24 +1225,21 @@ static void ps2_common_reset(PS2State *s)
> - static void ps2_common_post_load(PS2State *s)
> - {
> -     PS2Queue *q =3D &s->queue;
> --    int size;
> --    int i;
> --    int tmp_data[PS2_QUEUE_SIZE];
> -+    uint8_t i, size;
> -+    uint8_t tmp_data[PS2_QUEUE_SIZE];
> -
> -     /* set the useful data buffer queue size, < PS2_QUEUE_SIZE */
> --    size =3D q->count > PS2_QUEUE_SIZE ? 0 : q->count;
> -+    size =3D (q->count < 0 || q->count > PS2_QUEUE_SIZE) ? 0 : q->count=
;
> -
> -     /* move the queue elements to the start of data array */
> --    if (size > 0) {
> --        for (i =3D 0; i < size; i++) {
> --            /* move the queue elements to the temporary buffer */
> --            tmp_data[i] =3D q->data[q->rptr];
> --            if (++q->rptr =3D=3D 256) {
> --                q->rptr =3D 0;
> --            }
> -+    for (i =3D 0; i < size; i++) {
> -+        if (q->rptr < 0 || q->rptr >=3D sizeof(q->data)) {
> -+            q->rptr =3D 0;
> -         }
> --        memcpy(q->data, tmp_data, size);
> -+        tmp_data[i] =3D q->data[q->rptr++];
> -     }
> -+    memcpy(q->data, tmp_data, size);
> -+
> -     /* reset rptr/wptr/count */
> -     q->rptr =3D 0;
> -     q->wptr =3D size;
> diff --git a/meta/recipes-devtools/qemu/qemu_2.11.1.bb b/meta/recipes-dev=
tools/qemu/qemu_2.12.0.bb
> similarity index 80%
> rename from meta/recipes-devtools/qemu/qemu_2.11.1.bb
> rename to meta/recipes-devtools/qemu/qemu_2.12.0.bb
> index 2314262d7a..21796df9d7 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.11.1.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.12.0.bb
> @@ -20,19 +20,17 @@ SRC_URI =3D "http://wiki.qemu-project.org/download/${=
BP}.tar.bz2 \
>             file://0008-chardev-connect-socket-to-a-spawned-command.patch=
 \
>             file://0009-apic-fixup-fallthrough-to-PIC.patch \
>             file://0010-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-targ=
et.patch \
> -           file://0011-memfd-fix-configure-test.patch \
> -           file://0012-arm-translate-a64-treat-DISAS_UPDATE-as-variant-o=
f-D.patch \
> -           file://0013-ps2-check-PS2Queue-pointers-in-post_load-routine.=
patch \
> +           file://0011-Revert-linux-user-fix-mmap-munmap-mprotect-mremap=
-sh.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+\..*)\.tar"
>
>  SRC_URI_append_class-native =3D " \
> -            file://0014-fix-libcap-header-issue-on-some-distro.patch \
> -            file://0015-cpus.c-Add-error-messages-when-qemi_cpu_kick_thr=
ead-.patch \
> +            file://0012-fix-libcap-header-issue-on-some-distro.patch \
> +            file://0013-cpus.c-Add-error-messages-when-qemi_cpu_kick_thr=
ead-.patch \
>              "
>
> -SRC_URI[md5sum] =3D "61cf862b6007eba4ac98247776af2e27"
> -SRC_URI[sha256sum] =3D "d9df2213ceed32e91dab7bc9dd19c1af83f91ba72c7aeef7=
605dfaaf81732ccb"
> +SRC_URI[md5sum] =3D "122fd7cdf241ff7eb1e42c0b503b5d1b"
> +SRC_URI[sha256sum] =3D "c9f4a147bc915d24df9784affc611a115f42d24720a89210=
b479f1ba7a3f679c"
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

