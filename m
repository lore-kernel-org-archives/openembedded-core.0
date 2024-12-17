Return-Path: <ejo@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6AAE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 07:35:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web10.76500.1734420938238985960
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 23:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: ejo@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <ejo@pengutronix.de>)
	id 1tNS7E-0005PL-99; Tue, 17 Dec 2024 08:35:36 +0100
Message-ID: <a3343457006984c01589114e82839f2941fa7b02.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2] barebox: upgrade 2024.10.0 -> 2024.12.0
From: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>
To: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>, PTX-Internal Yocto List
	 <yocto@pengutronix.de>
Date: Tue, 17 Dec 2024 08:35:34 +0100
In-Reply-To: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
References: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 07:35:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208801

Hi Wang,

Am Donnerstag, dem 12.12.2024 um 08:48 +0800 schrieb wangmy via lists.opene=
mbedded.org:
> From: Wang Mingyu <wangmy@cn.fujitsu.com>
>=20
> 0001-lib-lz4-use-lz4-instead-of-lz4c.patch
> removed since it's included in 2024.12.0
>=20
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * ARM: omap: fix NS16550 UART setup in omap_debug_ll_init
> * Documentation: imd: update information on barebox_update
> * partitions: efi: Check GPT header size against minimum limit
> * checkpatch: fix detection of barebox root directory
> * ARM: omap: add two smaller MLO defconfigs for AM335x
> * crc: crc-itu-t: generate lookup table on first use
> * of: fdt: fix possible overflow during parsing of fdt
> * remoteproc: use I/O memory variants of memcpy/memset
> * dlmalloc: Fix integer overflow in request2size()
> * remoteproc: imx: add support for loading ELF data sections into DRAM
> * remoteproc: elf_loader: skip segment with memsz as zero
> * of: fdt: fix overflow caused by fdt_prop extending beyond fdt
> * usb: typec: fix freeing uninitialized memory=C2=A0 Ahmad Fatoum
> * startup: do not bring up networking if console input disabled
> * sandbox: noshell_defconfig: set CONFIG_CONSOLE_DISABLE_INPUT=3Dy
> * ARM: dts: i.MX8MP: disable NPU node if hardware is missing
> * clk: clk-composite: fix callback guard in clk_composite_round_rate
> * partitions: efi: fix overflow issues while allocating gpt entries
> * lib: lz4: use lz4 instead of lz4c
> * clk: rockchip: make it compile again
> * ARM: i.MX: ele: fix forward_lifecycle
> * ARM: i.MX9: tqma93xx: workaround warning in variant detection
> * partitions: efi: fix GPT header size exceeding allocation size
> * video: Rockchip: add missing dma_alloc_coherent a device parameter
> * dma: give dma_alloc_coherent a device parameter
> * common: buffer access out-of-bounds
> * include: Include <linux/math.h> to resolve implicit declaration of do_d=
iv()
> * i2c: lpi2c: fix potential read of uninitialized variable

thank you for the version bump!

Just a note for maybe the next round, since this patch is already in oe-cor=
e master:
This is not the changelog between v2024.10.0 and v2024.12.0. It is only the=
 changelog of the final
fixes after merging the for-next/-Branches.

The total patch count for 2024.10.0 -> 2024.12.0 is >150 patches.
Therefore, it might be more practical to include the 'high-level' release n=
otes from the barebox ML:

> This release brings us some Rockchip updates. We have a new board
> supported, the OrangePI 5 plus. Also we have VOP2 graphics output on
> RK356x SoCs. This comes with a few updates to the fbconsole which now
> supports changing the orientation and fonts with transparent background
> so that we can nicely put a console on a background image.
>=20
> Also new in this release is ECDSA support for verifying FIT images.
>=20
> Ahmad has continued to cleanup include/common.h. It's now nearly empty
> so everything is moved to more dedicated headers.

https://lore.barebox.org/barebox/Z1LWzzW3pa2ZM8XZ@pengutronix.de/t/

Regards, Enrico

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
> =C2=A0meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
> =C2=A0meta/recipes-bsp/barebox/barebox.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 --
> =C2=A02 files changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-
> common.inc
> index 5dcdb70757..fce3b825ae 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
> =C2=A0
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364=
286c4192"
> =C2=A0
> -PV =3D "2024.10.0"
> +PV =3D "2024.12.0"
> =C2=A0SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16d=
ee7442d71a5af88d"
> +SRC_URI[sha256sum] =3D "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f=
47cd6967b9c4dcab"
> diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/bareb=
ox/barebox.bb
> index dc9ae669d7..a48d97941c 100644
> --- a/meta/recipes-bsp/barebox/barebox.bb
> +++ b/meta/recipes-bsp/barebox/barebox.bb
> @@ -8,5 +8,3 @@ and a subset of the POSIX C library for writing more comm=
and-line utilities."
> =C2=A0require barebox-common.inc
> =C2=A0inherit barebox
> =C2=A0
> -SRC_URI +=3D "file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch=C2=A0\
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208618): https://lists.openembedded.org/g/openembedde=
d-core/message/208618
> Mute This Topic: https://lists.openembedded.org/mt/110072594/3616721
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=C2=
=A0[ejo@pengutronix.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Pengutronix e.K.=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Enrico J=C3=B6rns=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|
Embedded Linux Consulting & Support=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| https://www.pengutronix.de/ |
Steuerwalder Str. 21=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0| Phone: +49-5121-206917-180=C2=A0=C2=A0|
31137 Hildesheim, Germany=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| Fax:=C2=A0=C2=
=A0=C2=A0+49-5121-206917-9=C2=A0=C2=A0=C2=A0=C2=A0|

