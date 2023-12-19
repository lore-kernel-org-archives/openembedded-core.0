Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAE3C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 10:01:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.8969.1702980069398954561
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 02:01:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="143392826"
X-IronPort-AV: E=Sophos;i="6.04,287,1695654000"; 
   d="scan'208";a="143392826"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 19:01:07 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A42D6D7AC6
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:01:04 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D9A47D4F7F
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:01:03 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6A5076B670
	for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 19:01:03 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 28E911A006F;
	Tue, 19 Dec 2023 18:01:03 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-psutil: upgrade 5.9.6 -> 5.9.7
Date: Tue, 19 Dec 2023 17:58:58 +0800
Message-Id: <1702979938-8436-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28066.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28066.006
X-TMASE-Result: 10-3.805700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mr2FA7wK9mP9dPyX9TddQUk76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HZonBD1OvOD5wM
	PMqdPNSyAO06NP66FDV365UWdO2/FrWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNZKQ2nSmoAeRDXf8qPd54Ow5XiawaZbJkk0DbJzUrXgUXGi0zxUqJonNh0Qc5ZeOZ2NC3
	82DFZ5jxIyrNMsskHV3//4+uteMXtctSarHnY/EU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 10:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192716

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-enforce Ruff rule raw-string-in-exception, which helps providing clearer
 tracebacks when exceptions are raised by psutil.
-[PyPy]: psutil did not compile on PyPy due to missing
 PyErr_SetExcFromWindowsErrWithFilenameObject cPython API.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-psutil_5.9.6.bb => python3-psutil_5.9.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.6.bb => python3-psutil_5.9.7.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.6.bb b/meta/recipes-devtools/python/python3-psutil_5.9.7.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-psutil_5.9.6.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.7.bb
index df4f776b7b..9a8c3e11f8 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.6.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.7.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a9c72113a843d0d732a0ac1c200d81b1"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "e4b92ddcd7dd4cdd3f900180ea1e104932c7bce234fb88976e2a3b296441225a"
+SRC_URI[sha256sum] = "3f02134e82cfb5d089fddf20bb2e03fd5cd52395321d1c8458a9e58500ff417c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


