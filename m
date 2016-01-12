Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 306EF6FF6B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 16:26:48 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id 65so65187943pff.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ViFehJgLXPB2112qTVMIV7forTDQELP306kLFVucCQ0=;
	b=i69slpbCuLAip5qFOyJIlsJ9z9cMsMUFGpW7ZqGCmTYZisHAbwBtwnBy4py7K3/lrt
	o2KK9mcB96CLsYv6MW1uOyaBUAMvOvqvyaLUdCYghh27SGH1fJK2/nyi/g0SLzZ5eC4S
	mPmL540Ha31CD/ZWNIYzxaVfrA3Jb47WIGshrOaH1SBuFc0CnuFhJHR2q5bC7aywKgOl
	fJMiRv4C5FaHHeK+9PBdtusoMpKmoR+V7EQTMLSQDUB2p6icj4MG/oopHDNmZyNokwit
	agxvSeK3hBbGKkieQpciu5g1+SQYOP8CFCHLQuuNoziFOZIOnmhvc2WzC5U1IHGaFOMM
	S4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=ViFehJgLXPB2112qTVMIV7forTDQELP306kLFVucCQ0=;
	b=M4T7MPaWkc48YYbj9HX+zw+1Iew1WRN4hg51ugIsvc+BE/yv81H5pTGmg4PwftL/6R
	lbj3LVJS0n7g/Ws2Ngy4uO10Ept9eKChcrSIwuIMNxX66XlV7whjxS2PBqIWAzx421ld
	3Hv7Vbc9rsDTcL4yHXl2A/R8eLWjNzXhNav/KoWwc8LhWnKmCLiA1EgDO7dpwjsumo6B
	TXdCxDC+G9qzvxrXLbilae8aOl3HFQIHEurKFWfSvLxVRwTKMKLu8zcfgcfZOXmqrFin
	riuNcvjsmTfTY81/AN2i6O6MCnSmT1mCObNQBZ3qk/sCk6WIxr1z6LHm8u/LXU6MVY/U
	v/XA==
X-Gm-Message-State: ALoCoQlwZAtvklASBfZIBkK1KYHyZDnXNBHGvmw/a67CHAt/ogmDGlNHRjrtrcI/A0xcm1TA6Lhq1JEbmCfTmPbJnYwlPUhACg==
X-Received: by 10.98.7.79 with SMTP id b76mr36087595pfd.40.1452616009498;
	Tue, 12 Jan 2016 08:26:49 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:98ae:25c1:975a:428c?
	([2601:646:8802:5d5c:98ae:25c1:975a:428c])
	by smtp.gmail.com with ESMTPSA id
	z15sm31529229pfa.71.2016.01.12.08.26.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 12 Jan 2016 08:26:48 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452591757.1950.33.camel@pbcl.net>
Date: Tue, 12 Jan 2016 08:26:43 -0800
Message-Id: <30C7BCF7-5137-4EC3-A978-D74AA04AE6AB@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
	<4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
	<1452591757.1950.33.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Tue, 12 Jan 2016 16:26:49 -0000
X-Groupsio-MsgNum: 75942
Content-Type: multipart/signed;
	boundary="Apple-Mail=_856BBB96-6D30-4182-8462-6D87900C082B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_856BBB96-6D30-4182-8462-6D87900C082B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 12, 2016, at 1:42 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Mon, 2016-01-11 at 14:58 -0800, Khem Raj wrote:
>> it came into ffmpeg circa 2008 and proliferated into related =
components primarily to support vectorization and neon
>> which was quite nascent for ARM architecture in those days in gcc. =
Today if you were to configure libav with default options
>> then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno =
-fno-signed-zeros -fno-tree-vectorize
>>=20
>> which is primarily -Ofast -fno-tree-vectorize
>=20
> I think -fno-tree-vectorize is just there as a workaround for old
> compilers.  It sounds like you're saying that ffmpeg basically just
> wants "-Ofast", and by implication it wants this on all architectures.
> So in that case there is no need for a FULL_OPTIMIZATION override on
> arm, let alone armv7a specifically.

yes I think it should use -Ofast irrespective of architecture.

>=20
> Whether ffmpeg ought to be forcing its own FULL_OPTIMIZATION at all
> versus leaving it up to the distro is another question.  Personally I
> think that individual recipes have no business setting those =
variables,
> and ffmpeg is no exception, but I don't have a particularly strong
> opinion either way.
>=20
> p.
>=20
>=20


--Apple-Mail=_856BBB96-6D30-4182-8462-6D87900C082B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaVKUcACgkQuwUzVZGdMxRbrQCaA5ZoizrxaOZIxrDnu6YtVeHW
4L8An3YDUQHUZ4BivKoxmnIZS3JFtcKm
=0SPn
-----END PGP SIGNATURE-----

--Apple-Mail=_856BBB96-6D30-4182-8462-6D87900C082B--
