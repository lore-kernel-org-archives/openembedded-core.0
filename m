Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0E0DCD3436
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 09:57:57 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10233.1778234271807767491
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 02:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=f129kO1F;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51222C5DC6F;
	Fri,  8 May 2026 09:58:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2EB23606D2;
	Fri,  8 May 2026 09:49:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C52EA10819770;
	Fri,  8 May 2026 11:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778233768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=ZOl/SVSF43bJUkr5VmmyEVYWyMmi6uVOOPVNlQij8j0=;
	b=f129kO1FfVe7eSHjmOU150RPHoSYseauprLiVCcdtfayIFsP1GCE9hwltS4YSBGoJwwHs9
	T0A4xbPV0G2Jt6CNdn8bVyVpcMjXNCa9TqkDfYPU5fFIYcmfNZEGkkccfCpekOlkL4mWSV
	IEQ8V9pXITRhZVu1j/1AzB171tRclhFzRYAsu8zFpNGKSFPpIVX7Jfptlikrqr7BWSjRZn
	TrMKTqpVKE5Warfq0hcpnecIx/SQJlPfSz6FJZn70TlGhVc5E1Djjmu3c+gKd2RR6QBY8l
	j32C0MQF+c55Jql7t9w+aZIekBwpnE//TcTINns1CMT35lbOMiUtw91huhp2iw==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [PATCH v2 0/3] sbom-cve-check: Update to version 1.3.1 and update
 CVE databases
Date: Fri, 08 May 2026 11:49:24 +0200
Message-Id: <20260508-update-sbom-cve-check-v2-0-386df4c5e6a4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQ6CMBBGr0Jm7ZhSgqAr72FY0GEqVaGkLY2Gc
 HcLHsDly/fzFvDsDHu4ZAs4jsYbOyaQhwyob8c7o+kSgxTyJEpR4Tx1bWD0yg5IkZF6pifmKdN
 ayJY1QdpOjrV577+35sd+Vg+msJ1tjd74YN1nF8d86/1zxBwFFlSc605VtS71VVkbXmY8kh2gW
 df1C2gU2UjOAAAA
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
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 09:57:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236702

This series updates:
 - sbom-cve-check to version 1.3.1, which mainly fix a dead lock that may
   occur when multiple instances of sbom-cve-check are run in parallel.
 - sbom-cve-check-update-* recipes to the latest revision

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Changes in v2:
- Fix Signed-off-by in the last patch: The email was cropped somehow.
- Link to v1: https://patch.msgid.link/20260507-update-sbom-cve-check-v1-0-3c398db78f5f@bootlin.com

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


