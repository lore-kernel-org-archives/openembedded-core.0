Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F066C46CD4
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 13:29:19 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web10.13406.1702992368837941654
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 05:26:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 19 Dec 2023 22:26:06 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO user3..) (10.177.227.40)
	by 156.147.1.127 with ESMTP; 19 Dec 2023 22:26:06 +0900
X-Original-SENDERIP: 10.177.227.40
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	martin.jansa@gmail.com,
	"mark.yang" <mark.yang@lge.com>
Subject: [kirkstone][PATCH] ffmpeg: fix for CVE-2022-3965
Date: Tue, 19 Dec 2023 22:25:44 +0900
Message-Id: <20231219132544.73221-2-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231219132544.73221-1-mark.yang@lge.com>
References: <20231219132544.73221-1-mark.yang@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 13:29:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192729

From: "mark.yang" <mark.yang@lge.com>

Without a CVE tag, It will be recognised as Unpatched by cve_check task.

Signed-off-by: mark.yang <mark.yang@lge.com>
---
 .../0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
index 6e237fdd52..8ebf1f69c4 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
 
 Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13109759090b7f7182480d075e13b36ed8edd]
 
+CVE: CVE-2022-3965
 Signed-off-by: <narpat.mali@windriver.com>
 
 ---
-- 
2.34.1


