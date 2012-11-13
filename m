Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYGFh-000891-2q
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 14:10:05 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so2752948bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2012 04:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+I5uOH9yH82J4zoXVjLu06b/I4R9wCxMpu7uiCC09qY=;
	b=sJBzXDw+djWMoHo9OEqZKEThMHXf2SUUzKBRTr2lysIrsX233eTkaEtV6U6WkXQENM
	CSpMIrAdy4kenjY7oxpNV7SqeRL0lxtnVC1tWJPU61EveQXwqwMWKMuM7o8zv1WVxKKO
	qCBlZrl772nUBSwtKZ030Ux3HyVu/nUaB/G2/NYZEV0ePLhOkYMZBOrrLs2omnN5nC0H
	l2NMm17x6AcH8/0K1ExxasYhbaT9s7xsBj8TYGGIeQnA4KjTLPV2NCfjaYSg1ZniZmT+
	4VPDxo4xa+6WmDZI/kBleyUiDrC+oSAMi1hDZ86nakHbIvjm+NvtzXHK+x4mQFKR+eKu
	rkUQ==
Received: by 10.204.147.141 with SMTP id l13mr1765884bkv.43.1352811370837;
	Tue, 13 Nov 2012 04:56:10 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id go4sm5144554bkc.15.2012.11.13.04.56.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Nov 2012 04:56:09 -0800 (PST)
Date: Tue, 13 Nov 2012 13:56:20 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Message-ID: <20121113125620.GE3928@jama.jama.net>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
	<2964a05f2b16c3c55862251ab0d509d258c57d19.1352808309.git.laurentiu.palcu@intel.com>
	<20121113123743.GC3928@jama.jama.net> <50A241E4.9050801@intel.com>
MIME-Version: 1.0
In-Reply-To: <50A241E4.9050801@intel.com>
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
X-List-Received-Date: Tue, 13 Nov 2012 13:10:05 -0000
X-Groupsio-MsgNum: 31245
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline

--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 02:49:40PM +0200, Laurentiu Palcu wrote:
>=20
>=20
> On 11/13/2012 02:37 PM, Martin Jansa wrote:
> > On Tue, Nov 13, 2012 at 02:18:25PM +0200, Laurentiu Palcu wrote:
> >> The patch contains several aditional changes:
> >>  * removed one backported patch (included in the new release);
> >>  * changed mips64-compiler.patch to apply properly;
> >>  * licence checksum for COPYING file changed: some copyright years have
> >>    been changed
> >>
> >> The following external modules are now built-in:
> >>  * DBE
> >>  * DRI2
> >>  * DRI
> >>  * RECORD
> >=20
> > Can you also say why?
> This was done upstream. I just updated the recipe accordingly.

OK then you're missing RREPLACES/RCONFLICTS/RPROVIDES for them in PN.

Cheers,

> > And is this patch for oe-core or poky? because meta-yocto-bsp does not
> > belong here.
> You are right, I included the meta-yocto-bsp changes by mistake... I'll
> resend a new patchset.
>=20
> >=20
> > Cheers,
> >=20
> >>
> >> The extmod module was completely removed.
> >>
> >> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> >> ---
> >>  meta-yocto-bsp/conf/machine/atom-pc.conf           |    3 -
> >>  meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf      |    1 -
> >>  meta-yocto-bsp/conf/machine/routerstationpro.conf  |    1 -
> >>  meta/conf/machine/include/ia32-base.inc            |    5 +-
> >>  .../xserver-xorg-1.11.4/pkgconfig-deps.patch       |   70 -----------=
---------
> >>  .../crosscompile.patch                             |    0
> >>  .../fix_open_max_preprocessor_error.patch          |    0
> >>  .../macro_tweak.patch                              |    0
> >>  .../mips64-compiler.patch                          |   28 ++++----
> >>  .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   14 +---
> >>  ...erver-xorg_1.11.4.bb =3D> xserver-xorg_1.13.0.bb} |    5 +-
> >>  .../arch/powerpc/conf/machine/{{=3Dmachine}}.conf    |    1 -
> >>  12 files changed, 19 insertions(+), 109 deletions(-)
> >>  delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.=
11.4/pkgconfig-deps.patch
> >>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> x=
server-xorg-1.13.0}/crosscompile.patch (100%)
> >>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> x=
server-xorg-1.13.0}/fix_open_max_preprocessor_error.patch (100%)
> >>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> x=
server-xorg-1.13.0}/macro_tweak.patch (100%)
> >>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg-1.11.4 =3D> x=
server-xorg-1.13.0}/mips64-compiler.patch (42%)
> >>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.11.4.bb =3D=
> xserver-xorg_1.13.0.bb} (56%)
> >>
> >> diff --git a/meta-yocto-bsp/conf/machine/atom-pc.conf b/meta-yocto-bsp=
/conf/machine/atom-pc.conf
> >> index 46bc71b..77dd7fb 100644
> >> --- a/meta-yocto-bsp/conf/machine/atom-pc.conf
> >> +++ b/meta-yocto-bsp/conf/machine/atom-pc.conf
> >> @@ -13,10 +13,7 @@ PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
> >>  PREFERRED_VERSION_linux-yocto ?=3D "3.0%"
> >>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> >>  XSERVER ?=3D "xserver-xorg \
> >> -           xserver-xorg-extension-dri2 \
> >>             xserver-xorg-extension-glx \
> >> -           xserver-xorg-extension-extmod \
> >> -           xserver-xorg-extension-dbe \
> >>             xf86-input-mouse \
> >>             xf86-input-keyboard \
> >>             xf86-input-evdev \
> >> diff --git a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf b/meta-yoct=
o-bsp/conf/machine/mpc8315e-rdb.conf
> >> index 7aa498d..252f4cc 100644
> >> --- a/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> >> +++ b/meta-yocto-bsp/conf/machine/mpc8315e-rdb.conf
> >> @@ -19,7 +19,6 @@ PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
> >> =20
> >>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> >>  XSERVER ?=3D "xserver-xorg \
> >> -            xserver-xorg-extension-extmod \
> >>              xf86-input-evdev \
> >>              xf86-video-fbdev"
> >> =20
> >> diff --git a/meta-yocto-bsp/conf/machine/routerstationpro.conf b/meta-=
yocto-bsp/conf/machine/routerstationpro.conf
> >> index feaa26e..e5e4d1a 100644
> >> --- a/meta-yocto-bsp/conf/machine/routerstationpro.conf
> >> +++ b/meta-yocto-bsp/conf/machine/routerstationpro.conf
> >> @@ -14,7 +14,6 @@ PREFERRED_VERSION_linux-yocto ?=3D "3.4%"
> >> =20
> >>  PREFERRED_PROVIDER_virtual/xserver ?=3D "xserver-xorg"
> >>  XSERVER ?=3D "xserver-xorg \
> >> -            xserver-xorg-extension-extmod \
> >>              xf86-input-evdev \
> >>              xf86-video-fbdev"
> >> =20
> >> diff --git a/meta/conf/machine/include/ia32-base.inc b/meta/conf/machi=
ne/include/ia32-base.inc
> >> index 4b10183..c2d267a 100644
> >> --- a/meta/conf/machine/include/ia32-base.inc
> >> +++ b/meta/conf/machine/include/ia32-base.inc
> >> @@ -33,11 +33,8 @@ XSERVER_IA32_BASE =3D "xserver-xorg \
> >>             xf86-input-synaptics \
> >>             "
> >> =20
> >> -XSERVER_IA32_EXT =3D "xserver-xorg-extension-dri \
> >> -           xserver-xorg-extension-dri2 \
> >> +XSERVER_IA32_EXT =3D "
> >>             xserver-xorg-extension-glx \
> >> -           xserver-xorg-extension-extmod \
> >> -           xserver-xorg-extension-dbe \
> >>             xserver-xorg-module-libint10 \
> >>             "
> >> =20
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pk=
gconfig-deps.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4=
/pkgconfig-deps.patch
> >> deleted file mode 100644
> >> index fee8d76..0000000
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/pkgconfig=
-deps.patch
> >> +++ /dev/null
> >> @@ -1,70 +0,0 @@
> >> -Upstream-Status: Backport
> >> -Signed-off-by: Ross Burton <ross.burton@intel.com>
> >> -
> >> -commit 41d903918a5721e53ed694880eab44170f9717cc
> >> -Author: Jeremy Huddleston <jeremyhu@apple.com>
> >> -Date:   Wed Sep 14 13:45:18 2011 -0500
> >> -
> >> -    xorg-server.pc.in: Remove libpciaccess and pixman-1 from Requires
> >> -   =20
> >> -    Every module building against xorg-server does not *Require* pixm=
an nor
> >> -    libpciaccess.  If such modules need pixman or pciaccess, they sho=
uld be
> >> -    depending on them directly rather than inheriting a dependency fr=
om
> >> -    xorg-server.  To do this, they should use PKG_CHECK_MODULES in co=
nfigure.ac
> >> -    to check for pixman-1 or pciaccess and include the apporpriate _L=
IBS variable
> >> -    to the appropriate _LDFLAGS variable in Makefile.am
> >> -   =20
> >> -    This also moves pixman-1 to Requires.private, so CPPFLAGS is set =
right to
> >> -    to satisfy include dependencies but avoid linking needlessly.
> >> -   =20
> >> -    Signed-off-by: Jeremy Huddleston <jeremyhu@apple.com>
> >> -    Reviewed-by: Gaetan Nadon <memsize@videotron.ca>
> >> -
> >> -diff --git a/configure.ac b/configure.ac
> >> -index 50beb01..4bfa82c 100644
> >> ---- a/configure.ac
> >> -+++ b/configure.ac
> >> -@@ -780,11 +780,6 @@ VIDMODEPROTO=3D"xf86vidmodeproto >=3D 2.2.99.1"
> >> - WINDOWSWMPROTO=3D"windowswmproto"
> >> - APPLEWMPROTO=3D"applewmproto >=3D 1.4"
> >> -=20
> >> --dnl Core modules for most extensions, et al.
> >> --SDK_REQUIRED_MODULES=3D"[xproto >=3D 7.0.22] [randrproto >=3D 1.2.99=
=2E3] [renderproto >=3D 0.11] [xextproto >=3D 7.1.99] [inputproto >=3D 1.9.=
99.902] [kbproto >=3D 1.0.3] fontsproto"
> >> --# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> >> --AC_SUBST(SDK_REQUIRED_MODULES)
> >> --
> >> - dnl List of libraries that require a specific version
> >> - LIBAPPLEWM=3D"applewm >=3D 1.4"
> >> - LIBDMX=3D"dmx >=3D 1.0.99.1"
> >> -@@ -806,6 +801,11 @@ dnl specific modules against it
> >> - PKG_CHECK_MODULES(PIXMAN, $LIBPIXMAN)
> >> - REQUIRED_LIBS=3D"$REQUIRED_LIBS $LIBPIXMAN $LIBXFONT xau"
> >> -=20
> >> -+dnl Core modules for most extensions, et al.
> >> -+SDK_REQUIRED_MODULES=3D"[xproto >=3D 7.0.22] [randrproto >=3D 1.2.99=
=2E3] [renderproto >=3D 0.11] [xextproto >=3D 7.1.99] [inputproto >=3D 1.99=
=2E99.902] [kbproto >=3D 1.0.3] fontsproto $LIBPIXMAN"
> >> -+# Make SDK_REQUIRED_MODULES available for inclusion in xorg-server.pc
> >> -+AC_SUBST(SDK_REQUIRED_MODULES)
> >> -+
> >> - REQUIRED_MODULES=3D"[fixesproto >=3D 5.0] [damageproto >=3D 1.1] [xc=
miscproto >=3D 1.2.0] [xtrans >=3D 1.2.2] [bigreqsproto >=3D 1.1.0] $SDK_RE=
QUIRED_MODULES"
> >> -=20
> >> - if test "x$CONFIG_UDEV" =3D xyes &&
> >> -@@ -1583,6 +1583,7 @@ if test "x$XORG" =3D xyes; then
> >> - 	if test "x$PCI" =3D xyes; then
> >> -=20
> >> - 	PKG_CHECK_MODULES([PCIACCESS], $LIBPCIACCESS)
> >> -+	SDK_REQUIRED_MODULES=3D"$SDK_REQUIRED_MODULES $LIBPCIACCESS"
> >> -	SAVE_LIBS=3D$LIBS
> >> -	SAVE_CFLAGS=3D$CFLAGS
> >> -	CFLAGS=3D$PCIACCESS_CFLAGS
> >> -diff --git a/xorg-server.pc.in b/xorg-server.pc.in
> >> -index fb238b5..a98eca8 100644
> >> ---- a/xorg-server.pc.in
> >> -+++ b/xorg-server.pc.in
> >> -@@ -15,7 +15,6 @@ abi_extension=3D@abi_extension@
> >> - Name: xorg-server
> >> - Description: Modular X.Org X Server
> >> - Version: @PACKAGE_VERSION@
> >> --Requires: pixman-1 pciaccess
> >> - Requires.private: @SDK_REQUIRED_MODULES@
> >> - Cflags: -I${sdkdir} @symbol_visibility@
> >> - Libs: -L${libdir}
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/cr=
osscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/c=
rosscompile.patch
> >> similarity index 100%
> >> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/cro=
sscompile.patch
> >> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/cross=
compile.patch
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fi=
x_open_max_preprocessor_error.patch b/meta/recipes-graphics/xorg-xserver/xs=
erver-xorg-1.13.0/fix_open_max_preprocessor_error.patch
> >> similarity index 100%
> >> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/fix=
_open_max_preprocessor_error.patch
> >> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/fix_o=
pen_max_preprocessor_error.patch
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/ma=
cro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/ma=
cro_tweak.patch
> >> similarity index 100%
> >> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mac=
ro_tweak.patch
> >> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/macro=
_tweak.patch
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mi=
ps64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.=
0/mips64-compiler.patch
> >> similarity index 42%
> >> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mip=
s64-compiler.patch
> >> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips6=
4-compiler.patch
> >> index e6bc95b..168368e 100644
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.4/mips64-co=
mpiler.patch
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.13.0/mips64-co=
mpiler.patch
> >> @@ -6,24 +6,24 @@ This patch choses the right values for mips64
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> =20
> >>  Upstream-Status: Pending
> >> -Index: xorg-server-1.11.2/hw/xfree86/common/compiler.h
> >> +Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
> >>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> ---- xorg-server-1.11.2.orig/hw/xfree86/common/compiler.h	2012-05-10 1=
2:19:59.485599046 -0700
> >> -+++ xorg-server-1.11.2/hw/xfree86/common/compiler.h	2012-05-10 12:20:=
53.109602488 -0700
> >> -@@ -104,6 +104,7 @@
> >> -=20
> >> - #  if !defined(__arm__)
> >> - #   if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32_=
_) && !defined(__nds32__) \
> >> +--- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 2=
3:04:29.000000000 +0300
> >> ++++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:=
50.865831783 +0200
> >> +@@ -101,6 +101,7 @@
> >> + #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
> >> + #if !defined(__arm__)
> >> + #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) =
&& !defined(__nds32__) \
> >>  +      && !defined(__mips64) \
> >>         && !(defined(__alpha__) && defined(linux)) \
> >>         && !(defined(__ia64__) && defined(linux)) \
> >>  =20
> >> -@@ -708,7 +709,7 @@
> >> +@@ -721,7 +722,7 @@
> >>   }
> >>  =20
> >> - #   elif defined(__mips__) || (defined(__arm32__) && !defined(__linu=
x__))
> >> --#    ifdef __arm32__
> >> -+#    if defined (__arm32__) || defined (__mips64)
> >> - #     define PORT_SIZE long
> >> - #    else
> >> - #     define PORT_SIZE short
> >> + #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__=
))
> >> +-#ifdef __arm32__
> >> ++#if defined (__arm32__) || defined (__mips64)
> >> + #define PORT_SIZE long
> >> + #else
> >> + #define PORT_SIZE short
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/met=
a/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >> index 33564eb..9d5e1c2 100644
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> >> @@ -2,7 +2,7 @@ DESCRIPTION =3D "The X.Org X server"
> >>  HOMEPAGE =3D "http://www.x.org"
> >>  SECTION =3D "x11/base"
> >>  LICENSE =3D "MIT-X"
> >> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D74df27b6254cc88d2799b5f4f5=
949c00"
> >> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbc098b9774ed096943f6c37b5b=
eeef13"
> >> =20
> >>  # xf86-*-* packages depend on an X server built with the xfree86 DDX
> >>  # so we have a virtual to represent that:
> >> @@ -13,7 +13,7 @@ PROVIDES =3D "virtual/xserver-xf86"
> >>  PROVIDES +=3D "virtual/xserver"
> >> =20
> >>  PE =3D "2"
> >> -INC_PR =3D "r3"
> >> +INC_PR =3D "r5"
> >> =20
> >>  XORG_PN =3D "xorg-server"
> >>  SRC_URI =3D "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.b=
z2"
> >> @@ -48,12 +48,7 @@ PACKAGES =3D+ "${PN}-security-policy \
> >>               ${PN}-utils \
> >>               ${PN}-xephyr \
> >>               ${PN}-multimedia-modules \
> >> -             ${PN}-extension-dri \
> >> -             ${PN}-extension-dri2 \
> >>               ${PN}-extension-glx \
> >> -             ${PN}-extension-record \
> >> -             ${PN}-extension-extmod \
> >> -             ${PN}-extension-dbe \
> >>               ${PN}-module-libint10 \
> >>               ${PN}-module-libafb \
> >>               ${PN}-module-libwfb  \
> >> @@ -82,12 +77,7 @@ FILES_${PN}-xvfb =3D "${bindir}/Xvfb"
> >>  FILES_${PN}-utils =3D "${bindir}/scanpci ${bindir}/pcitweak ${bindir}=
/ioport ${bindir}/in[bwl] ${bindir}/out[bwl] ${bindir}/mmap[rw] ${bindir}/g=
tf ${bindir}/getconfig ${bindir}/getconfig.pl"
> >>  FILES_${PN}-xephyr =3D "${bindir}/Xephyr"
> >>  FILES_${PN}-multimedia-modules =3D "${libdir}/xorg/modules/multimedia=
/*drv*"
> >> -FILES_${PN}-extension-dri =3D "${libdir}/xorg/modules/extensions/libd=
ri.so"
> >> -FILES_${PN}-extension-dri2 =3D "${libdir}/xorg/modules/extensions/lib=
dri2.so"
> >>  FILES_${PN}-extension-glx =3D "${libdir}/xorg/modules/extensions/libg=
lx.so"
> >> -FILES_${PN}-extension-record =3D "${libdir}/xorg/modules/extensions/l=
ibrecord.so"
> >> -FILES_${PN}-extension-extmod =3D "${libdir}/xorg/modules/extensions/l=
ibextmod.so"
> >> -FILES_${PN}-extension-dbe =3D "${libdir}/xorg/modules/extensions/libd=
be.so"
> >>  FILES_${PN}-module-libint10 =3D "${libdir}/xorg/modules/libint10.so"
> >>  FILES_${PN}-module-libafb =3D "${libdir}/xorg/modules/libafb.so"
> >>  FILES_${PN}-module-libwfb =3D "${libdir}/xorg/modules/libwfb.so"
> >> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb=
 b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> >> similarity index 56%
> >> rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> >> rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> >> index 4739ee2..8ad87b8 100644
> >> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.4.bb
> >> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.13.0.bb
> >> @@ -4,10 +4,9 @@ require xserver-xorg.inc
> >>  SRC_URI +=3D "file://crosscompile.patch \
> >>              file://fix_open_max_preprocessor_error.patch \
> >>              file://mips64-compiler.patch \
> >> -            file://pkgconfig-deps.patch \
> >>             "
> >> =20
> >> -SRC_URI[md5sum] =3D "256325e9b17dff479d92bed97f6b0adb"
> >> -SRC_URI[sha256sum] =3D "3e2935bc400612df58d5b5e6840829e2c63af02c2e7d2=
893092500358a4366fc"
> >> +SRC_URI[md5sum] =3D "bde3d178b756597d2ec2a19ef60d2e1f"
> >> +SRC_URI[sha256sum] =3D "548b91cb01087ad4f892428e7ac4955251cf12393e86c=
70420436b33848ef28a"
> >> =20
> >>  PR =3D "${INC_PR}.0"
> >> diff --git a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machin=
e/{{=3Dmachine}}.conf b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/=
machine/{{=3Dmachine}}.conf
> >> index cbf3c32..1d6143a 100644
> >> --- a/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=3D=
machine}}.conf
> >> +++ b/scripts/lib/bsp/substrate/target/arch/powerpc/conf/machine/{{=3D=
machine}}.conf
> >> @@ -43,7 +43,6 @@ PREFERRED_VERSION_{{=3Dpreferred_kernel}} ?=3D "{{=
=3Dpreferred_kernel_version}}%"
> >>  {{ if xserver =3D=3D "y": }}
> >>  PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> >>  XSERVER =3D "xserver-xorg \
> >> -           xserver-xorg-extension-extmod \
> >>             xf86-input-evdev \
> >>             xf86-video-fbdev"
> >> =20
> >> --=20
> >> 1.7.9.5
> >>
> >>
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCiQ3QACgkQN1Ujt2V2gBwScwCfRo7FsEsDWCD9YUo2eePHO06v
3jsAoLU3mW1KJV47rOMjp5LNmsKgxE/n
=W2qm
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
