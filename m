Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 3D3D5606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 18:02:24 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id h186so345579pfg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 11:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=SW+kwLNmj9WVt1Q1xIeVa27A0atm/OtDjZmeaGPcEC4=;
	b=N2KixvcAwPkxWoaKGOiG394RZ1+osPRkw44MonaQZZpOeoZuIg58Eb6aT7AriZkQic
	sTxphBIEx8z4mBxEtlTicDlujZTZKa5plMl93hLeEBIYanQenHhv6EclsC33fnVd9xof
	vE7iC2r+0dsooLtZqfKh2hxakdFYkWv5RvC/ym4McBRswco1JsxMkcejhN+dNNUZm+nn
	qSgzuTvhBBE/0g0hmjK2Ttf+3KdM7yJoDaUIQVRT6w1+8ya7WeH55QjLLsEI+u2gpzkZ
	Gy4ndXBOdYgKTY7RJtbrusTGAe/AwGz3w/nYHp5AdGriErKJtYjBiZneOraW6W5AlnLQ
	tVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=SW+kwLNmj9WVt1Q1xIeVa27A0atm/OtDjZmeaGPcEC4=;
	b=GEI1tK562hC6Ev+xeVAsKOJIrRTziQf1FJQ+tsHiW7War4v9DWPTYrdiaZz3ZpbAvR
	hozYAoz9q6ncTVKNRaREeLJVtLXg+nAwSLruEuSiQF8eOUPVvneMtJ9GtI2FaEGZlMHr
	Yd0CJQlHohdIt/c/XXCqIRHwFBCPxAdC9+jcq7EEzQ1j/RZEUnf/597si/0rpKhhy4tZ
	2w16FBvZWmCagfLAh8zbFzOjSky9uqM1cotx8lZXucL70Te7zbyENhJPi5W/cyDGHmV9
	xo7KR/hnGO1FCcH/krjKLlqYXJKYUsqn0wNG0xShf7EHxIPxntjUeqXYATkuZEejo3C5
	3JMg==
X-Gm-Message-State: AEkoouvtik29boJUlIwNT7xGnfosNfa4ZoTbgjCJjzFx0APWjE+ibys6hP7cbjgZ04LBLw==
X-Received: by 10.98.106.65 with SMTP id f62mr41235677pfc.107.1469556145360;
	Tue, 26 Jul 2016 11:02:25 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:885c:46d5:80be:2a67?
	([2601:646:8882:b8c:885c:46d5:80be:2a67])
	by smtp.gmail.com with ESMTPSA id f3sm3159812pff.26.2016.07.26.11.02.24
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 26 Jul 2016 11:02:24 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1469548140-4095-2-git-send-email-git@andred.net>
Date: Tue, 26 Jul 2016 11:02:18 -0700
Message-Id: <1FBAD0A9-9F86-4A09-A1A3-15FB78A57BF0@gmail.com>
References: <1469548140-4095-1-git-send-email-git@andred.net>
	<1469548140-4095-2-git-send-email-git@andred.net>
To: =?utf-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tune-mips-24k: add QEMU_EXTRAOPTIONS for DSP and MIPS16e cores
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
X-List-Received-Date: Tue, 26 Jul 2016 18:02:25 -0000
X-Groupsio-MsgNum: 84928
Content-Type: multipart/signed;
	boundary="Apple-Mail=_900172F3-3B52-4F56-A415-DEED88F4B321";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_900172F3-3B52-4F56-A415-DEED88F4B321
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 26, 2016, at 8:49 AM, Andr=C3=A9 Draszik <git@andred.net> =
wrote:
>=20
> The core emulated by default by qemu-mips(el) just crashes with
> illegal instruction when encountering DSP and/or MIPS16e
> instructions - we have to specify a CPU that supports the extra
> instructions.
>=20
> This is an issue when generating a rootfs and e.g. running some
> of the package postinstall scriptlets.
>=20
> The patch to qemu to add 24KEc as a CPU has been accepted
> upstream, so let's use that CPU here as well as needed.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>
> ---
> meta/conf/machine/include/mips/tune-mips-24k.inc | 6 ++++++

These changes probably belong to meta/classes/qemu.bbclass

> 1 file changed, 6 insertions(+)
>=20
> diff --git a/meta/conf/machine/include/mips/tune-mips-24k.inc =
b/meta/conf/machine/include/mips/tune-mips-24k.inc
> index 154ab56..828acd4 100644
> --- a/meta/conf/machine/include/mips/tune-mips-24k.inc
> +++ b/meta/conf/machine/include/mips/tune-mips-24k.inc
> @@ -22,12 +22,15 @@ TUNE_FEATURES_tune-mips32r2-24kec-m16 =3D =
"${TUNE_FEATURES_tune-mips32r2-24kec} mi
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2-24kc =3D "mips32r2-24kc"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2-nf} mips32r2-24kc-nf"
> +QEMU_EXTRAOPTIONS_mips32r2-24kc-nf =3D " -cpu 24Kc"
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2-24kec =3D "mips32r2-24kec"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kc} mips32r2-24kec-nf"
> +QEMU_EXTRAOPTIONS_mips32r2-24kec-nf =3D " -cpu 24KEc"
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2-24kec-m16 =3D =
"mips32r2-24kec${MIPSPKGSFX_MIPS16E}"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec-m16 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2-24kec} mips32r2-24kec-m16-nf"
> +QEMU_EXTRAOPTIONS_mips32r2-24kec-m16-nf =3D " -cpu 24KEc"
>=20
>=20
> # little endian: kc, kc+dsp=3Dkec, kc+dsp+mips16e=3Dkec-m16
> @@ -37,9 +40,12 @@ TUNE_FEATURES_tune-mips32r2el-24kec-m16 =3D =
"${TUNE_FEATURES_tune-mips32r2el-24kec
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2el-24kc =3D "mips32r2el-24kc"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-nf} mips32r2el-24kc-nf"
> +QEMU_EXTRAOPTIONS_mips32r2el-24kc-nf =3D " -cpu 24Kc"
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec =3D "mips32r2el-24kec"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kc} mips32r2el-24kec-nf"
> +QEMU_EXTRAOPTIONS_mips32r2el-24kec-nf =3D " -cpu 24KEc"
>=20
> MIPSPKGSFX_VARIANT_tune-mips32r2el-24kec-m16 =3D =
"mips32r2el-24kec${MIPSPKGSFX_MIPS16E}"
> PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec-m16 =3D =
"${PACKAGE_EXTRA_ARCHS_tune-mips32r2el-24kec} mips32r2el-24kec-m16-nf"
> +QEMU_EXTRAOPTIONS_mips32r2el-24kec-m16-nf =3D " -cpu 24KEc"
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_900172F3-3B52-4F56-A415-DEED88F4B321
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleXpa8ACgkQuwUzVZGdMxQRFACcCbkRUYKX77we0z0y5S1oDLoE
s4MAn0LQcafFSJVEZKXd2vbBDNjp+M0w
=kcMv
-----END PGP SIGNATURE-----

--Apple-Mail=_900172F3-3B52-4F56-A415-DEED88F4B321--
