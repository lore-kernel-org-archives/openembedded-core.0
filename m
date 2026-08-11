Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B08C5B56A
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 18:33:23 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.61496.1786473197770515759
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 11:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=DLE/zsgK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202608111833147676a386ed000207a1-_vv1ng@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202608111833147676a386ed000207a1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Aug 2026 20:33:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OL4Jsjyyjw1Z8EpFOuiB02Mz+p6NhDYyU6Xzbd9cAbo=;
 b=DLE/zsgKND4qT/4lY0ifYLHiJJRzxCE28YIw8tnGII/umWjClpWH70OYLbl8j5/FyenyqJ
 +SygHbSnasQrQogXogAN2GMktpg7khSkHBqVPVjJ1ALn6Xe75kejoHMPpmusNFUHSsucmrFL
 kHEZvR4veJfq+nGbo9BLpugeGpAfmcGJpH3alcHghfzUNcH8qVdqcT7eIC+paGfNwrxuoN9Q
 R0BFOgUaq5WOHRuv1P6HRRamnTJy+7PUYe7jwT+O8iq7dCNzRb9MAAMYi77Qh5ToJII7PNXq
 7klGK2EoCNrJnbX7eYcgGgboCtb1/lUDxflkhAIU+Ju5yPARYjALM/RQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] expat: upgrade 2.8.2 -> 2.8.3
Date: Tue, 11 Aug 2026 20:32:56 +0200
Message-ID: <20260811183256.2325708-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 18:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243219

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2026-72522.

Release information:
* https://blog.hartwork.org/posts/expat-2-8-3-released/
* https://github.com/libexpat/libexpat/blob/R_2_8_3/expat/Changes

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.8.2.bb => expat_2.8.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.8.2.bb => expat_2.8.3.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.8.2.bb b/meta/recipes-core/expat/expat_2.8.3.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.8.2.bb
rename to meta/recipes-core/expat/expat_2.8.3.bb
index 0b9dbe161b..79e8c15227 100644
--- a/meta/recipes-core/expat/expat_2.8.2.bb
+++ b/meta/recipes-core/expat/expat_2.8.3.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "69e7f52417d85b1c2b7fe855e176eec55d0b2d7d92d691372d833a1c7df7923b"
+SRC_URI[sha256sum] = "b4cc2483927d5e90bf8c40b44a6b95b368b42a8a96e25883fce188b48a92b670"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 

