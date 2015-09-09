Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5BECF7669F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 05:55:59 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so146944927pac.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 22:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=ecIPp8Z/Bm/EqzMDXXmfCqlUVbUgmE2uCM8Ee29X7cs=;
	b=TtCFoRTD/31OmYFjFCJYncCXimILbse5ggN9CUjjjzmY/3WyUWQKvj2uVkxrUXMpbX
	PoThdRhrLtYfVU4zJJ/a/3YIDgMWtqjcqLO4mfhr3bVCe9Sa5+hOaI2K4lxRRGlXp3y+
	Swa+pPWzZdD8X4SDhvrWJxEtp9cY6bQxEa+niIllirmwF/VyASGo/DQF+t9cxXsyJxTT
	dZQTJaEKjahThjy/soqtvRmc2boAKEZd1+lQ+gaVBnRsDuAQ2w/RAlooGNjnLqbCnMdO
	0NujVSrWT+oZHn1ZqqTN7l/ytT0JBK7b23rPSRuN6qx3pxpQBZKKZZBmDHrKtgFprfDQ
	qU4Q==
X-Received: by 10.68.89.35 with SMTP id bl3mr67727566pbb.69.1441778159864;
	Tue, 08 Sep 2015 22:55:59 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:17f:93e:50e6:541c?
	([2601:646:8601:4580:17f:93e:50e6:541c])
	by smtp.gmail.com with ESMTPSA id
	lh4sm5546243pbc.19.2015.09.08.22.55.57
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Sep 2015 22:55:59 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <7B715C23-22C6-4F08-8389-45CCE8EA7D9A@gmail.com>
Date: Tue, 8 Sep 2015 22:55:48 -0700
Message-Id: <BFA4D604-FB13-4650-843F-3A0C7C2A1ADA@gmail.com>
References: <87b72ec93b53c0a0ac61950f52480fa86a93c937.1440446289.git.raj.khem@gmail.com>
	<96e447b0dad1a139b68ee85780055379147ba40f.1440446289.git.raj.khem@gmail.com>
	<1441142254.24871.22.camel@linuxfoundation.org>
	<7B715C23-22C6-4F08-8389-45CCE8EA7D9A@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/17] busybox: Use CC instead of bare LD to be the Linker
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
X-List-Received-Date: Wed, 09 Sep 2015 05:56:00 -0000
X-Groupsio-MsgNum: 70881
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0F892ADB-36D3-4021-BDC2-2621EB5008FE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0F892ADB-36D3-4021-BDC2-2621EB5008FE
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 1, 2015, at 4:55 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>=20
>> On Sep 1, 2015, at 2:17 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>=20
>>> =
/mnt/home/kraj/work/angstrom/build/tmp-angstrom-glibc/sysroots/x86_64-linu=
x/usr/bin/arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi-ld:
>>> error: applets/built-in.o: unsupported ELF file type 2
>>> clang-3.7: error: linker command failed with exit code 1 (use -v to =
see invocation)
>>=20
>> This breaks DISTRO=3Dpoky-lsb:
>>=20
>> http://errors.yoctoproject.org/Errors/Details/15705/
>>=20
>> (searching for busybox shows many other versions of this too)
>>=20
>=20
> OK I think we add -fpie to poky-lsb. is that right ?
> now instead of calling ld directly we are calling gcc to do linking so =
we now also get the baggage of CFLAGS since LDFLAG =3D CFLAGS
> which is actually correct but in this case we are trying to do partial =
linking so -pie is useless at this stage of linking. So what we need is
> to ignore -pie ( add -fno-pie) in LDFLAGS when doing partial linking. =
I will send a reworked patch.

I have sent out a v2 addressing this issue.

=
http://lists.openembedded.org/pipermail/openembedded-core/2015-September/1=
10245.html

--Apple-Mail=_0F892ADB-36D3-4021-BDC2-2621EB5008FE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXvyewACgkQuwUzVZGdMxQdNwCeMPfDZay0wLBnpENpfB47DidK
wMkAni2QRrkqm4Iv9IS5t0XTDIXmwBub
=2sW8
-----END PGP SIGNATURE-----

--Apple-Mail=_0F892ADB-36D3-4021-BDC2-2621EB5008FE--
