Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2569C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:39 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10647.1710313777043280878
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ElBCwo4d;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313777; x=1741849777;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OPtOdd/5F+fgSYROMUjInr1b4OAIveONzkUByOstEls=;
  b=ElBCwo4d8o3jKfTDomUwha8NcmsCEZmeokjshubcdP63hMqVMHjikKiD
   2L+z/Uacl1h8LltXLLL2wbr4lvxfV5w/tg939ypOTaVU3fs89YyFmUVCr
   fmKvLwEwz/LwcaDSBcob6sf4A0kgZ0e/cMjA9npvU/qoJE1Tv+3+L+70d
   dEZJm04FxmoBZVb+V+Ytjf7dNlnSNKJA7jq5BByz3HF1jMdDGCPIgpcMi
   EzyLIxKcK0sF4vPKgGUK/qnL3lkAJHKAtGKxxZdnM05981wlDZRH2jXcV
   7NdFyjToqFoY/qyVPSu40AjW2HRy+oNRUp7Vm7vsF7Qa5OEAeP4bn3iKp
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="131429036"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="131429036"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D154BC21C0
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 109D8BDCA3
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 812EB20097CD1
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:31 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2CE0C1A006B;
	Wed, 13 Mar 2024 15:09:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 28/36] python3-pytest: upgrade 8.0.2 -> 8.1.1
Date: Wed, 13 Mar 2024 15:08:26 +0800
Message-Id: <1710313714-12541-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10-2.095700-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrBgA+oehWZhGU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCyfmd9HsjZ0U4wnGKAoIKJL1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2mZ3
	96Gt5HhWHLYiZXJkvcnxDt5yZBxB+6Tgwb14ZkLiBuz78hOA8BTmZay1gj2AsUsFkjzcv5M7SW7
	3Jns9DWX8M1gTjdNGPr3SdzypIBpPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://docs.pytest.org/en/stable/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_8.0.2.bb => python3-pytest_8.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.0.2.bb => python3-pytest_8.1.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb b/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.0.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.1.1.bb
index 57e979e909..b1cf23fbc4 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "d4051d623a2e0b7e51960ba963193b09ce6daeb9759a451844a21e4ddedfc1bd"
+SRC_URI[sha256sum] = "ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


