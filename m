Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7D1DE7C66A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 02:33:18 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z25so3952933qti.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2019 18:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZRZb9J1GRCl9YFMnvNnqEozCmjeT73hF9NMi2F2Uju4=;
	b=sCHQ5ODVf8WkwE1Mhw3ly2ygLHNWyibnzLK2YT4UWPU09ZfEeD78DF0PIhMy8Bn98R
	2y8D3g0GKrPzK3pfTLxiHalPODoq+GroGoaXK4NFmC2qgKE1rr7OGeXmPgNQ90Cglpn2
	x9V69zQdMIeoZH7zwe4TnUuHdl945rBUUNDObUhWfRFB4FLKmrIas7Ej6d/c9voqkrKW
	EUI6AJY41JH5/rFT6FnIQ1xWvdA9VzcvTD9r7rJmIjCYJ71CgNFMIjywAjTOf0espcfL
	05EgR2YfxZKVYqJeNXGoqq04LQuiApAAAvFvoTOM94gm5YHbwPZ8zWWPOBXjH4ZbOQfX
	Ftyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZRZb9J1GRCl9YFMnvNnqEozCmjeT73hF9NMi2F2Uju4=;
	b=p1AMfer33vFrHUSsNvbhaEJkEm3MNDVGZ8m2l3yYA3bF+/vYPEW0d8rvlcTJeGNoWj
	FSuNxrdK4il8Mt/5L3f0nsX9cPDSWAhXh/irbjji2xe3lH+/+hEKdC1PfwIrUkOLVhKH
	T8SZ0+DecEdryyhNbp2sqYsE2RpVtPp2TZaB4P5CvlfHNKjMlc6nNkWIPXB5p5f16Q4z
	vVdEc+R33orMWnV9ojLB9NW+ZeHMmh3xO9fFQeNpLFUL24NvB9Iv0iWc9MJYx7ctON1h
	Dzu5WLkuGJ/UK8VJmvA1NxLHzxz48bSdap2xvkmsXMIsbWzpAOg95Kp/QydE6ABRJROw
	+49g==
X-Gm-Message-State: AHQUAuZ4mcuETj3cjtLNwF1F034SHGAnPapbg/hqgCo/OgCvU3Qnqjqj
	gXutOGi6i9OzntMv5rJh4Gsr+3FtZDNEVW0fypeSpWUM
X-Google-Smtp-Source: AHgI3IZXvu3tRWoLEzyyU7FLYiYWSKtGtmjrwzU68KM2vCeRhDiZrooV570nE4e4eK4qpFFZ0pEVIy0y3bPG8Qn9Fp0=
X-Received: by 2002:a0c:b660:: with SMTP id q32mr7949780qvf.50.1550629998909; 
	Tue, 19 Feb 2019 18:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Feb 2019 18:32:52 -0800
Message-ID: <CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 02:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails for rpi3/aarch64

| checking for libdrm >=3D 2.4.75... yes
| checking for glproto >=3D 1.4.14... yes
| checking for dri2proto >=3D 2.8... yes
| checking for x11 xext xdamage >=3D 1.1 xfixes x11-xcb xcb xcb-glx >=3D
1.8.1 xcb-dri2 >=3D 1.8 xxf86vm... yes
| checking for wayland-client >=3D 1.11... yes
| checking for wayland-server >=3D 1.11... yes
| checking for wayland-protocols >=3D 1.8... yes
| checking for wayland-egl-backend >=3D 3... yes
| checking for wayland-scanner...
/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/mesa/2_18.3.4-r0/recipe-sysroot=
-native/usr/bin/wayland-scanner
| checking for x11-xcb xcb xcb-dri2 >=3D 1.8 xcb-xfixes... yes
| checking for x11-xcb xcb >=3D 1.9.3 xcb-dri3 xcb-xfixes xcb-present
xcb-sync xshmfence >=3D 1.1... yes
| checking for xcb-dri3 >=3D 1.13 xcb-present >=3D 1.13... yes
| checking for x11-xcb xcb-randr... yes
| checking for xrandr... no
| configure: error: Package requirements (xrandr) were not met:
|
| No package 'xrandr' found
|
| Consider adjusting the PKG_CONFIG_PATH environment variable if you
| installed software in a non-standard prefix.
|
| Alternatively, you may set the environment variables XLIB_RANDR_CFLAGS
| and XLIB_RANDR_LIBS to avoid the need to call pkg-config.
| See the pkg-config man page for more details.
| NOTE: The following config.log files may provide further information.
| NOTE: /mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/mesa/2_18.3.4-r0/build/=
config.log
| ERROR: configure failed
| WARNING: /mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/mesa/2_18.3.4-r0/tem=
p/run.do_configure.11286:1
exit 1 from 'exit 1'
| ERROR: Function failed: do_configure (log file is located at
/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux/mesa/2_18.3.4-r0/temp/log.do_co=
nfigure.11286)

On Tue, Feb 19, 2019 at 8:59 AM Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
>   - Refresh all patches.
>
>   - Remove "Use Python 3 to execute the scripts" patch
>       Commit 986033a2750c1160a4cef3c8418fc7f9e2b4fb5a add support
>       for both python 2 and 3.
>
>   - Remove "dri: i965: Add missing time.h include" patch
>       Commit 3c288da5eec81ee58b85927df18d9194ead8f5c2 add time.h
>       header file.
>
>   - Remove --enable-texture-float.
>       Commit 66673bef941af344314fe9c91cad8cd330b245eb remove option to
>       unconditionally enable floating-point textures.
>
>   - Commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd moved
>     ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf
>
>   - Add patch to fix mesa-native build
>
> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> ---
>  ...0001-Simplify-wayland-scanner-lookup.patch | 20 +++++---
>  ...-winsys-svga-drm-Include-sys-types.h.patch |  8 +--
>  ...M-version-when-using-LLVM-Git-releas.patch | 12 ++---
>  ...-Use-Python-3-to-execute-the-scripts.patch | 32 ------------
>  ...-for-defining-WAYLAND_PROTOCOLS_DAT.patch} | 23 ++++-----
>  ...-dri-i965-Add-missing-time.h-include.patch | 36 --------------
>  ...sing-include-stddef.h-in-egldevice.h.patch | 49 +++++++++++++++++++
>  .../{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3.4.bb}  |  0
>  meta/recipes-graphics/mesa/mesa.inc           |  4 +-
>  .../mesa/{mesa_18.1.9.bb =3D> mesa_18.3.4.bb}   |  9 ++--
>  10 files changed, 89 insertions(+), 104 deletions(-)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0004-Use-Python-3-to=
-execute-the-scripts.patch
>  rename meta/recipes-graphics/mesa/files/{0006-use-PKG_CHECK_VAR-for-defi=
ning-WAYLAND_PROTOCOLS_DAT.patch =3D> 0004-use-PKG_CHECK_VAR-for-defining-W=
AYLAND_PROTOCOLS_DAT.patch} (60%)
>  delete mode 100644 meta/recipes-graphics/mesa/files/0005-dri-i965-Add-mi=
ssing-time.h-include.patch
>  create mode 100644 meta/recipes-graphics/mesa/files/0005-egl-add-missing=
-include-stddef.h-in-egldevice.h.patch
>  rename meta/recipes-graphics/mesa/{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3.4=
.bb} (100%)
>  rename meta/recipes-graphics/mesa/{mesa_18.1.9.bb =3D> mesa_18.3.4.bb} (=
69%)
>
> diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scann=
er-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-sc=
anner-lookup.patch
> index a50d2a2ba2..e765356fe1 100644
> --- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-look=
up.patch
> +++ b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-look=
up.patch
> @@ -1,7 +1,7 @@
> -From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
> +From 7338667148cb7fcefee76b27359bc1e11656c132 Mon Sep 17 00:00:00 2001
>  From: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Date: Tue, 15 Nov 2016 15:20:49 +0200
> -Subject: [PATCH 1/6] Simplify wayland-scanner lookup
> +Subject: [PATCH 1/5] Simplify wayland-scanner lookup
>  Organization: O.S. Systems Software LTDA.
>
>  Don't use pkg-config to lookup the path of a binary that's in the path.
> @@ -13,20 +13,24 @@ Upstream-Status: Pending
>  Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>  ---
> - configure.ac | 7 +------
> - 1 file changed, 1 insertion(+), 6 deletions(-)
> + configure.ac | 11 +----------
> + 1 file changed, 1 insertion(+), 10 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 14f1af2b2f..916d0bd207 100644
> +index cd9ff259fad..cbc455e130f 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1825,12 +1825,7 @@ for plat in $platforms; do
> -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=3D =
$WAYLAND_PROTOCOLS_REQUIRED])
> +@@ -1841,16 +1841,7 @@ for plat in $platforms; do
> +         fi
>           WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdatadi=
r wayland-protocols`
>
>  -        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
>  -                          WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=3Dw=
ayland_scanner wayland-scanner`,
>  -                          WAYLAND_SCANNER=3D'')
> +-        PKG_CHECK_EXISTS([wayland-scanner >=3D 1.15],
> +-                          AC_SUBST(SCANNER_ARG, 'private-code'),
> +-                          AC_SUBST(SCANNER_ARG, 'code'))
> +-
>  -        if test "x$WAYLAND_SCANNER" =3D x; then
>  -            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
>  -        fi
> @@ -35,5 +39,5 @@ index 14f1af2b2f..916d0bd207 100644
>           if test "x$WAYLAND_SCANNER" =3D "x:"; then
>                   AC_MSG_ERROR([wayland-scanner is needed to compile the =
wayland platform])
>  --
> -2.18.0
> +2.20.1
>
> diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Includ=
e-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm=
-Include-sys-types.h.patch
> index ffb3bf7a63..12dca61e19 100644
> --- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-t=
ypes.h.patch
> +++ b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys-t=
ypes.h.patch
> @@ -1,7 +1,7 @@
> -From 7792f228991744a0396b8bf811e281dca86165d3 Mon Sep 17 00:00:00 2001
> +From 34c3d07b67e6c08f555473a86ff158951abb6000 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Wed, 16 Aug 2017 18:58:20 -0700
> -Subject: [PATCH 2/6] winsys/svga/drm: Include sys/types.h
> +Subject: [PATCH 2/5] winsys/svga/drm: Include sys/types.h
>  Organization: O.S. Systems Software LTDA.
>
>  vmw_screen.h uses dev_t which is defines in sys/types.h
> @@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br=
>
>   1 file changed, 1 insertion(+)
>
>  diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/wins=
ys/svga/drm/vmw_screen.h
> -index f21cabb51f..4c972fdaa9 100644
> +index a87c087d9c5..cb34fec48e7 100644
>  --- a/src/gallium/winsys/svga/drm/vmw_screen.h
>  +++ b/src/gallium/winsys/svga/drm/vmw_screen.h
>  @@ -41,6 +41,7 @@
> @@ -30,5 +30,5 @@ index f21cabb51f..4c972fdaa9 100644
>   #define VMW_GMR_POOL_SIZE (16*1024*1024)
>   #define VMW_QUERY_POOL_SIZE (8192)
>  --
> -2.18.0
> +2.20.1
>
> diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-vers=
ion-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/000=
3-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
> index 5e735ca105..59b118d9f4 100644
> --- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-whe=
n-using-LLVM-Git-releas.patch
> +++ b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-whe=
n-using-LLVM-Git-releas.patch
> @@ -1,7 +1,7 @@
> -From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
> +From c5b5bf6c31be1823be1d0317eabe16558a4f0762 Mon Sep 17 00:00:00 2001
>  From: Otavio Salvador <otavio@ossystems.com.br>
>  Date: Tue, 5 Jun 2018 11:11:10 -0300
> -Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git relea=
ses
> +Subject: [PATCH 3/5] Properly get LLVM version when using LLVM Git relea=
ses
>  Organization: O.S. Systems Software LTDA.
>
>  $ llvm-config-host --version
> @@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.=
br>
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 916d0bd207..dd172f1ebe 100644
> +index cbc455e130f..0065376f4b7 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
> +@@ -1111,7 +1111,7 @@ strip_unwanted_llvm_flags() {
>
>   llvm_set_environment_variables() {
>       if test "x$LLVM_CONFIG" !=3D xno; then
> @@ -30,7 +30,7 @@ index 916d0bd207..dd172f1ebe 100644
>           LLVM_CPPFLAGS=3D`strip_unwanted_llvm_flags "$LLVM_CONFIG --cppf=
lags"`
>           LLVM_INCLUDEDIR=3D`$LLVM_CONFIG --includedir`
>           LLVM_LIBDIR=3D`$LLVM_CONFIG --libdir`
> -@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
> +@@ -2860,7 +2860,7 @@ detect_old_buggy_llvm() {
>       dnl ourselves.
>       dnl (See https://llvm.org/bugs/show_bug.cgi?id=3D6823)
>       dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
> @@ -40,5 +40,5 @@ index 916d0bd207..dd172f1ebe 100644
>
>       if test "x$llvm_have_one_so" =3D xyes; then
>  --
> -2.18.0
> +2.20.1
>
> diff --git a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execut=
e-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to=
-execute-the-scripts.patch
> deleted file mode 100644
> index 8953c4a18f..0000000000
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
> diff --git a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-=
defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/000=
4-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
> similarity index 60%
> rename from meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-d=
efining-WAYLAND_PROTOCOLS_DAT.patch
> rename to meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-def=
ining-WAYLAND_PROTOCOLS_DAT.patch
> index 0212922c5d..d4f1d9dcf4 100644
> --- a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-definin=
g-WAYLAND_PROTOCOLS_DAT.patch
> +++ b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-definin=
g-WAYLAND_PROTOCOLS_DAT.patch
> @@ -1,7 +1,7 @@
> -From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
> -From: Otavio Salvador <otavio@ossystems.com.br>
> -Date: Wed, 29 Aug 2018 22:10:30 -0300
> -Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DA=
TADIR
> +From f48b8f073f921ce5be859130313e9d392ef3e78e Mon Sep 17 00:00:00 2001
> +From: Fabio Berton <fabio.berton@ossystems.com.br>
> +Date: Fri, 15 Feb 2019 10:57:06 -0200
> +Subject: [PATCH 4/5] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DA=
TADIR
>  Organization: O.S. Systems Software LTDA.
>
>  This allows to override the wayland-protocols pkgdatadir with the
> @@ -11,27 +11,28 @@ pkgconfig would return an absolute path in
>  /usr/share/wayland-protocols
>  for the pkgdatadir value, which is not suitable for cross-compiling.
>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Upstream-Status: Pending
>
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>  ---
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/configure.ac b/configure.ac
> -index 40cac36ac2..728bbdcbc4 100644
> +index 0065376f4b7..b21fb2210c6 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1823,7 +1823,7 @@ for plat in $platforms; do
> -         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >=3D $WAYLA=
ND_REQUIRED])
> -         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >=3D $WAYLA=
ND_REQUIRED])
> -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=3D =
$WAYLAND_PROTOCOLS_REQUIRED])
> +@@ -1839,7 +1839,7 @@ for plat in $platforms; do
> +         if test "x$enable_egl" =3D xyes; then
> +           PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >=3D $W=
AYLAND_EGL_BACKEND_REQUIRED])
> +         fi
>  -        WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdatadi=
r wayland-protocols`
>  +        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >=
=3D $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
>
>           AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
>
>  --
> -2.18.0
> +2.20.1
>
> diff --git a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-t=
ime.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-mi=
ssing-time.h-include.patch
> deleted file mode 100644
> index d40e7b5855..0000000000
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
> diff --git a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-includ=
e-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0005-egl=
-add-missing-include-stddef.h-in-egldevice.h.patch
> new file mode 100644
> index 0000000000..1782576db2
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-stdde=
f.h-in-egldevice.h.patch
> @@ -0,0 +1,49 @@
> +From f452e30ab664fe608acc107cc03d2efa8731d938 Mon Sep 17 00:00:00 2001
> +From: Gurchetan Singh <gurchetansingh@chromium.org>
> +Date: Wed, 28 Nov 2018 08:39:34 -0800
> +Subject: [PATCH 5/5] egl: add missing #include <stddef.h> in egldevice.h
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +Organization: O.S. Systems Software LTDA.
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
> +diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
> +index ddcdcd17f5a..83a47d5eacc 100644
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
> +2.20.1
> +
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipes-=
graphics/mesa/mesa-gl_18.3.4.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 66ed649efe..a57438b295 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -104,7 +104,7 @@ GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PACK=
AGECONFIG', 'r600', ',r600',
>  GALLIUMDRIVERS_append =3D ",virgl"
>
>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
> -PACKAGECONFIG[gallium]      =3D "--enable-texture-float --with-gallium-d=
rivers=3D${GALLIUMDRIVERS}, --without-gallium-drivers"
> +PACKAGECONFIG[gallium] =3D "--with-gallium-drivers=3D${GALLIUMDRIVERS}, =
--without-gallium-drivers"
>  MESA_LLVM_RELEASE ?=3D "8.0"
>  PACKAGECONFIG[gallium-llvm] =3D "--enable-llvm --enable-llvm-shared-libs=
, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
> @@ -219,7 +219,7 @@ PACKAGESPLITFUNCS_prepend =3D "mesa_populate_packages=
 "
>
>  PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
>
> -FILES_${PN} +=3D "${sysconfdir}/drirc"
> +FILES_${PN} +=3D "${datadir}/drirc.d"
>  FILES_mesa-megadriver =3D "${libdir}/dri/*"
>  FILES_mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vulka=
n"
>  FILES_libegl-mesa =3D "${libdir}/libEGL.so.*"
> diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-gra=
phics/mesa/mesa_18.3.4.bb
> similarity index 69%
> rename from meta/recipes-graphics/mesa/mesa_18.1.9.bb
> rename to meta/recipes-graphics/mesa/mesa_18.3.4.bb
> index 86d6a6bf3a..27f4f0241f 100644
> --- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> +++ b/meta/recipes-graphics/mesa/mesa_18.3.4.bb
> @@ -4,13 +4,12 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mesa-=
${PV}.tar.xz \
>             file://0001-Simplify-wayland-scanner-lookup.patch \
>             file://0002-winsys-svga-drm-Include-sys-types.h.patch \
>             file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-rel=
eas.patch \
> -           file://0004-Use-Python-3-to-execute-the-scripts.patch \
> -           file://0005-dri-i965-Add-missing-time.h-include.patch \
> -           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_=
DAT.patch \
> +           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_=
DAT.patch \
> +           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h.p=
atch \
>  "
>
> -SRC_URI[md5sum] =3D "2f8d2098ab478bc3907e42130577b54a"
> -SRC_URI[sha256sum] =3D "55f5778d58a710a63d6635f000535768faf7db9e8144dc0f=
4fd1989f936c1a83"
> +SRC_URI[md5sum] =3D "6f2a5e01dd5cb91d05a9534f5a80c35d"
> +SRC_URI[sha256sum] =3D "32314da4365d37f80d84f599bd9625b00161c273c39600ba=
63b45002d500bb07"
>
>  #because we cannot rely on the fact that all apps will use pkgconfig,
>  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> --
> 2.20.1
>

