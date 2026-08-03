Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD7AC55184
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 09:26:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39522.1785749172479056089
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2026 02:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MrlwkuC9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 95F374E410B4;
	Mon,  3 Aug 2026 09:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CBE36029B;
	Mon,  3 Aug 2026 09:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FC5711C17D06;
	Mon,  3 Aug 2026 11:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785749169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FLA7aYtwGzzAJVVV0gxjojkbvI/prmWA24GYWBnNUuA=;
	b=MrlwkuC9AF0HBj7u12YXBS2IGKX8knsgbTY4zMOX0NMBKRyt4162jgJvhDFFz1SePmxnCf
	nIFr4sH6hqdRluuTVJkKxRce9jIE9yytbCP+wf4cvfI3/tPj5R1G5IQXmpjbVBNU0VouRN
	nwJZJuuGHDfkt7LEwCwR4GYVbB6WlPPXg38W/X1l58rWpV0biFpVp2+qD8lS0viSgGRNNe
	+HAKab0CCc6mWc1hjApnvqWC1012UL96PeUdIXab9vKkh6aoE0SUh3tHpZo9af6CVVCw7g
	qV+kWF5HHZzEr8HaQJtXztco62jofbHSWbkuoXenCZe5xBlerMfBkiyPG91iVA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Mon, 03 Aug 2026 11:25:59 +0200
Subject: [PATCH 3/3] sbom-cve-check-update-nvd-native: update to version
 2026.08.03-000011
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-update-sbom-cve-check-1-3-3-v1-3-c0e5e198030e@bootlin.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242641

Update fkie-cad/nvd-json-data-feeds to the CVE database from 2026.08.03.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...-000007.bb => sbom-cve-check-update-nvd-native_2026.08.03-000011.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
index b0b6fb7d8c68..7c4c0511f830 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.07.23-000007.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix=;tag=v${PV}"
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "64a0cea215628d780438fba8bfe0f3300db1b702"
+SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

-- 
2.55.0


