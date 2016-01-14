Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 275D4607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 04:04:24 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id e65so92743089pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 20:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NwmjAJG3bSxXa8z8PUxdb75/bt0XKqQViTKKv7MsibY=;
	b=UQom1xkzcOhcC7NxavQ2kv36OjHB3XlaLzLRBXwKDiJDTx/LH3No4kajmCtj35auT4
	mPiVVXotlX5tc2mS0p6UqBGAjk1RUub5yNppNhPT6wX0MHWFNaJYMtaWQDLfd3MtnUjH
	vTy8AJqbXY+19ZpQItp4/iRolgNZYm6GOqsffilpYPHa6gIV3H6KtmYyp/cVtwyAnZXC
	sqm8r4Z6w64GIe4L89a7lR4uWxPnEVlzaTWoBc//ZoHCAN+TkNy4stjwKC6JmgHQZjbm
	lbeUmGmBXcz32O7Y7oIuATjwqr28qbRmEDGaCjrjdKdMInaTn/lzsepQ/+Wpi2pStwy8
	csuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=NwmjAJG3bSxXa8z8PUxdb75/bt0XKqQViTKKv7MsibY=;
	b=OXsVlyrBNdPEheC26eQKB4OB2sDPKTxWfqcBqIm+Wm2vJoeI5wmdW3UmLXB/gNoxzm
	IyhLUygC2Rnot/gj0AZ0/gxfBWcTL2eGGKhRgpJWSvrkHerdtYBsXBi1erlxbuquXnL/
	y+QO81RzCpEr1hPPt2l+2x8qZ+qr8vVdOLvfwKNfeuOqX+jrzkvMqGhNSb8taJFkystX
	XiA+MEC5gXd/gcgi1tpnR9lvB5n/KZR2dP9auG88VWhu0FMpEyHP4mUHvp71wezlsvum
	LFL8jd6/O5cQ6IhrG/SJ6fgyWXF9zewEr2IDW1dbddSKU7ItUIVfhNX60LP3TuJRo0dv
	wRyA==
X-Gm-Message-State: ALoCoQkCc43pJ2ima1lqqO677i8R6xR/MRU6bDi8VHEaOfqoL2Gv8Gu/zpIMW2oCUNr6GwUEcBtUfeCdEBN/xcycLOt3KbSOVw==
X-Received: by 10.98.65.203 with SMTP id g72mr2851539pfd.44.1452744265486;
	Wed, 13 Jan 2016 20:04:25 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:45ce:aeb2:1c03:b451?
	([2601:646:8802:5d5c:45ce:aeb2:1c03:b451])
	by smtp.gmail.com with ESMTPSA id f21sm5766709pfd.6.2016.01.13.20.04.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 13 Jan 2016 20:04:24 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452741432-10746-1-git-send-email-marex@denx.de>
Date: Wed, 13 Jan 2016 20:04:22 -0800
Message-Id: <3EB3A651-B3EE-4E31-9A2D-F4D9D71EC4FA@gmail.com>
References: <1452741432-10746-1-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3112)
Cc: trini@konsulko.com, Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Thu, 14 Jan 2016 04:04:25 -0000
X-Groupsio-MsgNum: 76029
Content-Type: multipart/signed;
	boundary="Apple-Mail=_6BABFD51-77F0-4B5D-8F19-47AD843A02A9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_6BABFD51-77F0-4B5D-8F19-47AD843A02A9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 13, 2016, at 7:17 PM, Marek Vasut <marex@denx.de> wrote:
>=20
> Upgrade U-Boot to latest version and drop upstreamed patches.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> V2: Drop the _defconfig addition to make ${UBOOT_MACHINE} . This =
leaves
>    U-Boot build broken unless you abuse the UBOOT_MACHINE variable to
>    explicitly contain the _defconfig bit. Apparently, some BSPs depend
>    on this behavior.

This looks fine now.


> ---
> ...utils_2015.10.bb =3D> u-boot-fw-utils_2016.01.bb} |    6 +-
> ...kimage_2015.10.bb =3D> u-boot-mkimage_2016.01.bb} |    6 +-
> ...-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch |  185 ---
> ...-non-Android-booting-with-ramdisk-and-or-.patch |   36 -
> ...board_f-enable-setup_board_part1-for-MIPS.patch |   59 -
> ...PS-bootm-rework-and-fix-broken-bootm-code.patch |  254 -----
> ...PS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch |   93 --
> ...-Replace-extern-inline-with-static-inline.patch | 1184 =
--------------------
> meta/recipes-bsp/u-boot/u-boot_2015.10.bb          |   19 -
> meta/recipes-bsp/u-boot/u-boot_2016.01.bb          |   10 +
> 10 files changed, 16 insertions(+), 1836 deletions(-)
> rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2015.10.bb =3D> =
u-boot-fw-utils_2016.01.bb} (91%)
> rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2015.10.bb =3D> =
u-boot-mkimage_2016.01.bb} (84%)
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0001-powerpc-cpu-u-boot-.lds-remove-_GLOBAL=
_OFFSET_TABLE_.patch
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with-r=
amdisk-and-or-.patch
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_part=
1-for-MIPS.patch
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-bootm=
-code.patch
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-every=
where.patch
> delete mode 100644 =
meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-inli=
ne.patch
> delete mode 100644 meta/recipes-bsp/u-boot/u-boot_2015.10.bb
> create mode 100644 meta/recipes-bsp/u-boot/u-boot_2016.01.bb
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb =
b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb
> similarity index 91%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb
> index 93c06e1..30b7c7a 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2015.10.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2016.01.bb
> @@ -4,12 +4,12 @@ LIC_FILES_CHKSUM =3D =
"file://Licenses/README;md5=3D0507cd7da8e7ad6d6701926ec9b84c95"
> SECTION =3D "bootloader"
> DEPENDS =3D "mtd-utils"
>=20
> -# This revision corresponds to the tag "v2015.10"
> +# This revision corresponds to the tag "v2016.01"
> # We use the revision in order to avoid having to fetch it from the
> # repo during parse
> -SRCREV =3D "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
> +SRCREV =3D "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
>=20
> -PV =3D "v2015.10+git${SRCPV}"
> +PV =3D "v2016.01+git${SRCPV}"
>=20
> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster"
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb =
b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb
> similarity index 84%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb
> index 301b6e2..5d163a8 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2015.10.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2016.01.bb
> @@ -5,12 +5,12 @@ SECTION =3D "bootloader"
>=20
> DEPENDS =3D "openssl"
>=20
> -# This revision corresponds to the tag "v2015.10"
> +# This revision corresponds to the tag "v2016.01"
> # We use the revision in order to avoid having to fetch it from the
> # repo during parse
> -SRCREV =3D "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
> +SRCREV =3D "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
>=20
> -PV =3D "v2015.10+git${SRCPV}"
> +PV =3D "v2016.01+git${SRCPV}"
>=20
> SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster"
>=20
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0001-powerpc-cpu-u-boot-.lds-remove-_GLOB=
AL_OFFSET_TABLE_.patch =
b/meta/recipes-bsp/u-boot/u-boot/0001-powerpc-cpu-u-boot-.lds-remove-_GLOB=
AL_OFFSET_TABLE_.patch
> deleted file mode 100644
> index b709acf..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0001-powerpc-cpu-u-boot-.lds-remove-_GLOB=
AL_OFFSET_TABLE_.patch
> +++ /dev/null
> @@ -1,185 +0,0 @@
> -=46rom 47092c85a2d3dea6fb3ffa59ae6fe737112db93e Mon Sep 17 00:00:00 =
2001
> -From: Zhenhua Luo <zhenhua.luo@freescale.com>
> -Date: Mon, 9 Feb 2015 18:33:56 +0800
> -Subject: [PATCH 1/6] powerpc/cpu/*/u-boot*.lds: remove =
_GLOBAL_OFFSET_TABLE_
> - definition
> -Organization: O.S. Systems Software LTDA.
> -
> -In binutils-2.25, the _GLOBAL_OFFSET_TABLE_ symbols defined by =
PROVIDE in
> -u-boot.lds overrides the linker built-in symbols
> =
-(https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;a=3Dcommitdif=
f;h=3Db893397a4b1316610f49819344817715e4305de9),
> -so the linker is treating _GLOBAL_OFFSET_TABLE_ as a definition into =
the .reloc section.
> -
> -To align with the change of binutils-2.25, the _GLOBAL_OFFSET_TABLE_ =
symbol
> -should not be defined in sections, and the symbols in linker =
generated .got
> -section should be =
used(https://sourceware.org/ml/binutils/2008-09/msg00122.html).
> -
> -Fixed the following build errors with binutils-2.25:
> -| powerpc-poky-linux-gnuspe-ld.bfd: _GLOBAL_OFFSET_TABLE_ not defined =
in linker created .got
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - arch/powerpc/cpu/mpc512x/u-boot.lds          | 1 -
> - arch/powerpc/cpu/mpc5xx/u-boot.lds           | 1 -
> - arch/powerpc/cpu/mpc5xxx/u-boot.lds          | 1 -
> - arch/powerpc/cpu/mpc8260/u-boot.lds          | 1 -
> - arch/powerpc/cpu/mpc83xx/u-boot-spl.lds      | 1 -
> - arch/powerpc/cpu/mpc83xx/u-boot.lds          | 1 -
> - arch/powerpc/cpu/mpc85xx/u-boot-nand.lds     | 1 -
> - arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds | 1 -
> - arch/powerpc/cpu/mpc85xx/u-boot-spl.lds      | 1 -
> - arch/powerpc/cpu/mpc85xx/u-boot.lds          | 1 -
> - arch/powerpc/cpu/mpc86xx/u-boot.lds          | 1 -
> - arch/powerpc/cpu/ppc4xx/u-boot.lds           | 1 -
> - 12 files changed, 12 deletions(-)
> -
> -diff --git a/arch/powerpc/cpu/mpc512x/u-boot.lds =
b/arch/powerpc/cpu/mpc512x/u-boot.lds
> -index 9658b21..b32f74e 100644
> ---- a/arch/powerpc/cpu/mpc512x/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc512x/u-boot.lds
> -@@ -24,7 +24,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -     *(.fixup)
> -diff --git a/arch/powerpc/cpu/mpc5xx/u-boot.lds =
b/arch/powerpc/cpu/mpc5xx/u-boot.lds
> -index 7198465..6a53571 100644
> ---- a/arch/powerpc/cpu/mpc5xx/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc5xx/u-boot.lds
> -@@ -33,7 +33,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc5xxx/u-boot.lds =
b/arch/powerpc/cpu/mpc5xxx/u-boot.lds
> -index cd9e23f..aa80d3d 100644
> ---- a/arch/powerpc/cpu/mpc5xxx/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc5xxx/u-boot.lds
> -@@ -28,7 +28,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc8260/u-boot.lds =
b/arch/powerpc/cpu/mpc8260/u-boot.lds
> -index 50cbf85..469fc29 100644
> ---- a/arch/powerpc/cpu/mpc8260/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc8260/u-boot.lds
> -@@ -27,7 +27,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds =
b/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
> -index 774772b..4101eaf 100644
> ---- a/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
> -+++ b/arch/powerpc/cpu/mpc83xx/u-boot-spl.lds
> -@@ -24,7 +24,6 @@ SECTIONS
> - 		_GOT2_TABLE_ =3D .;
> - 		KEEP(*(.got2))
> - 		KEEP(*(.got))
> --		PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> - 	}
> - 	__got2_entries =3D ((_GLOBAL_OFFSET_TABLE_ - _GOT2_TABLE_) >> 2) =
- 1;
> -
> -diff --git a/arch/powerpc/cpu/mpc83xx/u-boot.lds =
b/arch/powerpc/cpu/mpc83xx/u-boot.lds
> -index 3c177fa..dbd8bbe 100644
> ---- a/arch/powerpc/cpu/mpc83xx/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc83xx/u-boot.lds
> -@@ -26,7 +26,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds =
b/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
> -index f933b21..0399f93 100644
> ---- a/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
> -+++ b/arch/powerpc/cpu/mpc85xx/u-boot-nand.lds
> -@@ -44,7 +44,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds =
b/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
> -index b83c553..f044564 100644
> ---- a/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
> -+++ b/arch/powerpc/cpu/mpc85xx/u-boot-nand_spl.lds
> -@@ -22,7 +22,6 @@ SECTIONS
> - 		_GOT2_TABLE_ =3D .;
> - 		KEEP(*(.got2))
> - 		KEEP(*(.got))
> --		PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> - 		_FIXUP_TABLE_ =3D .;
> - 		KEEP(*(.fixup))
> - 	}
> -diff --git a/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds =
b/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
> -index 5ae7b3e..889a4c2 100644
> ---- a/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
> -+++ b/arch/powerpc/cpu/mpc85xx/u-boot-spl.lds
> -@@ -29,7 +29,6 @@ SECTIONS
> - 		_GOT2_TABLE_ =3D .;
> - 		KEEP(*(.got2))
> - 		KEEP(*(.got))
> --		PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> - 		_FIXUP_TABLE_ =3D .;
> - 		KEEP(*(.fixup))
> - 	}
> -diff --git a/arch/powerpc/cpu/mpc85xx/u-boot.lds =
b/arch/powerpc/cpu/mpc85xx/u-boot.lds
> -index 2cf0b25..f15eaf3 100644
> ---- a/arch/powerpc/cpu/mpc85xx/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc85xx/u-boot.lds
> -@@ -50,7 +50,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/mpc86xx/u-boot.lds =
b/arch/powerpc/cpu/mpc86xx/u-boot.lds
> -index 58467c2..6c48f40 100644
> ---- a/arch/powerpc/cpu/mpc86xx/u-boot.lds
> -+++ b/arch/powerpc/cpu/mpc86xx/u-boot.lds
> -@@ -32,7 +32,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> -diff --git a/arch/powerpc/cpu/ppc4xx/u-boot.lds =
b/arch/powerpc/cpu/ppc4xx/u-boot.lds
> -index 1980508..55dd4e1 100644
> ---- a/arch/powerpc/cpu/ppc4xx/u-boot.lds
> -+++ b/arch/powerpc/cpu/ppc4xx/u-boot.lds
> -@@ -46,7 +46,6 @@ SECTIONS
> -     _GOT2_TABLE_ =3D .;
> -     KEEP(*(.got2))
> -     KEEP(*(.got))
> --    PROVIDE(_GLOBAL_OFFSET_TABLE_ =3D . + 4);
> -     _FIXUP_TABLE_ =3D .;
> -     KEEP(*(.fixup))
> -   }
> ---
> -2.6.2
> -
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with=
-ramdisk-and-or-.patch =
b/meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with=
-ramdisk-and-or-.patch
> deleted file mode 100644
> index 0d1a714..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0002-image.c-Fix-non-Android-booting-with=
-ramdisk-and-or-.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -=46rom 0a8c59720155c30f01d4cd1c53da3647a3f4decd Mon Sep 17 00:00:00 =
2001
> -From: Tom Rini <trini@konsulko.com>
> -Date: Tue, 27 Oct 2015 19:04:40 -0400
> -Subject: [PATCH 2/6] image.c: Fix non-Android booting with ramdisk =
and/or
> - device tree
> -Organization: O.S. Systems Software LTDA.
> -
> -In 1fec3c5 I added a check that if we had an Android image we default =
to
> -trying the kernel address for a ramdisk.  However when we don't have =
an
> -Android image buf is NULL and we oops here.  Ensure that we have =
'buf'
> -to check first.
> -
> -Upstream-Status: Backport [2016.01]
> -
> -Reported-by: elipe Balbi <balbi@ti.com>
> -Signed-off-by: Tom Rini <trini@konsulko.com>
> ----
> - common/image.c | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/common/image.c b/common/image.c
> -index e607109..85c4f39 100644
> ---- a/common/image.c
> -+++ b/common/image.c
> -@@ -913,7 +913,7 @@ int boot_get_ramdisk(int argc, char * const =
argv[], bootm_headers_t *images,
> - 	 * Look for an Android boot image.
> - 	 */
> - 	buf =3D map_sysmem(images->os.start, 0);
> --	if (genimg_get_format(buf) =3D=3D IMAGE_FORMAT_ANDROID)
> -+	if (buf && genimg_get_format(buf) =3D=3D IMAGE_FORMAT_ANDROID)
> - 		select =3D argv[0];
> - #endif
> -
> ---
> -2.6.2
> -
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_pa=
rt1-for-MIPS.patch =
b/meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_pa=
rt1-for-MIPS.patch
> deleted file mode 100644
> index 45d20b8..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0003-common-board_f-enable-setup_board_pa=
rt1-for-MIPS.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -=46rom e5ebba40a3b8a1405e48d49dc873ffe2fa1963a1 Mon Sep 17 00:00:00 =
2001
> -From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Date: Sun, 1 Nov 2015 17:36:13 +0100
> -Subject: [PATCH 3/6] common/board_f: enable setup_board_part1() for =
MIPS
> -Organization: O.S. Systems Software LTDA.
> -
> -The variables bd_t:bi_memstart and bd_t:bi_memsize have to be
> -initialized also on MIPS. Otherwise LMB and cmd_bdinfo do not
> -correctly work. This currently breaks the booting of FIT images
> -on MIPS. Enable the board_init_f hook setup_board_part1()
> -for MIPS to fix this.
> -
> -Upstream-Status: Backport [2016.01]
> -
> -Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Reviewed-by: Tom Rini <trini@konsulko.com>
> -Reviewed-by: Simon Glass <sjg@chromium.org>
> ----
> - common/board_f.c | 8 ++++++--
> - 1 file changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/common/board_f.c b/common/board_f.c
> -index 613332e..33cc5c0 100644
> ---- a/common/board_f.c
> -+++ b/common/board_f.c
> -@@ -551,7 +551,7 @@ static int display_new_sp(void)
> - 	return 0;
> - }
> -
> --#if defined(CONFIG_PPC) || defined(CONFIG_M68K)
> -+#if defined(CONFIG_PPC) || defined(CONFIG_M68K) || =
defined(CONFIG_MIPS)
> - static int setup_board_part1(void)
> - {
> - 	bd_t *bd =3D gd->bd;
> -@@ -580,7 +580,9 @@ static int setup_board_part1(void)
> -
> - 	return 0;
> - }
> -+#endif
> -
> -+#if defined(CONFIG_PPC) || defined(CONFIG_M68K)
> - static int setup_board_part2(void)
> - {
> - 	bd_t *bd =3D gd->bd;
> -@@ -933,8 +935,10 @@ static init_fnc_t init_sequence_f[] =3D {
> - 	reserve_stacks,
> - 	setup_dram_config,
> - 	show_dram_config,
> --#if defined(CONFIG_PPC) || defined(CONFIG_M68K)
> -+#if defined(CONFIG_PPC) || defined(CONFIG_M68K) || =
defined(CONFIG_MIPS)
> - 	setup_board_part1,
> -+#endif
> -+#if defined(CONFIG_PPC) || defined(CONFIG_M68K)
> - 	INIT_FUNC_WATCHDOG_RESET
> - 	setup_board_part2,
> - #endif
> ---
> -2.6.2
> -
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-boo=
tm-code.patch =
b/meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-boo=
tm-code.patch
> deleted file mode 100644
> index 5692c60..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0004-MIPS-bootm-rework-and-fix-broken-boo=
tm-code.patch
> +++ /dev/null
> @@ -1,254 +0,0 @@
> -=46rom da9d99765476b10fe0a75140a2d4c1f284ffc333 Mon Sep 17 00:00:00 =
2001
> -From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Date: Sun, 1 Nov 2015 17:36:14 +0100
> -Subject: [PATCH 4/6] MIPS: bootm: rework and fix broken bootm code
> -Organization: O.S. Systems Software LTDA.
> -
> -The move to 'generic board' as well as changes in the generic
> -bootm code broke the boot of FIT uImage's. Especially uImage's
> -with additional initramfs images or FDT's do not work anymore.
> -
> -Refactor the bootm code to work again with the generic bootm code.
> -
> -Always relocate ramdisk and FDT in step 'bootm prep' because the
> -generic bootm code does this only for legacy uImage's.
> -
> -Move the step 'bootm cmdline' to 'bootm prep' because the Linux
> -kernel parameters rd_start and rd_size have to be initialized after
> -the relocation of the ramdisk.
> -
> -Furthermore support the step 'bootm fake'.
> -
> -Upstream-Status: Backport [2016.01]
> -
> -Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Reviewed-by: Tom Rini <trini@konsulko.com>
> -Reviewed-by: Simon Glass <sjg@chromium.org>
> ----
> - arch/mips/lib/bootm.c | 163 =
++++++++++++++++++++++++--------------------------
> - 1 file changed, 78 insertions(+), 85 deletions(-)
> -
> -diff --git a/arch/mips/lib/bootm.c b/arch/mips/lib/bootm.c
> -index 9c647aa..a7eddd3 100644
> ---- a/arch/mips/lib/bootm.c
> -+++ b/arch/mips/lib/bootm.c
> -@@ -21,18 +21,6 @@ DECLARE_GLOBAL_DATA_PTR;
> - #define mips_boot_malta		0
> - #endif
> -
> --#if defined(CONFIG_MIPS_BOOT_CMDLINE_LEGACY)
> --#define mips_boot_cmdline_legacy	1
> --#else
> --#define mips_boot_cmdline_legacy	0
> --#endif
> --
> --#if defined(CONFIG_MIPS_BOOT_ENV_LEGACY)
> --#define mips_boot_env_legacy	1
> --#else
> --#define mips_boot_env_legacy	0
> --#endif
> --
> - static int linux_argc;
> - static char **linux_argv;
> - static char *linux_argp;
> -@@ -62,50 +50,6 @@ void arch_lmb_reserve(struct lmb *lmb)
> - 	lmb_reserve(lmb, sp, CONFIG_SYS_SDRAM_BASE + gd->ram_size - sp);
> - }
> -
> --static int boot_setup_linux(bootm_headers_t *images)
> --{
> --	int ret;
> --	ulong rd_len;
> --
> --	rd_len =3D images->rd_end - images->rd_start;
> --	ret =3D boot_ramdisk_high(&images->lmb, images->rd_start,
> --		rd_len, &images->initrd_start, &images->initrd_end);
> --	if (ret)
> --		return ret;
> --
> --#if defined(CONFIG_MIPS_BOOT_FDT) && defined(CONFIG_OF_LIBFDT)
> --	if (images->ft_len) {
> --		boot_fdt_add_mem_rsv_regions(&images->lmb, =
images->ft_addr);
> --
> --		ret =3D boot_relocate_fdt(&images->lmb, =
&images->ft_addr,
> --			&images->ft_len);
> --		if (ret)
> --			return ret;
> --	}
> --#endif
> --
> --	return 0;
> --}
> --
> --static void boot_setup_fdt(bootm_headers_t *images)
> --{
> --#if defined(CONFIG_MIPS_BOOT_FDT) && defined(CONFIG_OF_LIBFDT)
> --	u64 mem_start =3D 0;
> --	u64 mem_size =3D gd->ram_size;
> --
> --	debug("## setup FDT\n");
> --
> --	fdt_chosen(images->ft_addr);
> --	fdt_fixup_memory_banks(images->ft_addr, &mem_start, &mem_size, =
1);
> --	fdt_fixup_ethernet(images->ft_addr);
> --	fdt_initrd(images->ft_addr, images->initrd_start, =
images->initrd_end);
> --
> --#if defined(CONFIG_OF_BOARD_SETUP)
> --	ft_board_setup(images->ft_addr, gd->bd);
> --#endif
> --#endif
> --}
> --
> - static void linux_cmdline_init(void)
> - {
> - 	linux_argc =3D 1;
> -@@ -197,18 +141,6 @@ static void linux_cmdline_append(bootm_headers_t =
*images)
> - 	}
> - }
> -
> --static void boot_cmdline_linux(bootm_headers_t *images)
> --{
> --	if (mips_boot_cmdline_legacy && !images->ft_len) {
> --		linux_cmdline_legacy(images);
> --
> --		if (!mips_boot_env_legacy)
> --			linux_cmdline_append(images);
> --
> --		linux_cmdline_dump();
> --	}
> --}
> --
> - static void linux_env_init(void)
> - {
> - 	linux_env =3D (char **)(((ulong) linux_argp + 15) & ~15);
> -@@ -288,13 +220,81 @@ static void linux_env_legacy(bootm_headers_t =
*images)
> - 	}
> - }
> -
> -+static int boot_reloc_ramdisk(bootm_headers_t *images)
> -+{
> -+	ulong rd_len =3D images->rd_end - images->rd_start;
> -+
> -+	/*
> -+	 * In case of legacy uImage's, relocation of ramdisk is already =
done
> -+	 * by do_bootm_states() and should not repeated in 'bootm prep'.
> -+	 */
> -+	if (images->state & BOOTM_STATE_RAMDISK) {
> -+		debug("## Ramdisk already relocated\n");
> -+		return 0;
> -+	}
> -+
> -+	return boot_ramdisk_high(&images->lmb, images->rd_start,
> -+		rd_len, &images->initrd_start, &images->initrd_end);
> -+}
> -+
> -+static int boot_reloc_fdt(bootm_headers_t *images)
> -+{
> -+	/*
> -+	 * In case of legacy uImage's, relocation of FDT is already done
> -+	 * by do_bootm_states() and should not repeated in 'bootm prep'.
> -+	 */
> -+	if (images->state & BOOTM_STATE_FDT) {
> -+		debug("## FDT already relocated\n");
> -+		return 0;
> -+	}
> -+
> -+#if CONFIG_IS_ENABLED(MIPS_BOOT_FDT) && CONFIG_IS_ENABLED(OF_LIBFDT)
> -+	boot_fdt_add_mem_rsv_regions(&images->lmb, images->ft_addr);
> -+	return boot_relocate_fdt(&images->lmb, &images->ft_addr,
> -+		&images->ft_len);
> -+#else
> -+	return 0;
> -+#endif
> -+}
> -+
> -+int arch_fixup_memory_node(void *blob)
> -+{
> -+#if CONFIG_IS_ENABLED(MIPS_BOOT_FDT) && CONFIG_IS_ENABLED(OF_LIBFDT)
> -+	u64 mem_start =3D 0;
> -+	u64 mem_size =3D gd->ram_size;
> -+
> -+	return fdt_fixup_memory_banks(blob, &mem_start, &mem_size, 1);
> -+#else
> -+	return 0;
> -+#endif
> -+}
> -+
> -+static int boot_setup_fdt(bootm_headers_t *images)
> -+{
> -+	return image_setup_libfdt(images, images->ft_addr, =
images->ft_len,
> -+		&images->lmb);
> -+}
> -+
> - static void boot_prep_linux(bootm_headers_t *images)
> - {
> --	if (mips_boot_env_legacy && !images->ft_len)
> --		linux_env_legacy(images);
> -+	boot_reloc_ramdisk(images);
> -
> --	if (images->ft_len)
> -+	if (CONFIG_IS_ENABLED(MIPS_BOOT_FDT) && images->ft_len) {
> -+		boot_reloc_fdt(images);
> - 		boot_setup_fdt(images);
> -+	} else {
> -+		if (CONFIG_IS_ENABLED(CONFIG_MIPS_BOOT_ENV_LEGACY))
> -+			linux_env_legacy(images);
> -+
> -+		if (CONFIG_IS_ENABLED(MIPS_BOOT_CMDLINE_LEGACY)) {
> -+			linux_cmdline_legacy(images);
> -+
> -+			if =
(!CONFIG_IS_ENABLED(CONFIG_MIPS_BOOT_ENV_LEGACY))
> -+				linux_cmdline_append(images);
> -+
> -+			linux_cmdline_dump();
> -+		}
> -+	}
> - }
> -
> - static void boot_jump_linux(bootm_headers_t *images)
> -@@ -327,35 +327,28 @@ static void boot_jump_linux(bootm_headers_t =
*images)
> - int do_bootm_linux(int flag, int argc, char * const argv[],
> - 			bootm_headers_t *images)
> - {
> --	int ret;
> --
> - 	/* No need for those on MIPS */
> - 	if (flag & BOOTM_STATE_OS_BD_T)
> - 		return -1;
> -
> --	if (flag & BOOTM_STATE_OS_CMDLINE) {
> --		boot_cmdline_linux(images);
> -+	/*
> -+	 * Cmdline init has been moved to 'bootm prep' because it has to =
be
> -+	 * done after relocation of ramdisk to always pass correct =
values
> -+	 * for rd_start and rd_size to Linux kernel.
> -+	 */
> -+	if (flag & BOOTM_STATE_OS_CMDLINE)
> - 		return 0;
> --	}
> -
> - 	if (flag & BOOTM_STATE_OS_PREP) {
> - 		boot_prep_linux(images);
> - 		return 0;
> - 	}
> -
> --	if (flag & BOOTM_STATE_OS_GO) {
> -+	if (flag & (BOOTM_STATE_OS_GO | BOOTM_STATE_OS_FAKE_GO)) {
> - 		boot_jump_linux(images);
> - 		return 0;
> - 	}
> -
> --	ret =3D boot_setup_linux(images);
> --	if (ret)
> --		return ret;
> --
> --	boot_cmdline_linux(images);
> --	boot_prep_linux(images);
> --	boot_jump_linux(images);
> --
> - 	/* does not return */
> - 	return 1;
> - }
> ---
> -2.6.2
> -
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-eve=
rywhere.patch =
b/meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-eve=
rywhere.patch
> deleted file mode 100644
> index 210ca4d..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0005-MIPS-bootm-use-CONFIG_IS_ENABLED-eve=
rywhere.patch
> +++ /dev/null
> @@ -1,93 +0,0 @@
> -=46rom ebaf1eda6f3b8a339837bc0dbcbb9002d751ab75 Mon Sep 17 00:00:00 =
2001
> -From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Date: Sun, 1 Nov 2015 17:36:15 +0100
> -Subject: [PATCH 5/6] MIPS: bootm: use CONFIG_IS_ENABLED() everywhere
> -Organization: O.S. Systems Software LTDA.
> -
> -Upstream-Status: Backport [2016.01]
> -
> -Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
> -Reviewed-by: Tom Rini <trini@konsulko.com>
> ----
> - arch/mips/lib/bootm.c | 33 ++++++++++++++-------------------
> - 1 file changed, 14 insertions(+), 19 deletions(-)
> -
> -diff --git a/arch/mips/lib/bootm.c b/arch/mips/lib/bootm.c
> -index a7eddd3..eed159c 100644
> ---- a/arch/mips/lib/bootm.c
> -+++ b/arch/mips/lib/bootm.c
> -@@ -15,12 +15,6 @@ DECLARE_GLOBAL_DATA_PTR;
> - #define	LINUX_MAX_ENVS		256
> - #define	LINUX_MAX_ARGS		256
> -
> --#if defined(CONFIG_MALTA)
> --#define mips_boot_malta		1
> --#else
> --#define mips_boot_malta		0
> --#endif
> --
> - static int linux_argc;
> - static char **linux_argv;
> - static char *linux_argp;
> -@@ -157,7 +151,7 @@ static void linux_env_set(const char *env_name, =
const char *env_val)
> - 		strcpy(linux_env_p, env_name);
> - 		linux_env_p +=3D strlen(env_name);
> -
> --		if (mips_boot_malta) {
> -+		if (CONFIG_IS_ENABLED(MALTA)) {
> - 			linux_env_p++;
> - 			linux_env[++linux_env_idx] =3D linux_env_p;
> - 		} else {
> -@@ -178,14 +172,15 @@ static void linux_env_legacy(bootm_headers_t =
*images)
> - 	const char *cp;
> - 	ulong rd_start, rd_size;
> -
> --#ifdef CONFIG_MEMSIZE_IN_BYTES
> --	sprintf(env_buf, "%lu", (ulong)gd->ram_size);
> --	debug("## Giving linux memsize in bytes, %lu\n", =
(ulong)gd->ram_size);
> --#else
> --	sprintf(env_buf, "%lu", (ulong)(gd->ram_size >> 20));
> --	debug("## Giving linux memsize in MB, %lu\n",
> --	      (ulong)(gd->ram_size >> 20));
> --#endif /* CONFIG_MEMSIZE_IN_BYTES */
> -+	if (CONFIG_IS_ENABLED(MEMSIZE_IN_BYTES)) {
> -+		sprintf(env_buf, "%lu", (ulong)gd->ram_size);
> -+		debug("## Giving linux memsize in bytes, %lu\n",
> -+		      (ulong)gd->ram_size);
> -+	} else {
> -+		sprintf(env_buf, "%lu", (ulong)(gd->ram_size >> 20));
> -+		debug("## Giving linux memsize in MB, %lu\n",
> -+		      (ulong)(gd->ram_size >> 20));
> -+	}
> -
> - 	rd_start =3D UNCACHED_SDRAM(images->initrd_start);
> - 	rd_size =3D images->initrd_end - images->initrd_start;
> -@@ -214,7 +209,7 @@ static void linux_env_legacy(bootm_headers_t =
*images)
> - 	if (cp)
> - 		linux_env_set("eth1addr", cp);
> -
> --	if (mips_boot_malta) {
> -+	if (CONFIG_IS_ENABLED(MALTA)) {
> - 		sprintf(env_buf, "%un8r", gd->baudrate);
> - 		linux_env_set("modetty0", env_buf);
> - 	}
> -@@ -307,13 +302,13 @@ static void boot_jump_linux(bootm_headers_t =
*images)
> -
> - 	bootstage_mark(BOOTSTAGE_ID_RUN_OS);
> -
> --	if (mips_boot_malta)
> -+	if (CONFIG_IS_ENABLED(MALTA))
> - 		linux_extra =3D gd->ram_size;
> -
> --#ifdef CONFIG_BOOTSTAGE_FDT
> -+#if CONFIG_IS_ENABLED(BOOTSTAGE_FDT)
> - 	bootstage_fdt_add_report();
> - #endif
> --#ifdef CONFIG_BOOTSTAGE_REPORT
> -+#if CONFIG_IS_ENABLED(BOOTSTAGE_REPORT)
> - 	bootstage_report();
> - #endif
> -
> ---
> -2.6.2
> -
> diff --git =
a/meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-in=
line.patch =
b/meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-in=
line.patch
> deleted file mode 100644
> index 52ef687..0000000
> --- =
a/meta/recipes-bsp/u-boot/u-boot/0006-Replace-extern-inline-with-static-in=
line.patch
> +++ /dev/null
> @@ -1,1184 +0,0 @@
> -=46rom 69ce393f6ef57a8a0029df78dbdc9f9def2dbb8c Mon Sep 17 00:00:00 =
2001
> -From: =3D?UTF-8?q?M=3DC3=3DA5ns=3D20Rullg=3DC3=3DA5rd?=3D =
<mans@mansr.com>
> -Date: Fri, 6 Nov 2015 12:44:01 +0000
> -Subject: [PATCH 6/6] Replace "extern inline" with "static inline"
> -Organization: O.S. Systems Software LTDA.
> -
> -A number of headers define functions as "extern inline" which is
> -causing problems with gcc5.  The reason is that starting with
> -version 5.1, gcc defaults to the standard C99 semantics for the
> -inline keyword.
> -
> -Under the traditional GNU inline semantics, an "extern inline"
> -function would never create an external definition, the same
> -as inline *without* extern in C99.  In C99, and "extern inline"
> -definition is simply an external definition with an inline hint.
> -In short, the meanings of inline with and without extern are
> -swapped between GNU and C99.
> -
> -The upshot is that all these definitions in header files create
> -an external definition wherever those headers are included,
> -resulting in multiple definition errors at link time.
> -
> -Changing all these functions to "static inline" fixes the problem
> -since this works as desired in all gcc versions.  Although the
> -semantics are slightly different (a static inline definition may
> -result in an actual function being emitted), it works as intended
> -in practice.
> -
> -This patch also removes extern prototype declarations for the
> -changed functions where they existed.
> -
> -Upstream-Status: Submitted =
[https://patchwork.ozlabs.org/patch/540952/]
> -
> -Signed-off-by: Mans Rullgard <mans@mansr.com>
> -Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ----
> - arch/blackfin/include/asm/delay.h     |  4 +--
> - arch/m68k/include/asm/bitops.h        |  5 ++--
> - arch/m68k/include/asm/byteorder.h     |  8 +++---
> - arch/m68k/include/asm/io.h            | 40 =
++++++++++++++---------------
> - arch/powerpc/include/asm/atomic.h     |  8 +++---
> - arch/powerpc/include/asm/bitops.h     | 35 ++++++++++---------------
> - arch/powerpc/include/asm/byteorder.h  |  8 +++---
> - arch/powerpc/include/asm/io.h         | 20 +++++++--------
> - arch/powerpc/include/asm/iopin_8260.h | 40 =
++++++++++++++---------------
> - arch/powerpc/include/asm/iopin_8xx.h  | 48 =
+++++++++++++++++------------------
> - arch/sparc/include/asm/irq.h          |  4 +--
> - arch/sparc/include/asm/psr.h          |  6 ++---
> - arch/sparc/include/asm/srmmu.h        | 30 +++++++++++-----------
> - include/mpc8260.h                     |  2 +-
> - 14 files changed, 125 insertions(+), 133 deletions(-)
> -
> -diff --git a/arch/blackfin/include/asm/delay.h =
b/arch/blackfin/include/asm/delay.h
> -index 97401a7..f146efd 100644
> ---- a/arch/blackfin/include/asm/delay.h
> -+++ b/arch/blackfin/include/asm/delay.h
> -@@ -16,7 +16,7 @@
> -  * Delay routines, using a pre-computed "loops_per_second" value.
> -  */
> -
> --extern __inline__ void __delay(unsigned long loops)
> -+static __inline__ void __delay(unsigned long loops)
> - {
> - 	__asm__ __volatile__("1:\t%0 +=3D -1;\n\t"
> - 			     "cc =3D %0 =3D=3D 0;\n\t"
> -@@ -31,7 +31,7 @@ extern __inline__ void __delay(unsigned long loops)
> -  * first constant multiplications gets optimized away if the delay =
is
> -  * a constant)
> -  */
> --extern __inline__ void __udelay(unsigned long usecs)
> -+static __inline__ void __udelay(unsigned long usecs)
> - {
> - 	__delay(usecs);
> - }
> -diff --git a/arch/m68k/include/asm/bitops.h =
b/arch/m68k/include/asm/bitops.h
> -index f9c434b..6b79a0d 100644
> ---- a/arch/m68k/include/asm/bitops.h
> -+++ b/arch/m68k/include/asm/bitops.h
> -@@ -10,21 +10,20 @@
> - extern void set_bit(int nr, volatile void *addr);
> - extern void clear_bit(int nr, volatile void *addr);
> - extern void change_bit(int nr, volatile void *addr);
> --extern int test_and_set_bit(int nr, volatile void *addr);
> - extern int test_and_clear_bit(int nr, volatile void *addr);
> - extern int test_and_change_bit(int nr, volatile void *addr);
> -
> - #ifdef __KERNEL__
> -
> -
> --extern inline int test_bit(int nr, __const__ volatile void *addr)
> -+static inline int test_bit(int nr, __const__ volatile void *addr)
> - {
> - 	__const__ unsigned int *p =3D (__const__ unsigned int *) addr;
> -
> - 	return (p[nr >> 5] & (1UL << (nr & 31))) !=3D 0;
> - }
> -
> --extern inline int test_and_set_bit(int nr, volatile void *vaddr)
> -+static inline int test_and_set_bit(int nr, volatile void *vaddr)
> - {
> - 	char retval;
> -
> -diff --git a/arch/m68k/include/asm/byteorder.h =
b/arch/m68k/include/asm/byteorder.h
> -index 908a99b..7244b75 100644
> ---- a/arch/m68k/include/asm/byteorder.h
> -+++ b/arch/m68k/include/asm/byteorder.h
> -@@ -22,25 +22,25 @@
> - 		(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) | \
> - 		(((__u32)(x)) >> 24) ))
> -
> --extern __inline__ unsigned ld_le16(const volatile unsigned short =
*addr)
> -+static __inline__ unsigned ld_le16(const volatile unsigned short =
*addr)
> - {
> - 	unsigned result =3D *addr;
> - 	return __sw16(result);
> - }
> -
> --extern __inline__ void st_le16(volatile unsigned short *addr,
> -+static __inline__ void st_le16(volatile unsigned short *addr,
> - 			       const unsigned val)
> - {
> - 	*addr =3D __sw16(val);
> - }
> -
> --extern __inline__ unsigned ld_le32(const volatile unsigned *addr)
> -+static __inline__ unsigned ld_le32(const volatile unsigned *addr)
> - {
> - 	unsigned result =3D *addr;
> - 	return __sw32(result);
> - }
> -
> --extern __inline__ void st_le32(volatile unsigned *addr, const =
unsigned val)
> -+static __inline__ void st_le32(volatile unsigned *addr, const =
unsigned val)
> - {
> - 	*addr =3D __sw32(val);
> - }
> -diff --git a/arch/m68k/include/asm/io.h b/arch/m68k/include/asm/io.h
> -index 2d2a519..384308b 100644
> ---- a/arch/m68k/include/asm/io.h
> -+++ b/arch/m68k/include/asm/io.h
> -@@ -67,28 +67,28 @@
> -
> - #define mb() __asm__ __volatile__ ("" : : : "memory")
> -
> --extern inline void _insb(volatile u8 * port, void *buf, int ns)
> -+static inline void _insb(volatile u8 * port, void *buf, int ns)
> - {
> - 	u8 *data =3D (u8 *) buf;
> - 	while (ns--)
> - 		*data++ =3D *port;
> - }
> -
> --extern inline void _outsb(volatile u8 * port, const void *buf, int =
ns)
> -+static inline void _outsb(volatile u8 * port, const void *buf, int =
ns)
> - {
> - 	u8 *data =3D (u8 *) buf;
> - 	while (ns--)
> - 		*port =3D *data++;
> - }
> -
> --extern inline void _insw(volatile u16 * port, void *buf, int ns)
> -+static inline void _insw(volatile u16 * port, void *buf, int ns)
> - {
> - 	u16 *data =3D (u16 *) buf;
> - 	while (ns--)
> - 		*data++ =3D __sw16(*port);
> - }
> -
> --extern inline void _outsw(volatile u16 * port, const void *buf, int =
ns)
> -+static inline void _outsw(volatile u16 * port, const void *buf, int =
ns)
> - {
> - 	u16 *data =3D (u16 *) buf;
> - 	while (ns--) {
> -@@ -97,14 +97,14 @@ extern inline void _outsw(volatile u16 * port, =
const void *buf, int ns)
> - 	}
> - }
> -
> --extern inline void _insl(volatile u32 * port, void *buf, int nl)
> -+static inline void _insl(volatile u32 * port, void *buf, int nl)
> - {
> - 	u32 *data =3D (u32 *) buf;
> - 	while (nl--)
> - 		*data++ =3D __sw32(*port);
> - }
> -
> --extern inline void _outsl(volatile u32 * port, const void *buf, int =
nl)
> -+static inline void _outsl(volatile u32 * port, const void *buf, int =
nl)
> - {
> - 	u32 *data =3D (u32 *) buf;
> - 	while (nl--) {
> -@@ -113,14 +113,14 @@ extern inline void _outsl(volatile u32 * port, =
const void *buf, int nl)
> - 	}
> - }
> -
> --extern inline void _insw_ns(volatile u16 * port, void *buf, int ns)
> -+static inline void _insw_ns(volatile u16 * port, void *buf, int ns)
> - {
> - 	u16 *data =3D (u16 *) buf;
> - 	while (ns--)
> - 		*data++ =3D *port;
> - }
> -
> --extern inline void _outsw_ns(volatile u16 * port, const void *buf, =
int ns)
> -+static inline void _outsw_ns(volatile u16 * port, const void *buf, =
int ns)
> - {
> - 	u16 *data =3D (u16 *) buf;
> - 	while (ns--) {
> -@@ -128,14 +128,14 @@ extern inline void _outsw_ns(volatile u16 * =
port, const void *buf, int ns)
> - 	}
> - }
> -
> --extern inline void _insl_ns(volatile u32 * port, void *buf, int nl)
> -+static inline void _insl_ns(volatile u32 * port, void *buf, int nl)
> - {
> - 	u32 *data =3D (u32 *) buf;
> - 	while (nl--)
> - 		*data++ =3D *port;
> - }
> -
> --extern inline void _outsl_ns(volatile u32 * port, const void *buf, =
int nl)
> -+static inline void _outsl_ns(volatile u32 * port, const void *buf, =
int nl)
> - {
> - 	u32 *data =3D (u32 *) buf;
> - 	while (nl--) {
> -@@ -159,52 +159,52 @@ extern inline void _outsl_ns(volatile u32 * =
port, const void *buf, int nl)
> - /*
> -  * 8, 16 and 32 bit, big and little endian I/O operations, with =
barrier.
> -  */
> --extern inline int in_8(volatile u8 * addr)
> -+static inline int in_8(volatile u8 * addr)
> - {
> - 	return (int)*addr;
> - }
> -
> --extern inline void out_8(volatile u8 * addr, int val)
> -+static inline void out_8(volatile u8 * addr, int val)
> - {
> - 	*addr =3D (u8) val;
> - }
> -
> --extern inline int in_le16(volatile u16 * addr)
> -+static inline int in_le16(volatile u16 * addr)
> - {
> - 	return __sw16(*addr);
> - }
> -
> --extern inline int in_be16(volatile u16 * addr)
> -+static inline int in_be16(volatile u16 * addr)
> - {
> - 	return (*addr & 0xFFFF);
> - }
> -
> --extern inline void out_le16(volatile u16 * addr, int val)
> -+static inline void out_le16(volatile u16 * addr, int val)
> - {
> - 	*addr =3D __sw16(val);
> - }
> -
> --extern inline void out_be16(volatile u16 * addr, int val)
> -+static inline void out_be16(volatile u16 * addr, int val)
> - {
> - 	*addr =3D (u16) val;
> - }
> -
> --extern inline unsigned in_le32(volatile u32 * addr)
> -+static inline unsigned in_le32(volatile u32 * addr)
> - {
> - 	return __sw32(*addr);
> - }
> -
> --extern inline unsigned in_be32(volatile u32 * addr)
> -+static inline unsigned in_be32(volatile u32 * addr)
> - {
> - 	return (*addr);
> - }
> -
> --extern inline void out_le32(volatile unsigned *addr, int val)
> -+static inline void out_le32(volatile unsigned *addr, int val)
> - {
> - 	*addr =3D __sw32(val);
> - }
> -
> --extern inline void out_be32(volatile unsigned *addr, int val)
> -+static inline void out_be32(volatile unsigned *addr, int val)
> - {
> - 	*addr =3D val;
> - }
> -diff --git a/arch/powerpc/include/asm/atomic.h =
b/arch/powerpc/include/asm/atomic.h
> -index 43a2bb2..87efcca 100644
> ---- a/arch/powerpc/include/asm/atomic.h
> -+++ b/arch/powerpc/include/asm/atomic.h
> -@@ -19,7 +19,7 @@ typedef struct { int counter; } atomic_t;
> - extern void atomic_clear_mask(unsigned long mask, unsigned long =
*addr);
> - extern void atomic_set_mask(unsigned long mask, unsigned long =
*addr);
> -
> --extern __inline__ int atomic_add_return(int a, atomic_t *v)
> -+static __inline__ int atomic_add_return(int a, atomic_t *v)
> - {
> - 	int t;
> -
> -@@ -35,7 +35,7 @@ extern __inline__ int atomic_add_return(int a, =
atomic_t *v)
> - 	return t;
> - }
> -
> --extern __inline__ int atomic_sub_return(int a, atomic_t *v)
> -+static __inline__ int atomic_sub_return(int a, atomic_t *v)
> - {
> - 	int t;
> -
> -@@ -51,7 +51,7 @@ extern __inline__ int atomic_sub_return(int a, =
atomic_t *v)
> - 	return t;
> - }
> -
> --extern __inline__ int atomic_inc_return(atomic_t *v)
> -+static __inline__ int atomic_inc_return(atomic_t *v)
> - {
> - 	int t;
> -
> -@@ -67,7 +67,7 @@ extern __inline__ int atomic_inc_return(atomic_t =
*v)
> - 	return t;
> - }
> -
> --extern __inline__ int atomic_dec_return(atomic_t *v)
> -+static __inline__ int atomic_dec_return(atomic_t *v)
> - {
> - 	int t;
> -
> -diff --git a/arch/powerpc/include/asm/bitops.h =
b/arch/powerpc/include/asm/bitops.h
> -index a6bcf3c..986ca96 100644
> ---- a/arch/powerpc/include/asm/bitops.h
> -+++ b/arch/powerpc/include/asm/bitops.h
> -@@ -7,13 +7,6 @@
> -
> - #include <asm/byteorder.h>
> -
> --extern void set_bit(int nr, volatile void *addr);
> --extern void clear_bit(int nr, volatile void *addr);
> --extern void change_bit(int nr, volatile void *addr);
> --extern int test_and_set_bit(int nr, volatile void *addr);
> --extern int test_and_clear_bit(int nr, volatile void *addr);
> --extern int test_and_change_bit(int nr, volatile void *addr);
> --
> - /*
> -  * Arguably these bit operations don't imply any memory barrier or
> -  * SMP ordering, but in fact a lot of drivers expect them to imply
> -@@ -34,7 +27,7 @@ extern int test_and_change_bit(int nr, volatile =
void *addr);
> -  * These used to be if'd out here because using : "cc" as a =
constraint
> -  * resulted in errors from egcs.  Things may be OK with gcc-2.95.
> -  */
> --extern __inline__ void set_bit(int nr, volatile void * addr)
> -+static __inline__ void set_bit(int nr, volatile void * addr)
> - {
> - 	unsigned long old;
> - 	unsigned long mask =3D 1 << (nr & 0x1f);
> -@@ -51,7 +44,7 @@ extern __inline__ void set_bit(int nr, volatile =
void * addr)
> - 	: "cc" );
> - }
> -
> --extern __inline__ void clear_bit(int nr, volatile void *addr)
> -+static __inline__ void clear_bit(int nr, volatile void *addr)
> - {
> - 	unsigned long old;
> - 	unsigned long mask =3D 1 << (nr & 0x1f);
> -@@ -68,7 +61,7 @@ extern __inline__ void clear_bit(int nr, volatile =
void *addr)
> - 	: "cc");
> - }
> -
> --extern __inline__ void change_bit(int nr, volatile void *addr)
> -+static __inline__ void change_bit(int nr, volatile void *addr)
> - {
> - 	unsigned long old;
> - 	unsigned long mask =3D 1 << (nr & 0x1f);
> -@@ -85,7 +78,7 @@ extern __inline__ void change_bit(int nr, volatile =
void *addr)
> - 	: "cc");
> - }
> -
> --extern __inline__ int test_and_set_bit(int nr, volatile void *addr)
> -+static __inline__ int test_and_set_bit(int nr, volatile void *addr)
> - {
> - 	unsigned int old, t;
> - 	unsigned int mask =3D 1 << (nr & 0x1f);
> -@@ -104,7 +97,7 @@ extern __inline__ int test_and_set_bit(int nr, =
volatile void *addr)
> - 	return (old & mask) !=3D 0;
> - }
> -
> --extern __inline__ int test_and_clear_bit(int nr, volatile void =
*addr)
> -+static __inline__ int test_and_clear_bit(int nr, volatile void =
*addr)
> - {
> - 	unsigned int old, t;
> - 	unsigned int mask =3D 1 << (nr & 0x1f);
> -@@ -123,7 +116,7 @@ extern __inline__ int test_and_clear_bit(int nr, =
volatile void *addr)
> - 	return (old & mask) !=3D 0;
> - }
> -
> --extern __inline__ int test_and_change_bit(int nr, volatile void =
*addr)
> -+static __inline__ int test_and_change_bit(int nr, volatile void =
*addr)
> - {
> - 	unsigned int old, t;
> - 	unsigned int mask =3D 1 << (nr & 0x1f);
> -@@ -143,7 +136,7 @@ extern __inline__ int test_and_change_bit(int nr, =
volatile void *addr)
> - }
> - #endif /* __INLINE_BITOPS */
> -
> --extern __inline__ int test_bit(int nr, __const__ volatile void =
*addr)
> -+static __inline__ int test_bit(int nr, __const__ volatile void =
*addr)
> - {
> - 	__const__ unsigned int *p =3D (__const__ unsigned int *) addr;
> -
> -@@ -152,7 +145,7 @@ extern __inline__ int test_bit(int nr, __const__ =
volatile void *addr)
> -
> - /* Return the bit position of the most significant 1 bit in a word =
*/
> - /* - the result is undefined when x =3D=3D 0 */
> --extern __inline__ int __ilog2(unsigned int x)
> -+static __inline__ int __ilog2(unsigned int x)
> - {
> - 	int lz;
> -
> -@@ -160,7 +153,7 @@ extern __inline__ int __ilog2(unsigned int x)
> - 	return 31 - lz;
> - }
> -
> --extern __inline__ int ffz(unsigned int x)
> -+static __inline__ int ffz(unsigned int x)
> - {
> - 	if ((x =3D ~x) =3D=3D 0)
> - 		return 32;
> -@@ -226,7 +219,7 @@ static inline int ffs64(u64 x)
> -  * the libc and compiler builtin ffs routines, therefore
> -  * differs in spirit from the above ffz (man ffs).
> -  */
> --extern __inline__ int ffs(int x)
> -+static __inline__ int ffs(int x)
> - {
> - 	return __ilog2(x & -x) + 1;
> - }
> -@@ -250,7 +243,7 @@ extern __inline__ int ffs(int x)
> - #define find_first_zero_bit(addr, size) \
> - 	find_next_zero_bit((addr), (size), 0)
> -
> --extern __inline__ unsigned long find_next_zero_bit(void * addr,
> -+static __inline__ unsigned long find_next_zero_bit(void * addr,
> - 	unsigned long size, unsigned long offset)
> - {
> - 	unsigned int * p =3D ((unsigned int *) addr) + (offset >> 5);
> -@@ -298,7 +291,7 @@ found_middle:
> - #define ext2_clear_bit(nr, addr)	test_and_clear_bit((nr) ^ 0x18, =
addr)
> -
> - #else
> --extern __inline__ int ext2_set_bit(int nr, void * addr)
> -+static __inline__ int ext2_set_bit(int nr, void * addr)
> - {
> - 	int		mask;
> - 	unsigned char	*ADDR =3D (unsigned char *) addr;
> -@@ -311,7 +304,7 @@ extern __inline__ int ext2_set_bit(int nr, void * =
addr)
> - 	return oldbit;
> - }
> -
> --extern __inline__ int ext2_clear_bit(int nr, void * addr)
> -+static __inline__ int ext2_clear_bit(int nr, void * addr)
> - {
> - 	int		mask;
> - 	unsigned char	*ADDR =3D (unsigned char *) addr;
> -@@ -325,7 +318,7 @@ extern __inline__ int ext2_clear_bit(int nr, void =
* addr)
> - }
> - #endif	/* __KERNEL__ */
> -
> --extern __inline__ int ext2_test_bit(int nr, __const__ void * addr)
> -+static __inline__ int ext2_test_bit(int nr, __const__ void * addr)
> - {
> - 	__const__ unsigned char	*ADDR =3D (__const__ unsigned char *) =
addr;
> -
> -diff --git a/arch/powerpc/include/asm/byteorder.h =
b/arch/powerpc/include/asm/byteorder.h
> -index 3f5bcf6..f731d18 100644
> ---- a/arch/powerpc/include/asm/byteorder.h
> -+++ b/arch/powerpc/include/asm/byteorder.h
> -@@ -5,7 +5,7 @@
> -
> - #ifdef __GNUC__
> -
> --extern __inline__ unsigned ld_le16(const volatile unsigned short =
*addr)
> -+static __inline__ unsigned ld_le16(const volatile unsigned short =
*addr)
> - {
> - 	unsigned val;
> -
> -@@ -13,12 +13,12 @@ extern __inline__ unsigned ld_le16(const volatile =
unsigned short *addr)
> - 	return val;
> - }
> -
> --extern __inline__ void st_le16(volatile unsigned short *addr, const =
unsigned val)
> -+static __inline__ void st_le16(volatile unsigned short *addr, const =
unsigned val)
> - {
> - 	__asm__ __volatile__ ("sthbrx %1,0,%2" : "=3Dm" (*addr) : "r" =
(val), "r" (addr));
> - }
> -
> --extern __inline__ unsigned ld_le32(const volatile unsigned *addr)
> -+static __inline__ unsigned ld_le32(const volatile unsigned *addr)
> - {
> - 	unsigned val;
> -
> -@@ -26,7 +26,7 @@ extern __inline__ unsigned ld_le32(const volatile =
unsigned *addr)
> - 	return val;
> - }
> -
> --extern __inline__ void st_le32(volatile unsigned *addr, const =
unsigned val)
> -+static __inline__ void st_le32(volatile unsigned *addr, const =
unsigned val)
> - {
> - 	__asm__ __volatile__ ("stwbrx %1,0,%2" : "=3Dm" (*addr) : "r" =
(val), "r" (addr));
> - }
> -diff --git a/arch/powerpc/include/asm/io.h =
b/arch/powerpc/include/asm/io.h
> -index a5257e9..a54fc46 100644
> ---- a/arch/powerpc/include/asm/io.h
> -+++ b/arch/powerpc/include/asm/io.h
> -@@ -163,7 +163,7 @@ static inline void __raw_writel(unsigned int v, =
volatile void __iomem *addr)
> -  * is actually performed (i.e. the data has come back) before we =
start
> -  * executing any following instructions.
> -  */
> --extern inline u8 in_8(const volatile unsigned char __iomem *addr)
> -+static inline u8 in_8(const volatile unsigned char __iomem *addr)
> - {
> - 	u8 ret;
> -
> -@@ -174,7 +174,7 @@ extern inline u8 in_8(const volatile unsigned =
char __iomem *addr)
> - 	return ret;
> - }
> -
> --extern inline void out_8(volatile unsigned char __iomem *addr, u8 =
val)
> -+static inline void out_8(volatile unsigned char __iomem *addr, u8 =
val)
> - {
> - 	__asm__ __volatile__("sync;\n"
> - 			     "stb%U0%X0 %1,%0;\n"
> -@@ -182,7 +182,7 @@ extern inline void out_8(volatile unsigned char =
__iomem *addr, u8 val)
> - 			     : "r" (val));
> - }
> -
> --extern inline u16 in_le16(const volatile unsigned short __iomem =
*addr)
> -+static inline u16 in_le16(const volatile unsigned short __iomem =
*addr)
> - {
> - 	u16 ret;
> -
> -@@ -193,7 +193,7 @@ extern inline u16 in_le16(const volatile unsigned =
short __iomem *addr)
> - 	return ret;
> - }
> -
> --extern inline u16 in_be16(const volatile unsigned short __iomem =
*addr)
> -+static inline u16 in_be16(const volatile unsigned short __iomem =
*addr)
> - {
> - 	u16 ret;
> -
> -@@ -203,18 +203,18 @@ extern inline u16 in_be16(const volatile =
unsigned short __iomem *addr)
> - 	return ret;
> - }
> -
> --extern inline void out_le16(volatile unsigned short __iomem *addr, =
u16 val)
> -+static inline void out_le16(volatile unsigned short __iomem *addr, =
u16 val)
> - {
> - 	__asm__ __volatile__("sync; sthbrx %1,0,%2" : "=3Dm" (*addr) :
> - 			      "r" (val), "r" (addr));
> - }
> -
> --extern inline void out_be16(volatile unsigned short __iomem *addr, =
u16 val)
> -+static inline void out_be16(volatile unsigned short __iomem *addr, =
u16 val)
> - {
> - 	__asm__ __volatile__("sync; sth%U0%X0 %1,%0" : "=3Dm" (*addr) : =
"r" (val));
> - }
> -
> --extern inline u32 in_le32(const volatile unsigned __iomem *addr)
> -+static inline u32 in_le32(const volatile unsigned __iomem *addr)
> - {
> - 	u32 ret;
> -
> -@@ -225,7 +225,7 @@ extern inline u32 in_le32(const volatile unsigned =
__iomem *addr)
> - 	return ret;
> - }
> -
> --extern inline u32 in_be32(const volatile unsigned __iomem *addr)
> -+static inline u32 in_be32(const volatile unsigned __iomem *addr)
> - {
> - 	u32 ret;
> -
> -@@ -235,13 +235,13 @@ extern inline u32 in_be32(const volatile =
unsigned __iomem *addr)
> - 	return ret;
> - }
> -
> --extern inline void out_le32(volatile unsigned __iomem *addr, u32 =
val)
> -+static inline void out_le32(volatile unsigned __iomem *addr, u32 =
val)
> - {
> - 	__asm__ __volatile__("sync; stwbrx %1,0,%2" : "=3Dm" (*addr) :
> - 			     "r" (val), "r" (addr));
> - }
> -
> --extern inline void out_be32(volatile unsigned __iomem *addr, u32 =
val)
> -+static inline void out_be32(volatile unsigned __iomem *addr, u32 =
val)
> - {
> - 	__asm__ __volatile__("sync; stw%U0%X0 %1,%0" : "=3Dm" (*addr) : =
"r" (val));
> - }
> -diff --git a/arch/powerpc/include/asm/iopin_8260.h =
b/arch/powerpc/include/asm/iopin_8260.h
> -index 619f3a8..617584d 100644
> ---- a/arch/powerpc/include/asm/iopin_8260.h
> -+++ b/arch/powerpc/include/asm/iopin_8260.h
> -@@ -23,140 +23,140 @@ iopin_t;
> - #define IOPIN_PORTC	2
> - #define IOPIN_PORTD	3
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_high(iopin_t *iopin)
> - {
> -     volatile uint *datp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdata;
> -     datp[iopin->port * 8] |=3D (1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_low(iopin_t *iopin)
> - {
> -     volatile uint *datp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdata;
> -     datp[iopin->port * 8] &=3D ~(1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_high(iopin_t *iopin)
> - {
> -     volatile uint *datp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdata;
> -     return (datp[iopin->port * 8] >> (31 - iopin->pin)) & 1;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_low(iopin_t *iopin)
> - {
> -     volatile uint *datp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdata;
> -     return ((datp[iopin->port * 8] >> (31 - iopin->pin)) & 1) ^ 1;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_out(iopin_t *iopin)
> - {
> -     volatile uint *dirp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdira;
> -     dirp[iopin->port * 8] |=3D (1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_in(iopin_t *iopin)
> - {
> -     volatile uint *dirp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdira;
> -     dirp[iopin->port * 8] &=3D ~(1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_out(iopin_t *iopin)
> - {
> -     volatile uint *dirp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdira;
> -     return (dirp[iopin->port * 8] >> (31 - iopin->pin)) & 1;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_in(iopin_t *iopin)
> - {
> -     volatile uint *dirp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_pdira;
> -     return ((dirp[iopin->port * 8] >> (31 - iopin->pin)) & 1) ^ 1;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_odr(iopin_t *iopin)
> - {
> -     volatile uint *odrp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_podra;
> -     odrp[iopin->port * 8] |=3D (1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_act(iopin_t *iopin)
> - {
> -     volatile uint *odrp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_podra;
> -     odrp[iopin->port * 8] &=3D ~(1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_odr(iopin_t *iopin)
> - {
> -     volatile uint *odrp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_podra;
> -     return (odrp[iopin->port * 8] >> (31 - iopin->pin)) & 1;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_act(iopin_t *iopin)
> - {
> -     volatile uint *odrp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_podra;
> -     return ((odrp[iopin->port * 8] >> (31 - iopin->pin)) & 1) ^ 1;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_ded(iopin_t *iopin)
> - {
> -     volatile uint *parp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_ppara;
> -     parp[iopin->port * 8] |=3D (1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_gen(iopin_t *iopin)
> - {
> -     volatile uint *parp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_ppara;
> -     parp[iopin->port * 8] &=3D ~(1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_ded(iopin_t *iopin)
> - {
> -     volatile uint *parp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_ppara;
> -     return (parp[iopin->port * 8] >> (31 - iopin->pin)) & 1;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_gen(iopin_t *iopin)
> - {
> -     volatile uint *parp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_ppara;
> -     return ((parp[iopin->port * 8] >> (31 - iopin->pin)) & 1) ^ 1;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_opt2(iopin_t *iopin)
> - {
> -     volatile uint *sorp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_psora;
> -     sorp[iopin->port * 8] |=3D (1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_opt1(iopin_t *iopin)
> - {
> -     volatile uint *sorp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_psora;
> -     sorp[iopin->port * 8] &=3D ~(1 << (31 - iopin->pin));
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_opt2(iopin_t *iopin)
> - {
> -     volatile uint *sorp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_psora;
> -     return (sorp[iopin->port * 8] >> (31 - iopin->pin)) & 1;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_opt1(iopin_t *iopin)
> - {
> -     volatile uint *sorp =3D &((immap_t =
*)CONFIG_SYS_IMMR)->im_ioport.iop_psora;
> -diff --git a/arch/powerpc/include/asm/iopin_8xx.h =
b/arch/powerpc/include/asm/iopin_8xx.h
> -index 0123baf..8db0fa2 100644
> ---- a/arch/powerpc/include/asm/iopin_8xx.h
> -+++ b/arch/powerpc/include/asm/iopin_8xx.h
> -@@ -26,7 +26,7 @@ typedef struct {
> - #define IOPIN_PORTC	2
> - #define IOPIN_PORTD	3
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_high(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -44,7 +44,7 @@ iopin_set_high(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_low(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -62,7 +62,7 @@ iopin_set_low(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_high(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -81,7 +81,7 @@ iopin_is_high(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_low(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -100,7 +100,7 @@ iopin_is_low(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_out(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -118,7 +118,7 @@ iopin_set_out(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_in(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -136,7 +136,7 @@ iopin_set_in(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_out(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -155,7 +155,7 @@ iopin_is_out(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_in(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -174,7 +174,7 @@ iopin_is_in(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_odr(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -186,7 +186,7 @@ iopin_set_odr(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_act(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -198,7 +198,7 @@ iopin_set_act(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_odr(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -211,7 +211,7 @@ iopin_is_odr(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_act(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -224,7 +224,7 @@ iopin_is_act(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_ded(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -242,7 +242,7 @@ iopin_set_ded(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_gen(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -260,7 +260,7 @@ iopin_set_gen(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_ded(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -279,7 +279,7 @@ iopin_is_ded(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_gen(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTA) {
> -@@ -298,7 +298,7 @@ iopin_is_gen(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_opt2(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -307,7 +307,7 @@ iopin_set_opt2(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_opt1(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -316,7 +316,7 @@ iopin_set_opt1(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_opt2(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -326,7 +326,7 @@ iopin_is_opt2(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_opt1(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -336,7 +336,7 @@ iopin_is_opt1(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_falledge(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -345,7 +345,7 @@ iopin_set_falledge(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ void
> -+static __inline__ void
> - iopin_set_anyedge(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -354,7 +354,7 @@ iopin_set_anyedge(iopin_t *iopin)
> - 	}
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_falledge(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -@@ -364,7 +364,7 @@ iopin_is_falledge(iopin_t *iopin)
> - 	return 0;
> - }
> -
> --extern __inline__ uint
> -+static __inline__ uint
> - iopin_is_anyedge(iopin_t *iopin)
> - {
> - 	if (iopin->port =3D=3D IOPIN_PORTC) {
> -diff --git a/arch/sparc/include/asm/irq.h =
b/arch/sparc/include/asm/irq.h
> -index bbe0204..2faf7a0 100644
> ---- a/arch/sparc/include/asm/irq.h
> -+++ b/arch/sparc/include/asm/irq.h
> -@@ -12,7 +12,7 @@
> - #include <asm/psr.h>
> -
> - /* Set SPARC Processor Interrupt Level */
> --extern inline void set_pil(unsigned int level)
> -+static inline void set_pil(unsigned int level)
> - {
> - 	unsigned int psr =3D get_psr();
> -
> -@@ -20,7 +20,7 @@ extern inline void set_pil(unsigned int level)
> - }
> -
> - /* Get SPARC Processor Interrupt Level */
> --extern inline unsigned int get_pil(void)
> -+static inline unsigned int get_pil(void)
> - {
> - 	unsigned int psr =3D get_psr();
> - 	return (psr & PSR_PIL) >> PSR_PIL_OFS;
> -diff --git a/arch/sparc/include/asm/psr.h =
b/arch/sparc/include/asm/psr.h
> -index 70af8e0..a91bdc9 100644
> ---- a/arch/sparc/include/asm/psr.h
> -+++ b/arch/sparc/include/asm/psr.h
> -@@ -42,7 +42,7 @@
> -
> - #ifndef __ASSEMBLY__
> - /* Get the %psr register. */
> --extern __inline__ unsigned int get_psr(void)
> -+static __inline__ unsigned int get_psr(void)
> - {
> - 	unsigned int psr;
> - 	__asm__ __volatile__("rd	%%psr, %0\n\t"
> -@@ -53,7 +53,7 @@ extern __inline__ unsigned int get_psr(void)
> - 	return psr;
> - }
> -
> --extern __inline__ void put_psr(unsigned int new_psr)
> -+static __inline__ void put_psr(unsigned int new_psr)
> - {
> - 	__asm__ __volatile__("wr	%0, 0x0, %%psr\n\t" "nop\n\t" =
"nop\n\t" "nop\n\t":	/* no outputs */
> - 			     :"r"(new_psr)
> -@@ -67,7 +67,7 @@ extern __inline__ void put_psr(unsigned int =
new_psr)
> -
> - extern unsigned int fsr_storage;
> -
> --extern __inline__ unsigned int get_fsr(void)
> -+static __inline__ unsigned int get_fsr(void)
> - {
> - 	unsigned int fsr =3D 0;
> -
> -diff --git a/arch/sparc/include/asm/srmmu.h =
b/arch/sparc/include/asm/srmmu.h
> -index 74b1554..8da2f67 100644
> ---- a/arch/sparc/include/asm/srmmu.h
> -+++ b/arch/sparc/include/asm/srmmu.h
> -@@ -148,7 +148,7 @@ extern void *srmmu_nocache_pool;
> - #define __nocache_fix(VADDR) __va(__nocache_pa(VADDR))
> -
> - /* Accessing the MMU control register. */
> --extern __inline__ unsigned int srmmu_get_mmureg(void)
> -+static __inline__ unsigned int srmmu_get_mmureg(void)
> - {
> - 	unsigned int retval;
> - 	__asm__ __volatile__("lda [%%g0] %1, %0\n\t":
> -@@ -156,14 +156,14 @@ extern __inline__ unsigned int =
srmmu_get_mmureg(void)
> - 	return retval;
> - }
> -
> --extern __inline__ void srmmu_set_mmureg(unsigned long regval)
> -+static __inline__ void srmmu_set_mmureg(unsigned long regval)
> - {
> - 	__asm__ __volatile__("sta %0, [%%g0] %1\n\t"::"r"(regval),
> - 			     "i"(ASI_M_MMUREGS):"memory");
> -
> - }
> -
> --extern __inline__ void srmmu_set_ctable_ptr(unsigned long paddr)
> -+static __inline__ void srmmu_set_ctable_ptr(unsigned long paddr)
> - {
> - 	paddr =3D ((paddr >> 4) & SRMMU_CTX_PMASK);
> - 	__asm__ __volatile__("sta %0, [%1] %2\n\t"::"r"(paddr),
> -@@ -171,7 +171,7 @@ extern __inline__ void =
srmmu_set_ctable_ptr(unsigned long paddr)
> - 			     "i"(ASI_M_MMUREGS):"memory");
> - }
> -
> --extern __inline__ unsigned long srmmu_get_ctable_ptr(void)
> -+static __inline__ unsigned long srmmu_get_ctable_ptr(void)
> - {
> - 	unsigned int retval;
> -
> -@@ -181,13 +181,13 @@ extern __inline__ unsigned long =
srmmu_get_ctable_ptr(void)
> - 	return (retval & SRMMU_CTX_PMASK) << 4;
> - }
> -
> --extern __inline__ void srmmu_set_context(int context)
> -+static __inline__ void srmmu_set_context(int context)
> - {
> - 	__asm__ __volatile__("sta %0, [%1] %2\n\t"::"r"(context),
> - 			     "r"(SRMMU_CTX_REG), =
"i"(ASI_M_MMUREGS):"memory");
> - }
> -
> --extern __inline__ int srmmu_get_context(void)
> -+static __inline__ int srmmu_get_context(void)
> - {
> - 	register int retval;
> - 	__asm__ __volatile__("lda [%1] %2, %0\n\t":
> -@@ -196,7 +196,7 @@ extern __inline__ int srmmu_get_context(void)
> - 	return retval;
> - }
> -
> --extern __inline__ unsigned int srmmu_get_fstatus(void)
> -+static __inline__ unsigned int srmmu_get_fstatus(void)
> - {
> - 	unsigned int retval;
> -
> -@@ -206,7 +206,7 @@ extern __inline__ unsigned int =
srmmu_get_fstatus(void)
> - 	return retval;
> - }
> -
> --extern __inline__ unsigned int srmmu_get_faddr(void)
> -+static __inline__ unsigned int srmmu_get_faddr(void)
> - {
> - 	unsigned int retval;
> -
> -@@ -217,7 +217,7 @@ extern __inline__ unsigned int =
srmmu_get_faddr(void)
> - }
> -
> - /* This is guaranteed on all SRMMU's. */
> --extern __inline__ void srmmu_flush_whole_tlb(void)
> -+static __inline__ void srmmu_flush_whole_tlb(void)
> - {
> - 	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"::"r"(0x400),	=
/* Flush entire TLB!! */
> - 			     "i"(ASI_M_FLUSH_PROBE):"memory");
> -@@ -225,14 +225,14 @@ extern __inline__ void =
srmmu_flush_whole_tlb(void)
> - }
> -
> - /* These flush types are not available on all chips... */
> --extern __inline__ void srmmu_flush_tlb_ctx(void)
> -+static __inline__ void srmmu_flush_tlb_ctx(void)
> - {
> - 	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"::"r"(0x300),	=
/* Flush TLB ctx.. */
> - 			     "i"(ASI_M_FLUSH_PROBE):"memory");
> -
> - }
> -
> --extern __inline__ void srmmu_flush_tlb_region(unsigned long addr)
> -+static __inline__ void srmmu_flush_tlb_region(unsigned long addr)
> - {
> - 	addr &=3D SRMMU_PGDIR_MASK;
> - 	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"::"r"(addr | 0x200),	=
/* Flush TLB region.. */
> -@@ -240,7 +240,7 @@ extern __inline__ void =
srmmu_flush_tlb_region(unsigned long addr)
> -
> - }
> -
> --extern __inline__ void srmmu_flush_tlb_segment(unsigned long addr)
> -+static __inline__ void srmmu_flush_tlb_segment(unsigned long addr)
> - {
> - 	addr &=3D SRMMU_REAL_PMD_MASK;
> - 	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"::"r"(addr | 0x100),	=
/* Flush TLB segment.. */
> -@@ -248,7 +248,7 @@ extern __inline__ void =
srmmu_flush_tlb_segment(unsigned long addr)
> -
> - }
> -
> --extern __inline__ void srmmu_flush_tlb_page(unsigned long page)
> -+static __inline__ void srmmu_flush_tlb_page(unsigned long page)
> - {
> - 	page &=3D PAGE_MASK;
> - 	__asm__ __volatile__("sta %%g0, [%0] %1\n\t"::"r"(page),	=
/* Flush TLB page.. */
> -@@ -256,7 +256,7 @@ extern __inline__ void =
srmmu_flush_tlb_page(unsigned long page)
> -
> - }
> -
> --extern __inline__ unsigned long srmmu_hwprobe(unsigned long vaddr)
> -+static __inline__ unsigned long srmmu_hwprobe(unsigned long vaddr)
> - {
> - 	unsigned long retval;
> -
> -@@ -268,7 +268,7 @@ extern __inline__ unsigned long =
srmmu_hwprobe(unsigned long vaddr)
> - 	return retval;
> - }
> -
> --extern __inline__ int srmmu_get_pte(unsigned long addr)
> -+static __inline__ int srmmu_get_pte(unsigned long addr)
> - {
> - 	register unsigned long entry;
> -
> -diff --git a/include/mpc8260.h b/include/mpc8260.h
> -index 9980c74..75f1b0c 100644
> ---- a/include/mpc8260.h
> -+++ b/include/mpc8260.h
> -@@ -892,7 +892,7 @@
> - #define UPMC			3
> -
> - #if !defined(__ASSEMBLY__) && defined(CONFIG_WATCHDOG)
> --extern __inline__ void
> -+static __inline__ void
> - reset_8260_watchdog(volatile immap_t *immr)
> - {
> -     immr->im_siu_conf.sc_swsr =3D 0x556c;
> ---
> -2.6.2
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2015.10.bb =
b/meta/recipes-bsp/u-boot/u-boot_2015.10.bb
> deleted file mode 100644
> index 2abfcfa..0000000
> --- a/meta/recipes-bsp/u-boot/u-boot_2015.10.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -require u-boot.inc
> -
> -DEPENDS +=3D "dtc-native"
> -
> -# This revision corresponds to the tag "v2015.10"
> -# We use the revision in order to avoid having to fetch it from the
> -# repo during parse
> -SRCREV =3D "5ec0003b19cbdf06ccd6941237cbc0d1c3468e2d"
> -
> -SRC_URI +=3D " \
> -    =
file://0001-powerpc-cpu-u-boot-.lds-remove-_GLOBAL_OFFSET_TABLE_.patch \
> -    =
file://0002-image.c-Fix-non-Android-booting-with-ramdisk-and-or-.patch \
> -    =
file://0003-common-board_f-enable-setup_board_part1-for-MIPS.patch \
> -    file://0004-MIPS-bootm-rework-and-fix-broken-bootm-code.patch \
> -    file://0005-MIPS-bootm-use-CONFIG_IS_ENABLED-everywhere.patch \
> -    file://0006-Replace-extern-inline-with-static-inline.patch \
> -"
> -
> -PV =3D "v2015.10+git${SRCPV}"
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2016.01.bb =
b/meta/recipes-bsp/u-boot/u-boot_2016.01.bb
> new file mode 100644
> index 0000000..d5c1181
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/u-boot_2016.01.bb
> @@ -0,0 +1,10 @@
> +require u-boot.inc
> +
> +DEPENDS +=3D "dtc-native"
> +
> +# This revision corresponds to the tag "v2016.01"
> +# We use the revision in order to avoid having to fetch it from the
> +# repo during parse
> +SRCREV =3D "fa85e826c16b9ce1ad302a57e9c4b24db0d8b930"
> +
> +PV =3D "v2016.01+git${SRCPV}"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_6BABFD51-77F0-4B5D-8F19-47AD843A02A9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaXHkYACgkQuwUzVZGdMxRaEACffhjiuvUGSFrvCdSaNuxvO4K2
sbMAn3OuXx/gIxQgt5KIB8mKjPVmfsM+
=jrd7
-----END PGP SIGNATURE-----

--Apple-Mail=_6BABFD51-77F0-4B5D-8F19-47AD843A02A9--
