Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id EAB9D7318D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 02:24:40 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id us13so9833073pab.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 19:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=egeCtyc4kbWUDiqjKrz+j1/t2n9mR4wm5z+rAiYUlCs=;
	b=RUyxrJnToWlucIcuPLtMOPaTyas2ny5loh1Pe+RfARCyIeX+nvDo++A+H/aIVR1X5i
	pFE8rDlKK2fJ0GoTzaYUKiIz9AkssIggemcAAoS/yOJTWAmOFjW8ro7ZvIqpm9aDqtOj
	Scn4N6YVJeKD7UCcpx/cvux+lYJKgid8jQuGE8GHD3PxU8NqSf7amgbRkGzHnyfpQm4X
	gfpYeeN9nnxkR7bZrvDu7/JBeYad10nRAdnFTYbkq9uhrjdoZfBB5WMkHoJ5K1e7Z0Mo
	ZDaYS8UffAb4XkG8XabMdO3L+QdbiSvKh7tscIuosjj2cKRkhSgmNDoawfa7za2gOXre
	3yvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=egeCtyc4kbWUDiqjKrz+j1/t2n9mR4wm5z+rAiYUlCs=;
	b=XN1F+5GEPK+V35Zyk+G6yfsybF6TghEgzUCpBygVpfkAMMcOHJdxblpPExgQLs9yvM
	eEwWsG2tJNYo5PbYWU+iDs106kK0UcCGWobpnjhiaAtfhL1JHMIkgbBGNo38QNM6EN+s
	oumX61e9ZY+SBRXHvsZaSAIP1xL1GXouEmrk1UuCGI6VGkAw1n8wbwO/MeSd5ud29msV
	qVN4/vCpZzm0s6IS1pbBK0SncNVKM4TZ+slEByIxVLImYjq9T3QSio49+giYv1sfN5fB
	94aDz4wxrLm1mKDdyuUV4So47K1dJcN1AbECjLS8gwozT76KFzWfLeDuK0WOGH3kH4Be
	jsVg==
X-Gm-Message-State: ALyK8tLrDyWmvJvCBBY5z+uvKLebSbKT0HcLwDoGawiih5ZdTWR11AAEWQ/BJ1jcPcvXSA==
X-Received: by 10.66.222.202 with SMTP id qo10mr18418090pac.141.1466389481357; 
	Sun, 19 Jun 2016 19:24:41 -0700 (PDT)
Received: from localhost.localdomain
	(static-50-53-79-155.bvtn.or.frontiernet.net. [50.53.79.155])
	by smtp.gmail.com with ESMTPSA id
	b67sm32347269pfg.85.2016.06.19.19.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 19 Jun 2016 19:24:40 -0700 (PDT)
From: christopher.w.clark@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Jun 2016 19:23:48 -0700
Message-Id: <1466389428-4438-4-git-send-email-christopher.w.clark@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
References: <1466389428-4438-1-git-send-email-christopher.w.clark@gmail.com>
Cc: Christopher Clark <christopher.clark6@baesystems.com>
Subject: [PATCH v2 4/4] linux-firmware : add iwlwifi virtual package of all iwlwifi firmwares
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
X-List-Received-Date: Mon, 20 Jun 2016 02:24:41 -0000

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


