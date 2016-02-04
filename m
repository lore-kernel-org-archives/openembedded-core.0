Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id A346E766A3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 04:24:45 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id w123so30584783pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 20:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=QFI0IYgPZ+IsgA2WNA0RjZbwwhIdLwo3bZ3eJIwyLWI=;
	b=E4dEiWKsVDRoXxxaC3X1xZd+TYGrdcIuSAn/fVkCgkt9Dq1lgIhdDv5LM5T/g7SPt9
	gJvaoOK+4Fag1MWV2+n0mKdvye0CkWphOP5jcUwX802n0RcTxR8aNeOyNG7e2TujgH2s
	R5cN0aFBm9rV+t8J4ZcKPGDFhNrCKUkASznseSu1y4duJ3vNErysM4d5ta6e47sYsM4c
	svLMXOdlV34HvIgrtpdXmT96gqshpd9TOl1U+QH1pc18uKlT+2fJ07CEq5waGZG+IAnf
	4EP5e9VdnAZpgqlF3JYDkZ8ghdDRhyOroWqzpzRKtiMjo86Vc1mO9c+OrO7itR1sctTA
	MHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=QFI0IYgPZ+IsgA2WNA0RjZbwwhIdLwo3bZ3eJIwyLWI=;
	b=iYaTEDRwOAGiRfHvvVJ5I5L3ssS62gnLRRAxf3UGykJfY0ged6HiH1MwmgjLdjwjc4
	vn74XCpS04rFZN0eI/Ej2VSHddN3vWz4YcUBqJ6nkN7jLqJElQrEb6SBcQcte/sS85LP
	taO+lIsXxg0iMlG3kw4WpVnK6jTmletfDe1HTesXpFWCg4rLSFRsEd6FABfIDvePCEuq
	UeGA/vlDz5gWAdkEPdfdOz7gQHrUQF3l3wrO5jTJ9D6hgZV2nuYO3+S0Yb6rkj/LLmqL
	GUGY/gWVEZO1Pmj7pt6wluTyBpOWvlQWkgZ6ULPv/d/w6icAeN63/qLbpsy3nygJg9L0
	Yufg==
X-Gm-Message-State: AG10YOS5qqXYwM9qkGyg2TWZ4vPjknIFGfqjpvj2vWEw9ED0Scp9IVpOEThNVojbD9Faag==
X-Received: by 10.66.90.133 with SMTP id bw5mr7941679pab.22.1454559886010;
	Wed, 03 Feb 2016 20:24:46 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:952a:ca47:d927:7f24?
	([2601:646:8802:5d5c:952a:ca47:d927:7f24])
	by smtp.gmail.com with ESMTPSA id
	z67sm13153201pfa.71.2016.02.03.20.24.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Feb 2016 20:24:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <56B2C5D5.9040502@gmail.com>
Date: Wed, 3 Feb 2016 20:24:40 -0800
Message-Id: <60CC783B-F3E7-4077-BBD0-4788970515BE@gmail.com>
References: <56B25500.7030402@gmail.com>
	<34309FCD-61ED-4DC8-BD3C-219DE8924BDA@gmail.com>
	<1478930.Uaq5cohNMu@peggleto-mobl.ger.corp.intel.com>
	<56E071BC-9E02-44DD-8236-9697A647F8F7@gmail.com>
	<CA+chaQd2Cdzpo0_LP2mJUoYe8UtwmOK3DCpE-yXk_s80t41QSA@mail.gmail.com>
	<56B2C02C.90607@gmail.com>
	<1F06A159-1BC5-4008-92D0-B7939CE41A17@gmail.com>
	<56B2C5D5.9040502@gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: binutils upgrade to 2.26 failure - unsupported reloc 42 against global symbol __gmon_start__
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
X-List-Received-Date: Thu, 04 Feb 2016 04:24:45 -0000
X-Groupsio-MsgNum: 77506
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0B7F2CF9-89EA-46E1-8F0F-73EAB3D20883";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0B7F2CF9-89EA-46E1-8F0F-73EAB3D20883
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 3, 2016, at 7:30 PM, Trevor Woerner <twoerner@gmail.com> wrote:
>=20
> On 02/03/16 22:08, Khem Raj wrote:
>>=20
>>> On Feb 3, 2016, at 7:06 PM, Trevor Woerner <twoerner@gmail.com> =
wrote:
>>>=20
>>> On 02/03/16 15:32, Martin Jansa wrote:
>>>> This could be caused by chromium using own bundled binutils where =
the version doesn't match, I've solved it in our recipe by:
>>>> +GYP_DEFINES_append =3D " linux_use_bundled_gold=3D0"
>>>> +GYP_DEFINES_append =3D " linux_use_bundled_binutils=3D0"
>>>=20
>>> w00t!! awesome. works for me :-)
>>>=20
>>> So it looks like we both have working chromium recipes, yet the =
upstream one doesn't work. What version are you building? For what arch =
(which archs)? x11/wayland?
>>=20
>> please submit your patch for meta-browser
>=20
> Any patch I submit is guaranteed to be rejected. It only supports x11 =
and has only been tested on x86_64. If nothing else it would have to be =
named chromium-x11_<version>.bb, or something like that. I've actually =
removed the wayland/ozone stuff from my recipe.
>=20
> Considering each build of chromium takes me 2.5 hours (just for =
chromium alone!) it makes it hard to care about environments I'm not =
using.
>=20
> The only way chromium builds for wayland is when another project =
(ozone) is added to the mix. But, in my tests so far, not every release =
of chromium builds successfully with every version of ozone. So although =
building for x11 is easy and works for just about each release, building =
for wayland is much more hit-and-miss (and has less chance of success).
>=20
>>>=20
>>> I have a working recipe for 50.0.2636.0, but I'm only interested in =
x86_64 and x11. wayland+ozone is a whole other mess ;-)
>>>=20
>>> At some point it'll probably be easier if we build chromium with =
llvm-clang, the same as google is doing. Is that possible?
>>=20
>> you can try using meta-clang
>=20
> Okay. So if I have an image and everything in that image is built with =
gcc except for chromium, meta-clang will know what it needs to add to =
the image so that one clang-built package can run?

actually it will make clang as default compiler and there are some =
stubborn recipes which are hardcoded to use gcc even when clang is =
available see
see =
https://github.com/kraj/meta-clang/tree/master/recipes-excluded/nonclangab=
le

you just need to set

TOOLCHAIN =3D =E2=80=9Cgcc"


> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0B7F2CF9-89EA-46E1-8F0F-73EAB3D20883
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlay0osACgkQuwUzVZGdMxQ8WACZAYcPvGRhV2iJQ8mX9PG0/86h
rkYAn1K4yje4oe8JFK08p+157KsofL/l
=r3bH
-----END PGP SIGNATURE-----

--Apple-Mail=_0B7F2CF9-89EA-46E1-8F0F-73EAB3D20883--
