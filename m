Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B461C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 09:32:58 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.8658.1702978372215867880
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 01:32:52 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143911045"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143911045"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 18:32:50 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 83B83D4F62
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:32:47 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C1220D3F30
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:32:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A3562646E4
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 18:32:46 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 13A2A1A006F;
	Tue, 19 Dec 2023 17:32:46 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] dnf: upgrade 4.18.1 -> 4.18.2
Date: Tue, 19 Dec 2023 17:32:18 +0800
Message-Id: <1702978338-7643-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10--5.936700-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwPA848CkQl3bqQ
	ldU8NEzp2wO8wm8URrz3AXQaNgD+A/9HU1IxzaoJfOaYwP8dcX5MkOX0UoduubKw8Hx0EGitB5z
	clOaSfy4kw8PwVHl/nwFd21k9Z8naL/tBTZzO5Q2zRPQ8T4oe5WIw13TP8dlTPcUmpj78K5n2wV
	qcxIeACtXirfpLQ0TPM2ZXtJf8lihjAM4vu3dHId0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTteLhcSg9d5zF6x2rj/OySztJHC/xBlSmuiu9xgeyEy//dF9gK5CbFcg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 09:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
-automatic: Add feature to allow emitters to invoke on dnf error
-dnssec: Fix parsing PGP keys for DNS validation

0005-Do-not-prepend-installroot-to-logdir.patch
refreshed for new version.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch     | 2 +-
 meta/recipes-devtools/dnf/{dnf_4.18.1.bb => dnf_4.18.2.bb}      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/dnf/{dnf_4.18.1.bb => dnf_4.18.2.bb} (98%)

diff --git a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
index aa20009cef..0e11c2eac2 100644
--- a/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
+++ b/meta/recipes-devtools/dnf/dnf/0005-Do-not-prepend-installroot-to-logdir.patch
@@ -17,7 +17,7 @@ diff --git a/dnf/cli/cli.py b/dnf/cli/cli.py
 index d2d9c082..82270ecf 100644
 --- a/dnf/cli/cli.py
 +++ b/dnf/cli/cli.py
-@@ -920,7 +920,7 @@ class Cli(object):
+@@ -944,7 +944,7 @@ class Cli(object):
              logger.warning(_("Unable to detect release version (use '--releasever' to specify "
                               "release version)"))
  
diff --git a/meta/recipes-devtools/dnf/dnf_4.18.1.bb b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
similarity index 98%
rename from meta/recipes-devtools/dnf/dnf_4.18.1.bb
rename to meta/recipes-devtools/dnf/dnf_4.18.2.bb
index f60b4794a6..987ca42c98 100644
--- a/meta/recipes-devtools/dnf/dnf_4.18.1.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.18.2.bb
@@ -19,7 +19,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git;branch=master;protoc
 
 SRC_URI:append:class-native = "file://0001-dnf-write-the-log-lock-to-root.patch"
 
-SRCREV = "41a287e2bd60b4d1100c329a274776ff32ba8740"
+SRCREV = "1c43d0999178d492381ad0b43917ffd9c74016f8"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


