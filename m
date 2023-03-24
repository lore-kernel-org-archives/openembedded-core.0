Return-Path: <kubiznak@2n.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803C2C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:24:47 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.104275.1679671478962836792
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: 2n.com, ip: 195.60.68.18, mailfrom: kubiznak@2n.com)
From: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
To: <openembedded-core@lists.openembedded.org>
CC: =?UTF-8?q?Petr=20Kubiz=C5=88=C3=A1k?= <kubiznak@2n.com>
Subject: [OE-core][PATCH v3 5/6] avahi: depend on glib-2.0-native
Date: Fri, 24 Mar 2023 16:22:37 +0100
Message-ID: <20230324152238.194877-5-kubiznak@2n.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230324152238.194877-1-kubiznak@2n.com>
References: <20230324152238.194877-1-kubiznak@2n.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail01w.axis.com (10.20.40.7) To se-mail01w.axis.com
 (10.20.40.7)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:24:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179066

When gobject-introspection feature is disabled, glib-2.0-native package
dependency is not pulled in, which causes a failure in do_compile
due to missing glib-mkenums.

Signed-off-by: Petr Kubizňák <kubiznak@2n.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index a830385352..e8aebe500e 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -35,7 +35,7 @@ SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de79
 # Issue only affects Debian/SUSE, not us
 CVE_CHECK_IGNORE += "CVE-2021-26720"
 
-DEPENDS = "expat libcap libdaemon glib-2.0"
+DEPENDS = "expat libcap libdaemon glib-2.0 glib-2.0-native"
 
 # For gtk related PACKAGECONFIGs: gtk, gtk3
 AVAHI_GTK ?= ""
-- 
2.30.2


