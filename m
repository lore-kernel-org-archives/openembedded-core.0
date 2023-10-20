Return-Path: <gs-yoctoproject.org@gluelogic.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C791C0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:30:58 +0000 (UTC)
Received: from smtp1.atof.net (smtp1.atof.net [52.86.233.228])
 by mx.groups.io with SMTP id smtpd.web10.54234.1697808642990488032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gluelogic.com, ip: 52.86.233.228, mailfrom: gs-yoctoproject.org@gluelogic.com)
From: Glenn Strauss <gs-yoctoproject.org@gluelogic.com>
To: openembedded-core@lists.openembedded.org
Cc: Glenn Strauss <gstrauss@gluelogic.com>
Subject: [PATCH 1/3] lighttpd: upgrade 1.4.71 -> 1.4.72
Date: Fri, 20 Oct 2023 09:30:24 -0400
Message-ID: <20231020133026.103646-2-gs-yoctoproject.org@gluelogic.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
References: <20231020133026.103646-1-gs-yoctoproject.org@gluelogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit
X-Mime-Autoconverted: from 8bit to 7bit by courier 0.78
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189529

From: Glenn Strauss <gstrauss@gluelogic.com>

Signed-off-by: Glenn Strauss <gstrauss@gluelogic.com>
---
 .../lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.71.bb => lighttpd_1.4.72.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
index 3959f88b98..87058719f9 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.71.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.72.bb
@@ -16,7 +16,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
            file://lighttpd \
            "
 
-SRC_URI[sha256sum] = "b8b6915da20396fdc354df3324d5e440169b2e5ea7859e3a775213841325afac"
+SRC_URI[sha256sum] = "f7cade4d69b754a0748c01463c33cd8b456ca9cc03bb09e85a71bcbcd54e55ec"
 
 DEPENDS = "virtual/crypt"
 
-- 
2.41.0

