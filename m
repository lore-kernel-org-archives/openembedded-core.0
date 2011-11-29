Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVUcw-0004Bt-Tc
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:50:07 +0100
Received: by bkbzs2 with SMTP id zs2so9879057bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 12:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OxLSah20IfunDlB5gx3DrRcZl57hwblCZTBWla8iD8Q=;
	b=QSF3zfmOuEUV9VyiynKnuFzG7If7LDMpw09+uuraKEqwDIEZzKEgO6yYwJ7UqJlSF2
	opnPUd5tskiB3mwpN/ee2B6T0MRn3PY4W3Vcd/svWhvCPJNYgkpgcPhiAoKFIbOdADY0
	A/G/hTIHAIQz4gCaSLdbWCISOsUKqklVwcAcY=
Received: by 10.205.121.1 with SMTP id ga1mr49484566bkc.60.1322599402908;
	Tue, 29 Nov 2011 12:43:22 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	hw14sm26561491bkc.16.2011.11.29.12.43.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 12:43:21 -0800 (PST)
Date: Tue, 29 Nov 2011 21:43:08 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111129204308.GI7441@jama.jama.net>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
	<2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
	<4ED53FCA.8000509@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ED53FCA.8000509@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 10/10] gconf: add polkit to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 20:50:07 -0000
X-Groupsio-MsgNum: 13163
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cVp8NMj01v+Em8Se"
Content-Disposition: inline

--cVp8NMj01v+Em8Se
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 29, 2011 at 12:25:46PM -0800, Saul Wold wrote:
> On 11/29/2011 06:09 AM, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   meta/recipes-gnome/gnome/gconf_3.2.3.bb |    2 +-
> >   1 files changed, 1 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gno=
me/gnome/gconf_3.2.3.bb
> > index aa9da78..907f0ba 100644
> > --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> > +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> > @@ -3,7 +3,7 @@ SECTION =3D "x11/gnome"
> >   LICENSE =3D "LGPLv2+"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b5b66355690e9=
abc605"
> >
> > -DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native"
> > +DEPENDS =3D "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
> >
> >   PR =3D "r1"
> >
>=20
> What is this solving? This also would require polkit to have a=20
> BBCLASSEXTEND with native.

gconf-defaults.c:40:27: fatal error: polkit/polkit.h: No such file or direc=
tory

most people have polkit build in sysroot and then if you upgrade gconf
and polkit at the same time you can get it autodetected in
gconf's do_configure and later removed from sysroot while polkit itself
is being upgraded.

And we probably don't want to disable defaults_service for gconf to force p=
olkit=20
dependency off.

HAVE_POLKIT=3Dno
AC_ARG_ENABLE(defaults_service,
  AS_HELP_STRING([--enable-defaults-service],
    [build the defaults DBus service @<:@default=3Dauto@:>@]),
  , enable_defaults_service=3Dauto)

if test "x$enable_defaults_service" !=3D "xno" ; then
  PKG_CHECK_MODULES(DEFAULTS, glib-2.0 gthread-2.0 gobject-2.0 dbus-1 dbus-=
glib-1 polkit-gobject-1, HAVE_POLKIT=3Dyes, HAVE_POLKIT=3Dno)
  if test "x$HAVE_POLKIT" =3D "xno"; then
    if test "x$enable_defaults_service" =3D "xyes" ; then
      AC_MSG_ERROR([[
*** Could not find PolicyKit.]])
    else
      enable_defaults_service=3Dno
    fi
  else
    enable_defaults_service=3Dyes
  fi
fi

Weird it didn't fail for me without polkit-native (there isn't .bbappend in=
 any of=20
my layers and I've even tested it in distro less oe-core), but you're right=
, we should
provide polkit-native or disable defaults_service for native gconf.

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cVp8NMj01v+Em8Se
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7VQ9wACgkQN1Ujt2V2gBwN5wCZARRcNy1aCf+75vj+pyMmwvEG
CVUAoJmdHf6NOgVHoitP3aF0uuxpojSY
=6r3u
-----END PGP SIGNATURE-----

--cVp8NMj01v+Em8Se--
