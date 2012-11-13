Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYFxg-0007J0-K8
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:51:29 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so2743518bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 04:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mz5mhN6dQ417ewMoLzQtAHmPz1KAJpqpgD0Su9oYUF4=;
	b=uuX98CprqlB6JmiOex+dB9xr+paFy2Rit07KEkjT0S5N+Rhz630Bv1n4NsJerEYq7n
	xNBZd9rjGte0IMIt4KKdLFyPl2yVvAV7zs/6edK5aZ+6VEkKANQOe0vrMGWn8izFX/os
	Luj/Eh+TnmBjqs1wbXWNvkdExt7zKjOTz3pgP+uUxWl7LOL+zu+3vQribu8OAZtVIUxE
	NCr8a5//LgPuW+HlBrDEXCifN5EE55UZu+AncnhJYpBxcyoUGYkbjjj63MCde5cj/dUL
	VglLobE9O2x1nu75+McSiXZyve0erlTzeX18b/bhvh2lRJTpp3srG/AchefWM1Vv53qa
	eKeA==
Received: by 10.205.130.148 with SMTP id hm20mr7972640bkc.71.1352810254291;
	Tue, 13 Nov 2012 04:37:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id hu14sm5413165bkc.12.2012.11.13.04.37.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 04:37:33 -0800 (PST)
Date: Tue, 13 Nov 2012 13:37:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121113123743.GC3928@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<2964a05f2b16c3c55862251ab0d509d258c57d19.1352808309.git.laurentiu.palcu@intel.com>
MIME-Version: 1.0
In-Reply-To: <2964a05f2b16c3c55862251ab0d509d258c57d19.1352808309.git.laurentiu.palcu@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/12] xserver-xorg: upgrade to 1.13.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 12:51:29 -0000
X-Groupsio-MsgNum: 31241
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline

--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 02:18:25PM +0200, Laurentiu Palcu wrote:
> The patch contains several aditional changes:
>  * removed one backported patch (included in the new release);
>  * changed mips64-compiler.patch to apply properly;
>  * licence checksum for COPYING file changed: some copyright years have
>    been changed
>=20
> The following external modules are now built-in:
>  * DBE
>  * DRI2
>  * DRI
>  * RECORD

Can you also say why?

And is this patch for oe-core or poky? because meta-yocto-bsp does not
belong here.

Cheers,

>=20
> The extmod module was completely removed.
>=20
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta-yocto-bsp/conf/machine/atom-pc.conf           |    3 -
>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    1 -
>  meta-yocto-bsp/conf/machine/routerstationpro.conf  |    1 -
>  meta/conf/machine/include/ia32-base.inc            |    5 +-
>  .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 --------------=
------
>  .../crosscompile.patch                             |    0
>  .../fix_open_max_preprocessor_error.patch          |    0
>  .../macro_tweak.patch                              |    0
>  .../mips64-compiler.patch                          |   28 ++++----
>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   14 +---
>  ...erver-xorg_1.11.4.bb =3D> xserver-xorg_1.13.0.bb} |    5 +-
>  .../arch/powerpc/conf/machine/{{=3Dmachine}}.conf    |    1 -
>  12 files changed, 19 insertions(+), 109 deletions(-)
>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.=
4/pkgconfig-deps.patch
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> xser=
ver-xorg-1.13.0}/crosscompile.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> xser=
ver-xorg-1.13.0}/fix_open_max_preprocessor_error.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> xser=
ver-xorg-1.13.0}/macro_tweak.patch (100%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> xser=
ver-xorg-1.13.0}/mips64-compiler.patch (42%)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.4.bb =3D> x=
server-xorg_1.13.0.bb} (56%)
>=20
> diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf b/meta-yocto-bsp/co=
nf/machine/atom-pc.conf
> index 46bc71b..77dd7fb 100644
> --- a/meta-yocto-bsp/conf/machine/atom-pc.conf
> +++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
> @@ -13,10 +13,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
>  PREFERRED_VERSION_linux-yocto ?=3D "3.0%"
>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
>  XSERVER ?=3D "xserver-xorg \
> -           xserver-xorg-extension-dri2 \
>             xserver-xorg-extension-glx \
> -           xserver-xorg-extension-extmod \
> -           xserver-xorg-extension-dbe \
>             xf86-input-mouse \
>             xf86-input-keyboard \
>             xf86-input-evdev \
> diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yocto-b=
sp/conf/machine/mpc8315e-rdb.conf
> index 7aa498d..252f4cc 100644
> --- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> +++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> @@ -19,7 +19,6 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> =20
>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
>  XSERVER ?=3D "xserver-xorg \
> -            xserver-xorg-extension-extmod \
>              xf86-input-evdev \
>              xf86-video-fbdev"
> =20
> diff --git a/meta-yocto-bsp/conf/machine/routerstationpro.conf b/meta-yoc=
to-bsp/conf/machine/routerstationpro.conf
> index feaa26e..e5e4d1a 100644
> --- a/meta-yocto-bsp/conf/machine/routerstationpro.conf
> +++ b/meta-yocto-bsp/conf/machine/routerstationpro.conf
> @@ -14,7 +14,6 @@ PREFERRED_VERSION_linux-yocto ?=3D "3.4%"
> =20
>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
>  XSERVER ?=3D "xserver-xorg \
> -            xserver-xorg-extension-extmod \
>              xf86-input-evdev \
>              xf86-video-fbdev"
> =20
> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machine/=
include/ia32-base.inc
> index 4b10183..c2d267a 100644
> --- a/meta/conf/machine/include/ia32-base.inc
> +++ b/meta/conf/machine/include/ia32-base.inc
> @@ -33,11 +33,8 @@ XSERVER_IA32_BASE =3D "xserver-xorg \
>             xf86-input-synaptics \
>             "
> =20
> -XSERVER_IA32_EXT =3D "xserver-xorg-extension-dri \
> -           xserver-xorg-extension-dri2 \
> +XSERVER_IA32_EXT =3D "
>             xserver-xorg-extension-glx \
> -           xserver-xorg-extension-extmod \
> -           xserver-xorg-extension-dbe \
>             xserver-xorg-module-libint10 \
>             "
> =20
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgco=
nfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pk=
gconfig-deps.patch
> deleted file mode 100644
> index fee8d76..0000000
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig-de=
ps.patch
> +++ /dev/null
> @@ -1,70 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> -
> -commit 41d903918a5721e53ed694880eab44170f9717cc
> -Author: Jeremy Huddleston <jeremyhu@apple.com>
> -Date:   Wed Sep 14 13:45:18 2011 -0500
> -
> -    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
> -   =20
> -    Every module building against xorg-server does not *Require* pixman =
nor
> -    libpciaccess.  If such modules need pixman or pciaccess, they should=
 be
> -    depending on them directly rather than inheriting a dependency from
> -    xorg-server.  To do this, they should use PKG_CHECK_MODULES in confi=
gure.ac
> -    to check for pixman-1 or pciaccess and include the apporpriate _LIBS=
 variable
> -    to the appropriate _LDFLAGS variable in Makefile.am
> -   =20
> -    This also moves pixman-1 to Requires.private, so CPPFLAGS is set rig=
ht to
> -    to satisfy include dependencies but avoid linking needlessly.
> -   =20
> -    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
> -    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
> -
> -diff --git a/configure.ac b/configure.ac
> -index 50beb01..4bfa82c 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -780,11 +780,6 @@ VIDMODEPROTO=3D"xf86vidmodeproto >=3D 2.2.99.1"
> - WINDOWSWMPROTO=3D"windowswmproto"
> - APPLEWMPROTO=3D"applewmproto >=3D 1.4"
> -=20
> --dnl Core modules for most extensions, et al.
> --SDK_REQUIRED_MODULES=3D"[xproto >=3D 7.0.22] [randrproto >=3D 1.2.99.3]=
 [renderproto >=3D 0.11] [xextproto >=3D 7.1.99] [inputproto >=3D 1.9.99.90=
2] [kbproto >=3D 1.0.3] fontsproto"
> --# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> --AC_SUBST(SDK_REQUIRED_MODULES)
> --
> - dnl List of libraries that require a specific version
> - LIBAPPLEWM=3D"applewm >=3D 1.4"
> - LIBDMX=3D"dmx >=3D 1.0.99.1"
> -@@ -806,6 +801,11 @@ dnl specific modules against it
> - PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
> - REQUIRED_LIBS=3D"$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
> -=20
> -+dnl Core modules for most extensions, et al.
> -+SDK_REQUIRED_MODULES=3D"[xproto >=3D 7.0.22] [randrproto >=3D 1.2.99.3]=
 [renderproto >=3D 0.11] [xextproto >=3D 7.1.99] [inputproto >=3D 1.99.99.9=
02] [kbproto >=3D 1.0.3] fontsproto $LIBPIXMAN"
> -+# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> -+AC_SUBST(SDK_REQUIRED_MODULES)
> -+
> - REQUIRED_MODULES=3D"[fixesproto >=3D 5.0] [damageproto >=3D 1.1] [xcmis=
cproto >=3D 1.2.0] [xtrans >=3D 1.2.2] [bigreqsproto >=3D 1.1.0] $SDK_REQUI=
RED_MODULES"
> -=20
> - if test "x$CONFIG_UDEV" =3D xyes &&
> -@@ -1583,6 +1583,7 @@ if test "x$XORG" =3D xyes; then
> - 	if test "x$PCI" =3D xyes; then
> -=20
> - 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
> -+	SDK_REQUIRED_MODULES=3D"$SDK_REQUIRED_MODULES $LIBPCIACCESS"
> -	SAVE_LIBS=3D$LIBS
> -	SAVE_CFLAGS=3D$CFLAGS
> -	CFLAGS=3D$PCIACCESS_CFLAGS
> -diff --git a/xorg-server.pc.in b/xorg-server.pc.in
> -index fb238b5..a98eca8 100644
> ---- a/xorg-server.pc.in
> -+++ b/xorg-server.pc.in
> -@@ -15,7 +15,6 @@ abi_extension=3D@abi_extension@
> - Name: xorg-server
> - Description: Modular X.Org X Server
> - Version: @PACKAGE_VERSION@
> --Requires: pixman-1 pciaccess
> - Requires.private: @SDK_REQUIRED_MODULES@
> - Cflags: -I${sdkdir} @symbol_visibility@
> - Libs: -L${libdir}
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/cross=
compile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/cros=
scompile.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/crossc=
ompile.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/crosscom=
pile.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_o=
pen_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xserv=
er-xorg-1.13.0/fix_open_max_preprocessor_error.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix_op=
en_max_preprocessor_error.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_open=
_max_preprocessor_error.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro=
_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro=
_tweak.patch
> similarity index 100%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/macro_=
tweak.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro_tw=
eak.patch
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips6=
4-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/m=
ips64-compiler.patch
> similarity index 42%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64=
-compiler.patch
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-c=
ompiler.patch
> index e6bc95b..168368e 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-compi=
ler.patch
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-compi=
ler.patch
> @@ -6,24 +6,24 @@ This patch choses the right values for mips64
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> =20
>  Upstream-Status: Pending
> -Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
> +Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 12:1=
9:59.485599046 -0700
> -+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:53.=
109602488 -0700
> -@@ -104,6 +104,7 @@
> -=20
> - #  if !defined(__arm__)
> - #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) =
&& !defined(__nds32__) \
> +--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:0=
4:29.000000000 +0300
> ++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.=
865831783 +0200
> +@@ -101,6 +101,7 @@
> + #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
> + #if !defined(__arm__)
> + #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && =
!defined(__nds32__) \
>  +      && !defined(__mips64) \
>         && !(defined(__alpha__) && defined(linux)) \
>         && !(defined(__ia64__) && defined(linux)) \
>  =20
> -@@ -708,7 +709,7 @@
> +@@ -721,7 +722,7 @@
>   }
>  =20
> - #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__=
))
> --#    ifdef __arm32__
> -+#    if defined (__arm32__) || defined (__mips64)
> - #     define PORT_SIZE long
> - #    else
> - #     define PORT_SIZE short
> + #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
> +-#ifdef __arm32__
> ++#if defined (__arm32__) || defined (__mips64)
> + #define PORT_SIZE long
> + #else
> + #define PORT_SIZE short
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/r=
ecipes-graphics/xorg-xserver/xserver-xorg.inc
> index 33564eb..9d5e1c2 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The X.Org X server"
>  HOMEPAGE =3D "http://www.x.org"
>  SECTION =3D "x11/base"
>  LICENSE =3D "MIT-X"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f5949=
c00"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbc098b9774ed096943f6c37b5beee=
f13"
> =20
>  # xf86-*-* packages depend on an X server built with the xfree86 DDX
>  # so we have a virtual to represent that:
> @@ -13,7 +13,7 @@ PROVIDES =3D "virtual/xserver-xf86"
>  PROVIDES +=3D "virtual/xserver"
> =20
>  PE =3D "2"
> -INC_PR =3D "r3"
> +INC_PR =3D "r5"
> =20
>  XORG_PN =3D "xorg-server"
>  SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.bz2"
> @@ -48,12 +48,7 @@ PACKAGES =3D+ "${PN}-security-policy \
>               ${PN}-utils \
>               ${PN}-xephyr \
>               ${PN}-multimedia-modules \
> -             ${PN}-extension-dri \
> -             ${PN}-extension-dri2 \
>               ${PN}-extension-glx \
> -             ${PN}-extension-record \
> -             ${PN}-extension-extmod \
> -             ${PN}-extension-dbe \
>               ${PN}-module-libint10 \
>               ${PN}-module-libafb \
>               ${PN}-module-libwfb  \
> @@ -82,12 +77,7 @@ FILES_${PN}-xvfb =3D "${bindir}/Xvfb"
>  FILES_${PN}-utils =3D "${bindir}/scanpci ${bindir}/pcitweak ${bindir}/io=
port ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/gtf =
${bindir}/getconfig ${bindir}/getconfig.pl"
>  FILES_${PN}-xephyr =3D "${bindir}/Xephyr"
>  FILES_${PN}-multimedia-modules =3D "${libdir}/xorg/modules/multimedia/*d=
rv*"
> -FILES_${PN}-extension-dri =3D "${libdir}/xorg/modules/extensions/libdri.=
so"
> -FILES_${PN}-extension-dri2 =3D "${libdir}/xorg/modules/extensions/libdri=
2.so"
>  FILES_${PN}-extension-glx =3D "${libdir}/xorg/modules/extensions/libglx.=
so"
> -FILES_${PN}-extension-record =3D "${libdir}/xorg/modules/extensions/libr=
ecord.so"
> -FILES_${PN}-extension-extmod =3D "${libdir}/xorg/modules/extensions/libe=
xtmod.so"
> -FILES_${PN}-extension-dbe =3D "${libdir}/xorg/modules/extensions/libdbe.=
so"
>  FILES_${PN}-module-libint10 =3D "${libdir}/xorg/modules/libint10.so"
>  FILES_${PN}-module-libafb =3D "${libdir}/xorg/modules/libafb.so"
>  FILES_${PN}-module-libwfb =3D "${libdir}/xorg/modules/libwfb.so"
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb b/=
meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> similarity index 56%
> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> index 4739ee2..8ad87b8 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> @@ -4,10 +4,9 @@ require xserver-xorg.inc
>  SRC_URI +=3D "file://crosscompile.patch \
>              file://fix_open_max_preprocessor_error.patch \
>              file://mips64-compiler.patch \
> -            file://pkgconfig-deps.patch \
>             "
> =20
> -SRC_URI[md5sum] =3D "256325e9b17dff479d92bed97f6b0adb"
> -SRC_URI[sha256sum] =3D "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2893=
092500358a4366fc"
> +SRC_URI[md5sum] =3D "bde3d178b756597d2ec2a19ef60d2e1f"
> +SRC_URI[sha256sum] =3D "548b91cb01087ad4f892428e7ac4955251cf12393e86c704=
20436b33848ef28a"
> =20
>  PR =3D "${INC_PR}.0"
> diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{=
{=3Dmachine}}.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/mac=
hine/{{=3Dmachine}}.conf
> index cbf3c32..1d6143a 100644
> --- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=3Dmac=
hine}}.conf
> +++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=3Dmac=
hine}}.conf
> @@ -43,7 +43,6 @@ PREFERRED_VERSION_{{=3Dpreferred_kernel}} ?=3D "{{=3Dpr=
eferred_kernel_version}}%"
>  {{ if xserver =3D=3D "y": }}
>  PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
>  XSERVER =3D "xserver-xorg \
> -           xserver-xorg-extension-extmod \
>             xf86-input-evdev \
>             xf86-video-fbdev"
> =20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCiPxcACgkQN1Ujt2V2gByIWQCdHIi9CxnAMZgZoIaoHYr673pw
6YkAoJ0ygmzV1VLvOqZNnT5iB5keiVbp
=/gRw
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--
