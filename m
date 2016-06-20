Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3EB63602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 17:49:32 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id us13so11408414pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 10:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=egeCtyc4kbWUDiqjKrz+j1/t2n9mR4wm5z+rAiYUlCs=;
	b=uefaZWybLYLMnqjq3qhSyy0epM95VIkLHlNlQgIipU/0ayZrQZzWQH7rNLsJswiuNj
	TMYWPNbew8gd8g8dsqqXcndaoSQmqPUF1miIpmm6jPAIDdMHIepqETov2qtwLRzbw7x1
	j6Iq5GuwBgip1fBueuQYC5IhWxpdD5wpzcdJGuHJpGq/Zh1fKwtkFEsZD7KCDWiEQWSE
	vbEeyn2U6RUMS9jbfDWVItjkpYY8orbv+BFl+2Qpv78Cu1LQmOPCj93g++t5u1jH3d9X
	pK4x8ji6Le3KFBpD6lE4dXTDL7cpFTuHY41oP/QKzHpdbgXARrsO9+8dXu5m9wgcKqt3
	FEyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=egeCtyc4kbWUDiqjKrz+j1/t2n9mR4wm5z+rAiYUlCs=;
	b=XLPmHNfZt/6979XvUtBmXZO2uNK50ZTj5k6KCIIaZcdfZxephFCWTyzXcqjHbrTf04
	1QdY1AMZWYmLIcmdJCY1m+Ls+Awsg++YCqHLHiiNKyZmoZ5s+q4wN5qxCWjvUOHMQXf1
	jxV+8EAP+ZSylsuU40kFtI13UXI1j7FpIQFw1pzgwGcri/vU6CTgHJ88ypScgVw3ooUO
	DASoZDm9E4qd/d5nJw2N601mEMMbckbV7A2ncNZJN7eJcwLfc2JfOIjd4+haqVVOF6sG
	jPkYHdRA3t3kT8X0iJfyJzlMGaaRH1suQGJtT2IH/ubJV2ivIORRFqjDqNWWZJ6P1Hac
	3nfA==
X-Gm-Message-State: ALyK8tIwy5S1MqiwR3pEf055QBz/YuYFBJ0WTN9+1uQFVDN7ay/gjHngWG8GtwwgnX32Ug==
X-Received: by 10.66.121.136 with SMTP id lk8mr22883717pab.51.1466444973596;
	Mon, 20 Jun 2016 10:49:33 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	i187sm56862025pfc.62.2016.06.20.10.49.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Jun 2016 10:49:33 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2016 10:48:54 -0700
Message-Id: <1466444935-16308-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466444935-16308-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v3 4/5] linux-firmware : add iwlwifi virtual package of all iwlwifi firmwares
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
X-List-Received-Date: Mon, 20 Jun 2016 17:49:33 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Depends upon all available iwlwifi firmware packages at build time.
Fix typo in ALLOW_EMPTY of earlier version.

Motivation: simplifies inclusion of all Intel wifi firmwares.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index cdc7315..947e79b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -220,7 +220,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
              \
-             ${PN}-iwlwifi-license ${PN}-iwlwifi-135-6 \
+             ${PN}-iwlwifi-license ${PN}-iwlwifi \
+             ${PN}-iwlwifi-135-6 \
              ${PN}-iwlwifi-3160-7 ${PN}-iwlwifi-3160-8 ${PN}-iwlwifi-3160-9 \
              ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 \
              ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
@@ -444,6 +445,7 @@ FILES_${PN}-whence-license = "/lib/firmware/WHENCE"
 RDEPENDS_${PN}-bnx2-mips += "${PN}-whence-license"
 
 # For iwlwifi
+LICENSE_${PN}-iwlwifi           = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-135-6     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-7    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-3160-8    = "Firmware-iwlwifi_firmware"
@@ -498,6 +500,8 @@ RDEPENDS_${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 
+ALLOW_EMPTY_${PN}-iwlwifi = "1"
+
 # Handle package updating for the newly merged iwlwifi groupings
 RPROVIDES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9"
 RREPLACES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9"
@@ -571,7 +575,11 @@ RDEPENDS_${PN} += "${PN}-license"
 RDEPENDS_${PN} += "${PN}-whence-license"
 
 # Make linux-firmware depend on all of the split-out packages.
+# Make linux-firmware-iwlwifi depend on all of the split-out iwlwifi packages.
 python populate_packages_prepend () {
     firmware_pkgs = oe.utils.packages_filter_out_system(d)
     d.appendVar('RDEPENDS_linux-firmware', ' ' + ' '.join(firmware_pkgs))
+
+    iwlwifi_pkgs = filter(lambda x: x.find('-iwlwifi-') != -1, firmware_pkgs)
+    d.appendVar('RDEPENDS_linux-firmware-iwlwifi', ' ' + ' '.join(iwlwifi_pkgs))
 }
-- 
2.1.4


