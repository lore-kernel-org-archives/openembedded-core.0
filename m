Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7486E488
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 13:51:44 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so2219391eek.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 05:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=XfjWzP0XG5hPqzAw89jLU3OIrZqup2WcenBLPFHhxIU=;
	b=aGiWw8wxnE+U7fO7+CcicyLubrm6R0W3AyrGXs9ThWozGTScU97e7EMnoDjBfj6NHB
	6rECXDryf3K89Ca+ru5xgJcdBZ5aM+9SsC5wiZU1mC3bQQlBH6qAIwXu/9dqZLzjsFlG
	NUeveFU4Irh8FEckmSSkSzFarFDXLik3gA1h32CPLjTZwscDlXlWCT8rl4wE+OU44cB+
	IwmLIj+3JdlZj58jggXEx2j/FzNLneWBBTS7KQq/IRnbzuO7dtSNJl467evyt6JdoC+C
	MXFEBSP7IOAlfuP39VuZUMMSm3yA2t1Ptn7UVA9NoXuUlgUuCBaJi+3kJGXa16/JhchV
	n/tw==
X-Received: by 10.14.175.131 with SMTP id z3mr16990090eel.65.1387201901023;
	Mon, 16 Dec 2013 05:51:41 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h48sm42521128eev.3.2013.12.16.05.51.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Dec 2013 05:51:40 -0800 (PST)
Date: Mon, 16 Dec 2013 14:52:09 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20131216135209.GD3706@jama>
References: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
	<3470792.PBUdbl2oFv@helios>
MIME-Version: 1.0
In-Reply-To: <3470792.PBUdbl2oFv@helios>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Mon, 16 Dec 2013 13:51:45 -0000
X-Groupsio-MsgNum: 48247
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N1GIdlSm9i+YlY4t"
Content-Disposition: inline

--N1GIdlSm9i+YlY4t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2013 at 01:23:56PM +0000, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Monday 16 December 2013 14:15:25 Martin Jansa wrote:
> > * building without x11 doesn't work, because it sets default
> >   gdkbackend to x11 and then requires cairo-xlib to be available
> > * checking for CAIRO_BACKEND... no
> >   configure: error: Package requirements (cairo-xlib >=3D 1.6) were not=
 met:
> >=20
> >   No package 'cairo-xlib' found
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-gnome/gtk+/gtk+.inc | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-gnome/gtk+/gtk+.inc
> > b/meta/recipes-gnome/gtk+/gtk+.inc index 73d624c..5bf0bfe 100644
> > --- a/meta/recipes-gnome/gtk+/gtk+.inc
> > +++ b/meta/recipes-gnome/gtk+/gtk+.inc
> > @@ -14,9 +14,13 @@ X11DEPENDS =3D "virtual/libx11 libxext libxcursor li=
bxrandr
> > libxdamage libxrender DEPENDS =3D "glib-2.0 pango atk jpeg libpng
> > gdk-pixbuf-native docbook-utils-native \ cairo gdk-pixbuf"
> >=20
> > -PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', 'x11',=
 '',
> > d)}" +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'x11', '=
x11',
> > '', d)} \ +           ${@base_contains('DISTRO_FEATURES', 'directfb',
> > 'directfb', '', d)} \ +"
> >=20
> >  PACKAGECONFIG[x11] =3D "--with-x=3Dyes
> > --with-gdktarget=3Dx11,--with-x=3Dno,${X11DEPENDS}" +# without
> > --with-gdktarget=3Ddirectfb it will check for cairo-xlib which isn't
> > available without X11 DISTRO_FEATURE +PACKAGECONFIG[directfb] =3D
> > "--with-gdktarget=3Ddirectfb,,directfb"
> >=20
> >  inherit autotools gtk-doc pkgconfig update-alternatives gtk-immodules-=
cache
>=20
> I was under the impression that directfb support was removed from GTK+ so=
me=20
> time ago - is that not the case?

Hi,

I must admit that my real motivation is to really disable x11/xlib in
gtk+, not to use it with directfb backend (In order to resolve
unsatisfied dependency mdbus2 -> vala -> gtk+ in distro without x11
DISTRO_FEATURE). After enabling directfb PACKAGECONFIG in gtk+ _AND_
cairo it builds fine.

I've tested this with dora (gtk+-2.24.20) and master (gtk+-2.24.22)

and both have in configure.ac:
cairo_backend=3D$gdktarget
AC_ARG_WITH(gdktarget, [  --with-gdktarget=3D[[x11/win32/quartz/directfb]]
select non-default GDK target],
        gdktarget=3D$with_gdktarget)
if test "x$cairo_backend" =3D "xx11"; then
   cairo_backend=3Dxlib
fi

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--N1GIdlSm9i+YlY4t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlKvBYkACgkQN1Ujt2V2gBxK5wCdFbixPbLF00dC00XC23lWLVaI
MSIAn04exiVyj9pWSajPTOLCnQGmfrn0
=qZsW
-----END PGP SIGNATURE-----

--N1GIdlSm9i+YlY4t--
