Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD72C41513
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 07:41:58 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.7614.1690875707945883095
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 00:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="126071561"
X-IronPort-AV: E=Sophos;i="6.01,246,1684767600"; 
   d="scan'208";a="126071561"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 16:41:45 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3A154DB3C3
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 870BDD3F16
	for <openembedded-core@lists.openembedded.org>; Tue,  1 Aug 2023 16:41:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3FD22FC84CD;
	Tue,  1 Aug 2023 16:41:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.36 -> 3.0.0
Date: Tue,  1 Aug 2023 15:41:17 +0800
Message-Id: <1690875687-21573-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
References: <1690875687-21573-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27786.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27786.005
X-TMASE-Result: 10--0.625400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yRxA1AKmVGTOcDzcoONn/M4R34ro7k23ne79
	DJRUi35phgSBV7oGS48SuJRtSU84o39JXYBaBfzuxLSsi9FKAT3BOVz0Jwcxl0fyM5VfgjG2Q8O
	lf//DOs9rOUgQq+zxeD89mM8AoO5Nqqg2TSZUFr2DIpcBQ49iRJiQDIJsDspXPrhvTq+YBF+Ug5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyMWYLjf3ZQqDMKbXWBWAS5yXyy
	Lu6OH5l1YNMdPtPVlV9Bb2C9wXSZ6jhge7x+iw6xRwIt+S4m2qbIggPYu7dM/nDQltmGgr+/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 07:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185200

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: http changed to https

Changelog:
 https://github.com/cython/cython/blob/master/CHANGES.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                | 4 ++--
 .../{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb}    | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.36.bb => python3-cython_3.0.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 6aec6b012f..01829b9f33 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -5,11 +5,11 @@ It's designed to bridge the gap between the nice, high-level, easy-to-use world
 and the messy, low-level world of C."
 SECTION = "devel/python"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=61c3ee8961575861fa86c7e62bc9f69c"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "41c0cfd2d754e383c9eeb95effc9aa4ab847d0c9747077ddd7c0dcb68c3bc01f"
+SRC_URI[sha256sum] = "350b18f9673e63101dbbfcf774ee2f57c20ac4636d255741d76ca79016b1bd82"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.36.bb b/meta/recipes-devtools/python/python3-cython_3.0.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.36.bb
rename to meta/recipes-devtools/python/python3-cython_3.0.0.bb
-- 
2.34.1


