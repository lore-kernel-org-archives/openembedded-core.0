Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 90EAF73905
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 07:19:51 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so63722776pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Aug 2015 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=LqdD5O91ABq7eDZ6xNfDY25viJdv8Ur4P/W9wptU7gA=;
	b=A2runedvfSX5xICi9g6UnLNiXYedyHDHIB6gZsC+5Avw1malJKOLX7ZXKnyBiAwFNy
	pGvRxEQ0Qdhw+Ehc3v4jQAk4IK4JeGMe+CAjTG2hO+EnQvSq0fHBKntXYs8xDuQjIdCI
	Zeg3m8zGhycMczdMLPpEhalwnSRJNBJcE3PWedGlnrg1hWomn2HaRklVEfrwa4mIYaJP
	Yr3rnO2J0Vt1/6hX8yicPyOsVXiSC/CWwfbrTj9A45c6TGzz1vVwqqw5vWO+o5QWgbVx
	tYM87mYT170n69H0xirSe/F1K75G908IKazv89sLuHXJ0Dse5slA1+aKZQDSmYbnQ0ym
	e/BQ==
X-Received: by 10.69.1.102 with SMTP id bf6mr11872843pbd.17.1438931992303;
	Fri, 07 Aug 2015 00:19:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ec:fbce:7a8:43c9?
	([2601:646:8601:4580:4ec:fbce:7a8:43c9])
	by smtp.gmail.com with ESMTPSA id
	fm3sm8369939pdb.49.2015.08.07.00.19.51
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 07 Aug 2015 00:19:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55BA4B90.2040000@linux.intel.com>
Date: Fri, 7 Aug 2015 00:19:50 -0700
Message-Id: <6F5BF671-CD99-4721-A089-29A0AAA6323C@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<955430345ec10c6c1dda34e2b2c9f64e75d50f38.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143500.GI2457@jama> <55BA4B90.2040000@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 14/26] puzzles: switch svn for git, as upstream has done the same
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
X-List-Received-Date: Fri, 07 Aug 2015 07:19:52 -0000
X-Groupsio-MsgNum: 69103
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A30CB301-DB5C-4850-BA08-27AFEF4A3208";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A30CB301-DB5C-4850-BA08-27AFEF4A3208
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jul 30, 2015, at 9:06 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> On 07/30/2015 05:35 PM, Martin Jansa wrote:
>=20
>> Doesn't PV go backwards with this?
>=20
> Yes; Ross should make a suggestion of how to avoid that, and fix the =
upstream check at the same time - for this recipe and others where I =
tweak the PV in a similar manner.


define PE

>=20
> Alex
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A30CB301-DB5C-4850-BA08-27AFEF4A3208
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXEXBYACgkQuwUzVZGdMxR5NQCfYi4HpjUXDZ78XlTPR2l8BQDp
6psAmwd0JyCCJo76CXsAA3is9ltcaBS7
=YiKs
-----END PGP SIGNATURE-----

--Apple-Mail=_A30CB301-DB5C-4850-BA08-27AFEF4A3208--
