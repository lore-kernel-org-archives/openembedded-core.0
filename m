Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6725FC77B6C
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:28 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.52612.1680263366669445115
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 04:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4 09/10] libgudev: depend on glib-2.0-native
Date: Fri, 31 Mar 2023 13:46:33 +0200
Message-ID: <20230331114634.3578244-9-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230331114634.3578244-1-kubiznak@2n.com>
References: <20230331114634.3578244-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Mar 2023 11:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179436

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in but libgudev has a hard dependency on it
(do_configure fails due to missing glib-mkenums).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-gnome/libgudev/libgudev_237.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libgudev/libgudev_237.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
index 9ce43ce34b..5aa94e58f5 100644
--- a/meta/recipes-gnome/libgudev/libgudev_237.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
 SRC_URI[archive.sha256sum] = "0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa"
 
-DEPENDS = "glib-2.0 udev"
+DEPENDS = "glib-2.0 glib-2.0-native udev"
 
 RCONFLICTS:${PN} = "systemd (<= 220)"
 
-- 
2.30.2


