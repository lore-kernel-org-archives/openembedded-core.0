Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TOxOo-000650-PA; Thu, 18 Oct 2012 23:13:02 +0200
Received: by mail-wi0-f171.google.com with SMTP id hj13so2354023wib.6
	for <multiple recipients>; Thu, 18 Oct 2012 13:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=et60mCU8mIFFA+Ha/FfX5QCYSKz5he7FGYZLxtEC2VI=;
	b=ryFk4jRnT4rJsq8bNFSRVyBdcUL+rHPo/7GVsSL+P5M4hXGPxN6BUtXbb6M3yyMNv8
	cxMudkSxE7GAa4X8nlmUH51R1UM1WK/onD0GZBYrwD2N0HADejHAaFprki8gmI+rFr1q
	TH14ZWh2yKaD6YgdPiDUsr+jDA+n337LO9qV8hWbCBUf6F/stFgFrBTgOxTSIXsSwqMa
	lSsBU1OPilPCH9hvLMUbaA/mTVXlSf3oLhZyQeAV+bpZS0HzsL476TDXsWcErDhZtryC
	n0qWRrUbR066rvq7v8LjgQ+8HGEU3Yqy/9kX6y+TdlBKS0pOtiqB5aOmqqInfFS+zopO
	FMyg==
Received: by 10.181.13.239 with SMTP id fb15mr13834813wid.22.1350593982604;
	Thu, 18 Oct 2012 13:59:42 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id gm7sm35683528wib.10.2012.10.18.13.59.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 13:59:38 -0700 (PDT)
Date: Thu, 18 Oct 2012 22:59:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Message-ID: <20121018205948.GE3087@jama.jama.net>
References: <1349345672-803-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQePjXEa0o6ziqV7rUVgqWOEoyJPMb1iApbv-9MEJzts0Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gypsy: removed gypsy from meta/recipes-connectivity
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
X-List-Received-Date: Thu, 18 Oct 2012 21:13:02 -0000
X-Groupsio-MsgNum: 30709
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y2zxS2PfCDLh6JVG"
Content-Disposition: inline

--y2zxS2PfCDLh6JVG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 18, 2012 at 08:59:19PM +0200, Martin Jansa wrote:
> I know you've sent
> http://patchwork.openembedded.org/patch/37763/
> to add it to meta-oe, but this patch removed also newer gypsy_0.9.bb
> and only older gypsy_git.bb was added back.
>=20
> Please fix that.

There is also this diff which isn't mentioned in your commit.

-SRCREV =3D "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
+SRCREV =3D "be8c9c382d2d1d37b51d29b0843045121ec90213"
 PV =3D "0.8+git${SRCPV}"
 PR =3D "r2"

@@ -15,4 +15,5 @@
                     file://gypsy/gypsy-time.h;beginline=3D1;endline=3D24;m=
d5=3D06432ea19a7b6607428d04d9dadc37fd"

 SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
-           file://fixups.patch"
+           file://fixups.patch \
+           file://0001-gypsy-m4-directory-missing-from-structure.patch"


>=20
> On Thu, Oct 4, 2012 at 12:14 PM, Andrei Dinu
> <andrei.adrianx.dinu@intel.com> wrote:
> > removed also entry from meta/recipes-gnome/packagegroups/packagegroup-s=
dk-gmae.inc
> >
> > Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> > ---
> >  meta/recipes-connectivity/gypsy/files/fixups.patch |   21 ------------=
-----
> >  meta/recipes-connectivity/gypsy/gypsy.inc          |   15 ------------
> >  meta/recipes-connectivity/gypsy/gypsy_0.9.bb       |   24 ------------=
--------
> >  meta/recipes-connectivity/gypsy/gypsy_git.bb       |   18 ------------=
---
> >  .../packagegroups/packagegroup-sdk-gmae.inc        |    1 -
> >  5 files changed, 79 deletions(-)
> >  delete mode 100644 meta/recipes-connectivity/gypsy/files/fixups.patch
> >  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy.inc
> >  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_0.9.bb
> >  delete mode 100644 meta/recipes-connectivity/gypsy/gypsy_git.bb
> >
> > diff --git a/meta/recipes-connectivity/gypsy/files/fixups.patch b/meta/=
recipes-connectivity/gypsy/files/fixups.patch
> > deleted file mode 100644
> > index de4d92e..0000000
> > --- a/meta/recipes-connectivity/gypsy/files/fixups.patch
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > ----
> > - docs/reference/Makefile.am |    2 ++
> > - 1 file changed, 2 insertions(+)
> > -
> > ---- gypsy.orig/docs/reference/Makefile.am
> > -+++ gypsy/docs/reference/Makefile.am
> > -@@ -81,10 +81,12 @@ expand_content_files=3D
> > - # e.g. GTKDOC_LIBS=3D$(top_builddir)/gtk/$(gtktargetlib)
> > -
> > - INCLUDES=3D-I$(top_srcdir) $(GYPSY_CFLAGS)
> > - GTKDOC_LIBS=3D$(top_builddir)/gypsy/libgypsy.la $(GYPSY_LIBS)
> > -
> > -+EXTRA_DIST =3D
> > -+CLEANFILES =3D
> > - # This includes the standard gtk-doc make rules, copied by gtkdocize.
> > - include $(top_srcdir)/gtk-doc.make
> > -
> > - # Other files to distribute
> > - # e.g. EXTRA_DIST +=3D version.xml.in
> > diff --git a/meta/recipes-connectivity/gypsy/gypsy.inc b/meta/recipes-c=
onnectivity/gypsy/gypsy.inc
> > deleted file mode 100644
> > index 0c1735e..0000000
> > --- a/meta/recipes-connectivity/gypsy/gypsy.inc
> > +++ /dev/null
> > @@ -1,15 +0,0 @@
> > -SUMMARY =3D "GPS Multiplexing Daemon"
> > -DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> > -multiple clients to access GPS data from multiple GPS sources \
> > -concurrently.  Gypsy also hides the details of parsing NMEA from the \
> > -client applications, passing the data as simple values for the clients=
 \
> > -to use."
> > -LICENSE =3D "GPLv2.0 & LGPLv2.1"
> > -SECTION =3D "x11"
> > -DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib"
> > -
> > -inherit autotools pkgconfig gtk-doc
> > -
> > -EXTRA_OECONF +=3D "--with-distro=3Ddebian"
> > -
> > -FILES_${PN} +=3D "/usr/share/dbus-1/services/"
> > diff --git a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb b/meta/recipe=
s-connectivity/gypsy/gypsy_0.9.bb
> > deleted file mode 100644
> > index 51207c9..0000000
> > --- a/meta/recipes-connectivity/gypsy/gypsy_0.9.bb
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -SUMMARY =3D "GPS Multiplexing Daemon"
> > -DESCRIPTION =3D "Gypsy is a GPS multiplexing daemon which allows \
> > -multiple clients to access GPS data from multiple GPS sources \
> > -concurrently.  Gypsy also hides the details of parsing NMEA from the \
> > -client applications, passing the data as simple values for the clients=
 \
> > -to use."
> > -LICENSE =3D "GPLv2+ & LGPLv2+"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe \
> > -                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04b=
b903e34 \
> > -                    file://src/main.c;beginline=3D1;endline=3D25;md5=
=3D3fe64e27e61b289b77383a54a982cbdd \
> > -                    file://gypsy/gypsy-time.h;beginline=3D1;endline=3D=
24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> > -
> > -SECTION =3D "x11"
> > -DEPENDS =3D "glib-2.0 dbus bluez4 dbus-glib libxslt"
> > -
> > -SRC_URI =3D "http://gypsy.freedesktop.org/releases/gypsy-${PV}.tar.gz"
> > -PR =3D "r1"
> > -
> > -inherit autotools pkgconfig
> > -
> > -FILES_${PN} +=3D "/usr/share/dbus-1/system-services/"
> > -
> > -SRC_URI[md5sum] =3D "e2d186df9c2cc3b70a027043e22acf1a"
> > -SRC_URI[sha256sum] =3D "14e1cbe17351f408538e033ca370b4bf51ccf9c88744e2=
36ddfb271904f154d6"
> > diff --git a/meta/recipes-connectivity/gypsy/gypsy_git.bb b/meta/recipe=
s-connectivity/gypsy/gypsy_git.bb
> > deleted file mode 100644
> > index 867582d..0000000
> > --- a/meta/recipes-connectivity/gypsy/gypsy_git.bb
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -require gypsy.inc
> > -
> > -DEFAULT_PREFERENCE =3D "-1"
> > -
> > -SRCREV =3D "3652e1f37e82b8e63983e30fda3482cd099a8cf5"
> > -PV =3D "0.8+git${SRCPV}"
> > -PR =3D "r2"
> > -
> > -S =3D "${WORKDIR}/git"
> > -
> > -LICENSE =3D "GPLv2+ & LGPLv2+"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe \
> > -                    file://COPYING.lib;md5=3D7fbc338309ac38fefcd64b04b=
b903e34 \
> > -                    file://src/main.c;beginline=3D1;endline=3D25;md5=
=3D3fe64e27e61b289b77383a54a982cbdd \
> > -                    file://gypsy/gypsy-time.h;beginline=3D1;endline=3D=
24;md5=3D06432ea19a7b6607428d04d9dadc37fd"
> > -
> > -SRC_URI =3D "git://anongit.freedesktop.org/gypsy;protocol=3Dgit \
> > -           file://fixups.patch"
> > diff --git a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc=
 b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> > index 2289572..a6403fc 100644
> > --- a/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> > +++ b/meta/recipes-gnome/packagegroups/packagegroup-sdk-gmae.inc
> > @@ -17,7 +17,6 @@ SDK-GMAE =3D " \
> >      gupnp \
> >      gupnp-av \
> >      gupnp-tools \
> > -    gypsy \
> >      libart-lgpl \
> >      libtelepathy \
> >      pulseaudio \
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--y2zxS2PfCDLh6JVG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCAbcQACgkQN1Ujt2V2gBy4YACfWzBZCKhuxJj269S55L9VnIIB
QlwAoLcBnGb/Odb7zubNsx37MFlFAVgh
=vfL+
-----END PGP SIGNATURE-----

--y2zxS2PfCDLh6JVG--
