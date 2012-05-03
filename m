Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPmzd-0000nq-4M
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 05:46:13 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so1652799pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 20:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=p+2ke8yK4C58x9A/Z+dYy8CwDIcJeuK6+LO/9wdHL0c=;
	b=R7nGchoCVEvE1iRf86dcR7Nbbfvz83C8hxkrmet+QcNA3qQk8ssJSZiHGwwkckM0rD
	hdAki4IDoqJ/GWYHM3DXq08cJPXsb7FrGZVeSFo5TCb4xRDw0L6S/na+4nTTGIakcJRK
	mPAI2UY0E7ziSZaplyT68JPzwDAU4YnYqJexxALtzYfqz5v5UUgikfTNx7Bwkig86C+B
	KGVv3Z/iK6ow9K6ivpBLXGQrEUTue3xQkD008Vp3yarNz0UxATQIcfiMeQVT/DIMWE7m
	KpVauvuqjJscBURBeQn2QekL0sYX/oIhxceRRtHhiuyzO9mqxoECD5VJzRA37vfoKsE/
	UyNA==
Received: by 10.68.134.232 with SMTP id pn8mr3090483pbb.106.1336016190012;
	Wed, 02 May 2012 20:36:30 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id nt8sm3883458pbb.12.2012.05.02.20.36.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 20:36:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 May 2012 20:35:31 -0700
Message-Id: <2236dacc751fec76cdd8428f4063c91a1d59a62d.1336015963.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
References: <e6ccd54276855728be4e18f3fab28136736963a1.1336015963.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336015963.git.raj.khem@gmail.com>
References: <cover.1336015963.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] xserver-xf86-config: Add xorg.conf for arm, mips, ppc, sh qemu machines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 May 2012 03:46:13 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xserver-xf86-config/qemuarm/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips/xorg.conf         |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemumips64/xorg.conf       |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemuppc/xorg.conf          |   69 ++++++++++++++++++++
 .../xserver-xf86-config/qemush4/xorg.conf          |   69 ++++++++++++++++++++
 .../xorg-xserver/xserver-xf86-config_0.1.bb        |    2 +-
 6 files changed, 346 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuarm/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemumips64/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemuppc/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
new file mode 100644
index 0000000..629ae21
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemush4/xorg.conf
@@ -0,0 +1,69 @@
+
+Section "Files"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Generic Keyboard"
+    Driver        "evdev"
+    Option        "CoreKeyboard"
+    Option        "Device"      "/dev/input/by-path/platform-i8042-serio-0-event-kbd"
+    Option        "XkbRules"    "xorg"
+    Option        "XkbModel"    "evdev"
+    Option        "XkbLayout"    "us"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Configured Mouse"
+    Driver        "mouse"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/mice"
+    Option        "Protocol"        "ImPS/2"
+    Option        "ZAxisMapping"        "4 5"
+    Option        "Emulate3Buttons"    "true"
+EndSection
+
+Section "InputDevice"
+    Identifier    "Qemu Tablet"
+    Driver        "evdev"
+    Option        "CorePointer"
+    Option        "Device"        "/dev/input/touchscreen0"
+    Option        "USB"           "on"
+EndSection
+
+Section "Device"
+    Identifier    "Graphics Controller"
+    Driver        "fbdev"
+EndSection
+
+Section "Monitor"
+    Identifier    "Generic Monitor"
+    Option        "DPMS"
+    # 1024x600 59.85 Hz (CVT) hsync: 37.35 kHz; pclk: 49.00 MHz
+    Modeline "1024x600_60.00"   49.00  1024 1072 1168 1312  600 603 613 624 -hsync +vsync
+    # 640x480 @ 60Hz (Industry standard) hsync: 31.5kHz
+    ModeLine "640x480"    25.2  640  656  752  800    480  490  492  525 -hsync -vsync
+    # 640x480 @ 72Hz (VESA) hsync: 37.9kHz
+    ModeLine "640x480"    31.5  640  664  704  832    480  489  491  520 -hsync -vsync
+    # 640x480 @ 75Hz (VESA) hsync: 37.5kHz
+    ModeLine "640x480"    31.5  640  656  720  840    480  481  484  500 -hsync -vsync
+    # 640x480 @ 85Hz (VESA) hsync: 43.3kHz
+    ModeLine "640x480"    36.0  640  696  752  832    480  481  484  509 -hsync -vsync
+EndSection
+
+Section "Screen"
+    Identifier    "Default Screen"
+    Device        "Graphics Controller"
+    Monitor        "Generic Monitor"
+    SubSection "Display"
+        Modes     "640x480"
+    EndSubSection
+EndSection
+
+Section "ServerLayout"
+    Identifier    "Default Layout"
+    Screen        "Default Screen"
+    InputDevice    "Generic Keyboard"
+    # InputDevice    "Configured Mouse"
+    InputDevice    "QEMU Tablet"
+    Option         "AllowEmptyInput" "no"
+EndSection
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
index 970b4bd..3c29f8b 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config_0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.x.org"
 SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r10"
+PR = "r11"
 
 SRC_URI = "file://xorg.conf"
 
-- 
1.7.5.4



