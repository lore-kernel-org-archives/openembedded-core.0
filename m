Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1751A71AD1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 16:37:55 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id i85so11706554pfa.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=uELX3G6A3fkVD125HlaQC6gPjydsxYyQDl1Vt4yshwk=;
	b=dhzOz4MPE6FV05vwws9wLulV+BwaABckcuST1Gh+Ih0MtBS4wn9KfLLiJHCMO20dos
	bEd9yTjsTEwtK/paaaWDLxeDlBgFXYvXutKSkYyg8pmLZ3mSkCgt3HPkaJBhTfn4noPM
	ljVDdxCAM1C+2jY1B+e3qu+B/ywP7GfkWB5beRlZnl42OgP9heVSX6mJg5PcnnLVHvBK
	ovMAqkAk+dxMit8QDOIru3mFfW3ofACIRv6JRxDRvQ4yiaQKiWQzZED2ZMUygwhlu9Jp
	04iLk5uA7IViQT9kk4OsVe1qHKwQK3JZpe+tNjDnANA8tn0F8cqW/ZvSDA5tnAzyXW4h
	a3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=uELX3G6A3fkVD125HlaQC6gPjydsxYyQDl1Vt4yshwk=;
	b=T/YzMy0tepHVjaDvJxvXtcN/HNg8EeQTJf/yB0m+BkfY80S9O2NxtKiBTO5Y7mc1x1
	rreEYGAC1MaNjqSvO+M3CSiemxJntlQYqET1RuYeMxYRraWA8uSXk9nrVnW3bp4TvUTf
	i6qQbqZfT/1G2esftBqRPVazIk9Pv6LoxDSePnD4JV9svFTA5P1N9qjgdbez1FN5NpNV
	bCDB/YtrfEPDDa2ogmtX/PgDZ5lJUohmyw7xG/a7gOK26F3dogh5doIzu9laIDRCivz5
	W40gNXpWDvjT0KtQopMS5uEoGRFYzXVno81DfCldU+ULk8tL6EBNcnwvZEQVk+eeHty5
	HAsw==
X-Gm-Message-State: ABUngve7tWC6CmirzEDPja4bvnpv/kJTEarWQgF6+VUaGsTjMjC7KszQaL89diK/Qhl55Q==
X-Received: by 10.98.59.153 with SMTP id w25mr12542372pfj.112.1477154277048;
	Sat, 22 Oct 2016 09:37:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:69a1:6763:cf15:8ed8?
	([2601:646:8882:b8c:69a1:6763:cf15:8ed8])
	by smtp.gmail.com with ESMTPSA id
	y125sm13494020pfb.16.2016.10.22.09.37.55
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 22 Oct 2016 09:37:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
Date: Sat, 22 Oct 2016 09:37:54 -0700
Message-Id: <68D800E1-2594-4E8B-AB8E-6B9C758FD3CF@gmail.com>
References: <alpine.LFD.2.20.1610221156210.31588@localhost.localdomain>
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
X-List-Received-Date: Sat, 22 Oct 2016 16:37:56 -0000
X-Groupsio-MsgNum: 88510
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3E22B79A-039A-4293-B7E0-4B321C160C9D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_3E22B79A-039A-4293-B7E0-4B321C160C9D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 22, 2016, at 9:05 AM, Robert P. J. Day <rpjday@crashcourse.ca> =
wrote:
>=20
>=20
>  i'm about to dive into SDKs seriously for the first time, so a
> shamefully dumb question to make sure i'm starting with the correct
> understanding.
>=20
>  starting with up-to-date OE master branch, i selected
>=20
> MACHINE=3Dmpc8315e-rdb
>=20
> now, as i see it, i can create just the SDK with either of:
>=20
> $ bitbake meta-toolchain
> $ bitbake -s populate_sdk core-image-minimal
>=20
> (in that second command, i'm assuming the choice of image is
> irrelevant, i just always use core-image-minimal out of habit.)
>=20
>  i'm assuming those commands are entirely equivalent in terms f
> generating the SDK, given that meta-toolchain.bb consists solely of:
>=20
>  SUMMARY =3D "Meta package for building a installable toolchain"
>  LICENSE =3D "MIT"
>=20
>  PR =3D "r7"
>=20
>  LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690 \
> =
file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420=
"
>=20
>  inherit populate_sdk
>=20
> so the more efficient of those commands would be just
>=20
> $ bitbake meta-toolchain
>=20
>  also, i did notice the generated host.manifest and target.manifest
> files created along with the SDK -- am i correct in assuming those
> files represent, respectively, the TOOLCHAIN_HOST_TASK and
> TOOLCHAIN_TARGET_TASK values?
>=20
>  anyway, as long as i'm starting with the right info, pretty sure i
> can take it from there, accompanied by the SDK manual:
>=20
> http://www.yoctoproject.org/docs/2.2/sdk-manual/sdk-manual.html


generally meta-toolchain is prior art. You want to use image specific
SDKs so -cpopulate_sdk <image> is fine. In this case it will include the
needed dev headers/libs in your SDK for that given image automatically
it can be any image

I would recommend to try using eSDK, which can be generated using =
-cpopulate_sdk_ext
see

=
https://wiki.yoctoproject.org/wiki/Application_Development_with_Extensible=
_SDK

Thanks
-Khem

--Apple-Mail=_3E22B79A-039A-4293-B7E0-4B321C160C9D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgLleIACgkQuwUzVZGdMxTEGgCfZb7Mli2fqEmobBGpVlSEXgE9
nYgAn07rTOq7IuTXxceFySQRvtaz9Ho7
=c8aO
-----END PGP SIGNATURE-----

--Apple-Mail=_3E22B79A-039A-4293-B7E0-4B321C160C9D--
