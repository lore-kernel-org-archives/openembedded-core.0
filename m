Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B0B2965D00
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 08:47:20 +0000 (UTC)
Received: by pabyb7 with SMTP id yb7so86988034pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Aug 2015 01:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eCcc4sN4mVKT5f0QfaLSH4sEM8mUc/vp8MHvYqNF940=;
	b=b1jBkK1qHzwwGmom42/P59m5vFPCioaze3w8b2ElrXVB8Cj55FDX8XRKt/HgdjvzIK
	p/ti+tIp4YblpLPGgsBRS48cSFYX/zDNWvW4My5R5qEP3PTySRQJfO3jQtYDkl09eOU6
	RnxF8X8yn+ILrRl2b+522VvBrXg6kuvbU/hLEvkv1avN3BSIA0mUIRhtTKLzJQq68hDr
	hMEzoJoiUm3eTgWufmcC7akkBcX+4xSdIpS2LwOsWDAEHOHcAntVEJAXyh8c9Wr/3Q0R
	xo/+lpojESihUsEcuSk4hPSqtREONiRMbGl5359Cx8xuE6VrDUBJA+Y6jmZpspF5iNL6
	IdVw==
X-Received: by 10.66.162.229 with SMTP id yd5mr38877224pab.102.1439714841220; 
	Sun, 16 Aug 2015 01:47:21 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:f5b7:823c:7f00:1ba7?
	([2601:646:8601:4580:f5b7:823c:7f00:1ba7])
	by smtp.gmail.com with ESMTPSA id
	hz5sm10818530pbb.39.2015.08.16.01.47.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 16 Aug 2015 01:47:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1434575003.14710.38.camel@linuxfoundation.org>
Date: Sun, 16 Aug 2015 01:47:12 -0700
Message-Id: <DFCBD870-BD56-4C96-B1AA-676DCD2F6544@gmail.com>
References: <1434546648.14710.25.camel@linuxfoundation.org>
	<1434575003.14710.38.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python: Add performance patches from upstream 2.7 branch
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
X-List-Received-Date: Sun, 16 Aug 2015 08:47:25 -0000
X-Groupsio-MsgNum: 69484
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DDE4692B-F32C-4EFA-BE7A-C6EAEFE02EE7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DDE4692B-F32C-4EFA-BE7A-C6EAEFE02EE7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jun 17, 2015, at 2:03 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Wed, 2015-06-17 at 14:10 +0100, Richard Purdie wrote:
>> These performance patches result in about a 25% speed up of our =
parsing
>> speed with bitbake. They're already applied in 1.7 upstream and =
backported
>> from 3.X so worth applying for 2.7 too.
>=20
> Sadly, this was too good to be true. I'd messed up the test =
environment
> and the 25% is Ubuntu's python verses the one from OE. Ubuntu's uses =
PGO
> whereas ours does not which is likely where the speed comes from. The
> patches in this series do give a small speedup, but its more like
> 0.5-1%. Shows that PGO is likely worth investigating further though.
>=20

25% is too good to ignore. Have you opened a tracker for this ?
and python has needed workload for generating profile data pybench and =
pydes benchmarks are there
in source tree.

we need to compile twice.

compile with -fprofile-generate
run make run_profile_task
compile with -fprofile-use -fprofile-correction

So it should be straight forwards to try it out, do you still have the =
environment ?

> Cheers,
>=20
> Richard
>=20
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DDE4692B-F32C-4EFA-BE7A-C6EAEFE02EE7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXQThcACgkQuwUzVZGdMxS89ACggL3KX+ry+VRGmX1BNa3LxQTY
XCYAniCBhyYZqUgNozAYWtkGacK1Xuen
=lPK+
-----END PGP SIGNATURE-----

--Apple-Mail=_DDE4692B-F32C-4EFA-BE7A-C6EAEFE02EE7--
