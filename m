Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A80AEEE24B
	for <webhook@archiver.kernel.org>; Thu,  1 Jan 2026 20:19:57 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5948.1767298793206990683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jan 2026 12:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MINvqF2H;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260101201949be881ed93d000207c6-fykniu@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260101201949be881ed93d000207c6
        for <openembedded-core@lists.openembedded.org>;
        Thu, 01 Jan 2026 21:19:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=6wEih0MaJipqTzzN/DZb7phbnQhoVdZ21BwxFKEG/Jk=;
 b=MINvqF2H3j6Id/4OooLae/AduHnTouB+oSFHbXecZ/zpjFKHp25v7v8lgVOSAPif9Tb17e
 vy6uhCyTl5/nUe6CAQh977M4bqQSXn9DeqKsbPa1b79R7qAMc/HnXAxKQR1UyOCCB8WRTi62
 NF8RNdLfMQyqmD8vw0oBAwvTWIU0AiAPIJFMznZrUfCICBHAn7PSb3S2sebncuTXm4S8skTH
 sOovXcEoLwoC0TdKRbnTg7OWflMw+fkCB7UMHdTJbsWo2ufXMu5RV1/FTdMyDxd59g41uvdM
 KHeCGRHwXWUpo/iZT41FMJRC5j9Eo3wZeUzwvoTLs3mKJckzXCeyU77g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [OE-core][whinlatter][PATCH 1/3] libarchive: upgrade 3.8.2 -> 3.8.3
Date: Thu,  1 Jan 2026 21:19:46 +0100
Message-Id: <20260101201948.97100-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jan 2026 20:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228828

From: Peter Marko <peter.marko@siemens.com>

Release Notes [1]:
Libarchive 3.8.3 is a bugfix and security release.
Security fixes:
* lib: Create temporary files in the target directory (#2753)
* lha: Fix for an out-of-bounds buffer overrun when using p[H_LEVEL_OFFSET] (#2768)
* 7-zip: Fix a buffer overrun when reading truncated 7zip headers (#2769)
Notable bugxies:
* lz4 and zstd: Support both lz4 and zstd data with leading skippable frames (#2771)
Full Changelog: [2]

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.3
[2] https://github.com/libarchive/libarchive/compare/v3.8.2...v3.8.3

(From OE-Core rev: 4b32b43a607bf708e5433366a3ef6cbcd5b8b221)

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
---
 .../libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.2.bb => libarchive_3.8.3.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.2.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.3.bb
index d4f367009a..e3706ba3bb 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.3.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "5f2d3c2fde8dc44583a61165549dc50ba8a37c5947c90fc02c8e5ce7f1cfb80d"
+SRC_URI[sha256sum] = "a290c2d82bce7b806d1e5309558a7bd0ef39067a868f4622a0e32e71a4de8cb6"
 
 inherit autotools update-alternatives pkgconfig
 

