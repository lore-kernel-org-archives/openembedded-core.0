Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F99C433F5
	for <webhook@archiver.kernel.org>; Sun, 27 Mar 2022 01:38:04 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.1607.1648345082429561264
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Mar 2022 18:38:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CXlJvGHk;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648345083;
  x=1679881083;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P2kT8gufwtQxJStb5gsuvhVjzt2zKraLvX69UUWhfyo=;
  b=CXlJvGHkyGyN7sv/gWJYX2ymIxDp461Y2EH9Gwb2ui9PO2nW1i5Kufik
   TKrtnBbsZT6zyRCjU2NLGMv8Oh1/Z/YjbcrdP8c5ifvHKqCLvSdViflxV
   cvxwLvjxCEj6obdsTSjvgzwmYgCVy6PxZiX9LSaBC7Ptheay0Pm48CcY9
   itmKpeWYxvL+gNWb7HQ3K4gsBoGGQIvB6LdpyoFu+tB6bm+3ucueov8Kj
   LO8j+2eBSKRaCmMj1PtcWWL55gK2WpwCHB6Ufp6ig/4vmjiJyL7yhjTw2
   CWCW/lNap4GoDA8PjSNsdfWg+3/2XFS7pedqrHN5qYMHaHKYSQIWVGIp3
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] glib-2.0: Remove a leftover comment
Date: Sun, 27 Mar 2022 03:37:57 +0200
Message-ID: <20220327013757.5810-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Mar 2022 01:38:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163659

The system-pcre PACKAGECONFIG was removed in commit e359ee75 (glib-2.0:
update 2.68.4 -> 2.70.0), but a comment was left behind.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 6e20d40dac..ffddefe22e 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -38,7 +38,6 @@ S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "libmount \
                    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
-# To use the system pcre it must be configured with --enable-unicode-properties
 PACKAGECONFIG[libmount] = "-Dlibmount=enabled,-Dlibmount=disabled,util-linux"
 PACKAGECONFIG[manpages] = "-Dman=true, -Dman=false, libxslt-native xmlto-native"
 # libelf is auto-detected without a configuration option

