Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B867C77B70
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:28 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.52506.1680263365322975435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 04:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4 08/10] json-glib: depend on glib-2.0-native
Date: Fri, 31 Mar 2023 13:46:32 +0200
Message-ID: <20230331114634.3578244-8-kubiznak@2n.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179434

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in but json-glib has a hard dependency on it
(do_configure fails due to missing glib-mkenums).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-gnome/json-glib/json-glib_1.6.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
index 627f389536..9c34fb7f40 100644
--- a/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
+++ b/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://gitlab.gnome.org/GNOME/json-glib/issues"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 glib-2.0-native"
 
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase lib_package gobject-introspection gi-docgen gettext ptest-gnome manpages upstream-version-is-even
-- 
2.30.2


