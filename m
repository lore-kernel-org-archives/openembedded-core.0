Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.6288.1613562350517391585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 03:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=WRsemFkS;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from fringe.fritz.box (unknown [87.123.127.191])
	by linux.microsoft.com (Postfix) with ESMTPSA id F3F1520B6C40;
	Wed, 17 Feb 2021 03:45:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com F3F1520B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1613562349;
	bh=hbG+nrszYMf4CKltkH6T5Jznf8pHA1U7mV0GylFwQOY=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=WRsemFkSG2SX/vgtfqb75S1vveF8/ouTvrMy3tpMw8ylqkrkjGKGxMxnT/6PBTpyb
	 +TyQEOsgWGNsyVTWrfktT4C542uBkFhwqzwamjSO2heCDX7mi8aBkZM6MAeCk+wcF2
	 GTamYe2BSGeuSep2VCYx7TUj4CLbTTHPyl6ld3Y0=
Message-ID: <557d69ebe7e78cc245a3b4a9cd90223e9a2d7021.camel@linux.microsoft.com>
Subject: Re: [OE-core] meta-rust -> oe-core
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Reply-To: anbelski@linux.microsoft.com
To: Randy MacLeod <randy.macleod@windriver.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Cc: Khem Raj <raj.khem@gmail.com>, Andreas =?ISO-8859-1?Q?M=FCller?=
	 <schnitzeltony@gmail.com>, Vinay Kumar <vinay.kumar@blackfigtech.com>
Date: Wed, 17 Feb 2021 12:45:37 +0100
In-Reply-To: <e9e8693d-2e4c-40be-55ac-37ae001ec7b5@windriver.com>
References: <e9e8693d-2e4c-40be-55ac-37ae001ec7b5@windriver.com>
User-Agent: Evolution 3.38.3 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

thanks for driving progress on this work.

On Tue, 2021-02-16 at 21:40 -0500, Randy MacLeod wrote:
> I've updated poky-contrib with my merge of meta-rust to oe-core:
>=20
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleod=
/rust-wip-2021-02-16
>=20
> The build status is fine (shown below) aside from qemuriscv64/musl
> and qemuppc/musl.
>=20
> Khem is working on the qemuriscv64/musl problem with upstream rust
> devs.
> qemuppc/musl fails due to:
> =C2=A0=C2=A0=C2=A0 libunwind.cpp:66:3: error: #error Architecture not su=
pported
>=20
> Known issues if someone is interested:
>=20
> 1. I have an updated librsvg that isn't building using autotools
> =C2=A0=C2=A0=C2=A0 It does build with cargo but I doubt that will produc=
e a library
> =C2=A0=C2=A0=C2=A0 that is usable. See=20
> https://github.com/meta-rust/meta-rust/issues/264
>=20
> =C2=A0
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=3Drmacleod=
/librsvg-broken-wip-2021-02-16
>=20
> 2. native-sdk support is broken:
> =C2=A0=C2=A0=C2=A0=C2=A0 https://github.com/meta-rust/meta-rust/issues/2=
36
> =C2=A0=C2=A0=C2=A0 As shown in my OE talk last year, you can do rust app=
lication
> =C2=A0=C2=A0=C2=A0 development and testing without this but it would be =
best to
> =C2=A0=C2=A0=C2=A0 fix this bug and have rust behave like other YP toolc=
hains.
>=20
I was working on the SDK support some passt weeks and coincidentially
filed a PR yesterday

https://github.com/meta-rust/meta-rust/pull/313

This is definitely a wanted feature. If some would have time for a
review, it'd be great. Please also let me know how it would best be
integrated into your patch.

Thanks

Anatol

> 3. There's an cargo-fetcher proposal sent to the bitbake
> =C2=A0=C2=A0=C2=A0 list from Andreas but I don't see a patch to meta-rus=
t to
> =C2=A0=C2=A0=C2=A0 make the two patchsets work together. Andreas, is tha=
t something
> =C2=A0=C2=A0=C2=A0 that you can do, even if it's just a quick change to =
get started?
>=20
> 4. We're (Vinay via WR) working on a way to use the rustc test suite.
> =C2=A0=C2=A0=C2=A0 More to come on that later this week.
>=20
> Sorry that this has dragged on for so long.
> Any help would be appreciated.
>=20
>=20
>=20
>=20
>=20


