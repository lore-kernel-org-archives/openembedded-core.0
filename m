Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1114AC83F29
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 02:54:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.8778.1693450479485278663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 19:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="118369945"
X-IronPort-AV: E=Sophos;i="6.02,215,1688396400"; 
   d="scan'208";a="118369945"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:54:37 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1AC3410691
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:54:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 64469D5E94
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 11:54:34 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C9F0C2007894B;
	Thu, 31 Aug 2023 11:54:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] sysklogd: upgrade 2.5.0 -> 2.5.2
Date: Thu, 31 Aug 2023 10:54:13 +0800
Message-Id: <1693450453-28643-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27846.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27846.004
X-TMASE-Result: 10--4.789200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mryqyllX6UJIv+a1TrNm8OET13
	GoPFA1HFOuCrsY1oUqhElgbsX+4BncRBLZ5x+SkXP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6pByRBJ91zJGFp9qfciji95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAJfhdZJSY3atPPyUJtvES1BcagLHsNbi1DAH6bp45OJHjtMUW0O7a9OWTu+j3M7+H/+NA
	ikHTvVx7bQ7BhdaTyt/vwVeOTRRxfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 02:54:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186958

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
- Issue #67: restore support for reading kernel logs from '/proc/kmsg',
  regression introduced in v2.4.0, issue #48.
- Issue #37: improved accuracy of the MARK timer, optional, default: 20
  minutes.  Generates log messages to files, which have had no activity
  within the MARK interval.  Was off by up to 'interval / 2' minutes.
  It may now be off by up to '1 / 2' minutes, i.e.g, 30 seconds.
- Issue #64: sub-second faking of kernel timestamps was always zero

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sysklogd/{sysklogd_2.5.0.bb => sysklogd_2.5.2.bb} (97%)

diff --git a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
similarity index 97%
rename from meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
rename to meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
index 096bd376d7..c9c9055142 100644
--- a/meta/recipes-extended/sysklogd/sysklogd_2.5.0.bb
+++ b/meta/recipes-extended/sysklogd/sysklogd_2.5.2.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;branch=master;protocol=https
            file://sysklogd \
            "
 
-SRCREV = "b6d1ae26671a85e6087c98ec8b630855fc52886a"
+SRCREV = "3332c550f1a68393daec5d64cd81f3b7674c0af5"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


