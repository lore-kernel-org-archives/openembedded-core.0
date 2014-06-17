Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 73F966FD1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 12:53:04 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id bs8so5769136wib.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 05:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=y67n0MVnMePWuhKzIJSvKIF9iPe8h2wKxKkPaPidMas=;
	b=ZOnduglW9T6GDO+WzkpXkj16Y0szFOmvCNxNRSyD1AsRcD1pJpq0xnq8Y/VxQ5mdoG
	P3M8mc1QIcjJ0jIzrR2/yRDRYYLumxgOajqweSuBZ5LidwOEO3nPKK6P2Sm5li1BWM0R
	3xtzf6sNVzy91mgEAByHRAHy/lC0VFHbejfKP9WkRQEWR3xqV82Gm4rcK1zMZhKUL0G4
	aPqAxPW0FKL3+Qsg3jYBc+10wdWg9xqmfqu1a36eVP1KjCdMFc1rMV577mYIjZ772t6s
	6LmD2m9B9VU6EWdN03dOcC8shzYXjsNLONbD2HU46tmh+nxj82d9pPo6ENUCFWOfPhlX
	cshQ==
X-Received: by 10.194.80.161 with SMTP id s1mr38399039wjx.47.1403009584768;
	Tue, 17 Jun 2014 05:53:04 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o46sm41020508eef.31.2014.06.17.05.53.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Jun 2014 05:53:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 17 Jun 2014 14:53:03 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140617125303.GA2117@jama>
References: <1402073854-10723-1-git-send-email-Martin.Jansa@gmail.com>
	<3393068.dWaMXD2vQY@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3393068.dWaMXD2vQY@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] update-rc.d: Allow to use different initscripts provider
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
X-List-Received-Date: Tue, 17 Jun 2014 12:53:07 -0000
X-Groupsio-MsgNum: 54202
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline

--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2014 at 01:33:17PM +0100, Paul Eggleton wrote:
> Hi Martin,
>=20
> On Friday 06 June 2014 18:57:34 Martin Jansa wrote:
> > * until now all recipes were respecting VIRTUAL-RUNTIME_initscripts
> >   variable but commit bba835fed88c3bd5bb5bd58962034aef57c408d8
> >   hardcoded "initscripts" runtime dependency
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/update-rc.d.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/meta/classes/update-rc.d.bbclass
> > b/meta/classes/update-rc.d.bbclass index ca9486b..19b081d 100644
> > --- a/meta/classes/update-rc.d.bbclass
> > +++ b/meta/classes/update-rc.d.bbclass
> > @@ -1,7 +1,8 @@
> >  UPDATERCPN ?=3D "${PN}"
> >=20
> >  DEPENDS_append =3D " update-rc.d-native"
> > -DEPENDS_append_class-target =3D " initscripts"
> > +VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"
> > +DEPENDS_append_class-target =3D " ${VIRTUAL-RUNTIME_initscripts}"
> >  UPDATERCD =3D "update-rc.d"
> >  UPDATERCD_class-cross =3D ""
> >  UPDATERCD_class-native =3D ""
>=20
> Technically this isn't right either though - VIRTUAL-RUNTIME_initscripts =
is=20
> for the runtime package name not the recipe as is being added here. It ju=
st so=20
> happens that they are the same thing for initscripts.

Ah, you're right, I was blind when reading DEPENDS (I've even mentioned
runtime dependency in commit message :/), sorry.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOgOi8ACgkQN1Ujt2V2gBy0qACgmYX2OtYo6axupjSc32dvqG4m
4DAAn0fCYY6kH7TDkeDYkdosM8NnBRAP
=0c9e
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
