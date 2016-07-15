Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36C136067C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 03:26:34 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id hh10so5464135pac.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 20:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=OtBIIyB8VFsdWjV6MjOSP0CCzbEbow9SZg6GRx0Trc4=;
	b=vTOfQLieLeg9Y8GKgsqXC/NfyOFO/btxuFNNPE3aGcIzg2Zz1YUU9zBRDXhWJMyvGN
	cL7gXb4+bwzX2/OskXY0ZZYGYXUuhSecZr2Oxp0UtThpVqVN7u7rQngXLVTpgHy243q3
	dD6t3jSNSAkC2US49nVX94EDpI4Ho85ONqKkUCHNpPFZ2EsouEpPwQd77TFgznYlRCfe
	t+yapPrWqIzYaXzk2PGoud2JYFwHFTfFlpekN0wCPEl1FLz2eaCy+0lF+x4mrZpGumDK
	woAg20ifgV73O9rsuOgriBTvfwrYH6Wy3P9OvjIp358SLb5Atluo4B+I5eRD1/np/TzN
	krfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=OtBIIyB8VFsdWjV6MjOSP0CCzbEbow9SZg6GRx0Trc4=;
	b=hLGU1YOkgBT4t5dsPY+CRXJWFDGdLDef+T7BQds9wWHh2m3klKTZV+NTnBCgHyUX9V
	fw66HlEJ5VFmE4DUTi11dO+tD7QQaR/qaVmVtl4DIh7nl8Uhkwgqza9XhwTtn19xW3qF
	oNmKKx/VvO0o/Za/50mHrQECMY0RB2mjZp6yNtV8AaSdYk+MSNUttydzPF+HDQT0d9vv
	SJp4hjrTCJPXluELa0AWYEA5Chn07yFy8jX0WnlITHeOslxo8lrJ4OcTCTrzx+cBxP6I
	1lDyPkm9wOeKLEPUlwz2XivVDiyfUPbgEpNkzMxlaaPOTxratj3gWSvy4jEXC0EZyn6s
	udRQ==
X-Gm-Message-State: ALyK8tKRP3wtMcJIEkdxF/DvfTrmKqVLwmy03StJCo9wkPzPA6TImHeWzoLZO5CwK6ampw==
X-Received: by 10.66.0.74 with SMTP id 10mr28030380pac.38.1468553194784;
	Thu, 14 Jul 2016 20:26:34 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:38e0:eb9c:1fe3:e81c?
	([2601:646:8882:b8c:38e0:eb9c:1fe3:e81c])
	by smtp.gmail.com with ESMTPSA id 5sm87658pac.34.2016.07.14.20.26.33
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 14 Jul 2016 20:26:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <65069865417cc8d9a7d9f5a16daecebb2b3d4fe0.1468546499.git.timothy.t.orling@linux.intel.com>
Date: Thu, 14 Jul 2016 20:26:28 -0700
Message-Id: <55FCD1E3-857F-4E09-801F-5EA1A96F2FF9@gmail.com>
References: <cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<cover.1468546499.git.timothy.t.orling@linux.intel.com>
	<65069865417cc8d9a7d9f5a16daecebb2b3d4fe0.1468546499.git.timothy.t.orling@linux.intel.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [krogoth][PATCH 6/8] binutils: disable werror on native build
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
X-List-Received-Date: Fri, 15 Jul 2016 03:26:35 -0000
X-Groupsio-MsgNum: 84537
Content-Type: multipart/signed;
	boundary="Apple-Mail=_21E58447-3333-44D3-90B2-55015106FC32";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_21E58447-3333-44D3-90B2-55015106FC32
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jul 14, 2016, at 6:49 PM, Tim Orling =
<timothy.t.orling@linux.intel.com> wrote:
>=20
> From: Dan McGregor <dan.mcgregor@usask.ca>
>=20
> It's disabled on cross builds, and it's needed for gcc 6
>=20
> (=46rom OE-Core rev: ce1b37e29dc89b67dc698e856007b59faa16c4df)
>=20
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/recipes-devtools/binutils/binutils_2.26.bb | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils_2.26.bb =
b/meta/recipes-devtools/binutils/binutils_2.26.bb
> index b70ffbf..e976bad 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.26.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.26.bb
> @@ -13,7 +13,8 @@ EXTRA_OECONF +=3D "--with-sysroot=3D/ \
> EXTRA_OECONF_class-native =3D "--enable-targets=3Dall \
>                              --enable-64-bit-bfd \
>                              --enable-install-libiberty \
> -                             --enable-install-libbfd"
> +                             --enable-install-libbfd \
> +                             --disable-werror=E2=80=9D

How about other flavors of binutils ?

>=20
> do_install_class-native () {
> 	autotools_do_install
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_21E58447-3333-44D3-90B2-55015106FC32
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAleIV+cACgkQuwUzVZGdMxQj0wCfX5lBu8RKcEo89vO25qGShv65
ozwAn1LdVpp7jeslSTV2K3937y8SejQQ
=RmbM
-----END PGP SIGNATURE-----

--Apple-Mail=_21E58447-3333-44D3-90B2-55015106FC32--
