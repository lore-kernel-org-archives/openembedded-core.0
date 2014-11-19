Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id A54B865D4F;
	Wed, 19 Nov 2014 10:55:38 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so9072157wib.1
	for <multiple recipients>; Wed, 19 Nov 2014 02:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=c/PEHJJo/H0W4oleac67QxLolFPXSWtSvVwQnR3pTjQ=;
	b=Cjs0mxUD4jbj7jM7ugkXKUNwtAVNlrisX0IcFda2/Mzj1qlMy72KYXLw+0CmZaEpA/
	ssXdcscFqunZOFLQqLDSj17afet+sUnDJtLQgFT1qwzRB9hf/teby2uQ6XgyuOy4z3to
	MXMNOXtqwiv/We+kVN2yAG4aPc4YDKbQeeHbLDR755yygheSvmI/CASJGoKQ7Kb8ZX+N
	Sx84kYmTRwVRPPjaVcnPalhNSVUSZZ0bIjMXsvFNu8yT6dQM2kcGdQH97oC5uLEMHgZb
	YDoXUcvqMHoyJ3DIMjDiG0h75FzaBqg6dBrlj5h0CkLeM4QKy+Yaszvfcypk1+zgB462
	If3Q==
X-Received: by 10.194.236.232 with SMTP id ux8mr56633435wjc.96.1416394538474; 
	Wed, 19 Nov 2014 02:55:38 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id u5sm1708095wiz.9.2014.11.19.02.55.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Nov 2014 02:55:37 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 19 Nov 2014 11:55:38 +0100
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Message-ID: <20141119105538.GA3315@jama>
References: <20141105232840.B115C50244@opal.openembedded.org>
	<20141106172520.GB2455@jama> <20141106174544.GC2455@jama>
MIME-Version: 1.0
In-Reply-To: <20141106174544.GC2455@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Saul Wold : pseudo.inc: Clean up backport of version update to 1.6.2
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
X-List-Received-Date: Wed, 19 Nov 2014 10:55:41 -0000
X-Groupsio-MsgNum: 59757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2014 at 06:45:44PM +0100, Martin Jansa wrote:
> On Thu, Nov 06, 2014 at 06:25:20PM +0100, Martin Jansa wrote:
> > On Wed, Nov 05, 2014 at 11:28:40PM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: daisy
> > > Commit: 606793e7b5c129654f317e5bec9ed7f083d3383d
> > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D606793e7b5c129654f317e5bec9ed7f083d3383d
> > >=20
> > > Author: Saul Wold <sgw@linux.intel.com>
> > > Date:   Wed Nov  5 13:36:33 2014 -0800
> > >=20
> > > pseudo.inc: Clean up backport of version update to 1.6.2
> > >=20
> > >   This uprevs pseudo to 1.6. This merges in all of the existing
> > >     fixes, and also adds partial support for extended attributes,
> > >     including storing arbitrary extended attributes in the database,
> > >     and also interpreting the posix permissions ACLs as chmod
> > >     requests.
> > >=20
> > >     The extended attribute support means we need xattr.h, the simplest
> > >     way to be sure of this is to build attr before pseudo, which does=
n't
> > >     take long.
> > >=20
> > > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >=20
> > You can also remove
> > ./meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mod=
e.patch
> > which is no longer used by pseudo versions in daisy
>=20
> And probably remove 1.5.1 version from dizzy and master branches like it
> was removed in daisy.

Please fixup the fixup.

> > > ---
> > >=20
> > >  meta/recipes-devtools/pseudo/pseudo.inc | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-d=
evtools/pseudo/pseudo.inc
> > > index 42738ab..11a8514 100644
> > > --- a/meta/recipes-devtools/pseudo/pseudo.inc
> > > +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> > > @@ -7,11 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.=
cgi/pseudo"
> > >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b3=
44b86ad"
> > >  SECTION =3D "base"
> > >  LICENSE =3D "LGPL2.1"
> > > -DEPENDS =3D "sqlite3"
> > > -
> > > -SRC_URI_append_class-nativesdk =3D " file://symver.patch"
> > > -
> > > -SRC_URI_append_class-native =3D " file://symver.patch"
> > > +DEPENDS =3D "sqlite3 attr"
> > > =20
> > >  FILES_${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* =
${localstatedir}/pseudo ${prefix}/var/pseudo"
> > >  FILES_${PN}-dbg +=3D "${prefix}/lib/pseudo/lib*/.debug"
> > >=20
> > > --=20
> > > _______________________________________________
> > > Openembedded-commits mailing list
> > > Openembedded-commits@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
> >=20
> > --=20
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRsdyoACgkQN1Ujt2V2gBwj+wCeNuaXirY3+aopwm2RjtD/9tH/
iU0AniPagEBOsT6lVtJvQ3IFqkK3lN6S
=Rhmc
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
