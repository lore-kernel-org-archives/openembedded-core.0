Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD51EB64DC
	for <webhook@archiver.kernel.org>; Mon, 17 Jul 2023 09:11:05 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.4254.1689585055635844656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jul 2023 02:10:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10773"; a="126013307"
X-IronPort-AV: E=Sophos;i="6.01,211,1684767600"; 
   d="scan'208";a="126013307"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2023 18:10:53 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D1E5D501A
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:51 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DB75D3F22
	for <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 18:10:50 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E2BC2FC86AA;
	Mon, 17 Jul 2023 18:10:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] repo: upgrade 2.34.1 -> 2.35
Date: Mon, 17 Jul 2023 17:10:25 +0800
Message-Id: <1689585025-23731-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
References: <1689585025-23731-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27756.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27756.006
X-TMASE-Result: 10-1.366000-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwiKso3EN6f9DJCl
	VuR6WzhZhLY3PF3U/qHGKIf6hBf7Vb8jd91EIk0xP0HVIeixJdDBOVz0Jwcxl6vCrG0TnfVU2d8
	mtRIRsUOBkESMI05d4qHvyg1ZsxTfNrsgG44+2EQ6N/cDgNNi4U50qcJ5WOMhmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJe1hV9T4k9HBhK9kH5ggT3tE2ETGsbuLw/WydjXwM8OKx85
	0fxNtI3gqn6XsG9hKeZ6OKSFiO/MBU1HAoBvui4fnpwBRB6d2xLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jul 2023 09:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184455

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Fixed a couple of bugs in ExitEvent logging:
- log exitcode 130 on KeyboardInterrupt
- log exitcode 1 on unhandled Exception
- log errorevent with specific reason for exit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/repo/{repo_2.34.1.bb => repo_2.35.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.34.1.bb => repo_2.35.bb} (95%)

diff --git a/meta/recipes-devtools/repo/repo_2.34.1.bb b/meta/recipes-devtools/repo/repo_2.35.bb
similarity index 95%
rename from meta/recipes-devtools/repo/repo_2.34.1.bb
rename to meta/recipes-devtools/repo/repo_2.35.bb
index 1c5d1a08b3..d34c3db746 100644
--- a/meta/recipes-devtools/repo/repo_2.34.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.35.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main \
            file://0001-python3-shebang.patch \
            "
-SRCREV = "945c006f406550add8a3cad32ada0791f5a15c53"
+SRCREV = "c657844efe40b97700c3654989bdbe3a33e409d7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.34.1


