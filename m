Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 78B6F76A51;
	Thu, 28 Apr 2016 15:29:35 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id c189so35158472pfb.3;
	Thu, 28 Apr 2016 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Si73L8jxKSngTfPBfCjkOevGU5HaTlaBSCFVwpR8NbA=;
	b=UJ+NNBHwydg2X8p6XkCk3qv2FxmOISSRfPHj8Lljr+T2gsl70sFFd7GSNTgWdN6+eY
	RroWslQp3+zWjZqzV4IsJPQJhHr8RCFWUe71CyA/Ad5XxqS9QyLw9MaLwKS1PP6J3kzS
	LgSwDq3PefZSYsm1AzugYCB6C0Z+F29C/eEAUrVW0wGyer0Q7Ndv3S6wMmKNGeOcRerb
	DakvpI3urqvJps+Knmze7zP6xmVLofGQnz5tynzb/II3pnuEnm638oaiTlsePWntLZ6n
	Vwbjh9YxpM4IJFECmPo3zcPSR4Vxca39HTEnq9/0YXWRpyTAUVm4856MF/rta9jS/QqC
	2iSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Si73L8jxKSngTfPBfCjkOevGU5HaTlaBSCFVwpR8NbA=;
	b=CAcvBu64h+5L073wPrg0G2qhu2oDtf81eyUBK64IRge7n4e8r+F7ip1/e1nGGax3Ry
	xS4Nset7zvW3p+HT0deSVI21t4sQdqULPIkYvvLCB1Jeifr186yIQBzq1C83WUwBRcDe
	SCqytz4JdnEUdhC6tMGD3lA+A5up7F3c2iEJaTLlaGEAWhICzyb7qs5lFRoTbhxkrP+W
	zkATtj5PU1nvti/kGPcFVTD/VA8r1y7xYXbV0Q7tKhdQiJjgFZqmkQLHeLeHOLI+tRwq
	nu6AWRDc4GSnqhkoGrtHsrvtiL0h94p8MDnCRMTVaB3EtPgUZEn8gioxa9dJvZnpKLX7
	9Caw==
X-Gm-Message-State: AOPr4FXJGVVoRMyaXdA0rPlSGwhBpNCTvTo9i4Z+0n/IHQcFpXXTF2SRA9onWsDVv6QU1Q==
X-Received: by 10.98.80.150 with SMTP id g22mr21404098pfj.132.1461857375916;
	Thu, 28 Apr 2016 08:29:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7c73:e571:eae0:530b?
	([2601:646:8800:5a9a:7c73:e571:eae0:530b])
	by smtp.gmail.com with ESMTPSA id
	x64sm15952038pfx.95.2016.04.28.08.29.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Apr 2016 08:29:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <748495f9-7383-ce65-a41b-7343aa1c6004@windriver.com>
Date: Thu, 28 Apr 2016 08:29:30 -0700
Message-Id: <2D704C56-775E-4E1A-BFBD-0C14455EFE1A@gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
	<CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
	<CAJTo0Lb25x1H44nGn05d6qBVLDpyiaZ3XW40fdrAWcP_D+qYwg@mail.gmail.com>
	<CAJTo0LZZ3Hs_yrm5ceik4j8Orv-UQ9T72Wu=R_PCRKw4Y9-WCw@mail.gmail.com>
	<CAMKF1sozR3_Mhy5PKSaKCo7S2yHrtLzTNrUURFhN38gV0AbkYQ@mail.gmail.com>
	<246f9c39-736b-7ed6-b69a-69d8c4369236@windriver.com>
	<B59F2ADC-CB7F-44CF-9AD7-AD779FC2EEC9@gmail.com>
	<748495f9-7383-ce65-a41b-7343aa1c6004@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Project <yocto@yoctoproject.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 28 Apr 2016 15:29:35 -0000
X-Groupsio-MsgNum: 81370
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BDF74206-D697-4F7D-B23D-82FBB4BB27F7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BDF74206-D697-4F7D-B23D-82FBB4BB27F7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


> On Apr 28, 2016, at 8:19 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>=20
> On 4/28/16 2:10 AM, Khem Raj wrote:
>>=20
>>> On Apr 27, 2016, at 11:06 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
>>>=20
>>> On 4/27/16 12:53 PM, Khem Raj wrote:
>>>> thanks I think most of them come to these categories. So any help =
in
>>>> fixing them is welcome.
>>>>=20
>>>> 1. kernel older than 4.4, backport needed fixed into these branches =
or
>>>> move to newer kernels.
>>>> 2. uboot dont have gcc6 compiler header files, backport the needed =
fixes
>>>> 2. meta-qt4 needs to use gnu++98
>>>> 3. gcc6 providing its own stdlib.h in libstdc++
>>>> 4. gcc6 swtiching to gnu++14 for C++ as default.
>>>> 5. GPLv2-only versions of recipes are simply old will need fixing
>>>=20
>>> =46rom a -very- brief look, I suspect each of these fixes will be =
fairly simple.
>>> So as we move into the next oe-core phase, we should be able get =
through this
>>> pretty quickly.
>>=20
>> I think yes, they are trivial, except the GPL-2.0 packages which =
might need patching
>>=20
>=20
> Ha, actually that was what I was referring to.  The couple I looked at =
seemed to
> be trivial.. :)

yes they are just the fact that compiler has gone stricter compliance =
with standards compared
to when code was written. In worst case we might downgrade -std for =
these recipe but that
may not be enough in some cases
>=20
> If someone doesn't get to it first, I expect some of my guys will in =
about a month.
>=20

OK cool. I think we should make it merge worthy and get it early into =
master and fix the fallouts


> --Mark


--Apple-Mail=_BDF74206-D697-4F7D-B23D-82FBB4BB27F7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlciLF0ACgkQuwUzVZGdMxTTWgCff6MZthKDGvmigvquBtFre8x/
oIcAnjzUq+24lF/U1rpSosh0G2O9b6Zo
=/FwU
-----END PGP SIGNATURE-----

--Apple-Mail=_BDF74206-D697-4F7D-B23D-82FBB4BB27F7--
