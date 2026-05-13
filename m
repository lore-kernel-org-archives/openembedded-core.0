Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933DCCD4F21
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 19:53:17 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6017.1778701993461807439
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 12:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yaGJoIml;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D116EC5DC5B;
	Wed, 13 May 2026 19:54:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F48F5FE21;
	Wed, 13 May 2026 19:53:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B575011AF8001;
	Wed, 13 May 2026 21:53:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778701989; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=9yb23of++W8Njfkks8xvbYj0FkCG0stKSflseCgG6bA=;
	b=yaGJoImlPi7ASb3LsZlXLqB9eSO9t4B4KMphI1IRIhleqb3Nun81Y3PpfkfJJDMYQnY5e6
	KBwE4tUAiTeGX23An90CKkcfRqsyby/DdWPY4zsQDJSn9K8X60xk0Jn43KHOc5txnDvTp3
	bAQ8X0pR9OcqvoawZNTc9GetlsbOUVglzTC9n8v+fOqHEKNL6QvwQA4JRzz9i5frqxrSwp
	Ax0zhiYSR3VTZFZniRp8yDA5LMmAfCrC+6YsJwp5RkO3Wek8NqG0XM254xR+LObYEjE+AQ
	Z6WZwrEBiAAGv1AXZ3imlVnmKiZQAFTjPKutx4YJXz8ABN4GY4aUGT9dDj8T2w==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [wrynose][PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and
 update CVE databases
Date: Wed, 13 May 2026 21:52:58 +0200
Message-Id: <20260513-update-sbom-cve-check-wrynose-v1-0-e6e368932274@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MSQ6DMAxA0asgr2spg0BVr4JYBMctadUExQytE
 HcnHZZv8f8GwjmwwKXaIPMSJKRYoE8V0ODijTH4YjDKNKrWFufRu4lR+vREWhhpYHrgmt8xCaP
 1zjZnRdoqA+UxZr6G1/ffdj/L3N+Zps+0/Wcd7PsByOtBiIoAAAA=
X-Change-ID: 20260513-update-sbom-cve-check-wrynose-3da3680c1302
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237002

This (backport) series updates:
 - sbom-cve-check to version 1.3.1, which mainly fix a dead lock that may
   occur when multiple instances of sbom-cve-check are run in parallel.
 - sbom-cve-check-update-* recipes to a recent revision

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (3):
      python3-sbom-cve-check: Update to version 1.3.1
      sbom-cve-check-update-cvelist-native: Update source revision
      sbom-cve-check-update-nvd-native: Update source revision

 ...ython3-sbom-cve-check_1.3.0.bb => python3-sbom-cve-check_1.3.1.bb} | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb            | 4 ++--
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb                | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 080e184ad9a07b469da7e8b045a93cefd5bf2438
change-id: 20260513-update-sbom-cve-check-wrynose-3da3680c1302

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


