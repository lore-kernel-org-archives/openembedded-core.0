Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE53C43602
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 11:01:47 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147681.1783335706507433653
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 04:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aPImUXGd;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B6B5C8EC76;
	Mon,  6 Jul 2026 11:01:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FA0F601A2;
	Mon,  6 Jul 2026 11:01:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0C4311BBA12F;
	Mon,  6 Jul 2026 13:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783335700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=1jwpju+UrnEJdrx/KX/5b1v/gDRorm6Jn5prhJ9wt5E=;
	b=aPImUXGdOh1Uu84kwM6TmlBpsosLsiYdr5DKYpWosHLjt/2WYZU3g8DdF/7Qgyn9FkxWq8
	NJzkvziGqXn8SmWpzq4j4HnAG8N7Btzzun+TfwiA94yngsoZuVynPKYtEboM0KnBJEX9R4
	Y6GN2SWwRm35O7MbBtzz2IehiaNoZySIJYwj784WNhRi4Xfwtz96GBPchbyR5BiPppm+8e
	H5frD3duBRVM/WNraa2k1Gq3nWdrPyEzTO3vhf26xK/WBWnQkmmL8+7bANz1X7lwsaHH5J
	xdeabaEsRNxoWxgTlqwXvUxigoWLgjOe6DM8FcCamgEfx4Y/A9KkjrpEO2aaTA==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Subject: [scarthgap][PATCH 0/3] python3: fix CVE-2026-11940, CVE-2026-11972
 and CVE-2026-9669
Date: Mon, 06 Jul 2026 13:01:34 +0200
Message-Id: <20260706-fix-cves-python-scarthgap-v1-0-8d51db14f7ac@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2MQQqDMBAAvyJ7diHakhS/Ih5iXM32EEM2ikX8e
 9MWehyYmROEEpNAV52QaGfhNRRo6gqct2Eh5KkwtKrVyiiNMx/odhKMr+zXgOJsyn6xEY2m8U7
 NfJvMA0ofExX5++6HH8s2Psnlz7D/hwNc1xtT2KQSiAAAAA==
X-Change-ID: 20260706-fix-cves-python-scarthgap-76eb4e1f3d78
To: openembedded-core@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 11:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240252

This series fix the following CVEs:
 - CVE-2026-11940
 - CVE-2026-11972
 - CVE-2026-9669

On master and wrynose the CVE-2026-9669 patch is not necessary since it is
already included in 3.14.6

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
Benjamin Robin (Schneider Electric) (3):
      python3: fix CVE-2026-11940
      python3: fix CVE-2026-11972
      python3: fix CVE-2026-9669

 .../python/python3/CVE-2026-11940.patch            | 66 +++++++++++++++
 .../python/python3/CVE-2026-11972.patch            | 58 +++++++++++++
 .../python/python3/CVE-2026-9669.patch             | 97 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.12.13.bb    |  3 +
 4 files changed, 224 insertions(+)
---
base-commit: 2814f0962f56c8d1afa4de76d2895ba9b5cb767d
change-id: 20260706-fix-cves-python-scarthgap-76eb4e1f3d78

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


