Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 067C3776D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 18:36:46 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id n24so211168pfb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=bo05Sufmb3cHzQcp5CdLgPGrh8HIFoUDcBbRtRZem58=;
	b=LaxkHsXZXcG74snNlFR533FhI9biqIwtDiEEPQRHVoTpbPYX8s9/01ZPwHhTAE2jfZ
	3PmmlOK6vuGEhBU5k0MuXdDJQxj5uzm2EdD2jdcY8lcJU5zw/EV7O7269xQeoo8CuUnd
	sxuaK/Pb08hr54apUQW29qX0MBXgw/fnM0fze4p0BH9U8UtglI0L/2An3Z8JGIjrttos
	7j0xOINmGChJPFWX8swAmqIlCyHbw2j6tWXz08OdQKrjPZrnKTCrQtEgLDVyvFTkXx6G
	dZdw0pBDc5BIBHCaPbgST0MUNQHSXsXfDYNTwptpb6izdjyDd2+/Z643CqlB0KMRPZDJ
	Zzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=bo05Sufmb3cHzQcp5CdLgPGrh8HIFoUDcBbRtRZem58=;
	b=HAZ9q7q3beG+F5Ra+uz7qXQWEL0FtjYHbLYfpYLm2kTLYMrMv8FsLq2+QSbL4O3qas
	K7ev9MGdb64uOc7DUz2mNnTpvFQ+btAWLzODQqb4IiwU3G/NtlreQG3TFtwzidif5mSs
	rNF7Dx2+qBmc64b6DKuKKZ8sew951gbBcpKYLWCCKRQeDJWnBvUYuQZRAgU7DLBs3mZn
	cM6QghY+Sc4oTvG1GsbC63d1U5T2z2R0AwdQel/7+seEck3yB6vOatAaSzzEBGwOEYaV
	q9IK7z/XyYFQyeJATqZxDekBC0t2zdMjtHWZI8sSVmm3oSp33oFIPm8KMJWKElEl/6uG
	mHsQ==
X-Gm-Message-State: AE9vXwNU0aCmjQoWny+99WoBejEqNCqFIEdCCYUePV7cBgtFE3awYRlIA05LhEc8PHIwWg==
X-Received: by 10.98.95.129 with SMTP id t123mr74892533pfb.148.1473187007604; 
	Tue, 06 Sep 2016 11:36:47 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99d4:c55f:fbd3:66fa?
	([2601:647:4c00:3edf:99d4:c55f:fbd3:66fa])
	by smtp.gmail.com with ESMTPSA id
	x66sm42661164pfb.86.2016.09.06.11.36.46
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 11:36:46 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20160906132520.12562-1-ml@embed.me.uk>
Date: Tue, 6 Sep 2016 11:36:45 -0700
Message-Id: <09320575-0DBA-4F48-B349-7E99F6050A54@gmail.com>
References: <20160906132520.12562-1-ml@embed.me.uk>
To: Jack Mitchell <ml@embed.me.uk>
X-Mailer: Apple Mail (2.3124)
Cc: Jack Mitchell <jack@embed.me.uk>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] file: specify c std as c99 or greater required
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
X-List-Received-Date: Tue, 06 Sep 2016 18:36:48 -0000
X-Groupsio-MsgNum: 86813
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5985C073-1C21-4DD8-8ED5-39D99FD84657";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5985C073-1C21-4DD8-8ED5-39D99FD84657
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Sep 6, 2016, at 6:25 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>=20
> From: Jack Mitchell <jack@embed.me.uk>
>=20
> when using a toolchain not shipped by OE core such as linaro we
> can't be sure what the std will be set to. Ensure file is compiled
> as c99 or greater as required.

comment does not match the code, its using gnu11, secondly is gnu11 =
needed or can it live with
c11

>=20
> Signed-off-by: Jack Mitchell <jack@embed.me.uk>
> ---
> meta/recipes-devtools/file/file_5.28.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/file/file_5.28.bb =
b/meta/recipes-devtools/file/file_5.28.bb
> index 516c8c5..94848db 100644
> --- a/meta/recipes-devtools/file/file_5.28.bb
> +++ b/meta/recipes-devtools/file/file_5.28.bb
> @@ -27,6 +27,8 @@ inherit autotools
> EXTRA_OEMAKE_append_class-target =3D "-e =
FILE_COMPILE=3D${STAGING_BINDIR_NATIVE}/file-native/file"
> EXTRA_OEMAKE_append_class-nativesdk =3D "-e =
FILE_COMPILE=3D${STAGING_BINDIR_NATIVE}/file-native/file"
>=20
> +CFLAGS_append =3D " -std=3Dgnu11"
> +
> FILES_${PN} +=3D "${datadir}/misc/*.mgc"
>=20
> do_install_append_class-native() {
> --
> 2.9.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5985C073-1C21-4DD8-8ED5-39D99FD84657
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfPDMEACgkQuwUzVZGdMxQYpACeMKS7z8oyWkFaARipQkitMS3b
TJ0AnieYQPxjAkZ58fj+33sNS/Uypxzp
=aJa2
-----END PGP SIGNATURE-----

--Apple-Mail=_5985C073-1C21-4DD8-8ED5-39D99FD84657--
