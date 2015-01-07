Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDD47284C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 22:30:43 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id b13so2029469wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 14:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=OPKTdMFUgu7JelkAaRjHuYS6E1AFfkd+H8iR9o6nXnM=;
	b=OCJCh9KjUydZCIqoaXYNNHmsBQuFh4UkDp+CkgK1+AnUH4njKEjOpJ3o1Ee2DGCbUx
	Rm8L3/w/jZBYei1YppJwkyYj3qDua7dGqCg2ikmPftjYZbIevjRy4U/Qhy6rjfs9pToO
	GGfYkfe8s+6eUZyfPTC4SZ2s8FTHNbxtR/wcvYCzUMBxi0J5+JKtVY3Um0hOKb16HoOO
	x4p47DUyTNRtC2oXe14q13SLBnSy4B3w0S2FFHiLUXNdNmb/8iHJcieKPpLm1IL5/S1V
	pZ0/bkc7kqJeXc3KrfAc/FCVyfJ6KOTf2GCnwF1e0tmHGOf8GUuVPBHNQz/E/cJ+CN3j
	TJbg==
X-Received: by 10.194.104.196 with SMTP id gg4mr11040540wjb.31.1420669844410; 
	Wed, 07 Jan 2015 14:30:44 -0800 (PST)
Received: from Saturn.local.all (212-41-121-234.adsl.solnet.ch.
	[212.41.121.234])
	by mx.google.com with ESMTPSA id lg7sm4204690wic.0.2015.01.07.14.30.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 14:30:43 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jan 2015 23:29:57 +0100
Message-Id: <1420669797-17688-4-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1420669797-17688-1-git-send-email-max.krummenacher@toradex.com>
References: <1420669797-17688-1-git-send-email-max.krummenacher@toradex.com>
Cc: Max Krummenacher <max.oss.09@gmail.com>
Subject: [oe][PATCH V2 3/3] pcmanfm: update to 1.2.3
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
X-List-Received-Date: Wed, 07 Jan 2015 22:30:44 -0000

From: Max Krummenacher <max.oss.09@gmail.com>

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


