Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CC7C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:26:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39445.1785749171452699476
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vyjik+qq;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BA65A4E410B3;
	Mon,  3 Aug 2026 09:26:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FF266029B;
	Mon,  3 Aug 2026 09:26:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 00B6711C17D01;
	Mon,  3 Aug 2026 11:26:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785749168; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5VarJytKiXGOAM3Zau7Niq+Ib7n7AooLiDDMykZ8fcc=;
	b=vyjik+qqzARJKWS3smfC1pgmQky8iT5WqiIeLxgfgZJ5+WXn2A1xu8WFFwIrkRNBzSDWOx
	rzxvke4oMEmOJhH18nmpUgFgZiiyge1KsIL3GtHq3cSEfZ2AlvImG3PlC79F87sl2ixtpy
	TpDP8EcHIKPfq5Mp8syrqdjo/SUHb3zzxVo98XteugUngvPVUV7fPOixGDHpV3JbYlcxTF
	+Vc3NbhZH3ZpywKkbahEBwf55YdWICcPhxMfxxzTz85Ix8csSExsuHC0Cr6bwJd7rEmb5t
	WAgCG2of7h39vdEsGr9HaOb7fXWluu+1+qwKUIRGc5t0bVJu23yIWvF5Mmh0LA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 03 Aug 2026 11:25:58 +0200
Subject: [PATCH 2/3] sbom-cve-check-update-cvelist-native: update to
 version 2026-08-03
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-update-sbom-cve-check-1-3-3-v1-2-c0e5e198030e@bootlin.com>
References: <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
In-Reply-To: <20260803-update-sbom-cve-check-1-3-3-v1-0-c0e5e198030e@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, Peter.Marko@siemens.com, 
 olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2026 09:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242640

Update cvelistV5 to the CVE database from 2026-08-03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...2026-07-23.bb => sbom-cve-check-update-cvelist-native_2026-08-03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
index 0ada6e89f3b3..b2a665450311 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix=;tag=${PV}_baseline"
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
+SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

-- 
2.55.0


