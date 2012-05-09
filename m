Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SRuuj-0000cC-MM
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 02:37:58 +0200
Received: by dalh21 with SMTP id h21so8590342dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 May 2012 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=p+2ke8yK4C58x9A/Z+dYy8CwDIcJeuK6+LO/9wdHL0c=;
	b=GU2h74JacxslINTLzUFTXn1RiacdaYaUDCxngCIEaf4RHmVqvrvCX2MvUvuHV01O72
	WJvHewbZ/fMMfroFInqnkBUoWYnSDTZ/Pr8lJ9qf4uVKPTTmEtsN3R4XB1pJEIVHzF0o
	7iryJ8fZFomDpzto4wvZBGJ7lnainwBtZX37Y2ceapYNOIpinXD2R1u7NgSZaObELkOf
	2RZsoJ+V+2Qxq9XQcY6AIdtBiWK0CzwpzT9bskf8WPNz2J6YT48DHn5A9vrFC+Nn3i+D
	yGRbqrjgcUjOFqOq4+WJJQ6lYTYt3SnSxjwSGu4FDQnmxjQSQ8AxFecxM2hBBKSPCesW
	LX/g==
Received: by 10.68.224.196 with SMTP id re4mr1582374pbc.111.1336523284890;
	Tue, 08 May 2012 17:28:04 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qk5sm4002909pbc.45.2012.05.08.17.28.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 May 2012 17:28:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 17:27:47 -0700
Message-Id: <c71e064c1bc5ed0da06bb626d3cf896bd20226c2.1336522880.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
References: <2c51f2017955dff27ab68c1f4165309567864ee5.1336522880.git.raj.khem@gmail.com>
In-Reply-To: <cover.1336522880.git.raj.khem@gmail.com>
References: <cover.1336522880.git.raj.khem@gmail.com>
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
X-List-Received-Date: Wed, 09 May 2012 00:37:58 -0000

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



