Return-Path: <max.oss.09@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id CC709727C6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jan 2015 21:25:22 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id r20so1140477wiv.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jan 2015 13:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5AFTvPVRCRb7X2oC8I/7joGO+zmH0ttmvcGfCf9gAtQ=;
	b=jxheWWOlzqmlq2LN4LYyzp4MjhWPZrKgvVDBwTnZvIN3mXO4p7mCHWIMkBdWgiho4q
	ZFPib7XZgpdqRMSHVmpawJnoKq1Xy26/KRMu96QCTcvYZ8lMWFdt7K8OtT2ro12PcC1h
	pjM4ylY2ia15d0tAkRYqxsS+N4O9jQnO0cCtdPdoDMf40Kxr1A1kKUlBaqbqMm+53efF
	31249ygRqQyXnaKw79UKrBa10TePb0DY0hmv469epv0fxYV08F67Ws8kh6iiqh54SjKe
	hrHAfVsb3mFoWRaM+Yl4CPGMQAezhBGNN0mF9mPv5ZrRZE3Tr2RxDX4C8nkKZqSb5pc1
	V9EQ==
X-Received: by 10.180.37.142 with SMTP id y14mr1188380wij.47.1420233922995;
	Fri, 02 Jan 2015 13:25:22 -0800 (PST)
Received: from Saturn.local.all (212-41-114-243.adsl.solnet.ch.
	[212.41.114.243]) by mx.google.com with ESMTPSA id
	u18sm65897114wjq.42.2015.01.02.13.25.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jan 2015 13:25:22 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jan 2015 22:25:04 +0100
Message-Id: <1420233904-26745-4-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
References: <1420233904-26745-1-git-send-email-max.oss.09@gmail.com>
Subject: [oe][PATCH 3/3] pcmanfm: update to 1.2.3
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
X-List-Received-Date: Fri, 02 Jan 2015 21:25:25 -0000

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb | 33 ----------------------------
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb | 35 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 33 deletions(-)
 delete mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
 create mode 100644 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb

diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
deleted file mode 100644
index 14c5cd5..0000000
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.1.2.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Fast lightweight tabbed filemanager"
-HOMEPAGE = "http://pcmanfm.sourceforge.net/"
-
-LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
-                    file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
-                    file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
-
-SECTION = "x11"
-DEPENDS = "gtk+ startup-notification libfm intltool-native"
-DEPENDS_append_poky = " libowl"
-
-
-COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.gz \
-	   file://gnome-fs-directory.png \
-	   file://gnome-fs-regular.png \
-	   file://gnome-mime-text-plain.png \
-	   file://emblem-symbolic-link.png \
-	   file://no-desktop.patch"
-
-SRC_URI[md5sum] = "41104699e653ff2b0a9a9e80a257d6a2"
-SRC_URI[sha256sum] = "23ee33b34066ac83ce9a98bc9930049e69839438fb60489bd453bec8c2068950"
-
-inherit autotools pkgconfig
-
-do_install_append () {
-	install -d ${D}/${datadir}
-	install -d ${D}/${datadir}/pixmaps/
-
-	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
-}
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
new file mode 100644
index 0000000..14f58ae
--- /dev/null
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -0,0 +1,35 @@
+SUMMARY = "Fast lightweight tabbed filemanager"
+HOMEPAGE = "http://pcmanfm.sourceforge.net/"
+
+LICENSE = "GPLv2 & GPLv2+ & LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
+                    file://src/pcmanfm.h;endline=22;md5=417b3855771a3a87f8ad753d994491f0 \
+                    file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
+
+SECTION = "x11"
+DEPENDS = "gtk+ startup-notification libfm intltool-native"
+DEPENDS_append_poky = " libowl"
+
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|aarch64.*|arm.*|mips.*|powerpc.*|sh.*)-(linux|freebsd.*)'
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
+	   file://gnome-fs-directory.png \
+	   file://gnome-fs-regular.png \
+	   file://gnome-mime-text-plain.png \
+	   file://emblem-symbolic-link.png \
+	   file://no-desktop.patch"
+
+SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
+SRC_URI[sha256sum] = "cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"
+
+inherit autotools pkgconfig
+
+do_install_append () {
+	install -d ${D}/${datadir}
+	install -d ${D}/${datadir}/pixmaps/
+
+	install -m 0644 ${WORKDIR}/*.png ${D}/${datadir}/pixmaps
+}
+
+FILES_${PN} += "${libdir}/pcmanfm"
-- 
1.8.4.5


