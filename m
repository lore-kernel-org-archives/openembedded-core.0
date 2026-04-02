Return-Path: <pahaditechie@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D72E5D6AAE7
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:46:06 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18852.1775144758172872830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: ashissh7@cisco.com)
X-CSE-ConnectionGUID: 3J2I07lCT3SDSGs0sKFvWg==
X-CSE-MsgGUID: AneetypSS9KbVuKIDAdkdA==
X-IPAS-Result: =?us-ascii?q?A0AoBAB+js5p/5H/Ja1aglkCglVxXkNJlHZpbIMViGKCZ?=
 =?us-ascii?q?I9Cgg4BAQEPPRQEAQE/AgSDfI1vAiY1CA4BAgQBAQEBAwIDAQEBAQEBAQEBA?=
 =?us-ascii?q?QELAQEFAQEBAgEHBYEOE4ZPDUkBDAGGAwEtCwEYARAdJgYDAQJPAgkjIYMCA?=
 =?us-ascii?q?YI5AQM2AxEGs2IaN4F5FgUCFoEBgygBgVPXfAoZKA1xgWEBCxQBgTiEeCkdQ?=
 =?us-ascii?q?QGCN4UjWxgBhHonG32BEIJQgi2CH0ICgSeGfQSDHBSBYR6CGgaMKggHHxIIA?=
 =?us-ascii?q?RwGCgJIFRIDBAMEBAECCxMJAwMCDgIIAwIIBhkBPxIEEwoDCgsHBR8KAgwUC?=
 =?us-ascii?q?igiEisKAzUSDxsVAQgGAgIEBAIEDAIJAgIFBwIRAwQBAQgCAi0DAQMZCAkIA?=
 =?us-ascii?q?gsFERgMCwcxAxAJAx8XGggBRQgGFgEaBwUGCzgVBQwRAQECRwIGBAMDAwoHB?=
 =?us-ascii?q?wQDAQcDAwwCAhACBAQCEgMDBAMQAwECKQMDBwgDAgcEFgoZBAUCAS4DBQcCB?=
 =?us-ascii?q?AEHAQMDBwMCDAICEQUEBgIBAwwDBAMFBQstEQcTCgYEBwUCAgIUBgISEgMDB?=
 =?us-ascii?q?AQCAQICAjoEDhoOBAgHAwcBGAUCAwIFAQMBBwcSAgoIAw4BHQICBAIJAQEKD?=
 =?us-ascii?q?gICBgICAQMIGAMEHwQDAwcCAgwJAwQNAhIKEhsDDgMNDwIEAwwKMBAEAgcQA?=
 =?us-ascii?q?gkIBgoYAgICBgIDAwMFCQECAQEBAQEBAQIHAwMDAgMDBgMPCgMFBwYDBAYBB?=
 =?us-ascii?q?AQDAwYDAwUFAQMDBQUFBwIDBgMGBwcECAMHCwEBAQEBAwICCQEDCAMMCQQDB?=
 =?us-ascii?q?QMVDwMLCQgHDAE8DAcKKAQ2ARQUBwQlGWcHB4tJKII2gQ4BK4F9LxGTaYJoj?=
 =?us-ascii?q?xKgHXFogz6MHo8+hXwaM6prmQaOCYQJkkeEaDaBMwE6gVkzGiOBAYI2CUkZD?=
 =?us-ascii?q?44uFYNexFImMgI8AQcCBw4CgXOJMYZPgX0BAQ?=
IronPort-Data: A9a23:2lEd465P4WOMh/HspNst3wxRtFHGchMFZxGqfqrLsTDasY5as4F+v
 mUWDW+Fa6vcMWb3fNklYN/n909T6p6GmtRmSlZrrHo8Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo+KUzBHf/g2Qqaj5MsfrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eZq9C274oBUpyr
 sc0Ex8WNgugqfyJz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAj2L/ciZDqA29rqss6G+Vxwt0uFToGIWNJYbVGZoKwy50o
 Erv+Wn0HgACD+fO6jC771GNqsbDni/SDdd6+LqQs6QCbEeo7nQaCBQaVEe2qvm4h2axXtteL
 wof/S9Gha8q+UqmS9PwUxG1rDuPuQQRc95RCPEhrgaVx6zZ5gyUCmQJQnhGctNOiSMtbSYh2
 lnMm5biAiZi9eXFD3mc7byT6zi1PED5MFM/WMPNdiNdi/GLnW35pkmnogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:BSkZZ6xMuFmSVCwzEpchKrPwJ71zdoMgy1knxilNoNJuHfBw8P
 re+cjzuiWUtN98YhwdcLO7Scu9qA3nlaKdiLN5VdzJYOCMggWVxe9ZgbcKuweQeBEXMoVmpM
 Bdm28UMqyVMWRH
X-Talos-CUID: =?us-ascii?q?9a23=3ARa86K2iiSYy19jN7OQticpj3tTJuKV+H7S+PJ2S?=
 =?us-ascii?q?EUl1Fc5KOEUSz1r1bnJ87?=
X-Talos-MUID: 9a23:eZPM9gp1ssiUgM2teIkezxhkOcp08ryVMxEum6sbmOioHCBzNx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,156,1770595200"; 
   d="scan'208";a="707274775"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 02 Apr 2026 15:45:57 +0000
Received: from sjc-ads-21720.cisco.com (sjc-ads-21720.cisco.com [10.128.165.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id 1CE3F18000596;
	Thu,  2 Apr 2026 15:45:57 +0000 (GMT)
Received: by sjc-ads-21720.cisco.com (Postfix, from userid 1869324)
	id B9CD7CC1288; Thu,  2 Apr 2026 08:45:56 -0700 (PDT)
From: Ashish Sharma <pahaditechie@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <pahaditechie@gmail.com>,
	ashissh7@cisco.com
Subject: [OE-core][whinlatter][PATCH v3] nghttp2: upgrade 1.66.0 -> 1.68.1
Date: Thu,  2 Apr 2026 08:45:56 -0700
Message-Id: <20260402154556.3688170-1-pahaditechie@gmail.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.128.165.208, sjc-ads-21720.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234544

Upgrade nghttp2 to 1.68.1 which includes upstream security fixes and improvements since 1.66.0.

Changelog:
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.67.1
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.0
https://github.com/nghttp2/nghttp2/releases/tag/v1.68.1

CC: <ashissh7@cisco.com>

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


