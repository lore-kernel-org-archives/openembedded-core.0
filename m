Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF863C5AD2B
	for <webhook@archiver.kernel.org>; Sat,  8 Aug 2026 10:53:10 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3514.1786186384076201563
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2026 03:53:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=FAqUZls4;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-2026080810530274201791e9000207f1-0cpora@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026080810530274201791e9000207f1
        for <openembedded-core@lists.openembedded.org>;
        Sat, 08 Aug 2026 12:53:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=q0UK9ZcaptuDIZEDGiegcgo3etoQWiQP+LaUe0tnzPQ=;
 b=FAqUZls4a7eYZg7IhT7pfNgI95cpKgnKnrrcWElg7c5reDZkWZkzySHBRLmfPKlJHO3k6C
 a3r5mM4lnzm1CVeN2w445hmFl2EdCv1dMpsS7YM6yML58d7qINFwa57vNtoJvwuj6Wavw6fj
 Y50cv9bjJX5rlObZNY7CKITS3D3frIu51dmJMZFNDndZNVWW2jpXYClu4CkaD2cZOJOi+lts
 4h4+2mWZCsuLsMP7gTDQZU7tNnth3OoY6M2Jqk7xa6dsKwumriyIucXNK4oBgaiSFU6G0umk
 1FUlJQdoegj+H6TFADB0ZO/PkaD0t7NMVE+kjmmG6aC3x++gR/XRVW1g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [wrynose][RFC PATCH 11/11] sbom-cve-check-update-nvd-native: update to version 2026.08.03-000011
Date: Sat,  8 Aug 2026 12:51:47 +0200
Message-ID: <20260808105147.42294-12-peter.marko@siemens.com>
In-Reply-To: <20260808105147.42294-1-peter.marko@siemens.com>
References: <20260808105147.42294-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2026 10:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243048

From: Benjamin Robin <benjamin.robin@bootlin.com>

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026.08.03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 5928cf1985d65b5dc7a909df596d7ff91533fccd)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.07.23-000007.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
index cf35b16923..720b5ded0a 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
+SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

