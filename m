Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id E225F70034
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 16:56:02 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id s8so74124930pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 09:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=w8gCSJ9dUsXH5UqRESsEcuXZ3k6Lw+kVU67RncQVxdo=;
	b=A6ceyUhp3O4OiyLcyVGLr1RL2nQMzhr9QZccizP6AquRa0ymMDYGfBEdk3v+PdOBEt
	ODG0yVe378IEX8htcv5OQwpNZk+xEAG6oKzdZwJe7NBHCNDH8xzsB+Ve5FvSRqlKP5Od
	T0/+DSqoggeraaQp83fRhcC+cAwfIGAaIslV+WHJIxowOvdovcHXW6Wes4HMcVzBmMYP
	rAx84lb5j/uxE/eH1XAxJv6T8mfkn7aV3T7T7UGN3WNWbSzWJ7KXcHov2dG5cK8zLnW/
	DkgYCjUqB1+/TrNMH3cnMVFxJqCgR0d2fQVCoMd1DLTXKcAytZjIb8C9Mutu2PTFQy/9
	0PvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=w8gCSJ9dUsXH5UqRESsEcuXZ3k6Lw+kVU67RncQVxdo=;
	b=LbVXVRCZ7K2/Voog9qmIe5uL3J0wFI+z3d2UBsDB9kJ1XLiuU7oQMhkYNGObUcblc9
	3Rfn0XIPwGz9JTqQLwO+2dpCmtOeSFbA1gSRnFJXmwPumF7Fvrf/H25HcGEsAYsrS58x
	AJJC3Pm0S/XgBBRTNm2GpFdkzVab6rVbnk7hvdpU8hdVg+MTLJjlwGSK/j8s1dSUtENc
	Z/PddTua7a2B2CP/erBtMB5ryYHRk0Do/D/ySBRAq/jYBlWiBEf+IMd7xInqQ6FSfkfr
	rmn3SWmLMGX2TpQOwPaOYWUcQRsSUJt/czvgN/pPRx5Z3PeW/n6HHy/tc2NdwlNj8q5J
	NVkA==
X-Gm-Message-State: ABUngvcpOlMndwboQYljGPnDBQ863u5A99xCekICzFf3lp/hKN4wSnJMgZBtb6+Q0vupQQ==
X-Received: by 10.99.42.80 with SMTP id q77mr10554578pgq.3.1477155364099;
	Sat, 22 Oct 2016 09:56:04 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:69a1:6763:cf15:8ed8?
	([2601:646:8882:b8c:69a1:6763:cf15:8ed8])
	by smtp.gmail.com with ESMTPSA id
	c75sm13564436pfb.23.2016.10.22.09.56.03
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Oct 2016 09:56:03 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1610221251550.7526@localhost.localdomain>
Date: Sat, 22 Oct 2016 09:55:56 -0700
Message-Id: <0E3B4B95-0B46-41FB-AE8D-9386C0A4694E@gmail.com>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
	<68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
	<alpine.LFD.2.20.1610221251550.7526@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: basic bitbake commands to create an SDK?
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
X-List-Received-Date: Sat, 22 Oct 2016 16:56:03 -0000
X-Groupsio-MsgNum: 88512
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7448AD81-97E7-47F6-9536-03C43482052F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7448AD81-97E7-47F6-9536-03C43482052F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 22, 2016, at 9:53 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
> On Sat, 22 Oct 2016, Khem Raj wrote:
>=20
>> generally meta-toolchain is prior art. You want to use image
>> specific SDKs so -cpopulate_sdk <image> is fine. In this case it
>> will include the needed dev headers/libs in your SDK for that given
>> image automatically it can be any image
>=20
>  ah, good to know, i was starting to get that impression from the
> readings. (is there any mention in the docs that meta-toolchain is
> deprecated? if that's the correct word.)
>=20
>> I would recommend to try using eSDK, which can be generated using
>> -cpopulate_sdk_ext see
>>=20
>> =
https://wiki.yoctoproject.org/wiki/Application_Development_with_Extensible=
_SDK
>=20
>  i was just perusing the testsdk.bbclass file, where i read at the
> top:
>=20
>  # testsdk.bbclass enables testing for SDK and Extensible SDK
>  #
>  # For run SDK tests you need to do,
>  # - bitbake core-image-sato -c populate_sdk
>  # - bitbake core-image-sato -c testsdk
>  #
>  # For run eSDK tests you need to do,
>  # - bitbake core-image-sato -c populate_sdk_ext
>  # - bitbake core-image-sato -c testsdkext
>=20
> does that testing actually require the core-image-sato image? that's
> certainly what those comments seem to suggest.

it should work with any image.

>=20
> rday
>=20
> --
>=20
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day                                 Ottawa, Ontario, =
CANADA
>                        http://crashcourse.ca
>=20
> Twitter:                                       =
http://twitter.com/rpjday
> LinkedIn:                               =
http://ca.linkedin.com/in/rpjday
> =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20


--Apple-Mail=_7448AD81-97E7-47F6-9536-03C43482052F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgLmiIACgkQuwUzVZGdMxSIbgCfRUifaEFk+jx2MlBpvS9mpHO9
xSAAn2UfVugaIM3XkyCmdyVXeT/vW0vU
=/QFZ
-----END PGP SIGNATURE-----

--Apple-Mail=_7448AD81-97E7-47F6-9536-03C43482052F--
