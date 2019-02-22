Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id D6B9A6C12D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 11:49:22 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h6so2723862itl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dEMB+E9JCsP5/oPM/9SHURlZRupU8Dh+KqwzlAMIFo4=;
	b=iKgdM9cYeI07gI/IvX3S56SYBFVNlr1GkBMj1dTlh/44gEoiQOX80NbSCUoZ9lG/gx
	tGGHLVUkiaCOmei/kdxKTZE9qksd9rRDOlYtNxF3KSahZc2OHKaQ1Gc4xvoL8g93r2Kc
	TgyEFO+FxkEI5A5dVO0ywyj/ZEqdpNM3cHcEIydXBystkVxCCHl1XLvmlYcjt8SLYUPB
	pLNqasWfNtfl1W2XNvzPN5lAZOCfZAOoRf4WOwt9nSDPvf9hzdc61hQaTV7LI10rNNm1
	HRzc3o9xNaI8+c6BLIPtYr9x9aIDty7FzOT/JKHaMQ12Tw7BZk0oBl2iJVhelyNDUtK8
	im6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dEMB+E9JCsP5/oPM/9SHURlZRupU8Dh+KqwzlAMIFo4=;
	b=Yk0h1Q8NBVxLTyqvW2i4shj0FV0/iItJkb+hCS/0UXhv/KJfUkYUEAojMQeQKQfhiP
	mzam9ZzhXa0eqdnTlMTe/VN2vqRZA7DYgSrDBdFHCC52mYYl4VU59+RmaZBuQ0bGDM14
	v6OnfxtBNocfMdYpaJDpwZU52NHi04Ixhs8Px6enAc8emKbuGAQv6WL433ZWQwT8eYIP
	XutpvDLLilsD5HLt/ISNG5mEAhPwC66h69dpFsCSkNHnnzDu7DqZRPrPlnYz7purpnGE
	C7ADL0HDR8s9KXXqR/uTkT6XelMDaxgmHIxAmE8A3t+t6zXn0MkMlGlH/+nlIWXF2h2v
	20OQ==
X-Gm-Message-State: AHQUAubI+cl7mwgn073b/3AwZ+LiEcCtZzb2wbQuuHtdNsIH6YvAE64T
	NjBZ7ahFCtwzu38uwEYjOEXq3OGi7PxLNlQ5/VOkXQ==
X-Google-Smtp-Source: AHgI3IbEZt6LHVCMQGG+RAGhof3zNaaw8aseNCqdSOx5tTkw6qrKEQwx5VL4L1oNW411Q3Ym2+VmI2CpxQPN31vq4wU=
X-Received: by 2002:a24:248:: with SMTP id 69mr1947212itu.91.1550836163559;
	Fri, 22 Feb 2019 03:49:23 -0800 (PST)
MIME-Version: 1.0
References: <20190220210921.26761-1-fabio.berton@ossystems.com.br>
	<CAJTo0LZcnP1m6U-3udrN7r5gJcffHkNqyVX--RfWbwuSE_5UbA@mail.gmail.com>
In-Reply-To: <CAJTo0LZcnP1m6U-3udrN7r5gJcffHkNqyVX--RfWbwuSE_5UbA@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Fri, 22 Feb 2019 08:49:07 -0300
Message-ID: <CAAPZna3O+iScZSfBBhmpGAyv_dPArbqWpgz4QJ3wRTd3sNW3LQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Fri, 22 Feb 2019 11:49:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ross!

Yes, I'll check packages and fix this.

Thanks

On Fri, Feb 22, 2019 at 7:29 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> packages/corei7-64-poky-linux/mesa/mesa: FILELIST: added
> "/usr/share/drirc.d/00-mesa-defaults.conf"
> packages/corei7-64-poky-linux/mesa/mesa: PKGSIZE changed from 0 to 14966 =
(+100%)
>
> Can you identify what of the subpackages actually reads this file and
> move it to there?
>
> Ross
>
> On Wed, 20 Feb 2019 at 21:10, Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> >
> >   - Refresh all patches.
> >
> >   - Remove "Use Python 3 to execute the scripts" patch
> >       Commit 986033a2750c1160a4cef3c8418fc7f9e2b4fb5a add support
> >       for both python 2 and 3.
> >
> >   - Remove "dri: i965: Add missing time.h include" patch
> >       Commit 3c288da5eec81ee58b85927df18d9194ead8f5c2 add time.h
> >       header file.
> >
> >   - Remove --enable-texture-float.
> >       Commit 66673bef941af344314fe9c91cad8cd330b245eb remove option to
> >       unconditionally enable floating-point textures.
> >
> >   - Commit 30b10dbb7c6f6bdf3e489620f8333c727bd3a6dd moved
> >     ${sysconfdir}/drirc to ${datadir}/drirc.d/00-mesa-defaults.conf
> >
> >   - Add patch to fix mesa-native build
> >
> >   - Add xrandr to X11_DEPS
> >
> > Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > ---
> >  ...0001-Simplify-wayland-scanner-lookup.patch | 27 +++++-----
> >  ...-winsys-svga-drm-Include-sys-types.h.patch |  8 +--
> >  ...M-version-when-using-LLVM-Git-releas.patch | 12 ++---
> >  ...-Use-Python-3-to-execute-the-scripts.patch | 32 ------------
> >  ...-for-defining-WAYLAND_PROTOCOLS_DAT.patch} | 28 +++++------
> >  ...-dri-i965-Add-missing-time.h-include.patch | 36 --------------
> >  ...sing-include-stddef.h-in-egldevice.h.patch | 49 +++++++++++++++++++
> >  .../{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3.4.bb}  |  0
> >  meta/recipes-graphics/mesa/mesa.inc           |  6 +--
> >  .../mesa/{mesa_18.1.9.bb =3D> mesa_18.3.4.bb}   |  9 ++--
> >  10 files changed, 94 insertions(+), 113 deletions(-)
> >  delete mode 100644 meta/recipes-graphics/mesa/files/0004-Use-Python-3-=
to-execute-the-scripts.patch
> >  rename meta/recipes-graphics/mesa/files/{0006-use-PKG_CHECK_VAR-for-de=
fining-WAYLAND_PROTOCOLS_DAT.patch =3D> 0004-use-PKG_CHECK_VAR-for-defining=
-WAYLAND_PROTOCOLS_DAT.patch} (55%)
> >  delete mode 100644 meta/recipes-graphics/mesa/files/0005-dri-i965-Add-=
missing-time.h-include.patch
> >  create mode 100644 meta/recipes-graphics/mesa/files/0005-egl-add-missi=
ng-include-stddef.h-in-egldevice.h.patch
> >  rename meta/recipes-graphics/mesa/{mesa-gl_18.1.9.bb =3D> mesa-gl_18.3=
.4.bb} (100%)
> >  rename meta/recipes-graphics/mesa/{mesa_18.1.9.bb =3D> mesa_18.3.4.bb}=
 (69%)
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-sca=
nner-lookup.patch b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-=
scanner-lookup.patch
> > index a50d2a2ba2..1c2ded0e60 100644
> > --- a/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lo=
okup.patch
> > +++ b/meta/recipes-graphics/mesa/files/0001-Simplify-wayland-scanner-lo=
okup.patch
> > @@ -1,7 +1,7 @@
> > -From 7e8e0f8a8ac2425e19a2f340c9e3da9345f25940 Mon Sep 17 00:00:00 2001
> > -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> > -Date: Tue, 15 Nov 2016 15:20:49 +0200
> > -Subject: [PATCH 1/6] Simplify wayland-scanner lookup
> > +From 81bcaa1aeecf1e66b4d94181e9a827d68e970b03 Mon Sep 17 00:00:00 2001
> > +From: Fabio Berton <fabio.berton@ossystems.com.br>
> > +Date: Wed, 20 Feb 2019 16:17:00 -0300
> > +Subject: [PATCH 1/5] Simplify wayland-scanner lookup
> >  Organization: O.S. Systems Software LTDA.
> >
> >  Don't use pkg-config to lookup the path of a binary that's in the path=
.
> > @@ -17,23 +17,26 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.co=
m.br>
> >   1 file changed, 1 insertion(+), 6 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index 14f1af2b2f..916d0bd207 100644
> > +index cd9ff259fad..402b4a91946 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1825,12 +1825,7 @@ for plat in $platforms; do
> > -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=
=3D $WAYLAND_PROTOCOLS_REQUIRED])
> > +@@ -1841,16 +1841,11 @@ for plat in $platforms; do
> > +         fi
> >           WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdata=
dir wayland-protocols`
> > -
> > +
> >  -        PKG_CHECK_MODULES([WAYLAND_SCANNER], [wayland-scanner],
> >  -                          WAYLAND_SCANNER=3D`$PKG_CONFIG --variable=
=3Dwayland_scanner wayland-scanner`,
> >  -                          WAYLAND_SCANNER=3D'')
> > +         PKG_CHECK_EXISTS([wayland-scanner >=3D 1.15],
> > +                           AC_SUBST(SCANNER_ARG, 'private-code'),
> > +                           AC_SUBST(SCANNER_ARG, 'code'))
> > +
> >  -        if test "x$WAYLAND_SCANNER" =3D x; then
> >  -            AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> >  -        fi
> >  +        AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> > -
> > +
> >           if test "x$WAYLAND_SCANNER" =3D "x:"; then
> >                   AC_MSG_ERROR([wayland-scanner is needed to compile th=
e wayland platform])
> > ---
> > -2.18.0
> > -
> > +--
> > +2.20.1
> > diff --git a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Incl=
ude-sys-types.h.patch b/meta/recipes-graphics/mesa/files/0002-winsys-svga-d=
rm-Include-sys-types.h.patch
> > index ffb3bf7a63..12dca61e19 100644
> > --- a/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys=
-types.h.patch
> > +++ b/meta/recipes-graphics/mesa/files/0002-winsys-svga-drm-Include-sys=
-types.h.patch
> > @@ -1,7 +1,7 @@
> > -From 7792f228991744a0396b8bf811e281dca86165d3 Mon Sep 17 00:00:00 2001
> > +From 34c3d07b67e6c08f555473a86ff158951abb6000 Mon Sep 17 00:00:00 2001
> >  From: Khem Raj <raj.khem@gmail.com>
> >  Date: Wed, 16 Aug 2017 18:58:20 -0700
> > -Subject: [PATCH 2/6] winsys/svga/drm: Include sys/types.h
> > +Subject: [PATCH 2/5] winsys/svga/drm: Include sys/types.h
> >  Organization: O.S. Systems Software LTDA.
> >
> >  vmw_screen.h uses dev_t which is defines in sys/types.h
> > @@ -18,7 +18,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.=
br>
> >   1 file changed, 1 insertion(+)
> >
> >  diff --git a/src/gallium/winsys/svga/drm/vmw_screen.h b/src/gallium/wi=
nsys/svga/drm/vmw_screen.h
> > -index f21cabb51f..4c972fdaa9 100644
> > +index a87c087d9c5..cb34fec48e7 100644
> >  --- a/src/gallium/winsys/svga/drm/vmw_screen.h
> >  +++ b/src/gallium/winsys/svga/drm/vmw_screen.h
> >  @@ -41,6 +41,7 @@
> > @@ -30,5 +30,5 @@ index f21cabb51f..4c972fdaa9 100644
> >   #define VMW_GMR_POOL_SIZE (16*1024*1024)
> >   #define VMW_QUERY_POOL_SIZE (8192)
> >  --
> > -2.18.0
> > +2.20.1
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-ve=
rsion-when-using-LLVM-Git-releas.patch b/meta/recipes-graphics/mesa/files/0=
003-Properly-get-LLVM-version-when-using-LLVM-Git-releas.patch
> > index 5e735ca105..59b118d9f4 100644
> > --- a/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-w=
hen-using-LLVM-Git-releas.patch
> > +++ b/meta/recipes-graphics/mesa/files/0003-Properly-get-LLVM-version-w=
hen-using-LLVM-Git-releas.patch
> > @@ -1,7 +1,7 @@
> > -From 8b42fb47138f91d9378439ab716bac7701e4e326 Mon Sep 17 00:00:00 2001
> > +From c5b5bf6c31be1823be1d0317eabe16558a4f0762 Mon Sep 17 00:00:00 2001
> >  From: Otavio Salvador <otavio@ossystems.com.br>
> >  Date: Tue, 5 Jun 2018 11:11:10 -0300
> > -Subject: [PATCH 3/6] Properly get LLVM version when using LLVM Git rel=
eases
> > +Subject: [PATCH 3/5] Properly get LLVM version when using LLVM Git rel=
eases
> >  Organization: O.S. Systems Software LTDA.
> >
> >  $ llvm-config-host --version
> > @@ -18,10 +18,10 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.co=
m.br>
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index 916d0bd207..dd172f1ebe 100644
> > +index cbc455e130f..0065376f4b7 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1090,7 +1090,7 @@ strip_unwanted_llvm_flags() {
> > +@@ -1111,7 +1111,7 @@ strip_unwanted_llvm_flags() {
> >
> >   llvm_set_environment_variables() {
> >       if test "x$LLVM_CONFIG" !=3D xno; then
> > @@ -30,7 +30,7 @@ index 916d0bd207..dd172f1ebe 100644
> >           LLVM_CPPFLAGS=3D`strip_unwanted_llvm_flags "$LLVM_CONFIG --cp=
pflags"`
> >           LLVM_INCLUDEDIR=3D`$LLVM_CONFIG --includedir`
> >           LLVM_LIBDIR=3D`$LLVM_CONFIG --libdir`
> > -@@ -2808,7 +2808,7 @@ detect_old_buggy_llvm() {
> > +@@ -2860,7 +2860,7 @@ detect_old_buggy_llvm() {
> >       dnl ourselves.
> >       dnl (See https://llvm.org/bugs/show_bug.cgi?id=3D6823)
> >       dnl We can't use $LLVM_VERSION because it has 'svn' stripped out,
> > @@ -40,5 +40,5 @@ index 916d0bd207..dd172f1ebe 100644
> >
> >       if test "x$llvm_have_one_so" =3D xyes; then
> >  --
> > -2.18.0
> > +2.20.1
> >
> > diff --git a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-exec=
ute-the-scripts.patch b/meta/recipes-graphics/mesa/files/0004-Use-Python-3-=
to-execute-the-scripts.patch
> > deleted file mode 100644
> > index 8953c4a18f..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0004-Use-Python-3-to-execute-the=
-scripts.patch
> > +++ /dev/null
> > @@ -1,32 +0,0 @@
> > -From ebe6077a1d74e56b28249f71e8760295fa846ed2 Mon Sep 17 00:00:00 2001
> > -From: Otavio Salvador <otavio@ossystems.com.br>
> > -Date: Fri, 29 Dec 2017 10:27:59 -0200
> > -Subject: [PATCH 4/6] Use Python 3 to execute the scripts
> > -Organization: O.S. Systems Software LTDA.
> > -
> > -The MESA build system uses Python 2 but as OE-Core has moved away from
> > -it, we change it to use Python 3 instead.
> > -
> > -Upstream-Status: Inappropriate [ configuration ]
> > -
> > -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ----
> > - configure.ac | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > -
> > -diff --git a/configure.ac b/configure.ac
> > -index dd172f1ebe..40cac36ac2 100644
> > ---- a/configure.ac
> > -+++ b/configure.ac
> > -@@ -122,7 +122,7 @@ AM_PROG_CC_C_O
> > - AC_PROG_NM
> > - AM_PROG_AS
> > - AX_CHECK_GNU_MAKE
> > --AC_CHECK_PROGS([PYTHON2], [python2.7 python2 python])
> > -+AC_CHECK_PROGS([PYTHON2], [python3.5 python3 python])
> > - AC_PROG_SED
> > - AC_PROG_MKDIR_P
> > -
> > ---
> > -2.18.0
> > -
> > diff --git a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-fo=
r-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/mesa/files/0=
004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
> > similarity index 55%
> > rename from meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for=
-defining-WAYLAND_PROTOCOLS_DAT.patch
> > rename to meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-d=
efining-WAYLAND_PROTOCOLS_DAT.patch
> > index 0212922c5d..8c91790249 100644
> > --- a/meta/recipes-graphics/mesa/files/0006-use-PKG_CHECK_VAR-for-defin=
ing-WAYLAND_PROTOCOLS_DAT.patch
> > +++ b/meta/recipes-graphics/mesa/files/0004-use-PKG_CHECK_VAR-for-defin=
ing-WAYLAND_PROTOCOLS_DAT.patch
> > @@ -1,7 +1,7 @@
> > -From 754ccf89a732fc3da6e9bc62ebd6b28686ff3d26 Mon Sep 17 00:00:00 2001
> > -From: Otavio Salvador <otavio@ossystems.com.br>
> > -Date: Wed, 29 Aug 2018 22:10:30 -0300
> > -Subject: [PATCH 6/6] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_=
DATADIR
> > +From f48b8f073f921ce5be859130313e9d392ef3e78e Mon Sep 17 00:00:00 2001
> > +From: Fabio Berton <fabio.berton@ossystems.com.br>
> > +Date: Fri, 15 Feb 2019 10:57:06 -0200
> > +Subject: [PATCH 4/5] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_=
DATADIR
> >  Organization: O.S. Systems Software LTDA.
> >
> >  This allows to override the wayland-protocols pkgdatadir with the
> > @@ -11,27 +11,25 @@ pkgconfig would return an absolute path in
> >  /usr/share/wayland-protocols
> >  for the pkgdatadir value, which is not suitable for cross-compiling.
> >
> > -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  Upstream-Status: Pending
> >
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >  Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > +Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
> >  ---
> >   configure.ac | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/configure.ac b/configure.ac
> > -index 40cac36ac2..728bbdcbc4 100644
> > +index 0065376f4b7..b21fb2210c6 100644
> >  --- a/configure.ac
> >  +++ b/configure.ac
> > -@@ -1823,7 +1823,7 @@ for plat in $platforms; do
> > -         PKG_CHECK_MODULES([WAYLAND_CLIENT], [wayland-client >=3D $WAY=
LAND_REQUIRED])
> > -         PKG_CHECK_MODULES([WAYLAND_SERVER], [wayland-server >=3D $WAY=
LAND_REQUIRED])
> > -         PKG_CHECK_MODULES([WAYLAND_PROTOCOLS], [wayland-protocols >=
=3D $WAYLAND_PROTOCOLS_REQUIRED])
> > +@@ -1839,7 +1839,7 @@ for plat in $platforms; do
> > +         if test "x$enable_egl" =3D xyes; then
> > +           PKG_CHECK_MODULES([WAYLAND_EGL], [wayland-egl-backend >=3D =
$WAYLAND_EGL_BACKEND_REQUIRED])
> > +         fi
> >  -        WAYLAND_PROTOCOLS_DATADIR=3D`$PKG_CONFIG --variable=3Dpkgdata=
dir wayland-protocols`
> >  +        PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols=
 >=3D $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
> >
> > -         AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner], [:])
> > -
> > ---
> > -2.18.0
> > -
> > +         PKG_CHECK_EXISTS([wayland-scanner >=3D 1.15],
> > +                           AC_SUBST(SCANNER_ARG, 'private-code'),
> > diff --git a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing=
-time.h-include.patch b/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-=
missing-time.h-include.patch
> > deleted file mode 100644
> > index d40e7b5855..0000000000
> > --- a/meta/recipes-graphics/mesa/files/0005-dri-i965-Add-missing-time.h=
-include.patch
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -From 9e0368af471af3a36e0eb526453f892598120065 Mon Sep 17 00:00:00 2001
> > -From: Otavio Salvador <otavio@ossystems.com.br>
> > -Date: Wed, 6 Jun 2018 09:50:35 -0300
> > -Subject: [PATCH 5/6] dri: i965: Add missing time.h include
> > -Organization: O.S. Systems Software LTDA.
> > -
> > -This fixes a build error when using musl:
> > -
> > -,----
> > -| In file included from .../src/mesa/drivers/dri/i965/intel_upload.c:3=
3:0:
> > -| .../src/mesa/drivers/dri/i965/brw_bufmgr.h:132:4: error: unknown typ=
e name 'time_t'
> > -|     time_t free_time;
> > -|     ^~~~~~
> > -`----
> > -
> > -Upstream-Status: Backport [3c288da5eec81ee58b85927df18d9194ead8f5c2]
> > -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > ----
> > - src/mesa/drivers/dri/i965/brw_bufmgr.h | 1 +
> > - 1 file changed, 1 insertion(+)
> > -
> > -diff --git a/src/mesa/drivers/dri/i965/brw_bufmgr.h b/src/mesa/drivers=
/dri/i965/brw_bufmgr.h
> > -index 68f5e0c2c8..5b60a23763 100644
> > ---- a/src/mesa/drivers/dri/i965/brw_bufmgr.h
> > -+++ b/src/mesa/drivers/dri/i965/brw_bufmgr.h
> > -@@ -37,6 +37,7 @@
> > - #include <stdbool.h>
> > - #include <stdint.h>
> > - #include <stdio.h>
> > -+#include <time.h>
> > - #include "util/u_atomic.h"
> > - #include "util/list.h"
> > -
> > ---
> > -2.18.0
> > -
> > diff --git a/meta/recipes-graphics/mesa/files/0005-egl-add-missing-incl=
ude-stddef.h-in-egldevice.h.patch b/meta/recipes-graphics/mesa/files/0005-e=
gl-add-missing-include-stddef.h-in-egldevice.h.patch
> > new file mode 100644
> > index 0000000000..1782576db2
> > --- /dev/null
> > +++ b/meta/recipes-graphics/mesa/files/0005-egl-add-missing-include-std=
def.h-in-egldevice.h.patch
> > @@ -0,0 +1,49 @@
> > +From f452e30ab664fe608acc107cc03d2efa8731d938 Mon Sep 17 00:00:00 2001
> > +From: Gurchetan Singh <gurchetansingh@chromium.org>
> > +Date: Wed, 28 Nov 2018 08:39:34 -0800
> > +Subject: [PATCH 5/5] egl: add missing #include <stddef.h> in egldevice=
.h
> > +MIME-Version: 1.0
> > +Content-Type: text/plain; charset=3DUTF-8
> > +Content-Transfer-Encoding: 8bit
> > +Organization: O.S. Systems Software LTDA.
> > +
> > +Otherwise, I get this error:
> > +
> > +main/egldevice.h:54:13: error: =E2=80=98NULL=E2=80=99 undeclared (firs=
t use in this function)
> > +       dev =3D NULL;
> > +             ^~~~
> > +with this config:
> > +
> > +./autogen.sh --enable-gles1 --enable-gles2 --with-platforms=3D'surface=
less' --disable-glx
> > +             --with-dri-drivers=3D"i965" --with-gallium-drivers=3D"" -=
-enable-gbm
> > +
> > +v3: Use stddef.h (Matt)
> > +v4: Modify commit message (Eric)
> > +
> > +Reviewed-by: Matt Turner <mattst88@gmail.com>
> > +Reviewed-by: Eric Engestrom <eric.engestrom@intel.com>
> > +
> > +Upstream-Status: Backport [https://cgit.freedesktop.org/mesa/mesa/comm=
it/?id=3Deb44c36cf1729e7e200b77cf8ea755dff72d1639]
> > +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > +---
> > + src/egl/main/egldevice.h | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/egl/main/egldevice.h b/src/egl/main/egldevice.h
> > +index ddcdcd17f5a..83a47d5eacc 100644
> > +--- a/src/egl/main/egldevice.h
> > ++++ b/src/egl/main/egldevice.h
> > +@@ -31,9 +31,9 @@
> > +
> > +
> > + #include <stdbool.h>
> > ++#include <stddef.h>
> > + #include "egltypedefs.h"
> > +
> > +-
> > + #ifdef __cplusplus
> > + extern "C" {
> > + #endif
> > +--
> > +2.20.1
> > +
> > diff --git a/meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb b/meta/recipe=
s-graphics/mesa/mesa-gl_18.3.4.bb
> > similarity index 100%
> > rename from meta/recipes-graphics/mesa/mesa-gl_18.1.9.bb
> > rename to meta/recipes-graphics/mesa/mesa-gl_18.3.4.bb
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 66ed649efe..b9870eb6ad 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -55,7 +55,7 @@ PACKAGECONFIG_class-nativesdk ?=3D "gbm dri-native eg=
l"
> >  # "gbm" requires "dri", "opengl"
> >  PACKAGECONFIG[gbm] =3D "--enable-gbm,--disable-gbm"
> >
> > -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage l=
ibxfixes"
> > +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage l=
ibxfixes xrandr"
> >  # "x11" requires "opengl"
> >  PACKAGECONFIG[x11] =3D "--enable-glx-tls,--disable-glx,${X11_DEPS}"
> >  PACKAGECONFIG[xvmc] =3D "--enable-xvmc,--disable-xvmc,libxvmc"
> > @@ -104,7 +104,7 @@ GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PA=
CKAGECONFIG', 'r600', ',r600',
> >  GALLIUMDRIVERS_append =3D ",virgl"
> >
> >  # keep --with-gallium-drivers separate, because when only one of galli=
um versions is enabled, other 2 were adding --without-gallium-drivers
> > -PACKAGECONFIG[gallium]      =3D "--enable-texture-float --with-gallium=
-drivers=3D${GALLIUMDRIVERS}, --without-gallium-drivers"
> > +PACKAGECONFIG[gallium] =3D "--with-gallium-drivers=3D${GALLIUMDRIVERS}=
, --without-gallium-drivers"
> >  MESA_LLVM_RELEASE ?=3D "8.0"
> >  PACKAGECONFIG[gallium-llvm] =3D "--enable-llvm --enable-llvm-shared-li=
bs, --disable-llvm, llvm${MESA_LLVM_RELEASE} llvm-native \
> >                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM3=
3_ENABLED} else ''}"
> > @@ -219,7 +219,7 @@ PACKAGESPLITFUNCS_prepend =3D "mesa_populate_packag=
es "
> >
> >  PACKAGES_DYNAMIC +=3D "^mesa-driver-.*"
> >
> > -FILES_${PN} +=3D "${sysconfdir}/drirc"
> > +FILES_${PN} +=3D "${datadir}/drirc.d"
> >  FILES_mesa-megadriver =3D "${libdir}/dri/*"
> >  FILES_mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so ${datadir}/vul=
kan"
> >  FILES_libegl-mesa =3D "${libdir}/libEGL.so.*"
> > diff --git a/meta/recipes-graphics/mesa/mesa_18.1.9.bb b/meta/recipes-g=
raphics/mesa/mesa_18.3.4.bb
> > similarity index 69%
> > rename from meta/recipes-graphics/mesa/mesa_18.1.9.bb
> > rename to meta/recipes-graphics/mesa/mesa_18.3.4.bb
> > index 86d6a6bf3a..27f4f0241f 100644
> > --- a/meta/recipes-graphics/mesa/mesa_18.1.9.bb
> > +++ b/meta/recipes-graphics/mesa/mesa_18.3.4.bb
> > @@ -4,13 +4,12 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/mes=
a-${PV}.tar.xz \
> >             file://0001-Simplify-wayland-scanner-lookup.patch \
> >             file://0002-winsys-svga-drm-Include-sys-types.h.patch \
> >             file://0003-Properly-get-LLVM-version-when-using-LLVM-Git-r=
eleas.patch \
> > -           file://0004-Use-Python-3-to-execute-the-scripts.patch \
> > -           file://0005-dri-i965-Add-missing-time.h-include.patch \
> > -           file://0006-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOL=
S_DAT.patch \
> > +           file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOL=
S_DAT.patch \
> > +           file://0005-egl-add-missing-include-stddef.h-in-egldevice.h=
.patch \
> >  "
> >
> > -SRC_URI[md5sum] =3D "2f8d2098ab478bc3907e42130577b54a"
> > -SRC_URI[sha256sum] =3D "55f5778d58a710a63d6635f000535768faf7db9e8144dc=
0f4fd1989f936c1a83"
> > +SRC_URI[md5sum] =3D "6f2a5e01dd5cb91d05a9534f5a80c35d"
> > +SRC_URI[sha256sum] =3D "32314da4365d37f80d84f599bd9625b00161c273c39600=
ba63b45002d500bb07"
> >
> >  #because we cannot rely on the fact that all apps will use pkgconfig,
> >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > --
> > 2.20.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

