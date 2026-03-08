Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E24EEA8549
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 22:43:08 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1601.1773009781997132197
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 15:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WdKD5ukL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260308224300d08836b1f7000207b8-76i82b@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260308224300d08836b1f7000207b8
        for <openembedded-core@lists.openembedded.org>;
        Sun, 08 Mar 2026 23:43:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AnqM8RCf5gMoNoXnu5m1IBbwH/u8z3Qo0OK4BlqGsCw=;
 b=WdKD5ukL5Xx2qebFpSeqg0cuJ34G+Qp14t8gA9TQqWUS+w7byFEMbzLhSLecehNs/FX37z
 w8ZjN1G1jS9EGbSUFalQCPBQs73RVcrts6mS9SK6yShMK9r68xtDh/SWDRslb3yp6NnO4U8x
 n2UYfrsiLsJO4BL8B8cC2JRqJGSx/73NIZHFhbVF30fJq3fz5ZjF6Yi6gx4ZH72AiYW0OSit
 MOBYmSM9XalPBiyL3OIeAOuYZlFOhBTRSnBVTvTBTVGf6K3HhoxWVNRTJJUz4aSsU1Y2rNV0
 rEroBgyexqid1iHBraW3bpAeT+yPeTLBPdFoTgtJM6yQu71aSD4J4MZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 3/3] tiff: set status of CVE-2025-61145 as fixed by patch for CVE-2025-8961
Date: Sun,  8 Mar 2026 23:42:40 +0100
Message-Id: <20260308224240.60802-3-peter.marko@siemens.com>
In-Reply-To: <20260308224240.60802-1-peter.marko@siemens.com>
References: <20260308224240.60802-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 22:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232671

From: Peter Marko <peter.marko@siemens.com>

Gitlab issues for these two CVEs mentioned in NVD inks lead to the same
merge request.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
index 05b11a866e7..f87eaeb1084 100644
--- a/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2025-8961.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] tiffcrop: fix double-free and memory leak exposed by issue
 
 Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/0ac97aa7a5bffddd88f7cdbe517264e9db3f5bd5]
 CVE: CVE-2025-8961
+CVE: CVE-2025-61145
 Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
 ---
  tools/tiffcrop.c | 8 +++++++-

