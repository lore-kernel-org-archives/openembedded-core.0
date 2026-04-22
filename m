Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DF0F94CBE
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 15:31:42 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85530.1776871894297502843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2026 08:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=lSkYG2Ic;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77E5AC5B1AC;
	Wed, 22 Apr 2026 15:32:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9E56C5FA8F;
	Wed, 22 Apr 2026 15:31:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5385E10460BF1;
	Wed, 22 Apr 2026 17:31:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776871891; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uwrg40Av0G1i85t7a4i3VebYwj2jzMclygTmgDIz/qw=;
	b=lSkYG2IcuhNT8XC5Rg5oNt13LjTIqN8kUpLY7vw+85uC9CUDCsKxk7P2PbtNweMV32PLRY
	dlDhrWHbHZFY3LojS8TE/R2fiQ2LFSJ7rA9Mwf7DEL6HooRY5gVpeLyzzAeGcoZopu6XqR
	VPzuEtE2XWwqmrXClaQk8FUC/r4Q33yZ2cCa6jFAzVyhdfxq8UjuQjM64B8Tb3nTtQDnb2
	is1txxMeQtQjPuRH7ZhyDUauFTbmhBRDIY6jQA2QRNgedegYoAYsKw/+pXe3Yv4nej0ujP
	CT+fm/3bJEJ4S39XTXXLbVNu98GwB8ldlV86jKx37a5NpvrEfDXCCoLP7wpAow==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Wed, 22 Apr 2026 17:31:26 +0200
Subject: [PATCH 1/3] python3-shacl2code: Update to version 1.0.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-update-sbom-cve-check-and-depends-v1-1-4646f840ce48@bootlin.com>
References: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
In-Reply-To: <20260422-update-sbom-cve-check-and-depends-v1-0-4646f840ce48@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, peter.marko@siemens.com, 
 ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Apr 2026 15:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235730

sbom-cve-check version 1.3.0 now requires spdx-python-model 0.0.5
which is built using shacl2code 1.0.1.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 .../{python3-shacl2code_0.0.24.bb => python3-shacl2code_1.0.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
similarity index 81%
rename from meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
rename to meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
index 93ed9a253040..904940926fee 100644
--- a/meta/recipes-devtools/python/python3-shacl2code_0.0.24.bb
+++ b/meta/recipes-devtools/python/python3-shacl2code_1.0.1.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0582f358628f299f29c23bf5fb2f73c9"
 
 PYPI_PACKAGE = "shacl2code"
-SRC_URI[sha256sum] = "d8b511054ca564b4514b9186ece7f5eb8048cfc5daa6625def1a3adba13c4f66"
+SRC_URI[sha256sum] = "c856822b40c330452b8b31e94a658ad4595a5ef03cdb75ea432ea9c73d0cf7d9"
 
 inherit pypi python_hatchling
 

-- 
2.53.0


