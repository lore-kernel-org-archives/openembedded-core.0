Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id DBD1C763CE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 00:04:28 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so141085906pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Sep 2015 17:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=JI9WLAyjz8LlKnejNoW+FJF6KlFKD1aGMIwv5uqVXYU=;
	b=aqoymr5EHj/LSoAw6z2SHdKTlRtSTNjKY2IjIUIzYYeIRo9meDOJOsQTjPRP7A0qZ1
	3Wa28LrzDmYxNL7m9wsRGRsA6e0TTUcPHy+HH/i2c9IGhbV1U+IODwiTnUxPWsqJlpyj
	ZzdfMSoSGAbPMMrdiyxciKt43LxWdnoLDDIczRqfC/b1364/8ZzG0b/HXbKECmIESmO/
	WpXPwfjhlhwU9BrTpMmYYV70oY5WHMGbD1ERvfcLajvSWY2wbchNCrU3vwoHpfLlygX6
	v+YbECyLUFRS7QYWnexfIHOrw9zDtgWjrSK3YG08yC9Cl9+ceQwbfgmU94o4F02DGYHJ
	ZaGQ==
X-Received: by 10.68.200.40 with SMTP id jp8mr65066925pbc.16.1441757068772;
	Tue, 08 Sep 2015 17:04:28 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:4ddf:eeff:d299:213f?
	([2601:646:8601:4580:4ddf:eeff:d299:213f])
	by smtp.gmail.com with ESMTPSA id bh5sm4773562pbc.5.2015.09.08.17.04.27
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Sep 2015 17:04:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441430654.24871.202.camel@linuxfoundation.org>
Date: Tue, 8 Sep 2015 17:04:22 -0700
Message-Id: <1F034136-91B3-4F7D-943C-F92881B22EE5@gmail.com>
References: <cover.1441299182.git.raj.khem@gmail.com>
	<4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
	<1441430654.24871.202.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] busybox: Use UTMPX instead of legacy UTMP
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
X-List-Received-Date: Wed, 09 Sep 2015 00:04:34 -0000
X-Groupsio-MsgNum: 70870
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E3DA38E7-03DC-4B60-80E1-F586DA300BA4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E3DA38E7-03DC-4B60-80E1-F586DA300BA4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 4, 2015, at 10:24 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Thu, 2015-09-03 at 16:54 +0000, Khem Raj wrote:
>> This makes busybox honor UTMPX feature if available in a libc
>>=20
>> [YOCTO #8243]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 =
+++++++++++++++++++++
>> meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
>> 2 files changed, 389 insertions(+)
>> create mode 100644 =
meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>=20
> This breaks poky-tiny.
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/poky-tiny/builds/490/st=
eps/BuildImages/logs/stdio
>=20

well poky tiny now needs to enable utmpx support in libc as well, sent a =
patch for that

https://lists.yoctoproject.org/pipermail/poky/2015-September/010218.html

> Cheers,
>=20
> Richard
>=20


--Apple-Mail=_E3DA38E7-03DC-4B60-80E1-F586DA300BA4
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXvd4sACgkQuwUzVZGdMxR05QCcCkrwmF5qTAM0Y+kVN7gtYmiH
K4YAnR/ffL9XY9nnqLK3zlmpwvrk3aMB
=j2/x
-----END PGP SIGNATURE-----

--Apple-Mail=_E3DA38E7-03DC-4B60-80E1-F586DA300BA4--
