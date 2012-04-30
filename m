Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOvyW-0004TX-J0
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 21:09:32 +0200
Received: by wera1 with SMTP id a1so2229926wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 11:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fkK0b1mSrn0QsbkrZNPj/CR4TzGHSS7ev1VTDe/ALy0=;
	b=B695TWWV9QubeuNSXgD4I0BtOFLVpnNO05vibi8myhD4DbIdUHkmAhxWu+UFVEn/YP
	qbjGvMa4HsA/a5+kanaek8B3reTMBaCk+Go6NwXKVqspaQ805bNpErK2tHPrQ3+otLYi
	f0bz9rvxpQHJJKGDk/CPbBM/pOLt+vSTbRGzTbhjMZLRybqzW/9nGGpSuWHvusho7cfn
	Oa0qF3V1tJ1KAPZkNzanxCkP6DXGr48Mqj0TtG9IXVmSWqxUNe7DRpl2MHrwf7oOYCf+
	k87Al9CRUftYzN5bbb2jNhnyX4njCu+BVPamC581ge9JNQYmgbUKrJVTRCygWpP/NdyX
	d8HA==
Received: by 10.180.80.104 with SMTP id q8mr10993907wix.14.1335812390546;
	Mon, 30 Apr 2012 11:59:50 -0700 (PDT)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	ev10sm30256529wid.10.2012.04.30.11.59.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 11:59:47 -0700 (PDT)
Date: Mon, 30 Apr 2012 20:59:47 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120430185947.GG3664@jama.jama.net>
References: <cover.1335734193.git.Martin.Jansa@gmail.com>
	<aaa5eab3838d2b85d4e1316afdd91d354527ae20.1335734193.git.Martin.Jansa@gmail.com>
	<4F9EBCFB.3030103@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F9EBCFB.3030103@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glib-2.0: upgrade to 2.32.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 19:09:32 -0000
X-Groupsio-MsgNum: 21354
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline

--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 09:25:31AM -0700, Saul Wold wrote:
> On 04/29/2012 02:27 PM, Martin Jansa wrote:
> > * g_once_init_enter.patch shouldn't be needed after upstream commit
> >    794c1a30bc27b4c8d77537813acb1213d5ac80f2
> >
> > * LIC_FILES_CHKSUM change is only because PCRE was upgraded and now
> >    pcre.h says "Copyright (c) 1997-2012 University of Cambridge" instead
> >    of 2010 and COPYING file
> >    "Please see the file LICENCE in the PCRE distribution for licensing
> >    details."  but LICENSE file is not part of glib distribution (but st=
ill
> >    BSD in standalone PCRE)
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../glib-2.0/glib-2.0/configure-libtool.patch      |   54 +++++++++++=
+++------
> >   .../glib-2.0/glib-2.0/g_once_init_enter.patch      |   24 ---------
> >   .../{glib-2.0_2.30.3.bb =3D>  glib-2.0_2.32.1.bb}     |    6 +--
> >   meta/recipes-core/glib-2.0/glib.inc                |    2 +-
> >   4 files changed, 41 insertions(+), 45 deletions(-)
> >   delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/g_once_init_en=
ter.patch
> >   rename meta/recipes-core/glib-2.0/{glib-2.0_2.30.3.bb =3D>  glib-2.0_=
2.32.1.bb} (91%)
> >
> Martin:
>=20
> Did you see any issue similar to what was reported in=20
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2369?
>=20
> There is a new alignment check at configure time requiring updating the=
=20
> site file?

not while building, but in runtime I've seen some
Floating point exceptions where I'm not sure if they are caused by new
gcc or glib or something completely different if that's what reporter meant=
 by=20
"div0 crashes in glib"

so probably worth trying

>=20
> Sau!
>=20
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> > index c21e378..1d69a3f 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0/configure-libtool.patch
> > @@ -1,15 +1,31 @@
> > -# Poky renames libtool to $host_alias-libtool.
> > -# ./$host_alias-libtool isn't created until after configure runs with =
libtool>=3D 2.2.2
> > -# so we can't call # it at this point. We can safely assume a version =
is available
> > -# from PATH though
> > -# Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com>
> > +From 1c5718648d49e795efee91c220a2bf9386c184f2 Mon Sep 17 00:00:00 2001
> > +From: Martin Jansa<Martin.Jansa@gmail.com>
> > +Date: Sat, 28 Apr 2012 18:24:50 +0200
> > +Subject: [PATCH] configure: use $host_alias-libtool instead of libtool
> > + directly
> > +
> > +Poky renames libtool to $host_alias-libtool.
> > +./$host_alias-libtool isn't created until after configure runs with
> > +libtool>=3D 2.2.2
> > +so we can't call # it at this point. We can safely assume a version is
> > +available
> > +from PATH though
> > +
> > +Rebased to glib-2.27.3 by Dongxiao Xu<dongxiao.xu@intel.com>
> > +Rebased to glib-2.32.1 by Martin Jansa<Martin.Jansa@gmail.com>
> >
> >   Upstream-Status: Inappropriate [configuration]
> >
> > -diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/configure.ac
> > ---- glib-2.27.3-orig/configure.ac	2010-11-03 11:02:05.000000000 +0800
> > -+++ glib-2.27.3/configure.ac	2010-11-16 12:38:12.610485990 +0800
> > -@@ -1385,7 +1385,7 @@
> > +Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > +---
> > + configure.ac |    8 ++++----
> > + 1 files changed, 4 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index a6478c6..9a93d60 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -1470,7 +1470,7 @@ if test x"$glib_native_win32" =3D xyes; then
> >      G_MODULE_LDFLAGS=3D
> >    else
> >      export SED
> > @@ -18,16 +34,19 @@ diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3=
/configure.ac
> >    fi
> >    dnl G_MODULE_IMPL=3D don't reset, so cmd-line can override
> >    G_MODULE_NEED_USCORE=3D0
> > -@@ -1450,7 +1450,7 @@
> > +@@ -1535,9 +1535,9 @@ if test "$G_MODULE_IMPL" =3D "G_MODULE_IMPL_DL";=
 then
> >    	LDFLAGS=3D"$LDFLAGS $G_MODULE_LDFLAGS"
> >    dnl *** check for OSF1/5.0 RTLD_GLOBAL brokenness
> >    	echo "void glib_plugin_test(void) { }">  plugin.c
> > --	${SHELL} ./libtool --mode=3Dcompile ${CC} -shared \
> > -+	${SHELL} ./$host_alias-libtool --mode=3Dcompile ${CC} -shared \
> > - 		-export-dynamic -o plugin.o plugin.c 2>&1>/dev/null
> > - 	AC_CACHE_CHECK([for RTLD_GLOBAL brokenness],
> > - 		glib_cv_rtldglobal_broken,[
> > -@@ -1524,7 +1524,7 @@
> > +-	${SHELL} ./libtool --mode=3Dcompile --tag=3DCC ${CC} ${CFLAGS} \
> > ++	${SHELL} ./$host_alias-libtool --mode=3Dcompile --tag=3DCC ${CC} ${C=
FLAGS} \
> > + 		${CPPFLAGS} -c -o plugin.lo plugin.c>/dev/null 2>&1
> > +-	${SHELL} ./libtool --mode=3Dlink --tag=3DCC ${CC} ${CFLAGS} \
> > ++	${SHELL} ./$host_alias-libtool --mode=3Dlink --tag=3DCC ${CC} ${CFLA=
GS} \
> > + 		${LDFLAGS} -module -o plugin.la -export-dynamic \
> > + 		-shrext ".o" -avoid-version plugin.lo \
> > + 		-rpath /dont/care>/dev/null 2>&1
> > +@@ -1614,7 +1614,7 @@ fi
> >
> >    AC_MSG_CHECKING(for the suffix of module shared libraries)
> >    export SED
> > @@ -36,3 +55,6 @@ diff -ruN glib-2.27.3-orig/configure.ac glib-2.27.3/c=
onfigure.ac
> >    eval $shrext_cmds
> >    module=3Dyes eval std_shrext=3D$shrext_cmds
> >    # chop the initial dot
> > +--
> > +1.7.8.6
> > +
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patc=
h b/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
> > deleted file mode 100644
> > index 2eaa19b..0000000
> > --- a/meta/recipes-core/glib-2.0/glib-2.0/g_once_init_enter.patch
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -fix g_once_init_enter compile failure
> > -
> > -Kernelshark trips over a compile bug in glib-2.0 addressed by Open Emb=
edded
> > -back in the 2.22 timeframe. It appears to still be present in 2.27.
> > -
> > -http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/=
msg005
> > -
> > -Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> > -
> > -Upstream-Status: Pending
> > -
> > -Index: glib-2.27.5/glib/gthread.h
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > ---- glib-2.27.5.orig/glib/gthread.h
> > -+++ glib-2.27.5/glib/gthread.h
> > -@@ -344,7 +344,7 @@ void                    g_once_init_leav
> > - G_INLINE_FUNC gboolean
> > - g_once_init_enter (volatile gsize *value_location)
> > - {
> > --  if G_LIKELY ((gpointer) g_atomic_pointer_get (value_location) !=3D =
NULL)
> > -+  if G_LIKELY ((gpointer) g_atomic_pointer_get ((volatile gpointer *)=
value_location) !=3D NULL)
> > -     return FALSE;
> > -   else
> > -     return g_once_init_enter_impl (value_location);
> > diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb b/meta/recip=
es-core/glib-2.0/glib-2.0_2.32.1.bb
> > similarity index 91%
> > rename from meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
> > rename to meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
> > index f1f9217..354620f 100644
> > --- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.3.bb
> > +++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.1.bb
> > @@ -1,6 +1,5 @@
> >   require glib.inc
> >
> > -PR =3D "r1"
> >   PE =3D "1"
> >
> >   DEPENDS +=3D "libffi python-argparse-native zlib"
> > @@ -12,12 +11,11 @@ SHRT_VER =3D "${@d.getVar('PV',1).split('.')[0]}.${=
@d.getVar('PV',1).split('.')[1]
> >   SRC_URI =3D "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
> >              file://configure-libtool.patch \
> >              file://60_wait-longer-for-threads-to-die.patch \
> > -           file://g_once_init_enter.patch \
> >              file://glib-2.0_fix_for_x32.patch \
> >              file://nodbus.patch \
> >             "
> > -SRC_URI[md5sum] =3D "0f9fa329c6c1012d0fd861ad3d8a4520"
> > -SRC_URI[sha256sum] =3D "e6cbb27c71c445993346e785e8609cc75cea2941e32312=
e544872feba572dd27"
> > +SRC_URI[md5sum] =3D "032c7cf9868c9aa186b490b155a41144"
> > +SRC_URI[sha256sum] =3D "484d5b7fc09f3fa398355adaf74b369768f5859866c299=
f229c99721990f8398"
> >
> >   # Only apply this patch for target recipe on uclibc
> >   SRC_URI_append_libc-uclibc =3D " ${@['', 'file://no-iconv.patch']['${=
PN}' =3D=3D '${BPN}']}"
> > diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/gl=
ib-2.0/glib.inc
> > index 835743a..33f7613 100644
> > --- a/meta/recipes-core/glib-2.0/glib.inc
> > +++ b/meta/recipes-core/glib-2.0/glib.inc
> > @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd=
002f49e7bb854063f7e7 \
> >                       file://gmodule/COPYING;md5=3D3bf50002aefd002f49e7=
bb854063f7e7 \
> >                       file://gmodule/gmodule.h;startline=3D4;endline=3D=
17;md5=3D76ab161b37202cd004073c42fac276ed \
> >                       file://glib/pcre/COPYING;md5=3D266ebc3ff74ee9ce6f=
ad65577667c0f4 \
> > -                    file://glib/pcre/pcre.h;startline=3D11;endline=3D3=
5;md5=3Dce867cf87ebbd2bb55e980d90328390d \
> > +                    file://glib/pcre/pcre.h;startline=3D11;endline=3D3=
5;md5=3D2ffb79f0a0933f282f4f36cda635683d \
> >                       file://docs/reference/COPYING;md5=3Df51a5100c17af=
6bae00735cd791e1fcc"
> >   BUGTRACKER =3D "http://bugzilla.gnome.org"
> >   SECTION =3D "libs"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+e4SMACgkQN1Ujt2V2gBybhgCgsvbdA8FazP4Qc3NAl0ptvE5Q
3eIAoK2lRN0r444WJkegz0Gn2BHYW+b/
=VWln
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
