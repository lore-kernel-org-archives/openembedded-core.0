Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0A09D731C6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 17:06:38 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id bt5so63654511pac.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 May 2016 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=UXTnhG79BjdVFnk5DjIQd4l6ShcEJ4MzAJvLPBhPdvo=;
	b=AAB7z1bt/nZh9iib8KD7lCHxs/G3TQ73x/UVjGRfwS5FbbLlP5//Ka0SfPmF6qK811
	VCUcRAdpHXwBhlKsUFEcRHLex4WBECN4tqGETeG+/LI9yshMqfSbb39BJWjHMNITbMkY
	1xxBS4oRgazNG6SKplHjCQo1oF6P9GZCjh9IzL3QtHtTRu3TOv9FC07kGdHqgVsse6YF
	785LaClQz9HgbCm+E2QdLVo1q7IwaK0+1yzdR10vb4i+uhPeqX+nUcIFWX7utf8EyfP4
	dx3mJ4sVd5BCPk6HcDYd1Dx25XLgkb7vwpJwtis1DT0tQvPwU8/wCWXKA21L3wIIEEqG
	wz4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=UXTnhG79BjdVFnk5DjIQd4l6ShcEJ4MzAJvLPBhPdvo=;
	b=H+OOyEjwPNkhQfFGIAH/a2lKnnNupcs1PDvYWeMP2N1VQEf/o5mec6ZZC6GF+jO2bb
	Xn+lzUS2Gcdtf34W3ViQm/MHlZuOhxiwvMY156vZF6d7Ky9ZbQzcqI2cNgfS/ETuDhQ6
	xmNsAKL81RguGVjpZx4qilQIZuHNk1Thdr0jM8OY6ImtyCjffKQ8zxBQYMW2VZm7ZtoA
	IprhfG4UrfYgxRPCMrJyyjzK0nPNkA7JN74/Qral86DMaHSQv0keSsRr0vGE6QAf95Eb
	FToipPI1qUqHa3l2/W+RBh0le4wW9wNJv80WO89I9HIQtMA9eSMV7CHM1hWjl3I2KHFN
	5mIQ==
X-Gm-Message-State: AOPr4FU5VzV3G5mkAQXadjb/C6Ig318aBIppEoC9eO2WEYJy5wZHe3zk12oeqVsvh/q3Uw==
X-Received: by 10.67.30.68 with SMTP id kc4mr44352973pad.19.1462727199255;
	Sun, 08 May 2016 10:06:39 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:9836:6670:b773:dd6c?
	([2601:646:8800:5a9a:9836:6670:b773:dd6c])
	by smtp.gmail.com with ESMTPSA id
	lz5sm34731646pab.34.2016.05.08.10.06.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2016 10:06:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1462712432-6214-1-git-send-email-marex@denx.de>
Date: Sun, 8 May 2016 10:06:40 -0700
Message-Id: <81F5E78B-F4F8-44E9-8E21-2F5225D18C00@gmail.com>
References: <1462712432-6214-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake: Oldest kernel for nios2 is 3.19
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
X-List-Received-Date: Sun, 08 May 2016 17:06:40 -0000
X-Groupsio-MsgNum: 81709
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DB73EB5E-0574-4749-8567-17FE323688F3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DB73EB5E-0574-4749-8567-17FE323688F3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 8, 2016, at 6:00 AM, Marek Vasut <marex@denx.de> wrote:
>=20
> The oldest kernel version for nios2 is 3.19.0, set it so, otherwise
> qemu-nios2 -r ${OLDEST_KERNEL} fails with "FATAL: kernel too old"
> message from glibc.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/conf/bitbake.conf | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c4175f..2f5db22 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -405,6 +405,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
>=20
> OLDEST_KERNEL =3D "2.6.32"
> OLDEST_KERNEL_aarch64 =3D "3.14"
> +OLDEST_KERNEL_nios2 =3D =E2=80=9C3.19"

if you don=E2=80=99t need it on krogoth, then I would suggest to hold =
this patch for master since
I have a series which upgrades glibc to 2.24 and 2.24 needs 3.x minimum

see

=
https://github.com/kraj/openembedded-core/commit/1be5ebb2e1e2d39936d13ce15=
8db29954bc6dabe

> STAGING_KERNEL_DIR =3D =
"${TMPDIR}/work-shared/${MACHINE}/kernel-source"
> STAGING_KERNEL_BUILDDIR =3D =
"${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifacts"
>=20
> --
> 2.7.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DB73EB5E-0574-4749-8567-17FE323688F3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcvciQACgkQuwUzVZGdMxRN+ACeJxJRcq0e6apFTJXAgS1l6zqm
X8UAnilHqKL/MNKbIQmFhrZIgoYyQWw3
=QxW7
-----END PGP SIGNATURE-----

--Apple-Mail=_DB73EB5E-0574-4749-8567-17FE323688F3--
