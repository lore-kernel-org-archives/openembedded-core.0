Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCE0D5B878
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 23:04:30 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8365.1765839862312616402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 15:04:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Pa8ETsG7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20251215230419c8ba118480000207dd-rxigr0@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20251215230419c8ba118480000207dd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Dec 2025 00:04:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HX3BICl2tT4lUtQ94bNi8RvwIIIEIPhFA8d60ESSY5k=;
 b=Pa8ETsG7k9/oNyiARSWAi+dVWNWYWPLvNMaSknNq39QencRu8xTRNscBLJf/BO18vFbh3i
 9aFerzvXbHxXoQo9wT6p0EurQdJbJhWxvwph46U0KPdC1/ujADHR3G/q8X26DQdnXtvmcn0K
 DRju9QeI5cRRoSeznT17JAlIoYYR76bQgShocVbbv7Gp5RvajlgmMKVFL6sfwxR9WI8gdwsy
 h/WUyyR4L0r8D9eRsy3W9efv0QFS7yPaUhHnQzDVUSKK826ob2AH8XW0AZjTvOGMb/hFl+lt
 I1dkeLV0i44kiDpFcSzlWrg7q/pt/yE/qOeD0VOfFUuqNz6794WI9DOw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] libarchive: upgrade 3.8.3 -> 3.8.4
Date: Tue, 16 Dec 2025 00:04:15 +0100
Message-Id: <20251215230415.539610-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 23:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227755

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

Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
 

