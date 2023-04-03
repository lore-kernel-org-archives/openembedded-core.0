Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83501C761A6
	for <webhook@archiver.kernel.org>; Mon,  3 Apr 2023 11:08:24 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.67276.1680520096282905202
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 04:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v5 5/6] webkitgtk: add missing dependencies
Date: Mon, 3 Apr 2023 13:06:45 +0200
Message-ID: <20230403110646.2555294-5-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230403110646.2555294-1-kubiznak@2n.com>
References: <20230403110646.2555294-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 11:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179621

When gobject-introspection feature is disabled, gettext-native and
glib-2.0-native dependencies are not pulled in, which causes failures
in do_compile due to missing xgettext and gdbus-codegen.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.38.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
index 832c8327dd..36c6233b33 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb
@@ -38,6 +38,8 @@ DEPENDS += " \
           libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
+          glib-2.0-native \
+          gettext-native \
           "
 
 PACKAGECONFIG_SOUP ?= "soup3"
-- 
2.30.2


