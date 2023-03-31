Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E0B7C77B72
	for <webhook@archiver.kernel.org>; Fri, 31 Mar 2023 11:49:28 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.52506.1680263365322975435
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Mar 2023 04:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v4 10/10] at-spi2-core: depend on glib-2.0-native
Date: Fri, 31 Mar 2023 13:46:34 +0200
Message-ID: <20230331114634.3578244-10-kubiznak@2n.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179437

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in but at-spi2-core has a hard dependency on it
(do_configure fails due to missing glib-genmarshal).

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-support/atk/at-spi2-core_2.46.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
index d9161e1acb..90313467d0 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.46.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
 
 SRC_URI[sha256sum] = "aa0c86c79f7a8d67bae49a5b7a5ab08430c608cffe6e33bf47a72f41ab03c3d0"
 
-DEPENDS = "dbus glib-2.0 libxml2"
+DEPENDS = "dbus glib-2.0 glib-2.0-native libxml2"
 
 # For backwards compatibility
 PROVIDES += "atk at-spi2-atk"
-- 
2.30.2


