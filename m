Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640E3D3ABF3
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 19:06:31 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.67604.1731351990414767326
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 11:06:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=gYlbpoTV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2024111119062830455ebbf548facc6b-5gg_4b@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2024111119062830455ebbf548facc6b
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 Nov 2024 20:06:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RKapJy6iluiiwB04/0sCdKl7BvrPkCqeD7l+xAFvpe0=;
 b=gYlbpoTV+05g6W42fJIPYJGYdP/3JKV95SLz/6jtlgOP9pwTkI0H1KZ2rPJxBqJg9cg93K
 I9nHmIa9AO1Qx9rOD6yvxXGSLSD1N4+NkYAhI2DhLKHqbeh2UxheZIv/MtK61Qt03/jHON0J
 d1+H7CB9vnh+1CWaoOjaXhUxEa9Lq1vy1zyYyuCmEjJMpvC89/M6J6f49BaZXVLr20EmbPE4
 U/5CVa6kSQfy/nZkT7+REGoTpOGMOpCsxzqNKsa6oxjFyS32aDcAW0RCDltvVgkVE0RDAWO4
 F/ZTYCoELZl7fIO5s248WDJtpAljVsBicxo0xJur6l+XJIwZjXo+qyww==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] expat: upgrade 2.6.3 -> 2.6.4
Date: Mon, 11 Nov 2024 20:05:32 +0100
Message-Id: <20241111190532.118432-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:06:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206981

From: Peter Marko <peter.marko@siemens.com>

Handle CVE-2024-50602

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/expat/{expat_2.6.3.bb => expat_2.6.4.bb} (92%)

diff --git a/meta/recipes-core/expat/expat_2.6.3.bb b/meta/recipes-core/expat/expat_2.6.4.bb
similarity index 92%
rename from meta/recipes-core/expat/expat_2.6.3.bb
rename to meta/recipes-core/expat/expat_2.6.4.bb
index 5ae694a004..f383792793 100644
--- a/meta/recipes-core/expat/expat_2.6.3.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -15,7 +15,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
-SRC_URI[sha256sum] = "b8baef92f328eebcf731f4d18103951c61fa8c8ec21d5ff4202fb6f2198aeb2d"
+SRC_URI[sha256sum] = "8dc480b796163d4436e6f1352e71800a774f73dbae213f1860b60607d2a83ada"
 
 EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
 
-- 
2.30.2


