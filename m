Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TG81F-0001he-Fi
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 14:44:13 +0200
Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 05:31:24 -0700
Received: by wgbds1 with SMTP id ds1so2597486wgb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 05:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Q/JxXhXKh8etcpatvZfDFL812z2LIaffgCvVtB4+A54=;
	b=onMoY70ig48SAb8G2UCaagwwbI3D12pARs7dtQUI6/7CRhEke72hR8MowcwQpMSU2s
	dKJojT78w19hcPukkgPRqpPBvMscyLyVO8Xb1Lvuy4ZrccaNSAxEWehmjbplIBLW1a7Z
	9Z+eZm/BJOwoiHWE9h7/+wJ3KE1xaaeYQGtiREUqthclfeLB5jmYR4to5RojQJMn8Tvk
	BhQtWpOQSF8nSy+ZNghZc8gV21jtSIBj0yDDrISK3MxTk1Zb0nczy+t6vIfLKpyqIpW9
	5LrTyqo80ZsxVqxF6X7GRFyHiSk1Al+HmiFwGl/lmh+pb+lyhgqztiiSQ5hu4rJDJ2ju
	fVJw==
Received: by 10.216.212.3 with SMTP id x3mr7842137weo.31.1348489882409;
	Mon, 24 Sep 2012 05:31:22 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm16552955wid.1.2012.09.24.05.31.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 05:31:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2012 13:30:26 +0100
Message-Id: <1348489826-5105-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkQaJgNXNuhIL+RUrFK69o+XROhzWDABk1q5FQvWHW0/hvQ/vdCsefZcUp3nB2/Td7GTOpE
Subject: [PATCH] xf86-input-evdev: bump to latest release
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
X-List-Received-Date: Mon, 24 Sep 2012 12:44:13 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-driver/xf86-input-evdev_2.7.0.bb          |   21 --------------------
 .../xorg-driver/xf86-input-evdev_2.7.3.bb          |   20 +++++++++++++++++++
 2 files changed, 20 insertions(+), 21 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.0.bb
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.0.bb
deleted file mode 100644
index 2a04e73..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-require xorg-driver-input.inc
-
-SUMMARY = "X.Org X server -- event devices (evdev) input driver"
-
-DESCRIPTION = "evdev is an Xorg input driver for Linux's generic event \
-devices. It therefore supports all input devices that the kernel knows \
-about, including most mice and keyboards. \
-\
-The evdev driver can serve as both a pointer and a keyboard input \
-device, and may be used as both the core keyboard and the core pointer. \
-Multiple input devices are supported by multiple instances of this \
-driver, with one Load directive for evdev in the Module section of your \
-xorg.conf for each input device that will use this driver. "
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
-
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "4449b2e94900e98d2f41c2f46dd0397e"
-SRC_URI[sha256sum] = "3ee1feee0ccf748005ca30b0993d0c1b80f85158b726745f9e0cb220902d6ec7"
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
new file mode 100644
index 0000000..d979622
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.7.3.bb
@@ -0,0 +1,20 @@
+require xorg-driver-input.inc
+
+SUMMARY = "X.Org X server -- event devices (evdev) input driver"
+
+DESCRIPTION = "evdev is an Xorg input driver for Linux's generic event \
+devices. It therefore supports all input devices that the kernel knows \
+about, including most mice and keyboards. \
+\
+The evdev driver can serve as both a pointer and a keyboard input \
+device, and may be used as both the core keyboard and the core pointer. \
+Multiple input devices are supported by multiple instances of this \
+driver, with one Load directive for evdev in the Module section of your \
+xorg.conf for each input device that will use this driver. "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
+
+PR = "${INC_PR}.0"
+
+SRC_URI[md5sum] = "f68920ce2921a88b4662acc972bf3a4a"
+SRC_URI[sha256sum] = "eb389413602c3d28c44bbfab0477c98582f0e2f5be5f41986e58e93a033fa504"
-- 
1.7.10



