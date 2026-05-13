Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EF6ECD4F25
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:53:17 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6019.1778701994796728912
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 12:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Z7Q5kGk7;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9BB431A35A4
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 19:53:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 717285FE21;
	Wed, 13 May 2026 19:53:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69CFD11AF903E;
	Wed, 13 May 2026 21:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778701991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+uAG8bM/hbx+pAzU5bFC48/b4T4g79uBCFc+yLu9WvA=;
	b=Z7Q5kGk7y4y6thGcQQvBBoVmDedvkzXz/EtAxHXJ9+7tbTKB73/VvmZh4qsu2++2eNdyBP
	5dy+GGasA9GxACu9PRF41O6wpD0BFr1LolzgcXwlaR+rlcNNbv2SydWZ1xC2+JDss9t54b
	WtwhRDxadhDmbKC59K10F8w/HII14vFdjcJPwQdF0/TSfUeOdlm8aW81wWx7NVwSK2a73O
	Wr/E3vSS6VtzQIRo1yNcxEWjT6vH37f/rmV4K3ywYM8DZtkl8st1133SrzCLa+7hRb2yD7
	v0A1HMX7kCh5EOcVfgtmf0Y5XcloW0vl7dauhhd5Y/NWqdhLyzMEi+UpgDIyVA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 13 May 2026 21:52:59 +0200
Subject: [wrynose][PATCH 1/3] python3-sbom-cve-check: Update to version
 1.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-update-sbom-cve-check-wrynose-v1-1-e6e368932274@bootlin.com>
References: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
In-Reply-To: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, ross.burton@arm.com, 
 olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
 mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 19:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237003

For details on this new release which fixes various bugs, see:
https://github.com/bootlin/sbom-cve-check/releases/tag/v1.3.1

Also, update the LICENSE, which is now GPL-2.0-or-later instead of
GPL-2.0-only, to be compatible with the licence dependencies.

(cherry picked from commit 4f3a55803ff377dacac08c4131aa8a979e183886)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 ...ython3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
similarity index 76%
rename from meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
rename to meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
index 96fc167ecbc3..8120848a667d 100644
--- a/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.0.bb
+++ b/meta/recipes-devtools/sbom-cve-check/python3-sbom-cve-check_1.3.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Lightweight SBOM CVE analysis tool"
 HOMEPAGE = "https://github.com/bootlin/sbom-cve-check"
 SECTION = "devel/python"
-LICENSE = "GPL-2.0-only"
+LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=570a9b3749dd0463a1778803b12a6dce"
 
 PYPI_PACKAGE = "sbom_cve_check"
-SRC_URI[sha256sum] = "dad6f9df848f6dd7b69922baef0ec187b66ad0847fe0cf62614529e27203e842"
+SRC_URI[sha256sum] = "675828b2f02f11620b7a229853a24d09264bf41161be5fbb80a92456f46a14e0"
 
 inherit pypi python_hatchling
 

-- 
2.54.0


