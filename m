Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C027C6FD1D
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 11:00:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.98331.1680605996783229993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 03:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH] vte: depend on glib-2.0-native
Date: Tue, 4 Apr 2023 12:57:47 +0200
Message-ID: <20230404105747.617544-1-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 11:00:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179684

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in but vte has a hard dependency on it
(do_configure fails due to missing glib-mkenums).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-support/vte/vte_0.72.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/vte/vte_0.72.0.bb b/meta/recipes-support/vte/vte_0.72.0.bb
index c08ac879e1..5eaff99159 100644
--- a/meta/recipes-support/vte/vte_0.72.0.bb
+++ b/meta/recipes-support/vte/vte_0.72.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 \
 "
 
-DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
+DEPENDS = "glib-2.0 glib-2.0-native gtk+3 libpcre2 libxml2-native gperf-native icu"
 
 GNOMEBASEBUILDCLASS = "meson"
 GIR_MESON_OPTION = 'gir'
-- 
2.30.2


