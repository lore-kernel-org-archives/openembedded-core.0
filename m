Return-Path: <robert.joslyn@redrectangle.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EE9C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 19:09:30 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.21357.1641755369748312519
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:09:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: redrectangle.org,
 ip: 217.70.178.231, mailfrom: robert.joslyn@redrectangle.org)
Received: (Authenticated sender: robert.joslyn@redrectangle.org)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 97599100003;
	Sun,  9 Jan 2022 19:09:27 +0000 (UTC)
From: Robert Joslyn <robert.joslyn@redrectangle.org>
To: openembedded-core@lists.openembedded.org
Cc: Robert Joslyn <robert.joslyn@redrectangle.org>
Subject: [PATCH 3/3] maintainers.inc: Add myself as maintainer for curl
Date: Sun,  9 Jan 2022 11:08:05 -0800
Message-Id: <20220109190805.2409880-3-robert.joslyn@redrectangle.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109190805.2409880-1-robert.joslyn@redrectangle.org>
References: <20220109190805.2409880-1-robert.joslyn@redrectangle.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 19:09:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160289

I'll give it a go to try and help out.

Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0af6974a3d..d700d65c57 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -128,7 +128,7 @@ RECIPE_MAINTAINER:pn-cryptodev-linux = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cryptodev-module = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cryptodev-tests = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER:pn-cups = "Chen Qi <Qi.Chen@windriver.com>"
-RECIPE_MAINTAINER:pn-curl = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-curl = "Robert Joslyn <robert.joslyn@redrectangle.org>"
 RECIPE_MAINTAINER:pn-cve-update-db-native = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-cwautomacros = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-db = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.34.1


