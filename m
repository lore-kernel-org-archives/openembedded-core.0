Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id C794E7C707
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:21:48 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i2so23185650ite.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=GzXtwatccHh4AEASPoYdrQrP+cFemdozkSB7uK/XVkU=;
	b=ltKZPzl/ZalrnvFp9av41pRqXaRGMHZQP+ixDhRHLMPaVzPFCX8WM+DLiTWB2Z+R61
	HN7p/2EEtZXG8afdOVBSHRTmeY5eb/DB+Ei5B19Tfbt8uq7FIIttOu1Dwrj/Can8dQgz
	a3IPJhbiisP5z1e5bVBMKetTOfOd2Mjw0l9NCLw+skIdJYZ9fL7l3w701JuVah+i2eFO
	PdNctuJW1jJQx/F9wuPSNcdyjqFXFOflZEtefoErvLsf6KCVPQ/9/T1pa7MosMtonWn+
	S0dwC9DJVE7CRflDS15j5xfM0MT724l+MuRCkTUAWAQqhHn7a8C0wTJpKUkvAuYZhaRV
	GyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GzXtwatccHh4AEASPoYdrQrP+cFemdozkSB7uK/XVkU=;
	b=LMavV780IRs4zZIL/t5LnsVlkxoaEoJtGY5tw+Hsz6cJOi6ouU/eIxlfSZFAlY0SW9
	l3PdY/PgVDxNULrdbJc9rpd8w5v5wvaoBXcgLyAQNlACV7pmoPBsl5muFqXUqUiXBcch
	MdbtllY+Hz/aUCEn34GyjgQI77YnFAvoadIxB5mYuCW9Jvp2h9Xt+fGOuclYW0bWqOUX
	CgIKzlFgVQdHDpfO8j11UlfG+sy8Q+YbvKEm6h+nJ0T/aDcXiyQJ9t/ghcjMOR7H7iv8
	i+tjvm4J3KFY1sK8vFw2gZg1SANsi/hcH9PQ055YnX7JTvyTyCrORBWCOFBNUPFIlGU1
	DPqQ==
X-Gm-Message-State: AHQUAuYlil/dibeWEfviTBUPpCP/+9v6SHTdqeXegxBPCUQQ59vGAcNb
	8Jkx2skm0xM4Mc/JbWhjwPnMFvOtiRfbUbLIN5h53g==
X-Google-Smtp-Source: AHgI3IbuRad8wiANNUfUJtjboPI04+Yrw4aWV3+Jln1NE/Z7oP9aWdSDxG024DaWTr2hkdyfeQ3v/avy51T/SkY9RKw=
X-Received: by 2002:a24:248:: with SMTP id 69mr5029617itu.91.1550236909589;
	Fri, 15 Feb 2019 05:21:49 -0800 (PST)
MIME-Version: 1.0
References: <20190215131047.64007-1-alex.kanavin@gmail.com>
In-Reply-To: <20190215131047.64007-1-alex.kanavin@gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 15 Feb 2019 13:21:33 +0000
Message-ID: <CAAPZna19N6iLvaxLZOmDjJoAyGnJ=hkH0K4wk0TYQb4to_95Sw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade 18.1.9 -> 18.3.3
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
X-List-Received-Date: Fri, 15 Feb 2019 13:21:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All!

In my opinion, there is no relation with an update and change build
system, once we can use mesa 18.3.3 without meson.

On Fri, Feb 15, 2019 at 1:11 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> From: Anuj Mittal <anuj.mittal@intel.com>
>
> * For changes, see:
> https://www.mesa3d.org/relnotes/18.3.3.html
>
> * Convert from using autotools to meson and get rid of unnecessary
> patches.
>
> * Include a patch to fix detection of host os combinations that we build
> for.
>
> Alex:
> * fixed mesa-native failures by correctly setting disabled variants of
> PACKAGECONFIGs
>
> * Added a backported patch to avoid a build failure
>
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...0001-Simplify-wayland-scanner-lookup.patch | 39 -----------
>  ...k-for-all-linux-host_os-combinations.patch | 49 +++++++++++++
>  ...M-version-when-using-LLVM-Git-releas.patch | 44 ------------
>  ...-Use-Python-3-to-execute-the-scripts.patch | 32 ---------
>  ...-dri-i965-Add-missing-time.h-include.patch | 36 ----------
>  ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 37 ----------
>  .../mesa/files/fix-NULL-error.patch           | 50 +++++++++++++
>  .../{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3.3.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           | 70 +++++++++----------
>  .../mesa/{mesa_18.1.9.bb =3D> mesa_18.3.3.bb}   | 11 ++-
>  10 files changed, 136 insertions(+), 232 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0001-Simplify-waylan=
d-scanner-lookup.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0001-meson.build-che=
ck-for-all-linux-host_os-combinations.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0003-Properly-get-LL=
VM-version-when-using-LLVM-Git-releas.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0004-Use-Python-3-to=
-execute-the-scripts.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0005-dri-i965-Add-mi=
ssing-time.h-include.patch
>  delete mode 100644 meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_V=
AR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/fix-NULL-error.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3.3=
.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_18.1.9.bb =3D> mesa_18.3.3.bb} (=
54%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scann=
er-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-sc=
anner-lookup.patch
> deleted file mode 100644
> index a50d2a2ba28..00000000000
> --- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-look=
up.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Tue, 15 Nov 2016 15:20:49 +0200
> -Subject: [PATCH 1/6] Simplify wayland-scanner lookup
> -Organization: O.S. Systems Software LTDA.
> -
> -Don't use pkg-config to lookup the path of a binary that's in the path.
> -
> -Alternatively we'd have to prefix the path returned by pkg-config with
> -PKG_CONFIG_SYSROOT_DIR.
> -
> -Upstream-Status: Pending
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - configure.ac | 7 +------
> - 1 file changed, 1 insertion(+), 6 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 14f1af2b2f..916d0bd207 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1825,12 +1825,7 @@ for plat in $platforms; do
> -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=3D =
$WAYLAND_PROTOCOLS_REQUIRED])
> -         WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdatadi=
r wayland-protocols`
> -
> --        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
> --                          WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dw=
ayland_scanner wayland-scanner`,
> --                          WAYLAND_SCANNER=3D'')
> --        if test "x$WAYLAND_SCANNER" =3D x; then
> --            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> --        fi
> -+        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> -
> -         if test "x$WAYLAND_SCANNER" =3D "x:"; then
> -                 AC_MSG_ERROR([wayland-scanner is needed to compile the =
wayland platform])
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-=
all-linux-host_os-combinations.patch b/meta/recipes-graphics/mesa/files/000=
1-meson.build-check-for-all-linux-host_os-combinations.patch
> new file mode 100644
> index 00000000000..1147eacdd93
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-meson.build-check-for-all-lin=
ux-host_os-combinations.patch
> @@ -0,0 +1,49 @@
> +From 8140dc078bcdbc5fbaf1c46c3fd3efbe587a0f29 Mon Sep 17 00:00:00 2001
> +From: Anuj Mittal <anuj.mittal@intel.com>
> +Date: Mon, 11 Feb 2019 20:55:27 +0800
> +Subject: [PATCH] meson.build: check for all linux host_os combinations
> +
> +Make sure that we are also looking for our host_os combinations like
> +linux-musl etc. when assuming support for DRM/KMS.
> +
> +Also delete a duplicate line.
> +
> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> +---
> + meson.build | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/meson.build b/meson.build
> +index b934d0bfc76..7cbda909735 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -34,7 +34,7 @@ cpp =3D meson.get_compiler('cpp')
> +
> + null_dep =3D dependency('', required : false)
> +
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'l=
inux'].contains(host_machine.system())
> ++system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly'].co=
ntains(host_machine.system()) or host_machine.system().startswith('linux')
> +
> + # Arguments for the preprocessor, put these in a separate array from th=
e C and
> + # C++ (cpp in meson terminology) arguments since they need to be added =
to the
> +@@ -92,8 +92,6 @@ if (with_gles1 or with_gles2) and not with_opengl
> +   error('building OpenGL ES without OpenGL is not supported.')
> + endif
> +
> +-system_has_kms_drm =3D ['openbsd', 'netbsd', 'freebsd', 'dragonfly', 'l=
inux'].contains(host_machine.system())
> +-
> + _drivers =3D get_option('dri-drivers')
> + if _drivers.contains('auto')
> +   if system_has_kms_drm
> +@@ -799,7 +797,7 @@ if cc.compiles('int foo(void) __attribute__((__noret=
urn__));',
> + endif
> +
> + # TODO: this is very incomplete
> +-if ['linux', 'cygwin', 'gnu'].contains(host_machine.system())
> ++if ['cygwin', 'gnu'].contains(host_machine.system()) or host_machine.sy=
stem().startswith('linux')
> +   pre_args +=3D '-D_GNU_SOURCE'
> + endif
> +
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-vers=
ion-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/000=
3-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
> deleted file mode 100644
> index 5e735ca1052..00000000000
> --- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-whe=
n-using-LLVM-Git-releas.patch
> +++ /dev/null
> @@ -1,44 +0,0 @@
> -From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Tue, 5 Jun 2018 11:11:10 -0300
> -Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git relea=
ses
> -Organization: O.S. Systems Software LTDA.
> -
> -$ llvm-config-host --version
> -5.0.0git-9a5c333388c
> -
> -We need to ignore everything after 5.0.0 which is what the cut cmd is
> -doing
> -
> -Upstream-Status: Pending
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - configure.ac | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 916d0bd207..dd172f1ebe 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
> -
> - llvm_set_environment_variables() {
> -     if test "x$LLVM_CONFIG" !=3D xno; then
> --        LLVM_VERSION=3D`$LLVM_CONFIG --version | egrep -o '^[[0-9.]]+'`
> -+        LLVM_VERSION=3D`$LLVM_CONFIG --version | cut -c1-5`
> -         LLVM_CPPFLAGS=3D`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppf=
lags"`
> -         LLVM_INCLUDEDIR=3D`$LLVM_CONFIG --includedir`
> -         LLVM_LIBDIR=3D`$LLVM_CONFIG --libdir`
> -@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
> -     dnl ourselves.
> -     dnl (See https://llvm.org/bugs/show_bug.cgi?id=3D6823)
> -     dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
> --    LLVM_SO_NAME=3DLLVM-`$LLVM_CONFIG --version`
> -+    LLVM_SO_NAME=3DLLVM-`$LLVM_CONFIG --version | cut -c1-5`
> -     AS_IF([test -f "$LLVM_LIBDIR/lib$LLVM_SO_NAME.$IMP_LIB_EXT"], [llvm=
_have_one_so=3Dyes])
> -
> -     if test "x$llvm_have_one_so" =3D xyes; then
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execut=
e-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to=
-execute-the-scripts.patch
> deleted file mode 100644
> index 8953c4a18ff..00000000000
> --- a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the-s=
cripts.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From ebe6077a1d74e56b28249f71e8760295fa846ed2 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Fri, 29 Dec 2017 10:27:59 -0200
> -Subject: [PATCH 4/6] Use Python 3 to execute the scripts
> -Organization: O.S. Systems Software LTDA.
> -
> -The MESA build system uses Python 2 but as OE-Core has moved away from
> -it, we change it to use Python 3 instead.
> -
> -Upstream-Status: Inappropriate [ configuration ]
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index dd172f1ebe..40cac36ac2 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -122,7 +122,7 @@ AM_PROG_CC_C_O
> - AC_PROG_NM
> - AM_PROG_AS
> - AX_CHECK_GNU_MAKE
> --AC_CHECK_PROGS([PYTHON2], [python2.7 python2 python])
> -+AC_CHECK_PROGS([PYTHON2], [python3.5 python3 python])
> - AC_PROG_SED
> - AC_PROG_MKDIR_P
> -
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-t=
ime.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-mi=
ssing-time.h-include.patch
> deleted file mode 100644
> index d40e7b58558..00000000000
> --- a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h-i=
nclude.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From 9e0368af471af3a36e0eb526453f892598120065 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Wed, 6 Jun 2018 09:50:35 -0300
> -Subject: [PATCH 5/6] dri: i965: Add missing time.h include
> -Organization: O.S. Systems Software LTDA.
> -
> -This fixes a build error when using musl:
> -
> -,----
> -| In file included from .../src/mesa/drivers/dri/i965/intel_upload.c:33:=
0:
> -| .../src/mesa/drivers/dri/i965/brw_bufmgr.h:132:4: error: unknown type =
name 'time_t'
> -|     time_t free_time;
> -|     ^~~~~~
> -`----
> -
> -Upstream-Status: Backport [3c288da5eec81ee58b85927df18d9194ead8f5c2]
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - src/mesa/drivers/dri/i965/brw_bufmgr.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers/d=
ri/i965/brw_bufmgr.h
> -index 68f5e0c2c8..5b60a23763 100644
> ---- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
> -+++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
> -@@ -37,6 +37,7 @@
> - #include <stdbool.h>
> - #include <stdint.h>
> - #include <stdio.h>
> -+#include <time.h>
> - #include "util/u_atomic.h"
> - #include "util/list.h"
> -
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-=
defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/000=
6-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
> deleted file mode 100644
> index 0212922c5d5..00000000000
> --- a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-definin=
g-WAYLAND_PROTOCOLS_DAT.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Wed, 29 Aug 2018 22:10:30 -0300
> -Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DA=
TADIR
> -Organization: O.S. Systems Software LTDA.
> -
> -This allows to override the wayland-protocols pkgdatadir with the
> -WAYLAND_PROTOCOLS_DATADIR from environment.
> -
> -pkgconfig would return an absolute path in
> -/usr/share/wayland-protocols
> -for the pkgdatadir value, which is not suitable for cross-compiling.
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -Upstream-Status: Pending
> -
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index 40cac36ac2..728bbdcbc4 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1823,7 +1823,7 @@ for plat in $platforms; do
> -         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >=3D $WAYLA=
ND_REQUIRED])
> -         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >=3D $WAYLA=
ND_REQUIRED])
> -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=3D =
$WAYLAND_PROTOCOLS_REQUIRED])
> --        WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdatadi=
r wayland-protocols`
> -+        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >=
=3D $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
> -
> -         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> -
> ---
> -2.18.0
> -
> diff --git a/meta/recipes-graphics/mesa/files/fix-NULL-error.patch b/meta=
/recipes-graphics/mesa/files/fix-NULL-error.patch
> new file mode 100644
> index 00000000000..f31b73c3353
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/fix-NULL-error.patch
> @@ -0,0 +1,50 @@
> +From eb44c36cf1729e7e200b77cf8ea755dff72d1639 Mon Sep 17 00:00:00 2001
> +From: Gurchetan Singh <gurchetansingh@chromium.org>
> +Date: Wed, 28 Nov 2018 08:39:34 -0800
> +Subject: egl: add missing #include <stddef.h> in egldevice.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Otherwise, I get this error:
> +
> +main/egldevice.h:54:13: error: =E2=80=98NULL=E2=80=99 undeclared (first =
use in this function)
> +       dev =3D NULL;
> +             ^~~~
> +with this config:
> +
> +./autogen.sh --enable-gles1 --enable-gles2 --with-platforms=3D'surfacele=
ss' --disable-glx
> +             --with-dri-drivers=3D"i965" --with-gallium-drivers=3D"" --e=
nable-gbm
> +
> +v3: Use stddef.h (Matt)
> +v4: Modify commit message (Eric)
> +
> +Reviewed-by: Matt Turner <mattst88@gmail.com>
> +Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
> +
> +Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3Deb44c36cf1729e7e200b77cf8ea755dff72d1639]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + src/egl/main/egldevice.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +(limited to 'src/egl/main/egldevice.h')
> +
> +diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
> +index ddcdcd1..83a47d5 100644
> +--- a/src/egl/main/egldevice.h
> ++++ b/src/egl/main/egldevice.h
> +@@ -31,9 +31,9 @@
> +
> +
> + #include <stdbool.h>
> ++#include <stddef.h>
> + #include "egltypedefs.h"
> +
> +-
> + #ifdef __cplusplus
> + extern "C" {
> + #endif
> +--
> +cgit v1.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-=
graphics/mesa/mesa-gl_18.3.3.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_18.3.3.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 66ed649efe5..43ad67a4f4a 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://docs/license.html;md5=3D72=
5f991a1cc322aa7a0cd3a2016621c
>
>  PE =3D "2"
>
> -DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native"
> +DEPENDS =3D "expat makedepend-native flex-native bison-native libxml2-na=
tive zlib chrpath-replacement-native python3-mako-native gettext-native"
>  EXTRANATIVEPATH +=3D "chrpath-native"
>  PROVIDES =3D " \
>      ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '',=
 d)} \
> @@ -24,7 +24,8 @@ PROVIDES =3D " \
>      virtual/mesa \
>      "
>
> -inherit autotools pkgconfig python3native gettext distro_features_check
> +inherit meson pkgconfig python3native gettext distro_features_check
> +
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> @@ -34,56 +35,53 @@ PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', =
'x11 wayland', d)} \
>                 ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d=
)} \
>                 surfaceless"
>
> -export LLVM_CONFIG =3D "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_=
RELEASE}"
>  export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm${MESA_LLVM_R=
ELEASE}/llvm-config"
>  export YOCTO_ALTERNATE_MULTILIB_NAME =3D "${base_libdir}"
> -EXTRA_OECONF =3D "--enable-shared-glapi \
> -                --disable-opencl \
> -                --enable-glx-read-only-text \
> -                PYTHON2=3Dpython2 \
> -                --with-llvm-prefix=3D${STAGING_LIBDIR}/llvm${MESA_LLVM_R=
ELEASE} \
> -                --with-platforms=3D'${PLATFORMS}'"
> +EXTRA_OEMESON =3D "-Dshared-glapi=3Dtrue \
> +                -Dgallium-opencl=3Ddisabled \
> +                -Dglx-read-only-text=3Dtrue \
> +                -Dplatforms=3D'${@",".join("${PLATFORMS}".split())}' \
> +               "
>
>  PACKAGECONFIG_class-target ??=3D "${@bb.utils.filter('DISTRO_FEATURES', =
'wayland vulkan', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'op=
engl egl gles gbm dri gallium', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl',=
 'x11 dri3', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan',=
 'dri3', '', d)} \
>                    "
> -PACKAGECONFIG_class-native ?=3D "gbm dri-native egl"
> -PACKAGECONFIG_class-nativesdk ?=3D "gbm dri-native egl"
> +PACKAGECONFIG_class-native ?=3D "gbm opengl dri egl"
> +PACKAGECONFIG_class-nativesdk ?=3D "gbm opengl dri egl"
>
>  # "gbm" requires "dri", "opengl"
> -PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm"
> +PACKAGECONFIG[gbm] =3D "-Dgbm=3Dtrue,-Dgbm=3Dfalse"
>
> -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes"
> +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage lib=
xfixes libxrandr"
>  # "x11" requires "opengl"
> -PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
> -PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc"
> +PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
> +PACKAGECONFIG[xvmc] =3D "-gallium-xvmc=3Dtrue,-Dgallium-xvmc=3Dfalse,lib=
xvmc"
>  PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm wayland-prot=
ocols"
>
> -DRIDRIVERS =3D "swrast"
> -DRIDRIVERS_append_x86_class-target =3D ",radeon,r200,nouveau,i965,i915"
> -DRIDRIVERS_append_x86-64_class-target =3D ",radeon,r200,nouveau,i965,i91=
5"
> +DRIDRIVERS_class-native =3D "swrast"
> +DRIDRIVERS_class-nativesdk =3D "swrast"
> +DRIDRIVERS_append_x86_class-target =3D ",r100,r200,nouveau,i965,i915"
> +DRIDRIVERS_append_x86-64_class-target =3D ",r100,r200,nouveau,i965,i915"
>  # "dri" requires "opengl"
> -PACKAGECONFIG[dri] =3D "--enable-dri --with-dri-drivers=3D${DRIDRIVERS},=
 --disable-dri, xorgproto libdrm"
> -# On the native builds we use host's dri drivers
> -PACKAGECONFIG[dri-native] =3D "--enable-dri, , xorgproto libdrm"
> -PACKAGECONFIG[dri3] =3D "--enable-dri3, --disable-dri3, xorgproto libxsh=
mfence"
> +PACKAGECONFIG[dri] =3D "-Ddri-drivers=3D${DRIDRIVERS}, -Ddri-drivers=3D'=
', xorgproto libdrm"
> +PACKAGECONFIG[dri3] =3D "-Ddri3=3Dtrue, -Ddri3=3Dfalse, xorgproto libxsh=
mfence"
>
>  # Vulkan drivers need dri3 enabled
>  # radeon could be enabled as well but requires gallium-llvm with llvm >=
=3D 3.9
>  VULKAN_DRIVERS =3D ""
>  VULKAN_DRIVERS_append_x86_class-target =3D ",intel"
>  VULKAN_DRIVERS_append_x86-64_class-target =3D ",intel"
> -PACKAGECONFIG[vulkan] =3D "--with-vulkan-drivers=3D${VULKAN_DRIVERS}, --=
without-vulkan-drivers, python3-mako-native"
> +PACKAGECONFIG[vulkan] =3D "-Dvulkan-drivers=3D${VULKAN_DRIVERS}, -Dvulka=
n-drivers=3D'',"
>
> -PACKAGECONFIG[opengl] =3D "--enable-opengl, --disable-opengl"
> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>
>  # "gles" requires "opengl"
> -PACKAGECONFIG[gles] =3D "--enable-gles1 --enable-gles2, --disable-gles1 =
--disable-gles2"
> +PACKAGECONFIG[gles] =3D "-Dgles1=3Dtrue -Dgles2=3Dtrue, -Dgles1=3Dfalse =
-Dgles2=3Dfalse"
>
>  # "egl" requires "dri", "opengl"
> -PACKAGECONFIG[egl] =3D "--enable-egl, --disable-egl"
> +PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse"
>
>  PACKAGECONFIG[etnaviv] =3D ""
>  PACKAGECONFIG[imx] =3D ""
> @@ -104,27 +102,25 @@ GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'r600', ',r600',
>  GALLIUMDRIVERS_append =3D ",virgl"
>
>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
> -PACKAGECONFIG[gallium]      =3D "--enable-texture-float --with-gallium-d=
rivers=3D${GALLIUMDRIVERS}, --without-gallium-drivers"
> +PACKAGECONFIG[gallium]      =3D "-Dgallium-drivers=3D${GALLIUMDRIVERS}, =
-Dgallium-drivers=3D'' "
>  MESA_LLVM_RELEASE ?=3D "8.0"
> -PACKAGECONFIG[gallium-llvm] =3D "--enable-llvm --enable-llvm-shared-libs=
, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
> +PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Dtrue -Dshared-llvm=3Dtrue, -Dl=
lvm=3Dfalse, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
>  export WANT_LLVM_RELEASE =3D "${MESA_LLVM_RELEASE}"
> -PACKAGECONFIG[xa]  =3D "--enable-xa, --disable-xa"
> +PACKAGECONFIG[xa]  =3D "-Dgallium-xa=3Dtrue, -Dgallium-xa=3Dfalse"
>
> -OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium-os=
mesa', 'osmesa', d)}"
> -PACKAGECONFIG[osmesa] =3D "--enable-${OSMESA},--disable-${OSMESA}"
> +OSMESA =3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium', 'gallium', =
'classic', d)}"
> +PACKAGECONFIG[osmesa] =3D "-Dosmesa=3D${OSMESA},-Dosmesa=3Dnone"
>
> -PACKAGECONFIG[unwind] =3D "--enable-libunwind,--disable-libunwind,libunw=
ind"
> +PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libunw=
ind"
>
> -EXTRA_OECONF_remove_libc-musl =3D "--enable-glx-tls"
> -EXTRA_OECONF_append_libc-musl =3D " --disable-glx-tls"
> -EXTRA_OECONF_append_libc-musl_x86 =3D " --disable-asm"
> +# mesa tries to run cross-built gen_matypes on build machine to get stru=
ct size information
> +EXTRA_OEMESON_append =3D " -Dasm=3Dfalse"
>
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append =3D " -fno-omit-frame-pointer"
>
>  CFLAGS_append_armv5 =3D " -DMISSING_64BIT_ATOMICS"
> -EXTRA_OEMAKE +=3D "WAYLAND_PROTOCOLS_DATADIR=3D${STAGING_DATADIR}/waylan=
d-protocols"
>
>  # Remove the mesa dependency on mesa-dev, as mesa is empty
>  RDEPENDS_${PN}-dev =3D ""
> @@ -219,7 +215,7 @@ PACKAGESPLITFUNCS_prepend =3D "mesa_populate_packages=
 "
>
>  PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
>
See commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd
move ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf

We can remove ${sysconfdir}/drirc from FILES_${PN}

> -FILES_${PN} +=3D "${sysconfdir}/drirc"
> +FILES_${PN} +=3D "${sysconfdir}/drirc ${datadir}/drirc.d"
>  FILES_mesa-megadriver =3D "${libdir}/dri/*"
>  FILES_mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vulka=
n"
>  FILES_libegl-mesa =3D "${libdir}/libEGL.so.*"
> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-gra=
phics/mesa/mesa_18.3.3.bb
> similarity index 54%
> rename from meta/recipes-graphics/mesa/mesa_18.1.9.bb
> rename to meta/recipes-graphics/mesa/mesa_18.3.3.bb
> index 86d6a6bf3a7..4e26d08e678 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.3.3.bb
> @@ -1,16 +1,13 @@
>  require ${BPN}.inc
>
>  SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> -           file://0001-Simplify-wayland-scanner-lookup.patch \
>             file://0002-winsys-svga-drm-Include-sys-types.h.patch \
> -           file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-rel=
eas.patch \
> -           file://0004-Use-Python-3-to-execute-the-scripts.patch \
> -           file://0005-dri-i965-Add-missing-time.h-include.patch \
> -           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_=
DAT.patch \
> +           file://0001-meson.build-check-for-all-linux-host_os-combinati=
ons.patch \
> +           file://fix-NULL-error.patch \
>  "
>
> -SRC_URI[md5sum] =3D "2f8d2098ab478bc3907e42130577b54a"
> -SRC_URI[sha256sum] =3D "55f5778d58a710a63d6635f000535768faf7db9e8144dc0f=
4fd1989f936c1a83"
> +SRC_URI[md5sum] =3D "e9d1a24dbd5ca20efa75b9a29eb4566f"
> +SRC_URI[sha256sum] =3D "2ab6886a6966c532ccbcc3b240925e681464b658244f0cbe=
d752615af3936299"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

