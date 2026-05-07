Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E88ECD343F
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:30:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.154.1778171428237601827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LoQkwaOG;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 648AD4E42C33;
	Thu,  7 May 2026 16:30:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3008B605CF;
	Thu,  7 May 2026 16:30:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81DD5108194E4;
	Thu,  7 May 2026 18:30:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778171424; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XXZGDV68p96Yr0Y/kCr8p3SSPVyk/EudlrYYpLK6FPs=;
	b=LoQkwaOGEdGeVWjuhss4WFUQFa7Vb5j6YbSQgnu/dNm7i2SbZ9XaeGkCESImJuEx65olzh
	ao3tIBGiQY8dYmZDx/PFowavLtBMxcIunIFab/nNZLB04eQRINIVIDj8qstElwJbejGAt3
	PPdVaiVS2QMNjgQup3hJtQ1sE8Ci/bOkHIMFbEINR+BZimzeoVK/yQL6KF2db8qQxS/1L3
	eyEooSIHLrgGm8VFdFkx25h9OHoAItrxxJR9nvcul3YXD7SpbAhZ5tTNIsV0JsFDEPw0gL
	ILVF/NB70AWPNMAjiRZk1WvnqihJHVT99k2tmyLR1m7ArnOEz1j4gGJDSvENtQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Thu, 07 May 2026 18:30:18 +0200
Subject: [PATCH 2/3] sbom-cve-check-update-cvelist-native: Update source
 revision
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-update-sbom-cve-check-v1-2-3c398db78f5f@bootlin.com>
References: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
In-Reply-To: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:30:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236602

Update source revision to cve_2026-05-07_1300Z

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 338712216590..3763e7f21f7a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+# cve_2026-05-07_1300Z
+SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
 
 require sbom-cve-check-update-db.inc

-- 
2.54.0


