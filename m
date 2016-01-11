Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 200176FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 22:58:13 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id 65so51617696pff.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 14:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ONnPOWnM7bWVFLlLVwTgQ37kBPqQf83D49bwwfD0ZOY=;
	b=wgb/9t+Op+1kC96jrDKL0Fb9iEIR/SA7+fCddvcVuBuLBFWUrNr+MssPROa86ZKECZ
	Yl2m0YErGJJyms5B7UXj9bN+3wbJwoHeXQJv//L97iABpYwGwZgEXFXKnr6VFWrjH3Xa
	xSBJDhsVqMK9tIlxpVN4KFrN2LJzPobsOWg9PTjY89r7Q2tN9F/5pSK4Bk7E01joeVy0
	rr56wbH6DJ6laz13Khwxyrk1kyhnD9V3QcVVVscnbt5bIX9bIORIlT41SEQTmDeAQQmH
	Gca3xXFS8Aathoem/u4aQIWlkAKMKkpFJRAsW2RH5WUaKTre8llOFPBQrDnu5DEhQExX
	PysA==
X-Received: by 10.98.12.213 with SMTP id 82mr29340985pfm.116.1452553094872;
	Mon, 11 Jan 2016 14:58:14 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id 20sm4296200pfa.5.2016.01.11.14.58.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 14:58:14 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452210004.2002.129.camel@pbcl.net>
Date: Mon, 11 Jan 2016 14:58:09 -0800
Message-Id: <4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
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
X-List-Received-Date: Mon, 11 Jan 2016 22:58:16 -0000
X-Groupsio-MsgNum: 75882
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC2E66B8-751D-49B1-96BE-0B688CF58E31";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DC2E66B8-751D-49B1-96BE-0B688CF58E31
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 7, 2016, at 3:40 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Thu, 2016-01-07 at 14:29 -0800, Andre McCurdy wrote:
>> FULL_OPTIMIZATION_armv7a =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>> +FULL_OPTIMIZATION_armv7ve =3D "-fexpensive-optimizations =
-fomit-frame-pointer -O4 -ffast-math"
>=20

O4 ? may be just replace this whole thing with -Ofast now a days
-fexpensive-optimizations is enabled at -O2,-O3 anyway same for =
fomit-frame-pointer and -Ofast turns on
feast-match on top of -O3

> I wonder if this would be better as just FULL_OPTIMIZATION_arm.  That
> said, the OPTIMIZATION variables are primarily distro knobs and it's =
not
> entirely clear that individual packages ought to be overriding them at
> all.
>=20
> Does anybody know whether there is any actual science behind the use =
of
> those flags on armv7a specifically?

it came into ffmpeg circa 2008 and proliferated into related components =
primarily to support vectorization and neon
which was quite nascent for ARM architecture in those days in gcc. Today =
if you were to configure libav with default options
then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno =
-fno-signed-zeros -fno-tree-vectorize

which is primarily -Ofast -fno-tree-vectorize
>=20
> p.
>=20
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DC2E66B8-751D-49B1-96BE-0B688CF58E31
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUM4UACgkQuwUzVZGdMxQBBwCfXWjX2OP8UShc7RE9aGPYjbQj
tUEAoI6Tc8+VJp4mYRN5eVSw4QDxPa/5
=ainq
-----END PGP SIGNATURE-----

--Apple-Mail=_DC2E66B8-751D-49B1-96BE-0B688CF58E31--
