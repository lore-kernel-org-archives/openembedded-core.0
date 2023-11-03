Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B43C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 07:51:43 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.39061.1698997894403968809
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 00:51:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="138502824"
X-IronPort-AV: E=Sophos;i="6.03,273,1694703600"; 
   d="scan'208";a="138502824"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 16:51:33 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4ED82D6186
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:51:30 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CEAFDADE6
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Nov 2023 16:51:29 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 740FE880A3;
	Fri,  3 Nov 2023 16:51:28 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-wcwidth: upgrade 0.2.8 -> 0.2.9
Date: Fri,  3 Nov 2023 15:50:50 +0800
Message-Id: <1698997850-31405-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27974.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27974.005
X-TMASE-Result: 10-1.732700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrfeeWNV6+vcPFXntfxA7JmL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5+vx
	KjOzniQcvF9Go4im3FBzhQfLl8qqIjinfdF7eqvNO8j2XNse8oOMyJQM8uImJHCupaGCQeS3b00
	EAEW0qTjsCZkwxhEDyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 07:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190137

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Bugfix zero-width characters used in Emoji ZWJ sequences, Balinese,
 Jamo, Devanagari, Tamil, Kannada and others (PR #91).
-Updated to include a Specification of character measurements.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-wcwidth_0.2.8.bb => python3-wcwidth_0.2.9.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.2.8.bb => python3-wcwidth_0.2.9.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb b/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
index e906a6d73a..983852d07d 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.2.8.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.2.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "8705c569999ffbb4f6a87c6d1b80f324bd6db952f5eb0b95bc07517f4c1813d4"
+SRC_URI[sha256sum] = "a675d1a4a2d24ef67096a04b85b02deeecd8e226f57b5e3a72dbb9ed99d27da8"
 
 inherit pypi setuptools3 ptest
 
-- 
2.34.1


