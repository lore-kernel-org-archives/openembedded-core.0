Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 90D356AC4B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 23:13:47 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fe3so51484330pab.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=Y8dqdWcadZWjxU5Tc+9RxrLPHQBs7IUcZbwzhI3pw8g=;
	b=QvYEwGTqxuJKME8PDv8VGJ6nVpWkfvy+3rF0fkhWSCvuJf+X7PG3YvGcyQwmG93Zex
	5krqJzhOZZIO7H1KFmVeOou0ry7P53FNt++4VZN6FJezREFZIwjxWVAfgwNRgSLI9JZL
	lxUt8I8tR/ygTjCFdSEykJLh99mNSxadY56TUAIS/XLSkdLCv3OWPZDLByKi2u5cXrnC
	8LykFM+x4cMJgsQzHE2JggFXIKv1IdppHya6ydZOEBchtkb3/PJRBakGHFBjhYPLEU+v
	u1eEYziXgmPn1kGREz9JNPdZA69T093P7S3QNwIWmZUqpk4ydXQUuEDbUxlE2saU/pmK
	0BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Y8dqdWcadZWjxU5Tc+9RxrLPHQBs7IUcZbwzhI3pw8g=;
	b=e+z2RbY7w91pb8onxoO8f5xdrdfTVnBY+GPVIJpjgmEudqxm+VgJhYgrkw6UWP+V8w
	gVCabrO0pxxQr9mScFBVnUPC3QN3dCzJ7mcIMToT8HSc25qFlRDevTLGL7AOUdDgp8Bd
	ZovZV3Bolp/+2OEBnlhyK7zSEfGfbvMlhPQL0ZiZXnSgIBJakBbS8vEhX6aOaZdWXm0X
	5+qYPLYwyLdhnOB9A3Rr9jNgbGJMFvwlB5rgInLZefj/PrHTD529HmCJTeu05siewCDq
	Ph4VkLNu6np74fcYjaHvjd8qWmlGDCehqlx1NcijZpNV8B7JdO7CZPa19jHOZNbClHvW
	Azlw==
X-Gm-Message-State: AD7BkJJOTzrPOHiHT+0JpVR6Lm6fn/jkzfCYTM8HMSKiAHO+hB0zJb3VTTdsvFp8GZL8nA==
X-Received: by 10.66.131.79 with SMTP id ok15mr17313870pab.151.1459379628130; 
	Wed, 30 Mar 2016 16:13:48 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:5948:2b5c:b7c0:30b8?
	([2601:646:8800:5a9a:5948:2b5c:b7c0:30b8])
	by smtp.gmail.com with ESMTPSA id s66sm8378301pfi.3.2016.03.30.16.13.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2016 16:13:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1459377982.2322.57.camel@pbcl.net>
Date: Wed, 30 Mar 2016 16:13:47 -0700
Message-Id: <FE26BDAC-8B7D-4097-99DE-621B3B0FD83C@gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
	<1459377982.2322.57.camel@pbcl.net>
To: Phil Blundell <pb@pbcl.net>
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
X-List-Received-Date: Wed, 30 Mar 2016 23:13:50 -0000
X-Groupsio-MsgNum: 80322
Content-Type: multipart/signed;
	boundary="Apple-Mail=_83CB7008-4DF9-4BF4-BEA2-165C8462446B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_83CB7008-4DF9-4BF4-BEA2-165C8462446B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Mar 30, 2016, at 3:46 PM, Phil Blundell <pb@pbcl.net> wrote:
>=20
> On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
>> Either way it shouldn't be a concern for the CPU tuning files.
>> Building Thumb2 for an armv8a CPU is really just an extension of
>> "optimise for size" and we don't include -Os, -O2, etc options in the
>> CPU tuning files.
>=20
> Yes, agreed.  In principle there's no reason that the compiler =
couldn't
> choose between A32 and T32 instruction sets dynamically for each
> compilation unit (or each function) according to which it thinks would
> give the better result.  And from the user's point of view, the =
outcome
> should be equivalent apart from minor performance differences.

yes I think thumb2 on aarch32 may be controlled via a global =
configuration metadata
like distro feature or some such.

>=20
>>>> For most cores from Cortex A9 onwards NEON and VFP are optional, so
>>>> hardcoded assumptions won't work.
>=20
>> Nothing very concrete. The ARM Cortex-A Series Programmer=E2=80=99s =
Guide for
>> ARMv8-A mentions:
>>=20
>> "Both floating-point and NEON are required in all standard ARMv8
>> implementations. However, implementations targeting specialized
>> markets may support the following combinations:
>>=20
>> - No NEON or floating-point.
>> - Full floating-point and SIMD support with exception trapping.
>> - Full floating-point and SIMD support without exception trapping.
>=20
> Is there any evidence that anyone is actually building ARMv8-A (as
> opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there is =
a
> fairly clear indication that such cores do exist and are likely to be
> used with OE, I think we should not complicate the tuning files with
> support for such things.  Anybody who wants them can always add
> appropriate tunes later, either in oe-core or in their own layer.
>=20

agreed.

> p.
>=20
>=20


--Apple-Mail=_83CB7008-4DF9-4BF4-BEA2-165C8462446B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlb8XasACgkQuwUzVZGdMxSp7wCfZB3DYhLC8v3WYnkZJdhZxP1/
b30AnirxnhuEy8sX/EFLaQ5hGdtC90tl
=Ylxh
-----END PGP SIGNATURE-----

--Apple-Mail=_83CB7008-4DF9-4BF4-BEA2-165C8462446B--
