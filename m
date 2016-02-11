Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 80B316FFC8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 17:29:52 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id ho8so32056150pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 09:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=MklQloN3zANlaBRkKcGlUKptaLzPgqYppOVtcsJe6ng=;
	b=JaHytpSeFDNnwvYuJGejUm108wYKijtJ/7HaeN9fQfSG0GhV45U1tvw8Xmfx46hQBM
	VKmxvygfM29dT8+sZn6HAZKQ0+mXq+3xgJRLrQ1cxhzA8zG1u3iZA1Lqt8ucyQv//Plt
	eO3EXDO2YuxmBxoOGJCw7BVOeqJ1sfIrfhHfMKdABRcUn67t/Lh0VLcbdDR2FC3NwUhB
	9EThYBOv7OW4YRU50K8joHp4nEHD55ixWr6i3OamHXjVmQS7uYdEJ2S3vPmUiGTR/a0F
	Y5FtCwkpFvEZFFLZ5T/aUdxKjqNxXAGg0NsqFJBObXom69ApEN9Jx1sN/QOogupN6dJl
	lFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=MklQloN3zANlaBRkKcGlUKptaLzPgqYppOVtcsJe6ng=;
	b=mATfxML/0lCw5hyCRheySxTifRi9JR+fu4bpsEDhUo840Rez6OXPmKGKntyhnkZebh
	onEspcDJGd493HpXM6pkRwHpWB2r5CgS87z3ShWurq/Ac+NNCuleB3uYDDC2G1f3Azs4
	kDrcWg6kuBFJDc3oABDZAAZYauW4YA4UZ8BAZj/H8FrLBBWH3Hq8Ov901U0hjmJ9jkzO
	4O3QiNRkt575sSsQ3/Udn18Cbj5huOHuHLflXIZepn3AViqaCMel29XCMutFi+dNPAM+
	031Gwz7z/53ZtSoh36SvevWYLr7HyS6BwThZcu1pXpOAo45SP2fpQukS5xE37LWeMDFr
	INXA==
X-Gm-Message-State: AG10YOQvLjnCww01zlVWtTueRxPcSmZif7B/7BUWknXwgQ8eFs/2VSs7gKdO91oVJKoGiQ==
X-Received: by 10.66.220.230 with SMTP id pz6mr23077650pac.91.1455211793074;
	Thu, 11 Feb 2016 09:29:53 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:a190:ab95:2b5:eacb?
	([2601:646:8802:5d5c:a190:ab95:2b5:eacb])
	by smtp.gmail.com with ESMTPSA id 9sm13650431pfc.69.2016.02.11.09.29.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Feb 2016 09:29:51 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56BCC3F8.9000908@gmail.com>
Date: Thu, 11 Feb 2016 09:29:45 -0800
Message-Id: <3D3D10B0-D1B4-47BE-9D3D-B5FF7A6B77A9@gmail.com>
References: <56B922B3.9070604@gmail.com> <56BAB9F8.4000106@gmail.com>
	<A7F6AE58-0DBC-4180-B232-4876DD5E20E6@gmail.com>
	<56BCC3F8.9000908@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Thu, 11 Feb 2016 17:29:52 -0000
X-Groupsio-MsgNum: 78017
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9FFBC4EB-E117-4678-B10D-A852CCD4BF2F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9FFBC4EB-E117-4678-B10D-A852CCD4BF2F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Feb 11, 2016, at 9:25 AM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>=20
> On 02/09/16 23:37, Khem Raj wrote:
>> IIRC gold has its own notions to enable gold
>> so you need to enable that
>>=20
>>> On Feb 9, 2016, at 8:18 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>>=20
>>> I've tried every combination I can think of and no matter what I =
try, if gold is the linker the chromium build always errors out with:
>>>=20
>>>    collect2: fatal error: cannot find 'ld'
>=20
> Building with gold does cut the build time of the chromium component =
back down.
>=20
> binutils 2.25, bfd:  00:47:51, 00:44:24, 00:44:25
> binutils 2.26, bfd:  02:07:45, 02:09:31, 02:02:42
>=20
> binutils 2.26, gold: 00:43:49, 00:45:18, 00:42:51
>=20
>=20
> But the only way I could get it to work was to manually perform the =
following steps:
> $ cd <oe tmp dir>/sysroots/<native sysroot>/usr/bin
> $ ln -s <cross toolchain prefix>/<cross toolchain prefix>ld.gold =
ld.gold
>=20
> where:
>  <native sysroot> =3D x86_64-linux
>  <cross toolchain prefix> =3D x86_64-poky-linux
>=20
> to give:
> $ cd <oe-tmp-dir>/sysroots/x86_64-linux
> $ ln -s x86_64-poky-linux/x86_64-poky-linux-ld.gold ld.gold
>=20
> Maybe I can play with the recipe a bit more to get this to work =
"automatically"; maybe by setting the LD environment variable =
differently or something.


you can always pass -fuse-ld=3Dgold to LDFLAGS
secondly if you can tar up all needed objects and let
others reproduce it would help.


>=20
> But, as I said before, the last time I tried booting a gold-linked =
image on the minnow grub2 refused to work :-(
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9FFBC4EB-E117-4678-B10D-A852CCD4BF2F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAla8xQ4ACgkQuwUzVZGdMxRWWgCeLJMtODHxpFX10lwelk4u9+tr
8dEAnRx2b/VQyn3Zw0NQ9bP3wEJLANVv
=OW3o
-----END PGP SIGNATURE-----

--Apple-Mail=_9FFBC4EB-E117-4678-B10D-A852CCD4BF2F--
