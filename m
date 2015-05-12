Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id B2A0374028
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 16:11:12 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so18114919pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=f50QraH3ePaXp+wXCGgbrmV8vuT0JWBQ12yl/YTS2Ao=;
	b=dEXKI5aU5xqyjvashgWxRZl6nIj74gC5AAf+EMsuWRiBRODp++7q3teZSGJO61F9h+
	AcweIFBQP+XWXL1Yjo9kfpg2u3nUlVPz64GynylLPk9mdbI7aLaUvuZdytNKhFkChNWR
	VWBZKTBu8HcScce55CvKSzjyw4n3HniVC02qH/dKXrOYEaZp5EHNZlR2PJz8jzsUjqBT
	UEht/23Ecf2PJYRI1xQbdpAy8FSaMZ8deHHKQYgSS+ntf3D/PnLNsI8OPBImjEjcNm21
	lnVFgJxliGNgk1pXg7hX6ZJ/SY4j2H2hItJs34LyYqHaTUrT6lViWLbHc0xAEAgfywn5
	dZ3g==
X-Received: by 10.68.233.71 with SMTP id tu7mr29538244pbc.14.1431447073896;
	Tue, 12 May 2015 09:11:13 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	fk4sm16643803pbb.80.2015.05.12.09.11.12
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:11:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKocHho1K+zDbnEVsM5Lq_wFhJD59cD6o0c2R_99oZrmjQ@mail.gmail.com>
Date: Tue, 12 May 2015 09:11:11 -0700
Message-Id: <DEB17712-9E30-4E5E-9591-88D8C90D1A01@gmail.com>
References: <1431268136-6968-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spdFnLWipG86g52MGfTEohRkketU6qCj+cTQcJC-o2rCQ@mail.gmail.com>
	<1431295383.30971.25.camel@linuxfoundation.org>
	<1431414393.30971.109.camel@linuxfoundation.org>
	<CAP9ODKocHho1K+zDbnEVsM5Lq_wFhJD59cD6o0c2R_99oZrmjQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.2098)
Cc: Richard Schmitt <richard.schmitt@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: fix build issue with gcc5
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
X-List-Received-Date: Tue, 12 May 2015 16:11:13 -0000
X-Groupsio-MsgNum: 65460
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FA444A6E-AA68-4532-9247-9DDCD763783A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FA444A6E-AA68-4532-9247-9DDCD763783A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 7:57 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> On Tue, May 12, 2015 at 4:06 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Sun, 2015-05-10 at 23:03 +0100, Richard Purdie wrote:
> ...
>> Otavio: Could you see what our options are with meta-fsl-ppc and
>> metafsl-arm?
>=20
> Yes. I foresee some challenges especially the old kernels.
>=20
> fsl-arm has 2.6.35 for some platforms and fsl-ppc has 3.12.

Most of gcc5 issues are already addressed in kernel upstream so it might =
be that you need few back ports.
but going back to 2.6.x might be daunting. There might be a lot to deal =
with

>=20
> I am adding FSL people to also take a look on these failures.
>=20
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750


--Apple-Mail=_FA444A6E-AA68-4532-9247-9DDCD763783A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJh8ACgkQuwUzVZGdMxQ3fACdFMtOS8++bm/0B8aQ+6Q7dR3S
MUsAn38PENBozgEO1V0+jDBVBKpg5DtJ
=13Cp
-----END PGP SIGNATURE-----

--Apple-Mail=_FA444A6E-AA68-4532-9247-9DDCD763783A--
