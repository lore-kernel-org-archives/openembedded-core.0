Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37938E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 00:49:17 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.9844.1733964554819936806
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 16:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BWKPzwwf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1733964554; x=1765500554;
  h=from:to:cc:subject:date:message-id;
  bh=ODH2Fowx+Vif5bmRLKV83pwhmKyJpVtMl8NmHh3OJ+8=;
  b=BWKPzwwfa8RDX+KkkqLtVSKobon7iWGm2Zg7ohgZk6Cl9D2/2eE3YHeR
   IDf6qmaNE8t8OaNS8u7kRaakmjGqPe+kdtufai8PDIGfcd7wijV0APv/v
   iQKB7OzahIHw0Skp1uMxhOczBHRspp5eshPVN1xJEP+Z0DIR8i60wJJZM
   cnXwCkOhtKZAl6Zs13nRTxSN+B1cyjt0zkjF/3yS7E9btmHxwMwDxMfAU
   rxxxvSiEZiV/vZMMfDPDutGYecF5t+HUCzvOE8CHqwcnz5fHj3nqJeCGM
   at6P1Tm/8E18yuaNt5bzvxlPQ+PgcZ3l4JcCyS7XCiYa9DmoKSrN6SVI8
   A==;
X-CSE-ConnectionGUID: I2cgm0nwTh+Y0qo5uqiTZQ==
X-CSE-MsgGUID: LdYHfybRTSWtlCnJQplsaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="183629753"
X-IronPort-AV: E=Sophos;i="6.12,227,1728918000"; 
   d="scan'208";a="183629753"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2024 09:49:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C1538E8523
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:09 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 91304D3F08
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B8F32008B384
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 09:49:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 963721A000B;
	Thu, 12 Dec 2024 08:49:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: [OE-core] [PATCH v2] barebox: upgrade 2024.10.0 -> 2024.12.0
Date: Thu, 12 Dec 2024 08:48:59 +0800
Message-Id: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28854.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28854.003
X-TMASE-Result: 10--6.269500-10.000000
X-TMASE-MatchedRID: yX2NuvXOYO2jz0nOeth/yTo39wOA02LhQRlUSJjs8Z/9wRnyxuPjhD7C
	2zi5xdOEEQ/pXp0Ynfa/+eNmL+7cq/NeiPBzLCvM4wdobZiVzDh6AgcdfYvhjKzOXxkfrIYvAh3
	/LCiB9EhdJENsR7mB0PuuSUX7IU6V350VJQnKWfhmPsTq8ee41s5U+WuldDkjSMg2Oe/b8EzSsc
	aacuMzqBx0M+GVmwFaXtP8HsQpJdIoMmKpHm2CtZ+stJjZFtGk+Pj9s/c5EzcOabErRKSRvRc3T
	xPBcvYJwVeG+L4n/T/8fJ+JFuyARbQIlEvYJcRN+GYt8f/VhTtb4dXBMpIkhp3XmgvgO1VKTBVQ
	QAgPmRMiBaI06kukx8Yoh/qEF/tVWuiZFrpf1HxO5y1KmK5bJRSLgSFq3Tnj31GU/N5W5BB25lG
	5ErCg9hx/AZAhvCuQEEu7gcGO7sYmxaV6uGUX1Z4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gKq
	42LRYkb9K0bL9A1qKdkw4zz0L05JIPKidt1vyXDSa/NJh3Fe9+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 00:49:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208618

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-lib-lz4-use-lz4-instead-of-lz4c.patch
removed since it's included in 2024.12.0

Changelog:
===========
* ARM: omap: fix NS16550 UART setup in omap_debug_ll_init
* Documentation: imd: update information on barebox_update
* partitions: efi: Check GPT header size against minimum limit
* checkpatch: fix detection of barebox root directory
* ARM: omap: add two smaller MLO defconfigs for AM335x
* crc: crc-itu-t: generate lookup table on first use
* of: fdt: fix possible overflow during parsing of fdt
* remoteproc: use I/O memory variants of memcpy/memset
* dlmalloc: Fix integer overflow in request2size()
* remoteproc: imx: add support for loading ELF data sections into DRAM
* remoteproc: elf_loader: skip segment with memsz as zero
* of: fdt: fix overflow caused by fdt_prop extending beyond fdt
* usb: typec: fix freeing uninitialized memory  Ahmad Fatoum
* startup: do not bring up networking if console input disabled
* sandbox: noshell_defconfig: set CONFIG_CONSOLE_DISABLE_INPUT=y
* ARM: dts: i.MX8MP: disable NPU node if hardware is missing
* clk: clk-composite: fix callback guard in clk_composite_round_rate
* partitions: efi: fix overflow issues while allocating gpt entries
* lib: lz4: use lz4 instead of lz4c
* clk: rockchip: make it compile again
* ARM: i.MX: ele: fix forward_lifecycle
* ARM: i.MX9: tqma93xx: workaround warning in variant detection
* partitions: efi: fix GPT header size exceeding allocation size
* video: Rockchip: add missing dma_alloc_coherent a device parameter
* dma: give dma_alloc_coherent a device parameter
* common: buffer access out-of-bounds
* include: Include <linux/math.h> to resolve implicit declaration of do_div()
* i2c: lpi2c: fix potential read of uninitialized variable

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 meta/recipes-bsp/barebox/barebox.bb         | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index 5dcdb70757..fce3b825ae 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2024.10.0"
+PV = "2024.12.0"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "955b20bfa7358732d2c0c09ccfd4c1a69087b7e2c610b16dee7442d71a5af88d"
+SRC_URI[sha256sum] = "717a2416b37942f584b0bb2eb61ccbf85dc0f1a5c841318f47cd6967b9c4dcab"
diff --git a/meta/recipes-bsp/barebox/barebox.bb b/meta/recipes-bsp/barebox/barebox.bb
index dc9ae669d7..a48d97941c 100644
--- a/meta/recipes-bsp/barebox/barebox.bb
+++ b/meta/recipes-bsp/barebox/barebox.bb
@@ -8,5 +8,3 @@ and a subset of the POSIX C library for writing more command-line utilities."
 require barebox-common.inc
 inherit barebox
 
-SRC_URI += "file://0001-lib-lz4-use-lz4-instead-of-lz4c.patch \
-           "
-- 
2.43.0


