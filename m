Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC84EB64DD
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.7618.1690875715260730387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126655431"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126655431"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D83EFDE632
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:50 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DC278D9481
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:49 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AB612FC8177;
	Tue,  1 Aug 2023 16:41:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pyparsing: upgrade 3.1.0 -> 3.1.1
Date: Tue,  1 Aug 2023 15:41:24 +0800
Message-Id: <1690875687-21573-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10-1.167600-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgfoSOaijzG1uP3
	VP0MS9EezRFF1f+/9c94mzzfYOp5PCxvrg3QsGyPGqSG/c50XgNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw6frLSY2RbRpBCE2NlBjIjcXwSgW5EYVHVgUH
	KGsfRQd7F9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPaX/+jFS3pj1pTu
	KYL2EWiicFKjMYbvg+jD+8Pd4SvXcIQvKjHqKdM5TSNS4NqGtKEb4zpSsB6WmSpVjuJuSoHsHPZ
	tF83DCyIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185209

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fixed regression in Word(min)
- Fixed bug in bad exception messages raised by Forward expressions.
- Fixed regression in SkipTo, where ignored expressions were not checked when looking
  for the target expression.
- Fixed type annotation for enable_packrat
- Some general internal code cleanup.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyparsing_3.1.0.bb => python3-pyparsing_3.1.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.1.0.bb => python3-pyparsing_3.1.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb b/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
index e5c6d5f832..5f791cfb7e 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.1.0.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.1.1.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea"
+SRC_URI[sha256sum] = "ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db"
 
 UPSTREAM_CHECK_REGEX = "pyparsing-(?P<pver>.*)\.tar"
 
-- 
2.34.1


