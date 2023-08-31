Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C233C6FA8F
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:38:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8556.1693449496385190098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="118367236"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="118367236"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:38:13 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 507C1F0760
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:38:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 507A46CFB8A
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:38:07 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id DAF426BEF6;
	Thu, 31 Aug 2023 11:38:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] neard: upgrade 0.18 -> 0.19
Date: Thu, 31 Aug 2023 10:37:36 +0800
Message-Id: <1693449456-28078-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--6.459000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr5sPqcQkI8pvUlVJM/QT13vb6
	z01A5q1YXE3LyuW0+wiysMXN8ch2JgE4dbnyjMJa/HTKStsDGMLBOVz0Jwcxl0fyM5VfgjG2zJM
	B9PZ/Osrn22EcSrQBnVtpp5yxBNvcP06ke90qDvPdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtP1dAjBOiENGmPbLGIj3XGUaXvJze6iIFEPru8GIOqjSxcGAkkcxR8Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186945

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Fixed missing DBus org.neard.se.conf.
  Sync Linux kernel UAPI nfc.h header with newer kernel.
  NFC tag: Implement readout of tag UID via DBus interface.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-connectivity/neard/{neard_0.18.bb => neard_0.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/neard/{neard_0.18.bb => neard_0.19.bb} (97%)

diff --git a/meta/recipes-connectivity/neard/neard_0.18.bb b/meta/recipes-connectivity/neard/neard_0.19.bb
similarity index 97%
rename from meta/recipes-connectivity/neard/neard_0.18.bb
rename to meta/recipes-connectivity/neard/neard_0.19.bb
index 362a7615b6..a98f436b98 100644
--- a/meta/recipes-connectivity/neard/neard_0.18.bb
+++ b/meta/recipes-connectivity/neard/neard_0.19.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/network/nfc/neard.git;protocol=https;bra
            file://0001-Add-header-dependency-to-nciattach.o.patch \
           "
 
-SRCREV = "c781008d3786e03173f0a0f5dfcc0545c787d7fc"
+SRCREV = "a1dc8a75cba999728e154a0f811ab9dd50c809f7"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


