Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6705C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 00:33:14 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.12114.1706833994110862922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 16:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QTjmVMaf;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706833994; x=1738369994;
  h=from:to:cc:subject:date:message-id;
  bh=RDJanWCmnL3iJRdNxeUN7oE8Sv9d2fEWgigUt1pFa2c=;
  b=QTjmVMafigKppLivoiy9FQsVBygh5Td8oOUDUNCjoDSFeH2sZV6AK4XD
   MekdTfouBc0YLDATUACvpQiC6U0kBjMhekmZl9ih3MpAHfB4hSVuG1A3s
   W1NGx0nQr5k6HnjBk7VDoA9UjAJ9T5soOCBUYZossmMQWw01undetItwN
   ok9WJ5Su/sfRua5Q1uN/QRoNQxoqfpRy709ilR7yM2DAwkmei5gjm9lUJ
   pYmu5FTIUCHvkQTXqF/wPLdG1KYfj8if/UfkeX95tOLZ3kA/4osKACy4Y
   LMV8mDh2f6jeQ0L/cdrKkx8scsCFr37KG/3COZ125d7XIGJHnmDuUPlJD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="127393103"
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="127393103"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 09:33:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B8685D9F04
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:33:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E3BAD5078
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:33:04 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 975906C801
	for <openembedded-core@lists.openembedded.org>; Fri,  2 Feb 2024 09:33:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 23A7E1A009A;
	Fri,  2 Feb 2024 08:33:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.4.4 -> 8.0.0
Date: Fri,  2 Feb 2024 08:23:14 +0800
Message-Id: <1706833394-20114-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28158.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28158.003
X-TMASE-Result: 10--3.695600-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mr2FA7wK9mP9c6FHRWx2FGsI/M
	VY+TBf96lsVuD4sM+B6YQofPliJiVNxIifxGXX4+A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYjE41bFBKcdL80zZ28YwZ5w8o3fwIs8rQQFA6pSxaDHmAhn751acftuem2
	vw+cenKeLzNWBegCW24nmFeyfGnuMLbigRnpKlKZx+7GyJjhAUr3tjBtg+n8KL3FpkF+uwTZ1Te
	lmHOIr7hXhBKXWH5MBZU9gBuAbwNymBinFC0HZPDPQnrECWAzkhxnvGAqMgE6oywbMSCNZg7H2f
	VekOqwmYL1KImKhq1ZuOe7yPCBvAf2OJxbAVgHQ+kK598Yf3Mg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 00:33:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194773

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
#11842: Properly escape the reason of a skip mark when writing JUnit XML files.
#11861: Avoid microsecond exceeds 1_000_000 when using log-date-format with
 %f specifier, which might cause the test suite to crash.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.4.4.bb => python3-pytest_8.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.4.4.bb => python3-pytest_8.0.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.4.4.bb
rename to meta/recipes-devtools/python/python3-pytest_8.0.0.bb
index 18062c8fb8..994f6cbdaf 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.4.4.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.0.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "2cf0005922c6ace4a3e2ec8b4080eb0d9753fdc93107415332f50ce9e7994280"
+SRC_URI[sha256sum] = "249b1b0864530ba251b7438274c4d251c58d868edaaec8762893ad4a0d71c36c"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


