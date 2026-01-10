Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14DDD277E6
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 12:28:33 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7686.1768048099924200567
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 Jan 2026 04:28:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TsfgylaO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260110122817262b6ae1e20002078d-9f23s_@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260110122817262b6ae1e20002078d
        for <openembedded-core@lists.openembedded.org>;
        Sat, 10 Jan 2026 13:28:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=r5ukVPOLtbjrrT4nYY9StwjliwJU+hRW1/snAc7womk=;
 b=TsfgylaOMs9aC8HTMolM1sgXWy+TB8beRbH8imadrxPYG8jTUKyZEZ7r5gzFqZY6sVDiwU
 K68RdstKnAC/kgVVPzFVh8xD3PUQYv6ysD287lIucQVfB1ssKMh7ABdZfbBnhZXEB2FemYwO
 2tw8Yb00Cm7o8a3aUiwod/0eeCuZRQdt5Vi9LloymdMSJsZNojbfj1Gn5o1MMJH1izYqjNKV
 +NHtS3KgILnoPVAI3raV1PCHsT45CH6rmuhf13TVMI4Ito5zL3g90G8tBnwQWHECVszKs8Cg
 GfOZ23gxsO+D2DcBwQQNSdAR20SPSAgWwZumH7qExC98JDL+MqXSmRTw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] libarchive: upgrade 3.8.4 -> 3.8.5
Date: Sat, 10 Jan 2026 13:28:13 +0100
Message-Id: <20260110122813.381863-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 Jan 2026 12:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229148

From: Peter Marko <peter.marko@siemens.com>

Fixes regression of fix for CVE-2025-60753

Release notes [1]:
Libarchive 3.8.5 is a bugfix release.
Notable bugxies:
* bsdtar: fix regression from 3.8.4 zero-length pattern issue bugfix (#2809)
* various small bugfixes in code and documentation

[1] https://github.com/libarchive/libarchive/releases/tag/v3.8.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libarchive/{libarchive_3.8.4.bb => libarchive_3.8.5.bb} (96%)

diff --git a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
similarity index 96%
rename from meta/recipes-extended/libarchive/libarchive_3.8.4.bb
rename to meta/recipes-extended/libarchive/libarchive_3.8.5.bb
index e89638f5c6..fcfaf5d231 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.8.4.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.8.5.bb
@@ -32,7 +32,7 @@ EXTRA_OECONF += "--enable-largefile --without-iconv"
 SRC_URI = "https://libarchive.org/downloads/libarchive-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://www.libarchive.org/"
 
-SRC_URI[sha256sum] = "b2c75b132a0ec43274d2867221befcb425034cd038e465afbfad09911abb1abb"
+SRC_URI[sha256sum] = "8a60f3a7bfd59c54ce82ae805a93dba65defd04148c3333b7eaa2102f03b7ffd"
 
 inherit autotools update-alternatives pkgconfig
 

