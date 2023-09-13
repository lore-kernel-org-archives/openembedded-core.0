Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C907ECA5524
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 09:33:13 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.7642.1694597588575770248
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 02:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="133348196"
X-IronPort-AV: E=Sophos;i="6.02,142,1688396400"; 
   d="scan'208";a="133348196"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:33:06 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E6CA2DB3C1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:33:03 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 340E5CF7C4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 18:33:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B39256C9FA;
	Wed, 13 Sep 2023 18:33:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] kexec-tools: upgrade 2.0.26 -> 2.0.27
Date: Wed, 13 Sep 2023 17:32:43 +0800
Message-Id: <1694597563-21468-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27872.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27872.006
X-TMASE-Result: 10--0.850400-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrbgDZdyDEne7ozDhGeQC9EnOg
	GuPXScYte+eZU8eiw0ZtvPdnidpOeN2y9HfKt5UNuLt50vtxBA460U4in/HHAJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q1mPsTq8ee41gRryDXHx6oX7rencS+jsJiem2
	vw+cenKeLzNWBegCW2wgn7iDBesS0nRE+fI6etkv2yzxF+cszwTDx7L8w8VOkoiUCXAXClG3/rk
	K9g2fyzXBbXU1sfpEdW19nROawT6v4fyVzBI4S/gPSuqHIBIAw7BTYnTqlm9Eu/kTKv9giuqwOH
	O1Fdn0Kb4tj0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 09:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187565

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
arm64: Hook up the ZBOOT support as vmlinuz
arm64: Add ZBOOT PE containing compressed image support
kexec/zboot: Add arch independent zboot support
kexec: Introduce a member kernel_fd in kexec_info
kexec/arm64: Simplify the code for zImage
LoongArch: kdump: Set up kernel image segment
kexec: __NR_kexec_file_load is set to undefined on LoongArch
ppc64: Add elf-ppc64 file types/options and an arch specific flag to man page
x86: add devicetree support
kexec: make -a the default
ppc64: add --reuse-cmdline parameter support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../kexec/{kexec-tools_2.0.26.bb => kexec-tools_2.0.27.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kexec/{kexec-tools_2.0.26.bb => kexec-tools_2.0.27.bb} (97%)

diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
similarity index 97%
rename from meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
rename to meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
index 11a3c4f47e..9b9864da9a 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.26.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.27.bb
@@ -19,7 +19,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            "
 
-SRC_URI[sha256sum] = "89bdd941542c64fec16311858df304ed3a3908c1a60874d69df5d9bf1611e062"
+SRC_URI[sha256sum] = "410f89057d1f4cd2b0477b6c2035ec2c52e21c185e90742bbae8b4f78a7077a5"
 
 inherit autotools update-rc.d systemd
 
-- 
2.34.1


