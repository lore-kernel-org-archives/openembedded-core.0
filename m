Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07EDC4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 19:49:22 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.25314.1714506551879535957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Apr 2024 12:49:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VQvF9v07;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20240430194908b725d4a3931eec3b6e-fyhvit@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20240430194908b725d4a3931eec3b6e
        for <openembedded-core@lists.openembedded.org>;
        Tue, 30 Apr 2024 21:49:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rgqamD8pXsvvgyi5KuSYk3+leHkoKe4s2TsmeOyzjXs=;
 b=VQvF9v07rBa7w93cFxHIK9RQupCaBUat2jbFHDWeGU+82lvE9QBqo2qhQxHtNLjTgjvg7K
 O1WCDdWsCXk2E4pCUP/Fo+whtsNAXEPiAkd1PfeK4W0UxLC/ONkm8B5z+CNJlhPWqOGzVFup
 3QBSJ99/vkJwR39zWF/aTDV5cLEys=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] python3: Upgrade 3.10.13 -> 3.10.14
Date: Tue, 30 Apr 2024 21:48:21 +0200
Message-Id: <20240430194821.1908834-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Apr 2024 19:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198763

From: Peter Marko <peter.marko@siemens.com>

Addresses CVEs:
* CVE-2023-52425 (bundled expat)
* CVE-2023-6597 (https://github.com/python/cpython/pull/112840)

News: https://github.com/python/cpython/blob/3.10/Misc/NEWS.d/3.10.14.rst

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python/{python3_3.10.13.bb => python3_3.10.14.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3_3.10.13.bb => python3_3.10.14.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3_3.10.13.bb b/meta/recipes-devtools/python/python3_3.10.14.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.13.bb
rename to meta/recipes-devtools/python/python3_3.10.14.bb
index 76e37e42a1..31c458c09a 100644
--- a/meta/recipes-devtools/python/python3_3.10.13.bb
+++ b/meta/recipes-devtools/python/python3_3.10.14.bb
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "5c88848668640d3e152b35b4536ef1c23b2ca4bd2c957ef1ecbb053f571dd3f6"
+SRC_URI[sha256sum] = "9c50481faa8c2832329ba0fc8868d0a606a680fc4f60ec48d26ce8e076751fda"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.30.2


