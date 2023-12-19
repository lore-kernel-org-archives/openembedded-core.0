Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2351C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:16:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.9188.1702981017361282894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:16:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143915073"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143915073"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:16:56 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 36337D3EAF
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 80BA211C77
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 16B392026E773
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:16:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C59B41A006F;
	Tue, 19 Dec 2023 18:16:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] ttyrun: upgrade 2.29.0 -> 2.30.0
Date: Tue, 19 Dec 2023 18:16:43 +0800
Message-Id: <1702981003-8732-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--1.018900-10.000000
X-TMASE-MatchedRID: sujxEcxUy52jz0nOeth/yUIIxwDaU5mrxqwmEOBVKeowaoe6trQC0YnO
	/I/i7S2AEFRfkXUcAJladzrSk3ClpkVrSkLwS0mDYmbjxNY/eGDQxDD776KHL/5rVOs2bw4RPB9
	Zaq1MxdLAltnbFnuASGP/kQmfrRY/sNZy551oc7cqy6shOlK/41kN0eJOT05wzBnz0ZuJSWf88X
	4OiGZRZcNoTajpI9Vw3DPr8YsNtylaQiLka9EcSj9B1SHosSXQwTlc9CcHMZerwqxtE531VNnfJ
	rUSEbFDgZBEjCNOXeKh78oNWbMU31thF6IYgena3QqJN4m15UF9LQinZ4QefPcjNeVeWlqY+gtH
	j7OwNO0JC+VZi2gQEUPAtdzWGVRTOCIIgN4mZ/nhSXYfmTacB5UV+o3ehuMAcJa+KWX/spxt/lo
	ndxhTKFGtZe4G3Hjh0417lWfqC4xjW8BVCRlQmPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uAB
	Di47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:16:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192721

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- lspai: Tool to display PAI counter sets
- s390-tools: Provide a ShellCheck configuration
- cpumf/pai: Add command line option for realtime scheduling
- dbginfo.sh: enhance ethtool collection for ROCE
- libutil/util_lockfile: add routine to return owning pid of file lock
- lszcrypt: Improve lszcrypt output on SE guests
- rust: Use a single workspace for all rust tools
- zdev: limit the derivation of ZDEV_SITE_ID
- zdump/df_s390: Update 'zgetdump -i' output with zlib info
- zdump/dfi_s390: Support reading compressed s390_ext dumps
- zipl/boot: Integrate zlib compression to single volume DASD dumper
- zipl/boot: compile the bootloaders only if HOST_ARCH is s390x
- zipl: Add --no-compress option to zipl command
- zkey: Also check for deconfigured and check-stopped cards
- ap_tools/ap-check: handle get-attributes between pre and post event
- libutil: fix util_file_read_*() using wrong format specifiers
- rust/pv: fix Invalid write of size 1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-core/ttyrun/{ttyrun_2.29.0.bb => ttyrun_2.30.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ttyrun/{ttyrun_2.29.0.bb => ttyrun_2.30.0.bb} (93%)

diff --git a/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb b/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
similarity index 93%
rename from meta/recipes-core/ttyrun/ttyrun_2.29.0.bb
rename to meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
index e0956b9ac6..73c6c58c9d 100644
--- a/meta/recipes-core/ttyrun/ttyrun_2.29.0.bb
+++ b/meta/recipes-core/ttyrun/ttyrun_2.30.0.bb
@@ -7,7 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f5118f167b055bfd7c3450803f1847af"
 
 SRC_URI = "git://github.com/ibm-s390-linux/s390-tools;protocol=https;branch=master"
-SRCREV = "d9ce54dee3ac3827e76624352293a83eb05c727e"
+SRCREV = "c217f6be6addd4d008f110efa53fbec79681dbfd"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


