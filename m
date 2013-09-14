Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f177.google.com (mail-ea0-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2156360648
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 08:07:13 +0000 (UTC)
Received: by mail-ea0-f177.google.com with SMTP id f15so990748eak.22
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Sep 2013 01:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xrpr+GWr/hMTb4Z+FFZwSpTYMeFOSHbt2/KlqNpMLJ4=;
	b=VyZcM0HwJNTCre5N/b8c/qjyd1Wr00RQdKIK0tZEKIGvsVQ5Dy3vV8o6N1mWswRGB3
	QDOicOHJoegUed0sMmQFH2Qz5pOT/DLzQlINoAyaZbZHMObzdwT7omodYEmOyQ+VF4bF
	fJpgy/mOOuPtzxZi99Rujnsmf4I6OC0yWvXnQa6gcv9ed94WOTbUITHOqyczFpio0OKp
	bihU8blDeGLafvIzIRoLjr+80ZxPwJFHsQJSz+CA+CAAfTByuvpuRWDgXUT3u9KO6Fkl
	if/phc9nDj5oR6a3EgIVfmxbAx/MhwHV3ahQZEab2nBrPtODuJDw13aijTLbfOBmlrS/
	6JVw==
X-Received: by 10.15.48.197 with SMTP id h45mr24827513eew.0.1379146035523;
	Sat, 14 Sep 2013 01:07:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	d8sm21858232eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 14 Sep 2013 01:07:14 -0700 (PDT)
Date: Sat, 14 Sep 2013 10:08:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130914080844.GB30637@jama>
References: <1379114920-23851-1-git-send-email-jslater@windriver.com>
	<CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spii+oAutyKLg0+k2Qdp-KccVzX+r0=tX57bBgYkxrMgA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Joe Slater <jslater@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] webkit-gtk: limit ld memory requirement
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
X-List-Received-Date: Sat, 14 Sep 2013 08:07:14 -0000
X-Groupsio-MsgNum: 45024
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline

--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 09:35:36PM -0700, Khem Raj wrote:
> On Friday, September 13, 2013, Joe Slater wrote:
>=20
> > Add --no-keep-memory to LDFLAGS.
>=20

I think it was discussed on this ML before and conclusion was that it's
distro/builder policy and shouldn't be default in the recipe.
=20
> It does not come with out a price. Have you measured how much performance
> degradation it brings in ?
> We need that to assess the trade off and also describe the machine
> configuration where this option is helping
>=20
>=20
> >
> > Signed-off-by: Joe Slater <jslater@windriver.com <javascript:;>>
> > ---
> >  meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bbb/meta/recipes=
-sato/webkit/
> > webkit-gtk_1.8.3.bb
> > index 5691d3f..9304243 100644
> > --- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> > +++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
> > @@ -58,6 +58,10 @@ CPPFLAGS_append_powerpc =3D "
> > -I${STAGING_INCDIR}/pango-1.0 \
> >                              -I${STAGING_LIBDIR}/glib-2.0/include \
> >                              -I${STAGING_INCDIR}/glib-2.0"
> >
> > +# ld can run out of memory linking libwebkitgtk!
> > +#
> > +LDFLAGS +=3D "-Wl,--no-keep-memory"
> > +
> >  EXTRA_AUTORECONF =3D " -I Source/autotools "
> >
> >
> > --
> > 1.7.3.4
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org <javascript:;>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlI0GYwACgkQN1Ujt2V2gBxI+QCfV3twlGxHhDNrWEmV+C1nAk9M
8lkAoKTKbTkF9PyV6J4Ql3DskKo0d4+N
=tMwf
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
