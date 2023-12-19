Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 935F0C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:29:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.11676.1702991356905540388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:09:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 19 Dec 2023 22:09:15 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO user3..) (10.177.227.40)
	by 156.147.1.127 with ESMTP; 19 Dec 2023 22:09:15 +0900
X-Original-SENDERIP: 10.177.227.40
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>,
	Steve Sakoman <steve@sakoman.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] ffmpeg: fix for CVE-2022-3964
Date: Tue, 19 Dec 2023 22:09:13 +0900
Message-Id: <20231219130913.24646-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192727

From: "mark.yang" <mark.yang@lge.com>

Without a CVE tag, It will be recognised as Unpatched by cve_check task.

CC: Steve Sakoman <steve@sakoman.com>
CC: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
index 23573bb6b3..97fcfd993a 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
@@ -4,7 +4,7 @@ Date: Sat, 12 Nov 2022 16:12:00 +0100
 Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b28ed84a77138105475beba16c146bdaf984]
-
+CVE: CVE-2022-3964
 Signed-off-by: <narpat.mali@windriver.com>
 
 ---
-- 
2.34.1


