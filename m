Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41CDFC982DA
	for <webhook@archiver.kernel.org>; Sun, 20 Sep 2026 19:16:44 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34767.1789931797434874674
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Sep 2026 12:16:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZUZbnC1q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260920191635a980d90df40002075d-tlsyvk@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260920191635a980d90df40002075d
        for <openembedded-core@lists.openembedded.org>;
        Sun, 20 Sep 2026 21:16:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Werjr/goA7oNV449HbavqZlkkUVNQuS4g0S+a9r0EQM=;
 b=ZUZbnC1qmbhl+pWfBbpkGNjT4xRioMpTloAvRUeWmhBLfgBEu/WvlLN3UcmvuAa7FmmR0e
 tEYUrtKB4Vp3bMcqUDHwLG3b/14M9ayk6tI04DZXlDRFyPyGwLSgbTecSWfNRLjg1W23ISP5
 TDXNHfq7ht0SkA8zKefGlVFf1iULRPFrNU/rR5pFL3Mu3lImZ1hZ4CmX3M9cUXDGAH9V1LJH
 5TF46l8SGpGs3MDG+mOjtQAlnWgto19WaJDOPkSOF4UBc0qJS6SxxprOfFsnBc/c7+G9sCZR
 a79KR20JJEc6WSdxLOjMOkOukKvzlkRAidOVqUCr/1xKa7u+tK5OGtow==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][PATCH 5/5] python3-sbom-cve-check: update to version 1.3.5
Date: Sun, 20 Sep 2026 21:15:31 +0200
Message-ID: <20260920191531.113024-5-peter.marko@siemens.com>
In-Reply-To: <20260920191531.113024-1-peter.marko@siemens.com>
References: <20260920191531.113024-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Sep 2026 19:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246267

From: Benjamin Robin <benjamin.robin@bootlin.com>

For details on this new release, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.5

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 65804d3f2eec44a3bdba68d8865619818886a4d1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{python3-sbom-cve-check_1.3.4.bb => python3-sbom-cve-check_1.3.5.bb} (82%)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
similarity index 82%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
index c26ce6e6b3..83d420835d 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.4.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "aa2f4e183b600fdad7ce6eb67f7d642bd3e7c67293ae9ffda7d3a2fde433e02b"
+SRC_URI[sha256sum] = "9ed8b0e9c46015444cd3e30332d9558e0be5f5fec97f6df47c6760166a314167"
 
 inherit pypi python_hatchling
 

