Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0558460107
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 01:33:06 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id c74so8879254pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jun 2016 18:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rnqwTHscqRSKGulLnNTzVrGFOpJefZpSf+4mQmoFFsY=;
	b=QmLbgC/LH5E/WdH3BGGnCwJTGxGrvtq9uuWV28iQQ5YRePupQccX7jjWuBCFhxMQbS
	NALnejDGcL2hfQGZ3FWTFNOPhoVfI7lJ5v9CYNyp/obBKjB5ey4MAvb8/qspjVk/8wEB
	lDZ65yiNhSnKb0OP+tgaLajmdGhzfTstSTH5HLijQAU9LcTRC9BppBHMJSzgas/3gj2s
	6k/5GD8wOklYFZIFy65qnTSjFX9C36WGLdvm3ty2DBEMeyJlP2gzvMqS9BBgfwBJfkT0
	21Yt7MdEthWnK5gnwbfYnbxEoo7Jb5wdbyfhxo6VzyoDV8ZrtAMzrThgCc5rbtwouaSe
	V0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rnqwTHscqRSKGulLnNTzVrGFOpJefZpSf+4mQmoFFsY=;
	b=gWDxG8EPJmPHU0zfAE3QjwB5aT1rD4KSylIwnpamvCc9aNMClvd/1Wr6hgJcYeGJhG
	zo8teM1gIzd5dsdMXy4u5RLlOZAktA97u6fsLzs56Hlhep6uCFODJeN7rtGmaG9lFwDZ
	M5+bcBdQvrRlDG4HLStjMH7reJGvGLlPqCGL61Wn9gX4bSWA6DGGKNjwSXeWnwhEzK80
	qAVGmRWVs7f2Xcuy0YRQ4vNQDyNfjMHAThfsO39ncKFM5kDjF1vjv4eJnWV7MGw81Jft
	bgyKONP76w7Ym8M/T/AD4tzlHs5K37nRv8TbyfOglSIYUcV6GNyV+YRU9dfRAlEG6ldj
	kfWw==
X-Gm-Message-State: ALyK8tIawzvOj0lcY5LhInLZ7LdlpzHiZM7C3XB6cAmRyfoYwEYivFkIY6XRLEvKU2MUnA==
X-Received: by 10.98.9.68 with SMTP id e65mr12188357pfd.121.1466299986606;
	Sat, 18 Jun 2016 18:33:06 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	g63sm56257642pfb.7.2016.06.18.18.33.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 18 Jun 2016 18:33:05 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2016 18:31:13 -0700
Message-Id: <1466299873-8445-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466299873-8445-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH 4/4] linux-firmware : add iwlwifi virtual package of all iwlwifi firmwares
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
X-List-Received-Date: Sun, 19 Jun 2016 01:33:08 -0000

From: Christopher Clark <christopher.clark6@baesystems.com>

Depends upon all available iwlwifi firmware packages at build time.

Motivation: simplifies inclusion of all Intel wifi firmwares.

Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index cdc7315..c328cc9 100644
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
 
+ALLOW_EMTPY_${PN}-iwlwifi = "1"
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


