Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f180.google.com (mail-ea0-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 08A7D61118
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 14:40:25 +0000 (UTC)
Received: by mail-ea0-f180.google.com with SMTP id h10so316035eaj.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 07:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bB/PxxSiIIAPuVe0PrX/Oiuwr/bhUJolNYx0W1Z2qTA=;
	b=FQhKqhJJz1+Gj6mb7rIWMIvyYMzcKd9jYyVNYli4oJN5I12QY5taJsf3078zzzOy0W
	KXc/YWcjLRFrtinmlvl9cztTGPDs0dsf2BJuAafmCy2HUN+SSvvXmzgLsHsYzEaEUsHb
	vg8prULvlzVrn+QJhFHYjLukso2pcVu7biLbY+41TIKHTBAvgmVlZ101EhzcU9qVwz4w
	tPCUoSUz3KC5hgHOnvgyTBAZaPRIRzDwDDe5hhCZSTGVVn18MLI3HsqHVuAXJMUe2uc8
	nzUILOAL92UdjoIjx4dQBARlBoYEpoybYP7KvRIrsocFXanLURc6AwAWdjbhfFeobSTk
	7dOQ==
X-Received: by 10.15.41.200 with SMTP id s48mr1994968eev.94.1379688026949;
	Fri, 20 Sep 2013 07:40:26 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h45sm11259015eeg.5.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 20 Sep 2013 07:40:25 -0700 (PDT)
Date: Fri, 20 Sep 2013 16:42:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130920144205.GJ18414@jama>
References: <1379682086-27877-1-git-send-email-paul.eggleton@linux.intel.com>
	<CALbNGRTFYp0yJ+Y9yTX8npPQaHmaaZOzet5EEwjSpULDWy3QYA@mail.gmail.com>
	<1689545.vp0O8sHNEO@helios>
MIME-Version: 1.0
In-Reply-To: <1689545.vp0O8sHNEO@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qt4-x11-free: disable QGtkStyle
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
X-List-Received-Date: Fri, 20 Sep 2013 14:40:26 -0000
X-Groupsio-MsgNum: 45293
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9aCKuHbn5v2q3RVc"
Content-Disposition: inline

--9aCKuHbn5v2q3RVc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2013 at 03:27:32PM +0100, Paul Eggleton wrote:
> On Friday 20 September 2013 15:58:26 Andreas M=FCller wrote:
> > On Fri, Sep 20, 2013 at 3:01 PM, Paul Eggleton
> > <paul.eggleton@linux.intel.com> wrote:
> > > This currently leads to a floating dependency on GTK+. Since most use=
rs
> > > in an embedded context won't need this, just disable it by default.
> > >=20
> > > Fixes [YOCTO #5116].
> > >=20
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > >=20
> > >  meta/recipes-qt/qt4/qt4-x11-free.inc | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > b/meta/recipes-qt/qt4/qt4-x11-free.inc index 4b29f55..369b3d5 100644
> > > --- a/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > +++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
> > > @@ -12,7 +12,7 @@ INC_PR =3D "r50"
> > >=20
> > >  QT_GLFLAGS ?=3D "${@base_contains('DISTRO_FEATURES', 'opengl', '-ope=
ngl',
> > >  '-no-opengl', d)} " QT_GLFLAGS_qemux86 =3D "-opengl"
> > >  QT_GLFLAGS_qemuppc =3D "-opengl"
> > >=20
> > > -QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb"
> > > +QT_X11_FLAGS ?=3D "-no-xinerama -no-xkb -no-gtkstyle"
> > >=20
> > >  QT_CONFIG_FLAGS +=3D "${QT_X11_FLAGS}"
> > >  QT_BASE_LIB  ?=3D "libqt"
> >
> > How about PACKAGECONFIG for this?
>=20
> Ultimately I decided against introducing PACKAGECONFIG just for this, bec=
ause=20
> the Qt recipes currently avoid it (PACKAGECONFIG cannot support a number =
of=20
> the additional library options for Qt since they are tri-state; not to me=
ntion=20
> that PACKAGECONFIG isn't just a drop-in for Qt because it doesn't use=20
> autotools/cmake and therefore doesn't use EXTRA_OECONF/EXTRA_OECMAKE). I=
=20
> figured that the few users who do want QGTKStyle can just set QT_X11_FLAG=
S as=20
> desired.

FWIW: I'm using PACKAGECONFIG in meta-qt5, you're right that it cannot
cover all 3 states for each option, but most common scenarios need to
select only between 2 and automatically added DEPENDS/RDEPENDS is big
plus.

To support PACKAGECONFIG without autotools/cmake inherit I just add
generated EXTRA_OECONF to QT_CONFIG_FLAGS.

But I agree that in this patch it's easier without introducing PACKAGECONFIG
for qt4.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--9aCKuHbn5v2q3RVc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI8Xr0ACgkQN1Ujt2V2gBzf/gCfZbU6g4EYf6pPBWtUrz+wSgSb
LlkAoJcP5lbI5kaL3Hh1d/E5DfSnslPf
=X2t4
-----END PGP SIGNATURE-----

--9aCKuHbn5v2q3RVc--
