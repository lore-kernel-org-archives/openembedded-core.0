Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 96C7572020;
	Thu,  6 Nov 2014 17:45:41 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id a1so1814505wgh.20
	for <multiple recipients>; Thu, 06 Nov 2014 09:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UCct2zEQwJGL8tvKPLsJMab5jQxO5JL34fsoj7I1oKU=;
	b=h8bc6WEzV0tiR9NYQV4nedNjW9pXPFZoN9dlLb10VBPRnl7C5YJU+0oUMA7WwUbaK+
	pfp+IWzQx5Y1+k9lNymacBMxgeMwjsfsKS/Q/B16vrUOebpHqwIoR3OorYG6CI38DdpA
	jXHvScc7BnGzMPG7/ds25zoKYjATypvOX3qIsyPS+Y54LOBW7J3bHaKFPJsKdv5/vTon
	WZU/bMaafafdTdL8h/+F6+ylUNeM2SKPATb9AAEI+9KZSe8HSEObuNbcHH6LdsQzi7qI
	P34fECBpEewDSZxsTOIjxtag5LipqF3YtJGxaFQMht/e2tyKcVww01OoWi8HAUl/Dbnk
	QG5g==
X-Received: by 10.180.108.144 with SMTP id hk16mr16389549wib.68.1415295940393; 
	Thu, 06 Nov 2014 09:45:40 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id f6sm9148702wix.5.2014.11.06.09.45.39
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Nov 2014 09:45:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 6 Nov 2014 18:45:44 +0100
To: openembedded-core@lists.openembedded.org, Saul Wold <sgw@linux.intel.com>
Message-ID: <20141106174544.GC2455@jama>
References: <20141105232840.B115C50244@opal.openembedded.org>
	<20141106172520.GB2455@jama>
MIME-Version: 1.0
In-Reply-To: <20141106172520.GB2455@jama>
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
X-List-Received-Date: Thu, 06 Nov 2014 17:45:45 -0000
X-Groupsio-MsgNum: 59329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Content-Disposition: inline

--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2014 at 06:25:20PM +0100, Martin Jansa wrote:
> On Wed, Nov 05, 2014 at 11:28:40PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: daisy
> > Commit: 606793e7b5c129654f317e5bec9ed7f083d3383d
> > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcomm=
it;h=3D606793e7b5c129654f317e5bec9ed7f083d3383d
> >=20
> > Author: Saul Wold <sgw@linux.intel.com>
> > Date:   Wed Nov  5 13:36:33 2014 -0800
> >=20
> > pseudo.inc: Clean up backport of version update to 1.6.2
> >=20
> >   This uprevs pseudo to 1.6. This merges in all of the existing
> >     fixes, and also adds partial support for extended attributes,
> >     including storing arbitrary extended attributes in the database,
> >     and also interpreting the posix permissions ACLs as chmod
> >     requests.
> >=20
> >     The extended attribute support means we need xattr.h, the simplest
> >     way to be sure of this is to build attr before pseudo, which doesn't
> >     take long.
> >=20
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
>=20
> You can also remove
> ./meta/recipes-devtools/pseudo/files/pseudo-1.5.1-install-directory-mode.=
patch
> which is no longer used by pseudo versions in daisy

And probably remove 1.5.1 version from dizzy and master branches like it
was removed in daisy.

> > ---
> >=20
> >  meta/recipes-devtools/pseudo/pseudo.inc | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/meta/recipes-devtools/pseudo/pseudo.inc b/meta/recipes-dev=
tools/pseudo/pseudo.inc
> > index 42738ab..11a8514 100644
> > --- a/meta/recipes-devtools/pseudo/pseudo.inc
> > +++ b/meta/recipes-devtools/pseudo/pseudo.inc
> > @@ -7,11 +7,7 @@ HOMEPAGE =3D "http://git.yoctoproject.org/cgit/cgit.cg=
i/pseudo"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D243b725d71bb5df4a1e5920b344=
b86ad"
> >  SECTION =3D "base"
> >  LICENSE =3D "LGPL2.1"
> > -DEPENDS =3D "sqlite3"
> > -
> > -SRC_URI_append_class-nativesdk =3D " file://symver.patch"
> > -
> > -SRC_URI_append_class-native =3D " file://symver.patch"
> > +DEPENDS =3D "sqlite3 attr"
> > =20
> >  FILES_${PN} =3D "${prefix}/lib/pseudo/lib*/libpseudo.so ${bindir}/* ${=
localstatedir}/pseudo ${prefix}/var/pseudo"
> >  FILES_${PN}-dbg +=3D "${prefix}/lib/pseudo/lib*/.debug"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlRbs8cACgkQN1Ujt2V2gBwAWwCgjEoNfXflWU+jiFf7LFqw58p2
vbAAn3d3w3jsPQ6ahtUTkgmfwRzo30qu
=b88p
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
