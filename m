Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA79D3ABF2
	for <webhook@archiver.kernel.org>; Mon, 11 Nov 2024 19:05:41 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.67580.1731351937522762927
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Nov 2024 11:05:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Kd6PCgpd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20241111190534091966a2659ae3716f-xnyw4r@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20241111190534091966a2659ae3716f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 11 Nov 2024 20:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RKapJy6iluiiwB04/0sCdKl7BvrPkCqeD7l+xAFvpe0=;
 b=Kd6PCgpdKxUsUHnVdajN9sVhjrFpF00vrz28iZDPj3vZrLors6wnT62dQWwh2wAhdmBgrP
 IHgmFxoeh3ZWN1+0adSC/spqCFo0JoLHK5/XsrLd3ZBupgO/wwWsgjznJMApHlh4RowRTl9Y
 n73p1Thul4UB6ZpZhAgjl7CZJdOdC+MWzpUL6jdQWdSHYSuQwCvBKKa1XoI39WPFgdCqHuDQ
 toffpuz49eBBvOrv2jd9y8xaeWQ74VXhOZc9t9Wb3LJicBqVFJ+PlDbiguRjF+m4akQrnnMU
 Hchj0ZyYiz678an5uuGOAWpGG6mNFKzxCPoRY+ngSQMGUFR067J3apqA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] expat: upgrade 2.6.3 -> 2.6.4
Date: Mon, 11 Nov 2024 20:04:36 +0100
Message-Id: <20241111190436.48305-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Nov 2024 19:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206980

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


