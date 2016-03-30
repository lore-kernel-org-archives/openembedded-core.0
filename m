Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 90D126AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:11:28 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id td3so51088375pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=nqxXp6A5P9IrMsE3AkrDQcpHNxARmVuDdmGf5LgymE0=;
	b=c1yOws3GMrH6I5XEO4bmLyrWNJK8uNLBXHuTOMe2RFnwScBEP9tOoKT+04wQ9T/YVk
	Np/6aCOXWjT/GUyVlBVFx9fmj3a/2DTEhj+H6jf0+xBdYeka2l0Lzbn943k5c1xHibb9
	+6mDS0ZZsoxhbuMXy+Cq+1hSpjpvUUTQASz4omEf4CuOWcvmwQN+j10YgzE+7+VQEfaP
	JsoPz4LaKFzhu6HbFsBnmasZ1lM9p7MntFWB6OVD+GukZhzpDoKSJ0czM0JOpAaROjfI
	buXVwKfNv0crQtlTrc3mQln+xq2Kt6m541LjJLvwCNJnn0+pU/9z0HI/RVIB+zzQcrWJ
	hSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=nqxXp6A5P9IrMsE3AkrDQcpHNxARmVuDdmGf5LgymE0=;
	b=Y9njnIVAjAh6N0TDyT3+WgsBKwoc3cG1pkrlsOW4XUAG/eErZoEi4wMW+YWSzOyjtF
	7ZBzUwaBvjN2Mt5z+My+J/xmxQRR4v9AJ2OpTsygFI8E1dTWeyDf/Mh1m5AopERB8Poq
	Ma58j6fILprxjF4YQS8P7hVHiEDaDMCfvS5INYlXM2UYLWcpD0GFGQa28XfK/hlBrUla
	qBn0v/5M6R5mZp/BIYXfjP9xfVgDJNjfQ586JWgD5Tkrkcan7gaGdsxCnvb5XHXBtWBK
	ZkmFqGUzr0EWb2VzC7Y76hiRzUaewDyxZ3ug0GjrXtEv8BrgJXGSaGanxPkt/7a67PV4
	USuw==
X-Gm-Message-State: AD7BkJKtWCwd6Pf4puGvocNN3BvsBxOooWp4MlR+bhAKsuZ7FgvR2rW/5GOHPV+OtHfcaA==
X-Received: by 10.66.190.40 with SMTP id gn8mr17080234pac.64.1459379488852;
	Wed, 30 Mar 2016 16:11:28 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	l81sm8351931pfj.21.2016.03.30.16.11.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 16:11:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
Date: Wed, 30 Mar 2016 16:11:24 -0700
Message-Id: <4C87CFB9-C93F-4F88-9F7C-1D146795AED2@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Wed, 30 Mar 2016 23:11:31 -0000
X-Groupsio-MsgNum: 80321
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B450B4F7-F30A-450C-BC8B-ADC4528B7F11";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B450B4F7-F30A-450C-BC8B-ADC4528B7F11
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2016, at 11:53 AM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
>>=20
>> Is it really =E2=80=98onwards=E2=80=99 or just cortexa9 was an =
exception. Can you
>> point to some documentation on it ?
>=20
> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s =
Guide for
> ARMv8-A mentions:
>=20
> "Both floating-point and NEON are required in all standard ARMv8
> implementations. However, implementations targeting specialized
> markets may support the following combinations:
>=20
> - No NEON or floating-point.
> - Full floating-point and SIMD support with exception trapping.
> - Full floating-point and SIMD support without exception trapping.
>=20

this means nothing changes for ARM ABIs from v7 to v8 question is do we =
care
enough for these offshoots.

> =
http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.den0024a/CJH=
ECGIH.html
>=20
>=20



--Apple-Mail=_B450B4F7-F30A-450C-BC8B-ADC4528B7F11
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8XR8ACgkQuwUzVZGdMxS6BQCePZsx+8lMyV1+JWkVdd0vMqt+
tswAnj3jg51Qi3d8Cryf39LHWz1fnQRb
=nC2u
-----END PGP SIGNATURE-----

--Apple-Mail=_B450B4F7-F30A-450C-BC8B-ADC4528B7F11--
