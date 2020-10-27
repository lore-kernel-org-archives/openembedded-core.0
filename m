Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.11468.1603790676690296754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 02:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZB+d5Mef;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id d3so660201wma.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 02:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m357SC73EfvW6F/Ej5/Q2SiMmuL/5NmxFDa9fKA1wFY=;
        b=ZB+d5Mefh/38v6c/sZSfWJA1IdRp4ZAsvjx0U8bSMLTZsI8gxB8u33PVyPTHHapylZ
         fBRHOv/g2lxZ1eDnfU0PJDkV7/mpMGGqZRsQGXRjturUzlvCR0l8tdQMNpl4KWtXp54z
         C0D5wZGOn2kkP2uDG0Ylm95bPC0AutHAHFKlRI4OIiElhZ94M3rVma1CgeBTdTUvoBHV
         Wd/yAQAIJwtWE3Azie8SMxyI0sbH5fiFypNYuhsrTjwUH6zYxtGEn146SOoZ63B5Rmah
         pEt0isiqLRF1U3uZDaUJxZ5ByASn+9iuEBibHc3MJhoEVoZp7VcBCcH9sRWq9TEfuwoR
         9xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m357SC73EfvW6F/Ej5/Q2SiMmuL/5NmxFDa9fKA1wFY=;
        b=sFh/cFPT0hnhX7Ccz+XqYIBmPqRh/N6bqw0+l/ADb2lx5GU3DhynkGgrgWbzCl+YzQ
         0pbI+AJtL2kFQHx+hWxnwASI9AO7Ni6DeFTNV2qUhLpsIgFUXvLo51C4mrCVZPLX8q0r
         nT+bOqDfQvVIAvGQEAPfp2Pjm/bn2+cd7An3B8tl7FjhcGlvJ4BpMK/U7iBNMsraWu8E
         r4iZv0c4wYfhHYiguS1KKozgGZYGv+2z81bSnI9QuwAidVJiRP/BnicCtzmXGuu5AiFj
         +zuDA/Blkt9lH4pTp3GRg39Jb1BljecXkMWBRxrDhsRRvLcjGPU4h4/6DpBrKtbjG2TR
         qaeA==
X-Gm-Message-State: AOAM533ObheiVAqddlIVSKABm2RynwYIaR9eWqLamgJhsaAy87mjaiTc
	D55b24U+tx5JbdbAiRf/BPU=
X-Google-Smtp-Source: ABdhPJznh85PlIca6VKahKeYKGF8GUkpAI72ctypQ1IYuSDT83Exshm5t2uqyOWznOZSH9HrbmYtIw==
X-Received: by 2002:a1c:5401:: with SMTP id i1mr1644447wmb.124.1603790675188;
        Tue, 27 Oct 2020 02:24:35 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a199sm1278573wmd.8.2020.10.27.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 02:24:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2020 10:24:33 +0100
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell 00/14] Pull request (cover letter only)
Message-ID: <20201027092433.mtsr6bucqhzitixf@jama>
References: <cover.1603760941.git.steve@sakoman.com>
MIME-Version: 1.0
In-Reply-To: <cover.1603760941.git.steve@sakoman.com>
X-Groupsio-MsgNum: 143803
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3rvjcqesfcrhvn36"
Content-Disposition: inline

--3rvjcqesfcrhvn36
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 03:10:48PM -1000, Steve Sakoman wrote:
> The following changes since commit 3ee9590f96cb50e93864db768b254773e2ff9=
465:
>=20
>   uninative: Fix typo in error message (2020-10-19 04:27:15 -1000)
>=20
> are available in the Git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-ne=
xt
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=3Dstable=
/dunfell-next
>=20
> Alexander Kanavin (1):
>   selftest/virgl: drop the custom 30 sec timeout
>=20
> Changqing Li (1):
>   toolchain-shar-extract.sh: don't print useless info
>=20
> Khem Raj (1):
>   packagegroup-core-tools-debug: Disable for rv32/glibc as well
>=20
> Lee Chee Yang (3):
>   libproxy: fix CVE-2020-25219
>   python3: fix CVE-2020-26116
>   grub2: fix CVE-2020-10713
>=20
> Martin Jansa (7):
>   arch-armv7a.inc: fix typo
>   arch-mips.inc: remove duplicated mips64el-o32 from
>     PACKAGE_EXTRA_ARCHS_tune-mips64el-o32
>   tune-mips64r6.inc: fix typo in mipsisa64r6-nf
>   tune-ep9312.inc: add t suffix for thumb to
>     PACKAGE_EXTRA_ARCHS_tune-ep9312
>   tune-riscv.inc: use nf suffix also for TUNE_PKGARCH
>   siteinfo: Recognize 32bit PPC LE
>   siteinfo: Recognize bigendian sh3be and sh4be

Did you run tune/test.sh script with these on dunfell or do you want me to=
?

It looks OK, but would be good to confirm that it fixes all issues
currently in dunfell.

> Victor Kamensky (1):
>   qemu: change TLBs number to 64 in 34Kf mips cpu model
>=20
>  meta-selftest/lib/oeqa/runtime/cases/virgl.py |   2 +-
>  meta/classes/siteinfo.bbclass                 |   5 +
>  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
>  meta/conf/machine/include/mips/arch-mips.inc  |   2 +-
>  .../conf/machine/include/riscv/tune-riscv.inc |   4 +-
>  meta/conf/machine/include/tune-ep9312.inc     |   3 +-
>  meta/conf/machine/include/tune-mips64r6.inc   |   2 +-
>  meta/files/toolchain-shar-extract.sh          |   2 +-
>  .../grub/files/CVE-2020-10713.patch           |  73 ++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |   1 +
>  .../packagegroup-core-tools-debug.bb          |   2 +-
>  .../python/python3/CVE-2020-26116.patch       | 104 ++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.8.2.bb |   1 +
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  ...ease-number-of-TLB-entries-on-the-34.patch |  59 ++++++++++
>  .../libproxy/libproxy/CVE-2020-25219.patch    |  61 ++++++++++
>  .../libproxy/libproxy_0.4.15.bb               |   1 +
>  17 files changed, 315 insertions(+), 10 deletions(-)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-10713.patch
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-26116.=
patch
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0001-target-mips-Inc=
rease-number-of-TLB-entries-on-the-34.patch
>  create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-2521=
9.patch
>=20
> --=20
> 2.17.1
>=20

>=20
>=20
>=20


--3rvjcqesfcrhvn36
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCX5fnTwAKCRA3VSO3ZXaA
HKiQAKC00WAOuyngZ7RYUP6WYADlSQTLVACgkbra01VbNpoTjglwTWIzn1UBAew=
=n05v
-----END PGP SIGNATURE-----

--3rvjcqesfcrhvn36--
