Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6500A60107
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 01:32:28 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c74so8878647pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 18:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=scsLkFHzVbix20t5L97go1F3Bhl3uzHLIg00FJbT3HC3QYliVQXVlWiiptHMD/2lNC
	2ZAIHLkDWV5T4o2X5sxugf650ar9ADD4I8lQuiZ+tbFLfccgt4RRxlswALCPRlmrb6QY
	ZaVNBZ+jaGG2ORrlLYShpLCpTan/Fxbe7uXLJ/EIhpHDspsORe9vFJeJB01xiS76GuTQ
	R0RxCtgqXwPZTp5J8cAcbFT3gPZR+BcfT/BWRuoRbya8RC9K3d2G9czNyJmETyjN6uLD
	NM/DY3TJ8gkXpQ2+tlEn1qpaOH7cNiOlFSud6bJnvDKsQcIsQGjhdw7NrOhQYa91uOPf
	AOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=D3C2m4yfJyoO41n2JGXgnXgkbI3LZU7Scnh7XNzUsAfgsVqsIFxHdGlFgVekdYxvWZ
	axmd44z5OP5aXZIxepnSdiQ+VN3IQa1NUCRL9naH+XQofdBSFUvapRXNuFhV6QruGotM
	otwhib2E75U7jpdNYciX66YJmJQwpbds/3qs7etFVmPF+qKIO3PD4MUDe8AYEwmdtuA+
	vq71At7lwfgjHdRYdFHhILPqlOAwYWgi7NXkkRihoz8aMSLut5cfnmdhu0BE/64RVXUB
	Q1vuzQfnpcWzDBCAoR7dY1KkhWIKtQAZ2jUtEqBiyQLRJ5/8yjvNgC2VriCotvTqQrQm
	gB3A==
X-Gm-Message-State: ALyK8tKuKL04fUN/Uhnn+uLlc2HdlmnFdQzSs6NFHsFK+iOHORgaJs6O27HGJH3/a1zaHg==
X-Received: by 10.98.72.150 with SMTP id q22mr12171493pfi.122.1466299949279;
	Sat, 18 Jun 2016 18:32:29 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	g63sm56257642pfb.7.2016.06.18.18.32.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 18:32:28 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2016 18:31:10 -0700
Message-Id: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 1/4] linux-firmware : fix typo in LICENSE line for iwlwifi-6000g2b-5
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Jun 2016 01:32:29 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 52fd176..c39a9ca 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -451,7 +451,7 @@ LICENSE_${PN}-iwlwifi-3160-9    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2a-6 = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-6000g2b-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2b-6 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-5    = "Firmware-iwlwifi_firmware"
-- 
2.1.4


