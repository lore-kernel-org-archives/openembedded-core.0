Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CE6E77180
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 15:32:12 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.22185.1734017525363698705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 07:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=DXEbEm7H;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1F7BFF804;
	Thu, 12 Dec 2024 15:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734017523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8W55ll6UI0bfwQurGgtOrV/uCOXg2Vh4Z3ZImRmcLw8=;
	b=DXEbEm7HGNV7uGuuO+R3i/5wpGiuhjCU29EYjx4FiSVLh4zGtRPESHPu2HoPFrsOEuA4OB
	9XimmZdyBEE+SiRDlzHy4NILsErA836uGJZ1ssyVQbazWJYG0E3Clra3gjtIaRrDE4kCTk
	fu6fT5865TAvv9b2B4/U2qOJdCWQfohoS0qLa75/36yP59Ond/t+ImtgkY9LShs0XUYKeq
	ZrxHhoJtfgTkUjIw+Ly+O9SMIcABmaftzKcRxwrY3D8yTo9M4NVtik8wbOxYULcBEcboCR
	o4hkf9S3+OyzpYzXzEil7QQAwObkY1GMKuK+ibj0n+xp/8WNgFGiCtNjK0WpGQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 12 Dec 2024 16:31:17 +0100
Subject: [PATCH] scripts/install-buildtools: Update to 5.1.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-intall-buildtools-5-1-1-v1-1-9bdfd09b0518@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAMQBW2cC/x2MQQqEMAwAvyI5GzBREf2KeKg2aqC00rqLIP7dI
 nOaw8wNSaJKgqG4IcpfkwafhcoClt34TVBtduCKG2JiVH8a53D+qbNnCC5hi5Thmhrbm16kWyH
 XR5RVr+88Ts/zAqRR2CZpAAAA
X-Change-ID: 20241212-intall-buildtools-5-1-1-2314d9a9ee7f
To: openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VC2L79W9NPp+gLl8ncAEn0S7C+Thbc9orfmtSKlDAXo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWwHyheoT3tS62fvbruiRQ2we4skkIns6R28B3
 Yq9uC3ZJh6JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1sB8gAKCRDRgEFAKaOo
 Nq9MD/wJ6VhhmT3LSkTr3ywQzUozjlOBzAaWpm+ONONNnYsTLXOzRJubLAAXNN1zBWFZ2RMvUJr
 CXL66usDLz+6USYue2OMsS+H70rJ+d0eh0sNlqXzmFer26xv7eXa0dmerZkmbp1Q4SFYm5nwrjF
 qkOCTsKCq5F4P4dLudB4Qs9nGAqZC2RkmWxQY/cWgclanJyhTTlTglL2LUQqpe3YENfqqKVNQR6
 R14kipCxwFQ0cjCwq2jZZfyZjDCdsEhBqxEFD6RZs4CSo3wSivo0Fr7H4MYCZpzJRobfU6vN4W/
 ZOiqRNwSTuxeP/wFDMcGlKO0XGQsahGYBSR8nS57n+KwLkMsRlXnwSO7NiwCn8ZZVLe+ANZPhnV
 45PFfj/BlA+1WVd2r+xuVv0mnW7dNCr85xB4fnCzVFqDDLfr9QcW7g6BHE++eyHal+Gv4rDSVI0
 JrxWe9z15tKc23IWaTdlKVy7m8rUKAVeO0Zo3RJwJ3+bnpKSq2lKeY/75yTGk79sZmOWedo72Of
 Sje/qqxXmZo3ECW8piDpyDRAmw6MzD2A5nJTT2WN30lmB5FmN+6Q+wS5kipwVBt7WX2SAdQn06F
 ebE/X+2KpPucqriiIeQwAd9kOnN97of0S/qUsjknTNI9E7LlTsimUgqoAk7upmW3aK+RGsolqOY
 +mdgr+LTL8saJnA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 15:32:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208652

Update to the 5.1.1 release of the 5.1 series for buildtools.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 scripts/install-buildtools | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/install-buildtools b/scripts/install-buildtools
index 4618d6a3ac6a2cc326251d4f3fca2ffd19514d00..b56910455d3d7d287b73f95418d1ad213a6722ae 100755
--- a/scripts/install-buildtools
+++ b/scripts/install-buildtools
@@ -57,8 +57,8 @@ logger = scriptutils.logger_create(PROGNAME, stream=sys.stdout)
 
 DEFAULT_INSTALL_DIR = os.path.join(os.path.split(scripts_path)[0],'buildtools')
 DEFAULT_BASE_URL = 'https://downloads.yoctoproject.org/releases/yocto'
-DEFAULT_RELEASE = 'yocto-5.1'
-DEFAULT_INSTALLER_VERSION = '5.1'
+DEFAULT_RELEASE = 'yocto-5.1.1'
+DEFAULT_INSTALLER_VERSION = '5.1.1'
 DEFAULT_BUILDDATE = '202110XX'
 
 # Python version sanity check

---
base-commit: 5915e70469fa53600dd8926ddafcb5459df1a32c
change-id: 20241212-intall-buildtools-5-1-1-2314d9a9ee7f

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>


