Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7A8D39432
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 14:39:25 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17277.1775140760950422769
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 07:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: Qdp8HhM2SIi4UK2FPYLNNA==
X-CSE-MsgGUID: r2E2CouFQV+VN182GxJF1A==
X-IPAS-Result: =?us-ascii?q?A0BpAwBXfs5p/4//Ja1agjQQGgKCUXFeQ0mUdmlsgxWIY?=
 =?us-ascii?q?oJkj0KCDgEBAQ89FAQBAT8CBIN8jW8CJjQJDgECBAEBAQEDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDUkBDAGGAwEtCwEYARAdJgYDAQJPAgkjI?=
 =?us-ascii?q?YMCAYI5AQM2AxEGsmwaN4F5FgUCFoEBgygBgVOxXgoZKA1xgWEBCxQBgTiEe?=
 =?us-ascii?q?CkdQQGCN4UjWxgBhHonG32BEIJQgi2CH0ICgSeGfQSDHBSBYR6CGgaMKggHH?=
 =?us-ascii?q?xIIARwGCgJIFRIDBAMEBAECCxMJAwMCDgIIAwIIBhkBPxIEEwoDCgsHBR8KA?=
 =?us-ascii?q?gwUCigiEisKAzUSDxsVAQgGAgIEBAIEDAIJAgIFBwIRAwQBAQgCAi0DAQMZC?=
 =?us-ascii?q?AkIAgsFERgMCwcxAxAJAx8XGggBRQgGFgEaBwUGCzgVBQwRAQECRwIGBAMDA?=
 =?us-ascii?q?woHBwQDAQcDAwwCAhACBAQCEgMDBAMQAwECKQMDBwgDAgcEFgoZBAUCAS4DB?=
 =?us-ascii?q?QcCBAEHAQMDBwMCDAICEQUEBgIBAwwDBAMFBQstEQcTCgYEBwUCAgIUBgISE?=
 =?us-ascii?q?gMDBAQCAQICAjoEDhoOBAgHAwcBGAUCAwIFAQMBBwcSAgoIAw4BHQICBAIJA?=
 =?us-ascii?q?QEKDgICBgICAQMIGAMEHwQDAwcCAgwJAwQNAhIKEhsDDgMNDwIEAwwKMBAEA?=
 =?us-ascii?q?gcQAgkIBgoYAgICBgIDAwMFCQECAQEBAQEBAQIHAwMDAgMDBgMPCgMFBwYDB?=
 =?us-ascii?q?AYBBAQDAwYDAwUFAQMDBQUFBwIDBgMGBwcECAMHCwEBAQEBAwICCQEDCAMMC?=
 =?us-ascii?q?QQDBQMVDwMLCQgHDAE8DAcKKAQ2ARQUBwQlGWcHB4tJKII2gQQKASuBfUCTa?=
 =?us-ascii?q?YJojxKgHXFogz6MHo8+hXwaM6prmQaOCYQJkkeEaDaBMjyBWTMaI4EBgjYJS?=
 =?us-ascii?q?RkPji4Vg17GQCYyAjwBBwIHDgKBc4kxhk+BfQEB?=
IronPort-Data: A9a23:IUaajK9POgucEQEvBlCXDrUD3H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GocXGnTaf6LZmP9cowkPd+woBtQuMLdytVgSwRppSFEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbui/xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mpyyHjEAX9gWAsbjpOs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dgJtb
 7+epF0R1jqxEyYFUrtJoJ6iGqE5auK60Ty1t5Zjc/PKbi6uCcAF+v1T2PI0MS+7gtgS9jx74
 I0lWZeYEW/FMkBQ8QgQe0EwLs1wAUFJ0IbLOSifsenJ9GzHL0bPmdtWPWUQG6RNr46bAUkWn
 RAZACoGYhbGg6e9x6i2D7EywM8iN8LseogYvxmMzxmAUq1gGs+FGfiXo4YEh1/chegWdRraT
 8MCaTt0dxSfSxZOIVwQTpk5mY9Eg1GgKWEC+QrO/vBfD2771lZcipPqLfTsRJ+0Y5wFxGmIh
 Eyf1jGsav0dHJnFodafyVq0j+/GkSLnVYkSFbCQ+ftjgVnVzWsWYDURTVa9rPyzh0KyVt4aI
 EsO9wIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sZNpottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvrUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:yBf4o6jJ10wdvbHTELoo2qmj6HBQXtEji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8lXFh41gPW
 MKSdkYNDU2ZmIK6frH3A==
X-Talos-CUID: 9a23:ZeSZXWMfoBCQqO5DYSV/pG4UP5oeU3yB8VSKDXeJLUBPYejA
X-Talos-MUID: 9a23:ugtP8wUuRbv9dK/q/CW2qWtJM9pG2prtNmZUwc8pq+uqbAUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,156,1770595200"; 
   d="scan'208";a="724290332"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 14:39:20 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id CF3B7180003A9;
	Thu,  2 Apr 2026 14:39:19 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id 7D4FDCC1288; Thu,  2 Apr 2026 07:39:19 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <pahaditechie@gmail.com>,
	ashissh7@cisco.com
Subject: [OE-core][whinlatter][PATCH v2] nghttp2: upgrade 1.66.0 -> 1.68.1
Date: Thu,  2 Apr 2026 07:39:18 -0700
Message-Id: <20260402143918.3596776-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 14:39:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234528

Upgrade nghttp2 to 1.68.1 which includes fixes from upstream,
including the fix for CVE-2026-27135.

CVE: CVE-2026-27135

CVE-2026-27135: Assertion failure in
nghttp2_session_terminate_session()

Release:
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.1

CC: ashissh7@cisco.com

Signed-off-by: Ashish Sharma <pahaditechie@gmail.com>
---
 ...xt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch | 28 +++++++++++++++++++
 .../{nghttp2_1.66.0.bb => nghttp2_1.68.1.bb}  |  8 ++++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
 rename meta/recipes-support/nghttp2/{nghttp2_1.66.0.bb => nghttp2_1.68.1.bb} (62%)

diff --git a/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
new file mode 100644
index 0000000000..f7cc4fe539
--- /dev/null
+++ b/meta/recipes-support/nghttp2/nghttp2/0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch
@@ -0,0 +1,28 @@
+From eb5812d018eb96284aa6ef82569d0b6b75bcd020 Mon Sep 17 00:00:00 2001
+From: Ankur Tyagi <ankur.tyagi85@gmail.com>
+Date: Sun, 9 Nov 2025 12:45:25 +1300
+Subject: [PATCH] lib/CMakeLists.txt: Fix NGHTTP2_CONFIG_INSTALL_DIR path
+
+Remove hard coded path to fix installation on 64-bit arch.
+
+Upstream-Status: Submitted [https://github.com/nghttp2/nghttp2/pull/2551]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ lib/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/CMakeLists.txt b/lib/CMakeLists.txt
+index 98e3dbe7..3b6a4400 100644
+--- a/lib/CMakeLists.txt
++++ b/lib/CMakeLists.txt
+@@ -51,7 +51,7 @@ set(NGHTTP2_GENERATED_DIR "${CMAKE_CURRENT_BINARY_DIR}/generated")
+ set(NGHTTP2_VERSION_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}ConfigVersion.cmake")
+ set(NGHTTP2_PROJECT_CONFIG "${NGHTTP2_GENERATED_DIR}/${PROJECT_NAME}Config.cmake")
+ set(NGHTTP2_TARGETS_EXPORT_NAME "${PROJECT_NAME}Targets")
+-set(NGHTTP2_CONFIG_INSTALL_DIR "lib/cmake/${PROJECT_NAME}")
++set(NGHTTP2_CONFIG_INSTALL_DIR "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
+ set(NGHTTP2_NAMESPACE "${PROJECT_NAME}::")
+ set(NGHTTP2_VERSION ${PROJECT_VERSION})
+
+--
+2.43.0
diff --git a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
similarity index 62%
rename from meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
index 49d6d7e632..71d5eef8d6 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.66.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.68.1.bb
@@ -4,8 +4,12 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
-SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
-SRC_URI[sha256sum] = "00ba1bdf0ba2c74b2a4fe6c8b1069dc9d82f82608af24442d430df97c6f9e631"
+SRC_URI = "\
+    ${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz \
+    file://0001-lib-CMakeLists.txt-Fix-NGHTTP2_CONFIG_INSTALL_DIR-pa.patch \
+"
+
+SRC_URI[sha256sum] = "6abd7ab0a7f1580d5914457cb3c85eb80455657ee5119206edbd7f848c14f0b2"
 
 inherit cmake manpages python3native github-releases
 
-- 
2.35.6


