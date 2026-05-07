Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E38CD3442
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 16:30:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.151.1778171424040693097
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 09:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=0rLfVwPq;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0CC631A3538
	for <openembedded-core@lists.openembedded.org>; Thu,  7 May 2026 16:30:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CD140605CF;
	Thu,  7 May 2026 16:30:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE72A1081949C;
	Thu,  7 May 2026 18:30:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778171420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=DILgtG2qiXhtgoBlbiIqJrEnOfLfRzDrX6VLUI5uvl4=;
	b=0rLfVwPq8fICCWM8howlH2LxCKMSyfS1Gnvj8Gd3OG7UIVY5tr83y7mltMsLSIiQwOqvxi
	hL9tLviMaXNgguHaD/8yHi9n8jW2unXBC8IF7TEJ6AfeksTGzKfHnx7dHSbOLvSvwU2FdA
	Dgt90KISL1VWqqQBHqRN336giAMBIYSOx0spcf4om4C1gHQ76xnxvNfMFaGAH3myIoiBxO
	WlsvdKWZ1VdTU6TPxdN2orSJq2oYLOrPQP0ixhlHeX9ZywocUe87ArSLxTSllLOx7jgR7r
	LNhWs8OCiwxLo35TL1XoxG2CHuz1ge4QDtW35+/SDriO89LQADp9YKtRSCuZrA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH 0/3] sbom-cve-check: Update to version 1.3.1 and update CVE
 databases
Date: Thu, 07 May 2026 18:30:16 +0200
Message-Id: <20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPnchBlrBq5Q+xHVSV6lKVqUg3
 t3YPn4M8+9kSAqjutgpYVPTacwobwVJF8Y3WNts8s4/3N1VvM5tWMDWTB+WDSwdZOAybzE6HxC
 F8ndOiPr9dZ+vv21teshyxeg4Th5waFB5AAAA
X-Change-ID: 20260507-update-sbom-cve-check-1050ff02aefc
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
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 16:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236600

This series updates:
 - sbom-cve-check to version 1.3.1 which mainly fix a potential dead lock.
 - sbom-cve-check-update-* recipes to the latest revision

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
base-commit: 4f7d1a0885d7d6f2a533f7388ed5f5a35d6f99bc
change-id: 20260507-update-sbom-cve-check-1050ff02aefc

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


