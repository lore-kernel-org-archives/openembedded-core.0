Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3CFE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 12:54:59 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.9697.1733835291234180000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 04:54:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D/xJrdfO;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D8801BF204;
	Tue, 10 Dec 2024 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733835289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dYg1y2+1AoJUDE27kyJZOr3y0QJp9t1FkZ1FJcMGbBY=;
	b=D/xJrdfOLmkwPUSbGMLE6pIt80ZmrxVaYigH2qg+SIg8/cXJi2mUyM2citJqj9tXot9WNy
	OMQxGy5eZOdq807aK0x8ieJWLwVZHnnmD/Dgk4yJP5Z9/LvGoy1G06Ha0D0LE9ZsowOnYX
	syubhySwz1HpPZGqEgoznIQyYubK/igBiP7emnFhsUcBrvDujXPOECkIIWW2DT3bLmE0CQ
	0Woz7hjLpQWOXdQmuWYsGEtfwIgrOaUn32npBdJhT1JkP+543IU4tC6xdCTfMZgqZjbL9Q
	zgZdIb4rQy6eSGVF8HeqGNQvsZ4+Jw5IlUhaH3WRqdTw59pEy49oz5JkCAWOag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Dec 2024 13:54:49 +0100
Message-Id: <D681BBVIIFZY.3OKPEN7OE1BG6@bootlin.com>
Subject: Re: [OE-core] [PATCH 01/20] barebox-tools: upgrade 2024.10.0 ->
 2024.12.0
Cc: "Wang Mingyu" <wangmy@cn.fujitsu.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1733788612-20933-1-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 12:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208533

On Tue Dec 10, 2024 at 12:56 AM CET, wangmy via lists.openembedded.org wrot=
e:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
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
> * usb: typec: fix freeing uninitialized memory	Ahmad Fatoum
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
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---

Hi Wang,

I believe this patch is breaking the barebox build. I've got the
following error on the autobuilder:

ERROR: barebox-2024.12.0-r0 do_patch: Applying patch '0001-lib-lz4-use-lz4-=
instead-of-lz4c.patch' on target directory '/srv/pokybuild/yocto-worker/oe-=
selftest-armhost/build/build-st-2005505/tmp/work/qemuarm64-poky-linux/bareb=
ox/2024.12.0/barebox-2024.12.0'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/oe-selftest-armhost/b=
uild/build-st-2005505/tmp/work/qemuarm64-poky-linux/barebox/2024.12.0/recip=
e-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-lib-lz4=
-use-lz4-instead-of-lz4c.patch
patching file scripts/Makefile.lib
Hunk #1 FAILED at 492.
1 out of 1 hunk FAILED -- rejects in file scripts/Makefile.lib
Patch 0001-lib-lz4-use-lz4-instead-of-lz4c.patch can be reverse-applied

https://valkyrie.yoctoproject.org/#/builders/23/builds/647/steps/14/logs/st=
dio

It looks like the said patch was merged upstream. Can you have a look at
this please ?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


