Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE44CC7EE23
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.26250.1685610249308344175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="118599344"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="118599344"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B5DC4D29E6
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:04 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AAD56D88B8
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id E435188857;
	Thu,  1 Jun 2023 18:04:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-hatch-fancy-pypi-readme: upgrade 22.8.0 -> 23.1.0
Date: Thu,  1 Jun 2023 17:03:29 +0800
Message-Id: <1685610221-29015-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10--1.264800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mregIHHX2L4YzfUZT83lbkEKRN
	FH7T4P1T+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Spe9yhw6GB9Jios1GUjg/IKr4R3W7cmJmDxqwZR7TUp9heD
	zTZJqfuoCLgo33kyFThydg6KaZLGgefdmPSApS20PzO8njtE2xS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182080

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add CLI support for hatch.toml.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...adme_22.8.0.bb => python3-hatch-fancy-pypi-readme_23.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-fancy-pypi-readme_22.8.0.bb => python3-hatch-fancy-pypi-readme_23.1.0.bb} (81%)

diff --git a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb
rename to meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
index 4c256d155b..8f6e996a44 100644
--- a/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_22.8.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-fancy-pypi-readme_23.1.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_fancy_pypi_readme"
 
-SRC_URI[sha256sum] = "da91282ca09601c18aded8e378daf8b578c70214866f0971156ee9bb9ce6c26a"
+SRC_URI[sha256sum] = "b1df44063094af1e8248ceacd47a92c9cf313d6b9823bf66af8a927c3960287d"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.34.1


