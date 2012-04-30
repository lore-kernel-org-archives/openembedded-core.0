Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOvsN-0004KV-M7
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 21:03:11 +0200
Received: by wera1 with SMTP id a1so2226012wer.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 11:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WvKCvIIGizwGxUjgJ8iKoTJEpgMqg8hOnZhGzog5qbM=;
	b=kdXUDnNQ2wVYdDqJV4226C5OQyj7iiGQOfkp0fbMf2G/4aS44nHdADWVlDsggBX0TU
	IVWCAFrgIPD6iURSND81NzIr/dKfI1XpKX9dgtVTPcJCTdwq0UNIJS8kUgkLOJaqX9bG
	jQDQKY/s0w/gNYntxeudZrmQj7BDD8acMLNpeZiSFsiIzupVmA3hECwuxmHP+KgUpC9w
	j8o+pS3ZMujMaTuZBkEQOqjWes3W94hfAmPFtWBNrGa2XGZbbDcA7X+F93/YPSkZVkR0
	FvrgeoxKRYEQmYwaYIk6/uoWqdTpNvcBiz1HLut1PJSQPaTITcqGS7WFyDI9bC+Am5Oi
	6IOA==
Received: by 10.216.210.138 with SMTP id u10mr472654weo.11.1335812009274;
	Mon, 30 Apr 2012 11:53:29 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ea6sm30198850wib.5.2012.04.30.11.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Apr 2012 11:53:27 -0700 (PDT)
Date: Mon, 30 Apr 2012 20:53:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120430185327.GF3664@jama.jama.net>
References: <1335782052.7415.1.camel@ted>
	<CAMKF1spqp12AKBB1FLESE+WbzFb4sBf=J18aDNhYKRbYZoQECQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spqp12AKBB1FLESE+WbzFb4sBf=J18aDNhYKRbYZoQECQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] qt-4.8.1: Fix compile failures on qemux86
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
X-List-Received-Date: Mon, 30 Apr 2012 19:03:11 -0000
X-Groupsio-MsgNum: 21353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IvGM3kKqwtniy32b"
Content-Disposition: inline

--IvGM3kKqwtniy32b
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 30, 2012 at 07:34:58AM -0700, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 3:34 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.1.inc b/meta/recipes-qt/qt4/qt-=
4.8.1.inc
> > index b42ca01..8c38cae 100644
> > --- a/meta/recipes-qt/qt4/qt-4.8.1.inc
> > +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
> > @@ -21,6 +21,7 @@ SRC_URI =3D "http://get.qt.nokia.com/qt/source/qt-eve=
rywhere-opensource-src-${PV}.
> > =A0 =A0 =A0 =A0 =A0 =A0file://g++.conf \
> > =A0 =A0 =A0 =A0 =A0 =A0file://linux.conf \
> > =A0 =A0 =A0 =A0 =A0 =A0file://gcc47-fix.patch \
> > + =A0 =A0 =A0 =A0 =A0 file://gcc47-fix2.patch \
> > =A0 =A0 =A0 =A0 =A0 =A0file://disable-fuse-gold-flag.patch \
> > =A0 =A0 =A0 =A0 =A0 =A0"
> >
> > diff --git a/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch b/meta/recip=
es-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> > new file mode 100644
> > index 0000000..09513b6
> > --- a/dev/null
> > +++ b/meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix2.patch
> > @@ -0,0 +1,50 @@
> > +Fixes for gcc 4.7.0, particularly on qemux86
> > +
> > +Origin: upstream, http://trac.webkit.org/changeset/93631
> > +Origin: upstream, http://trac.webkit.org/changeset/113848
> > +
> > +Bug: https://bugs.webkit.org/show_bug.cgi?id=3D62168
> > +Bug: https://bugs.webkit.org/show_bug.cgi?id=3D83584
> > +
> > +RP 2012/04/30
> > +
> > +Upstream-Status: Backport
> > +
>=20
> looks good. Are we able to build QT 4.8.x now

FWIW: with qemux86-64 and current gcc-4.7 I was able to build
qt4-x11-free-4.8.1 even before this patch.

>=20
> > +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/W=
ebCore/dom/Element.cpp
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source=
/WebCore/dom/Element.cpp 2012-04-30 09:15:17.000000000 +0000
> > ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebC=
ore/dom/Element.cpp =A0 =A0 =A02012-04-30 09:22:04.586008994 +0000
> > +@@ -1080,7 +1080,7 @@
> > + {
> > + =A0 =A0 // Ref currentStyle in case it would otherwise be deleted whe=
n setRenderStyle() is called.
> > + =A0 =A0 RefPtr<RenderStyle> currentStyle(renderStyle());
> > +- =A0 =A0bool hasParentStyle =3D parentNodeForRenderingAndStyle() ? pa=
rentNodeForRenderingAndStyle()->renderStyle() : false;
> > ++ =A0 =A0bool hasParentStyle =3D parentNodeForRenderingAndStyle() ? st=
atic_cast<bool>(parentNodeForRenderingAndStyle()->renderStyle()) : false;
> > + =A0 =A0 bool hasDirectAdjacentRules =3D currentStyle && currentStyle-=
>childrenAffectedByDirectAdjacentRules();
> > + =A0 =A0 bool hasIndirectAdjacentRules =3D currentStyle && currentStyl=
e->childrenAffectedByForwardPositionalRules();
> > +
> > +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/W=
ebCore/html/HTMLImageElement.cpp
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source=
/WebCore/html/HTMLImageElement.cpp =A0 =A0 =A0 2012-03-14 14:01:19.00000000=
0 +0000
> > ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebC=
ore/html/HTMLImageElement.cpp =A0 =A02012-04-30 09:22:04.586008994 +0000
> > +@@ -74,7 +74,7 @@
> > + =A0 =A0 RefPtr<HTMLImageElement> image =3D adoptRef(new HTMLImageElem=
ent(imgTag, document));
> > + =A0 =A0 if (optionalWidth)
> > + =A0 =A0 =A0 =A0 image->setWidth(*optionalWidth);
> > +- =A0 =A0if (optionalHeight > 0)
> > ++ =A0 =A0if (optionalHeight)
> > + =A0 =A0 =A0 =A0 image->setHeight(*optionalHeight);
> > + =A0 =A0 return image.release();
> > + }
> > +Index: qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/W=
ebCore/platform/graphics/TiledBackingStoreClient.h
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +--- qt-everywhere-opensource-src-4.8.1.orig/src/3rdparty/webkit/Source=
/WebCore/platform/graphics/TiledBackingStoreClient.h =A0 =A0 2012-03-14 14:=
01:24.000000000 +0000
> > ++++ qt-everywhere-opensource-src-4.8.1/src/3rdparty/webkit/Source/WebC=
ore/platform/graphics/TiledBackingStoreClient.h =A02012-04-30 09:22:04.5900=
08963 +0000
> > +@@ -25,6 +25,7 @@
> > + #if ENABLE(TILED_BACKING_STORE)
> > + class TiledBackingStoreClient {
> > + public:
> > ++ =A0 =A0virtual ~TiledBackingStoreClient() { }
> > + =A0 =A0 virtual void tiledBackingStorePaintBegin() =3D 0;
> > + =A0 =A0 virtual void tiledBackingStorePaint(GraphicsContext*, const I=
ntRect&) =3D 0;
> > + =A0 =A0 virtual void tiledBackingStorePaintEnd(const Vector<IntRect>&=
 paintedArea) =3D 0;
> > diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb b/meta/recipes-q=
t/qt4/qt4-embedded_4.8.1.bb
> > index e16264c..668565e 100644
> > --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> > +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
> > @@ -1,7 +1,7 @@
> > =A0require qt-${PV}.inc
> > =A0require qt4-embedded.inc
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> > =A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> >
> > diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb b/meta/recipes-qt/=
qt4/qt4-native_4.8.1.bb
> > index 533b5d6..a2a1dbd 100644
> > --- a/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> > +++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
> > @@ -1,6 +1,6 @@
> > =A0require qt4-native.inc
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> > =A0# Find the g++.conf/linux.conf in the right directory.
> > =A0FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
> > diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb b/meta/re=
cipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> > index c4bd3cf..e17a8ad 100644
> > --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> > +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
> > @@ -1,6 +1,6 @@
> > =A0require qt4-tools-nativesdk.inc
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> > =A0SRC_URI +=3D "file://qmake_pri_fixes.patch"
> >
> > diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb b/meta/recipes-q=
t/qt4/qt4-x11-free_4.8.1.bb
> > index 7afb51f..6978053 100644
> > --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> > +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
> > @@ -1,7 +1,7 @@
> > =A0require qt4-x11-free.inc
> > =A0require qt-${PV}.inc
> >
> > -PR =3D "${INC_PR}.0"
> > +PR =3D "${INC_PR}.1"
> >
> > =A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
> >
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--IvGM3kKqwtniy32b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+e36YACgkQN1Ujt2V2gBzo0wCfYi9OX7yhjkNhPMjxhHb6Zk6s
o4oAn0/FW4z+8JOqOLPsyDAXCc4kqaZa
=PIQX
-----END PGP SIGNATURE-----

--IvGM3kKqwtniy32b--
