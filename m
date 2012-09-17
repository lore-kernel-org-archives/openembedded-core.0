Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1TDYoR-0008LA-8P
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Sep 2012 12:44:23 +0200
Received: by wgbdq11 with SMTP id dq11so2223324wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2012 03:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=no4O+QFDFFzohF9oi5EpFoCI/9oJWL6kD+XsY0UnIrI=;
	b=md0xKsyeg0j1eYSuy3TJPPVxmn/Sze89WsE2/nToCFvakWAXHQBKIorYgffKils3sZ
	pyvu7wgPwufw1hmPE3kwUxsiH8GrQrfMgfJ9CsUwGtJohLoihijj8Ky+oz+m8yz2J+7m
	x9Sgo57cknGhQJQfD0KfHo5F3gHds5s6soTKfBaSQ+Pc5jgTarn4iGCDsh0vRcnU1F8W
	T4yGA3dM9SieFVrypmZjifitgBgEWauMAUfLqGaENropvFVms4NgThY/c2shIN0EtBCh
	qvwQW9ydVaDSuI70ZPoGMKyaAPosWchsVyf1hZ7zqkGmL0L8aEMyZYX1Th1Ev8iuL5sI
	iJdw==
Received: by 10.216.88.145 with SMTP id a17mr2644615wef.0.1347877904589;
	Mon, 17 Sep 2012 03:31:44 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id t7sm24968727wix.6.2012.09.17.03.31.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:31:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Sep 2012 12:30:50 +0200
Message-Id: <1347877853-30738-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
References: <1347877853-30738-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmL0XKpcMyEvzrX7643Ic7RrK/fKl/kAcByn7zQk7d7aoPDKMlbRq5DkgW+fOf5XoKvcazH
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [for-denzil][bluez-updates 2/5] bluez-hcidump: upgrade to version 2.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 10:44:23 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../bluez/bluez-hcidump_2.3.bb                     |   20 --------------------
 .../bluez/bluez-hcidump_2.4.bb                     |   20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
 create mode 100644 meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb

diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
deleted file mode 100644
index 3a890df..0000000
--- a/meta/recipes-connectivity/bluez/bluez-hcidump_2.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool."
-DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
-and displays the commands, events and data in a human-readable form."
-
-SECTION = "console"
-DEPENDS = "bluez4"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
-                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
-PR = "r0"
-
-SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "0cc8ff247d05010e87e9125b31d335ff"
-SRC_URI[sha256sum] = "61c7e7dcad6ed8fce5f4bcc4a0f0d9a83c36642da404348388e6411d6f78d227"
-S = "${WORKDIR}/bluez-hcidump-${PV}"
-
-EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
-
-inherit autotools
diff --git a/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb b/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
new file mode 100644
index 0000000..194c04d
--- /dev/null
+++ b/meta/recipes-connectivity/bluez/bluez-hcidump_2.4.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Linux Bluetooth Stack HCI Debugger Tool."
+DESCRIPTION = "The hcidump tool reads raw HCI data coming from and going to a Bluetooth device \
+and displays the commands, events and data in a human-readable form."
+
+SECTION = "console"
+DEPENDS = "bluez4"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
+                    file://src/hcidump.c;beginline=1;endline=23;md5=3bee3a162dff43a5be7470710b99fbcf"
+PR = "r0"
+
+SRC_URI = "http://www.kernel.org/pub/linux/bluetooth/bluez-hcidump-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d39833de0ed26bddf784e9580b6f33c4"
+SRC_URI[sha256sum] = "bacd155e6420e480d8a30c0b0e6da990031890ee1000a31408e175ab7cf3cbd3"
+S = "${WORKDIR}/bluez-hcidump-${PV}"
+
+EXTRA_OECONF = "--with-bluez-libs=${STAGING_LIBDIR} --with-bluez-includes=${STAGING_INCDIR}"
+
+inherit autotools
-- 
1.7.7.6



