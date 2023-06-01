Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 707F2C7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:03:58 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.26239.1685610236204720410
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="106808142"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="106808142"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:03:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A8B9CD3EA3
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:51 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DA35BCF7F1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:03:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CC41887D8;
	Thu,  1 Jun 2023 18:03:50 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dos2unix: upgrade 7.4.4 -> 7.5.0
Date: Thu,  1 Jun 2023 17:03:09 +0800
Message-Id: <1685610221-29015-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-0.051100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrKQNhMboqZlowAYdq1VTXo30m
	mlU2RvUr62g4sCZkIxTUZ9lozDkx1HX5XBhjVrPMv8fLAX0P50BUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBGyZdMfe7PZV0O5odjU3jR5QDol
	RaRe50iX8AYrjAicEyLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07UXA0
	ioI+iBthZSX2d17v8nMj94m2Pg+f3+Lxj7jDXmZhHyVLFr+sTWXz+zkzV5enZ8nIXpRK37PRsfW
	uBPalZH2yxeCdsxPyBPRAKxv/8nG8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:03:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182059

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* New option -O, --to-stdout to write to standard output.
* New option -e, --add-eol to add a line break to the last
  line if there isn't one. Option --no-add-eol disables the
  feature.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dos2unix/{dos2unix_7.4.4.bb => dos2unix_7.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.4.4.bb => dos2unix_7.5.0.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
index 506faf5a6d..1ff1fc4f97 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.4.4.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=37f72246ce2aa2fce9482c10b1f2b502"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "b56a58584d3fef0720425ae154c2a4d80e6af6c5"
+SRCREV = "d6613bbb175624f065de907ebcc94437f699c14e"
 
 S = "${WORKDIR}/git/dos2unix"
 
-- 
2.34.1


