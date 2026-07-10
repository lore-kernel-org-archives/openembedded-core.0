Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B16C44501
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 07:44:23 +0000 (UTC)
Received: from lgeamrelo13.lge.com (lgeamrelo13.lge.com [156.147.23.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7955.1783669459169776366
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2026 00:44:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.53, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse7q.lge.com) (156.147.1.151)
	by 156.147.23.53 with ESMTP; 10 Jul 2026 16:44:16 +0900
X-Original-SENDERIP: 156.147.1.151
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.127.86)
	by 156.147.1.151 with ESMTP; 10 Jul 2026 16:44:16 +0900
X-Original-SENDERIP: 10.177.127.86
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [PATCH 4/4] libx11-compose-data: set CVE_PRODUCT to empty value
Date: Fri, 10 Jul 2026 16:43:04 +0900
Message-ID: <20260710074415.3341616-4-mark.yang@lge.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710074415.3341616-1-mark.yang@lge.com>
References: <20260710074415.3341616-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2026 07:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240600

From: "mark.yang" <mark.yang@lge.com>

This recipe only builds and installs the compose data files (nls/) from
the libX11 sources and contains no compiled libX11 code, so libx11 CVEs
do not apply to it. When the x11 DISTRO_FEATURE is enabled this recipe
is skipped and libx11 itself is built and scanned instead.

Referred glibc-locale case:
https://github.com/openembedded/openembedded-core/commit/1f9a963b9ff7ebe052ba54b9fcbdf7d09478dd17

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
index 562a8cbf16..4bf9f07aba 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-compose-data_1.8.12.bb
@@ -29,3 +29,9 @@ do_install() {
 PACKAGES = "${PN}"
 
 FILES:${PN} = "${datadir}/X11/locale ${libdir}/X11/locale"
+
+# This recipe only builds and installs the compose data files (nls/) from
+# the libX11 sources and contains no compiled libX11 code, so libx11 CVEs
+# do not apply to it. When the x11 DISTRO_FEATURE is enabled this recipe
+# is skipped and libx11 itself is built and scanned instead.
+CVE_PRODUCT = ""

