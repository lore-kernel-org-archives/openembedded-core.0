Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2968C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 09:37:05 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.97245.1679650617755255817
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 02:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.17, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v2 3/3] python3-pygobject: depend on gobject-introspection
Date: Fri, 24 Mar 2023 10:33:26 +0100
Message-ID: <20230324093326.3973899-4-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324093326.3973899-1-kubiznak@2n.com>
References: <175673>
 <20230324093326.3973899-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail02w.axis.com (10.20.40.8) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 09:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179025

When g-i feature is disabled, the gobject-introspection package
dependency is not pulled in but pygobject has a hard dependency on it.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-devtools/python/python3-pygobject_3.42.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
index cc7b07e804..f54f4ce784 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.2.bb
@@ -10,7 +10,7 @@ GIR_MESON_OPTION = ""
 
 inherit gnomebase setuptools3-base gobject-introspection upstream-version-is-even
 
-DEPENDS += "python3 glib-2.0"
+DEPENDS += "python3 glib-2.0 gobject-introspection"
 
 SRCNAME="pygobject"
 
-- 
2.30.2


