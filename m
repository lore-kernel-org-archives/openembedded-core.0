Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33D4C04A94
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:19:45 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.7535.1687850363892851065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122377576"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122377576"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:19:39 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E0A03C3F8C
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:36 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 26B37F81A
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 16:19:36 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 94B7640B47;
	Tue, 27 Jun 2023 16:19:35 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pytest: upgrade 7.3.1 -> 7.4.0
Date: Tue, 27 Jun 2023 15:17:25 +0800
Message-Id: <1687850250-20040-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
References: <1687850250-20040-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27716.005
X-TMASE-Result: 10-3.230800-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrZG3SCLP7QtKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCyfmd9HsjZ0U4wnGKAoIKJL1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO36CZ
	XLlV1mSaJvN3H/aBJPWQIoDT1sIJeaoTN/HrPReVnXggrn3bInTmZay1gj2AsUsFkjzcv5M7SW7
	3Jns9DWX8M1gTjdNGPr3SdzypIBpPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:19:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183467

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.pytest.org/en/stable/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pytest_7.3.1.bb => python3-pytest_7.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_7.3.1.bb => python3-pytest_7.4.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb b/meta/recipes-devtools/python/python3-pytest_7.4.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pytest_7.3.1.bb
rename to meta/recipes-devtools/python/python3-pytest_7.4.0.bb
index 914ea55346..323dfebe38 100644
--- a/meta/recipes-devtools/python/python3-pytest_7.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_7.4.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "434afafd78b1d78ed0addf160ad2b77a30d35d4bdf8af234fe621919d9ed15e3"
+SRC_URI[sha256sum] = "b4bf8c45bd59934ed84001ad51e11b4ee40d40a1229d2c79f9c592b0a3f6bd8a"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.34.1


