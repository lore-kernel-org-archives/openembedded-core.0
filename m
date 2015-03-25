Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id EB3FA6AC36
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 18:30:38 +0000 (UTC)
Received: by wgbcc7 with SMTP id cc7so37267444wgb.0
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 11:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7dY/Rm+OKBLUiN07iN5MHL5P+Ii29562FFePSMwGMFA=;
	b=U/7Ks+lI/+Gn1JKcwwd5o6gaw3nUFRLrUOkesLYbmUQ4M9wSnDQlLe7B4FLd6iyN+c
	IvVTclSgVpS8Tw2W8bsMxfuEBhAfjwqYMq8WDTOEekba0L6ULiMdIEoIlhhEIr9fLust
	0tRQ8uw43GenJyQa6qo7YXx7Joi2gCQjVBLKmR0lWdKXDIy5NrqumY0d1x/OBmSAXtEI
	K7rQZFdNGYb/QdhoFf2iIkNcokmmaqpGrO1+hE9IAg+Pfa8ObD6TdbxQ1J8ltIYCGXEJ
	H1pNIeafYIA53HItvlSBhVubERWTKDDSZ6ljpcVxOlOzs8GLyckCot53bzqqjqVcanAT
	glFQ==
X-Received: by 10.194.77.99 with SMTP id r3mr20698733wjw.149.1427308239356;
	Wed, 25 Mar 2015 11:30:39 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ub1sm4830270wjc.43.2015.03.25.11.30.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Mar 2015 11:30:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Mar 2015 19:30:52 +0100
To: Janne Karhunen <janne.karhunen@gmail.com>
Message-ID: <20150325183052.GL3904@jama>
References: <CAE=NcrZ-ODzj8LYcrGO0-a0Wvzb3YcyAqS44-NOwMumU9NVuAw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE=NcrZ-ODzj8LYcrGO0-a0Wvzb3YcyAqS44-NOwMumU9NVuAw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: pam related dependency processing bug?
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
X-List-Received-Date: Wed, 25 Mar 2015 18:30:39 -0000
X-Groupsio-MsgNum: 63713
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="huBJOJF9BsF479P6"
Content-Disposition: inline

--huBJOJF9BsF479P6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2015 at 10:39:34AM -0700, Janne Karhunen wrote:
> Hi,
>=20
> Wonder if you guys can share some insights on how to debug this case.
> I have a legacy PAM module recipe that says:
>=20
> DEPENDS_${PN} =3D "libpam"
>=20
> 'pam' is listed in DISTRO_FEATURES and is working fine. However, for
> that pam module libpam dependency is silently dropped during the
> build. If PAM happens to be compiled before that module, everything is
> fine, but if not, build fails on missing pam headers.
>=20
> To make this interesting, 'bitbake -g -u depexp <module>' shows the
> libpam dependency in place - yet it clearly is not there during the
> build. Results are the same for both dizzy and daisy and host OS
> doesn't seem to make a difference either.

That's because
DEPENDS_${PN}
doesn't mean anything you should be using DEPENDS (only RDEPENDS,
RPROVIDES, RREPLACES, RCONFLICTS variables are package specific and end
with _<package-name> e.g. _${PN})

>=20
>=20
> --
> Janne
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--huBJOJF9BsF479P6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUS/twACgkQN1Ujt2V2gBzOogCdFpmCEI6byNnumGxSVm6OUt6S
cWIAnAoMybMUq9tBGMLsLxw6xhZlIpwF
=FV1j
-----END PGP SIGNATURE-----

--huBJOJF9BsF479P6--
