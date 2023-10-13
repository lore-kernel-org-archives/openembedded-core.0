Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83DBC41513
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 09:03:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.34453.1697187822509127069
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Oct 2023 02:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="137480588"
X-IronPort-AV: E=Sophos;i="6.03,221,1694703600"; 
   d="scan'208";a="137480588"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 18:03:41 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1339EDDC64
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:03:38 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FBF0D9A84
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 18:03:37 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 742476BA77;
	Fri, 13 Oct 2023 18:03:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-babel: upgrade 2.12.1 -> 2.13.0
Date: Fri, 13 Oct 2023 17:03:15 +0800
Message-Id: <1697187795-4477-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27932.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27932.006
X-TMASE-Result: 10-2.845300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzfghYDxv+lXVzz
	JKQ55jKCw/XDCZYOi19kxgAsxYt/FngmaySKHyGGA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYLxEFvMLiU987Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFMN+zmXH6zNUlK9vO1QWSW7v2yslyGyjVaG7u
	1sGDghuul/tLeZLW0i6y8xFWPY4DewchmJmRv7yyVHSVj+xqagxlHWzjmwfaux9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Oct 2023 09:03:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189045

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Features
--------
Add flag to ignore POT-Creation-Date for updates
Support 't' specifier in keywords
Add f-string parsing for Python 3.12 (PEP 701)

Fixes
-------
Various typing-related fixes
babel.messages.catalog: deduplicate _to_fuzzy_match_key logic

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-babel_2.12.1.bb => python3-babel_2.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.12.1.bb => python3-babel_2.13.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.12.1.bb b/meta/recipes-devtools/python/python3-babel_2.13.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.12.1.bb
rename to meta/recipes-devtools/python/python3-babel_2.13.0.bb
index 794e1652cd..408f3344bb 100644
--- a/meta/recipes-devtools/python/python3-babel_2.12.1.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0f97d9a63e91407b4c0d01efde91cfc0"
 
-SRC_URI[sha256sum] = "cc2d99999cd01d44420ae725a21c9e3711b3aadc7976d6147f622d8581963455"
+SRC_URI[sha256sum] = "04c3e2d28d2b7681644508f836be388ae49e0cfe91465095340395b60d00f210"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.34.1


