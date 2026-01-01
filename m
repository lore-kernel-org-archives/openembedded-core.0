Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AEBEEE25C
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:19:57 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5938.1767298793207964929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=YWsmVFcl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202601012019493cc3d1fe9c00020713-upt4x3@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202601012019493cc3d1fe9c00020713
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=R2WvOF7r7UX7vWMO3ItDAEb6Uqh7ipgPh/UHkc93A3s=;
 b=YWsmVFcl8IefkxgK5RW8H7+j1h0HYUr7uH4/HFm+l2rXwBpCmtqWhCY0vD8GeklnklrRWj
 XOgFYVSMavobBLtVpZfhvY/2skwtBijKH6uaQPIlZw+8ZagIp6zAlXhnpAx/REmOXRueaD+w
 1zL8rqZdEt94skCix8MFpBBEZlmtQCtTuOea0VEf+lkx1+rv5brQ4VHvrUmKZgOxQdyPmznP
 b6ePQHfegDQdbisTv4od24pyVXLIXWq/vy8Ix/EIIgRq7rb8V230KmwBv0RRR07giiAqZpCY
 1e4PzVdsd/SL+RMeHspXaoi4pN+I+bKMEZ4QqIeDkRPovbls6Mo8bK6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 2/3] libarchive: upgrade 3.8.3 -> 3.8.4
Date: Thu,  1 Jan 2026 21:19:47 +0100
Message-Id: <20260101201948.97100-2-peter.marko@siemens.com>
In-Reply-To: <20260101201948.97100-1-peter.marko@siemens.com>
References: <20260101201948.97100-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228830

From: Peter Marko <peter.marko@siemens.com>

Handles CVE-2025-60753.

Release Notes [1]:
Libarchive 3.8.4 is a bugfix release.
Notable bugxies:
* bsdtar: Fix zero-length pattern issue (#2787)
* lib: Fix regression introduced in libarchive 3.8.2 when walking enterable but unreadable directories (#2797)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.4
[2] https://github.com/libarchive/libarchive/compare/v3.8.3...v3.8.4

(From OE-Core rev: 5479a5e6bcdebd2c5c6f1cbbe039243cf9fbc6b0)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.3.bb => libarchive_3.8.4.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.3.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.4.bb
index e3706ba3bb..e89638f5c6 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
+SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
 
 inherit autotools update-alternatives pkgconfig
 

