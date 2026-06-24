Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2A4CDE007
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 16:54:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12167.1782320052779376106
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 09:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Fv57W5Mc;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D15801A091E;
	Wed, 24 Jun 2026 16:54:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9EF74601C5;
	Wed, 24 Jun 2026 16:54:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE3DA106C8210;
	Wed, 24 Jun 2026 18:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782320049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=qh6McDjB2IFxd9gDGxgCTQ83Dbqj4GOWkNA66fWdlDo=;
	b=Fv57W5Mc1wdQkcs+eeCtjZKBjzSiPc/Gc64WNDCgdrlbhIQbbL1yhFeZ9Xe0AmG5vBwvHy
	pnvK+3vqyN7M4xrXUrhkovuKsCJiv1gzQipgnAgwEG62X1ZqL4w1g4I4z2K9Nh1MHqGA4R
	jbV9XROnY7J7lCoWTxzJm5I8oD8oSGjAboUOAE3m+5iR6WqGDGUK8phdtwYfWgH2Pl+daR
	NQbDQQduU6dOF9VkJUGyR3ozm9EO8GRKD7R1CBI5wMdYZX/xA4Xt+AjkYmwpsUipl+6FlI
	DN6FLLOLCVQWbqrxVD0hc+h1uAMJV4IsLnR6BO+CV0UEGW+4uceH3OrdiE0lUw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/4] sbom-cve-check: Update to version 1.3.2
Date: Wed, 24 Jun 2026 18:53:52 +0200
Message-Id: <20260624-update-sbom-cve-check-1-3-2-v1-0-f7ab738bd785@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBAF0KuQWTsJFGgyXsW4KMNXqhFIB4gJ4
 e5WXb7N28mQIozOxU4JW7Q4jRnVqSAdwngHxz6bXOl86V3D69yHBWzd9GLdwDpAn1xxzY69ACI
 SWmlaysOccIvv3365/m1r94Au35KO4wMyEs/jfwAAAA==
X-Change-ID: 20260624-update-sbom-cve-check-1-3-2-69ee999a5945
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
 antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 thomas.petazzoni@bootlin.com, pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 16:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239526

This series update sbom-cve-check to the latest release, and updates its
dependencies:
 - python3-spdx-python-model
 - python3-shacl2code (was already updated)

This release of sbom-cve-check addresses minor fixes and improvements.

This series also updates the sbom-cve-check-update-* recipes to fetch
a more recent version of the CVE databases.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (4):
      python3-spdx-python-model: update from version 0.0.5 to 0.0.6
      python3-sbom-cve-check: update to version 1.3.2
      sbom-cve-check-update-cvelist-native: update to version 2026-06-24
      sbom-cve-check-update-nvd-native: update to version 2026.06.24-000003

 ...oml-Update-shacl2code-to-1.1.0-and-add-ke.patch | 41 ----------------------
 ...0.0.5.bb => python3-spdx-python-model_0.0.6.bb} | 12 +++----
 ...ck_1.3.1.bb => python3-sbom-cve-check_1.3.2.bb} |  2 +-
 ...-cve-check-update-cvelist-native_2026-06-24.bb} |  2 +-
 ...e-check-update-nvd-native_2026.06.24-000003.bb} |  2 +-
 5 files changed, 9 insertions(+), 50 deletions(-)
---
base-commit: d595615c6a027b80d6f7ea80ab25e85e97b2436f
change-id: 20260624-update-sbom-cve-check-1-3-2-69ee999a5945

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


