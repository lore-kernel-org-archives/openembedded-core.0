Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1REHJl-0006zI-6z
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:11:10 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D95Pw7004395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:05:25 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 02:05:25 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 17:05:36 +0800
Message-ID: <604d642870b01d3eed3c469dc42faf7d73433f52.1318496401.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 4/4] xinput-calibrator: add touchscreen support
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
X-List-Received-Date: Thu, 13 Oct 2011 09:11:10 -0000
Content-Type: text/plain

Add the xinput_calibrator package to support evdev touchscreens,
which both programs the xinput settings and writes out xorg.conf
information that can be used to initialize the touchscreen in
subsequent X start-ups.

Add dependency pointercal-xinput at same time.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../pointercal-xinput/bug20/pointercal.xinput      |    1 +
 .../pointercal-xinput/iphone3g/pointercal.xinput   |    1 +
 .../pointercal-xinput/nokia900/pointercal.xinput   |    2 +
 .../pointercal-xinput/om-gta01/pointercal.xinput   |    2 +
 .../pointercal-xinput/om-gta02/pointercal.xinput   |    2 +
 .../pointercal-xinput/pointercal.xinput            |    1 +
 .../xinput-calibrator/pointercal-xinput_0.0.bb     |   21 +++++++++++++++++
 .../xinput-calibrator/xinput-calibrator_0.7.5.bb   |   24 ++++++++++++++++++++
 8 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
 create mode 100644 meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
 create mode 100644 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb

diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
new file mode 100644
index 0000000..50e2632
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/bug20/pointercal.xinput
@@ -0,0 +1 @@
+xinput set-int-prop "TSC2004 Touchscreen" "Evdev Axis Calibration" 32 239 10 232 6;
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
new file mode 100644
index 0000000..d6ce56b
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/iphone3g/pointercal.xinput
@@ -0,0 +1 @@
+xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 -102 4739 6 7321;
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
new file mode 100644
index 0000000..66bb32c
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/nokia900/pointercal.xinput
@@ -0,0 +1,2 @@
+xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 204 3897 3763 178;
+
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
new file mode 100644
index 0000000..be25da3
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta01/pointercal.xinput
@@ -0,0 +1,2 @@
+xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 911 98
+xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
new file mode 100644
index 0000000..be25da3
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/om-gta02/pointercal.xinput
@@ -0,0 +1,2 @@
+xinput set-int-prop "Touchscreen" "Evdev Axis Calibration" 32 107 918 911 98
+xinput set-int-prop "Touchscreen" "Evdev Axes Swap" 8 1
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
new file mode 100644
index 0000000..9633fc5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput/pointercal.xinput
@@ -0,0 +1 @@
+# replace with valid machine specific pointercal.xinput
diff --git a/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
new file mode 100644
index 0000000..5b7b967
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/pointercal-xinput_0.0.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Touchscreen calibration data from xinput-calibrator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SECTION = "base"
+
+PR = "r0"
+
+SRC_URI = "file://pointercal.xinput"
+S = "${WORKDIR}"
+
+do_install() {
+	# Only install file if it has a contents
+	if [ -s ${S}/pointercal.xinput ]; then
+	        install -d ${D}${sysconfdir}/
+	        install -m 0644 ${S}/pointercal.xinput ${D}${sysconfdir}/
+	fi
+}
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+CONFFILES_${PN} = "${sysconfdir}/pointercal.xinput"
diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
new file mode 100644
index 0000000..879f7e5
--- /dev/null
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_0.7.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A generic touchscreen calibration program for X.Org"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/xinput_calibrator"
+LICENSE = "MIT/X11"
+LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=998e238a7638a7446eaeb02398f691fc"
+DEPENDS = "virtual/libx11 libxi"
+
+inherit autotools
+
+RDEPENDS_${PN} = "xinput"
+RRECOMMENDS_${PN} = "pointercal-xinput"
+
+PR = "r0"
+
+SRC_URI = "http://github.com/downloads/tias/xinput_calibrator/xinput_calibrator-${PV}.tar.gz"
+SRC_URI[md5sum] = "20da0a2055a5a75962add8c6b44f60fa"
+SRC_URI[sha256sum] = "baa4ddca49ec94c27ba4c715bfa26692fec1132103e927213c3169e475d3d971"
+
+S = "${WORKDIR}/xinput_calibrator-${PV}"
+
+do_install_append() {
+        install -d ${D}${bindir}
+        install -m 0755 scripts/xinput_calibrator_pointercal.sh ${D}${bindir}/xinput_calibrator_once.sh
+        install -m 0755 scripts/xinput_calibrator_get_hal_calibration.sh ${D}${bindir}/xinput_calibrator_get_hal_calibration.sh
+}
-- 
1.7.5.1.300.gc565c



