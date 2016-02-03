Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6621273D46
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 22:37:57 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id w123so21278989pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 14:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ivemvtdIOBAH64W1tEHqQm++0FSa4j1NUvmo52cE/lc=;
	b=pT3Z06OE/RBTH5pZCtYW6oPhD8FPqdYjfEcBnV2FlCIXX6v0U2hLKAiKpz2HTvxfDp
	yHyEEJBYn+q0SFyTpG0GNIBGXA7VRkOwVMgpbBKdAkzV+3j+ioeYZqgM6B6AcWR5R6gQ
	Udr3QssHFONcnyPL9uG0UmjNqgMTsgUmpwT1dZLXiiti50gCzWYBiMmDvUYhvUH1ZQm7
	WJOoQ9FdYjB5H3J2FvtFmkVagQIB7hjvP1OsESelZdJB4ZTx/8dK94mSuaLNa37+oarq
	7LjPXdvyCspCRpJASWfFm1pq0QJ9Uc2wsnuM9H1FkJb4ZSgbsJ0CZoYALiVwX2qFxycz
	4Vyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ivemvtdIOBAH64W1tEHqQm++0FSa4j1NUvmo52cE/lc=;
	b=Cvu7Ec/Q/jeG8Z9cDjEin+2CGn+/9CUDfVMNB1un0OIMUK66nFlYp1r+jSRSfHm+tQ
	YhO3m4lJ2aFdsvwz2pNZ2wnG0CpzQj6FK/L2HmsBAimS1C+axRr4f3KDpziu5tXJ6jTz
	BuHBoY1QN50dGanWDMTZ2xj8VRxHS6gsM7YX40EpFjjrmr29c0rhlNCIMwWB41qaUo79
	h37lYsdGwZThPxkFDL8WMc41YqkYqRpyuueuGxJ66hU6c1EzpiVYceIJ+9HY1fehRxc9
	O3orIau94j0RuEf1tHT/bIY94IaChxVlIsp7uFDQRAQ+FxLqhgTQD0mPNVhHn2bH4Ikl
	laOA==
X-Gm-Message-State: AG10YOSy8EgyM7nSNYTG6cSN8haqDsIKFBRGZb2DkT9TZiakdtOu1NnODio/hMZdzF+E5A==
X-Received: by 10.66.180.168 with SMTP id dp8mr6188335pac.104.1454539078665;
	Wed, 03 Feb 2016 14:37:58 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:f4ee:b281:a3a4:822e?
	([2601:646:8802:5d5c:f4ee:b281:a3a4:822e])
	by smtp.gmail.com with ESMTPSA id
	ud8sm5185570pac.11.2016.02.03.14.37.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 14:37:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1454533708.7421.61.camel@pbcl.net>
Date: Wed, 3 Feb 2016 14:37:53 -0800
Message-Id: <3331DCC0-438E-4B2B-B61C-875F86CA20EE@gmail.com>
References: <56B0AE88.3090103@siemens.com> <1454446338.7421.45.camel@pbcl.net>
	<46DD8494-2C7E-44B8-8793-12228FD56738@gmail.com>
	<1454532510.7421.54.camel@pbcl.net>
	<CAMKF1sqevO99mD2V1xxZEa7--LX9vctuFebLc59fOej3xnjkhA@mail.gmail.com>
	<1454533078.7421.57.camel@pbcl.net>
	<CAMKF1srGn-maJcvPLQSV6Xz7RgU4N1Jipr+Oc9AH_B1xsj-UQw@mail.gmail.com>
	<1454533708.7421.61.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Default value for FULL_OPTIMIZATION
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
X-List-Received-Date: Wed, 03 Feb 2016 22:37:59 -0000
X-Groupsio-MsgNum: 77499
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CFCAAE6C-DC2F-4CCE-BD40-BE775ECFF465";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CFCAAE6C-DC2F-4CCE-BD40-BE775ECFF465
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 3, 2016, at 1:08 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Wed, 2016-02-03 at 12:59 -0800, Khem Raj wrote:
>> in systems of  this age it should be yet.
>=20
> Sorry, I didn't really understand that comment.

systems of today ( new systems ). read =E2=80=98yet' as 'yes'

>=20
> For what it's worth, as a very quick and fairly unscientific =
comparison,
> I did "time make -j4" in a glibc tree and got:
>=20
> real	1m38.812s
> user	4m6.420s
> sys	0m23.148s
>=20
> and then I cleaned the tree and did "time make -j4 CFLAGS=3D'-O2 -g
> -pipe'" and got:
>=20
> real	1m37.299s
> user	4m21.420s
> sys	0m27.304s
>=20
> I'm not sure these results are statistically significant but on this
> very limited evidence it certainly doesn't look like -pipe is =
providing
> any transformational benefits.  The real time has gone down a tiny =
bit,
> which suggests that -pipe is giving some extra parallelism, but the
> system and user time have both actually gone up in the second case.

Some bigger loads like webkit might be a better sample.

>=20
> p.
>=20
>=20


--Apple-Mail=_CFCAAE6C-DC2F-4CCE-BD40-BE775ECFF465
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaygUQACgkQuwUzVZGdMxS7hACfc+hHOvpn01aCGZAx5j9KXLOQ
cfkAn3JvbNouTVk8RuVolpCJArJsBoJy
=g0uu
-----END PGP SIGNATURE-----

--Apple-Mail=_CFCAAE6C-DC2F-4CCE-BD40-BE775ECFF465--
