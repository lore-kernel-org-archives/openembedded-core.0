Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 574696FFEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:24:13 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id us13so9832275pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=tAdzaAspOiCoiz8JtK8bj3Sn6wo8vDwVnoBb8h1ylM7FlVkRXG2O22eh/cZAnpkPpH
	KLOhzCJWXIX6upgvCM4dm6gAaLAFz6y9vU5F30Y9edVlMFlLiKzifdRC71ZkUPKzpLBc
	B4VYXjPgDNFZzKMrPPMmq3H+w4UkN9spjGe1BnfxIJui15UlbTld/7buecrR5jhFvIyt
	SxoHcPmJOfaTzK2K0Uqgf6pF6vAQv16QAftcPOMNqn1KARJBmkek3Ve93yivpYf4qcXR
	yvf6jt9Kqs58aI++mYOjA11iqw3GGn+HuorNeHO/N4CocSB+uRpYGswGa2a0QYNonhaV
	+UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8+1I614lwAQIpWwXQKr6GQfVibCr9wdWyeiHjBVGSj0=;
	b=XPiF77Jsw74PyFpcUoAVIET26ZiHgYPKusI5zUU/6C85dZOZq4txxndiHEhHnT3Y81
	ltxw+q6elyvlYWqVOmCAeWJem9qqgJEmmhBceb8beDfiAnyURnh1pHYPBxlUMa5jHe2C
	xWnrTn1ERqyHbRYWvyV6ukX8RLtGVgiR0kUYpx6AG67YzvzTeyCPXFBFkChR3WkMJlky
	SbqoKV/Tv4n45WKSd46J29BMvYyDKbp+0aH3rEyYo8WhiE9uLvWhCJMdbYcNi/kC4TC4
	64E2UqVuANQ6MQibMOajmgGQdCMJ7PMgTZzpt+8awVm57phDeaalVSH0np2iEU14QUrW
	ZgIw==
X-Gm-Message-State: ALyK8tKJOAiUL8uCrHCLv8IfNQJo9Argg/3TPTaMhwv0mLbfS4+GQIjNphnnen+1suTymQ==
X-Received: by 10.66.32.197 with SMTP id l5mr1920117pai.62.1466389454644;
	Sun, 19 Jun 2016 19:24:14 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	b67sm32347269pfg.85.2016.06.19.19.24.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 19:24:14 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 19:23:45 -0700
Message-Id: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v2 1/4] linux-firmware : fix typo in LICENSE line for iwlwifi-6000g2b-5
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
X-List-Received-Date: Mon, 20 Jun 2016 02:24:14 -0000

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


