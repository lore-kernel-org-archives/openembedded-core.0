Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id C81A971AA1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 10:33:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13690185"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Dec 2016 18:33:44 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D20844670074
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 18:33:41 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.226.109) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Wed, 7 Dec 2016 18:33:46 +0800
From: root <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Dec 2016 18:33:13 +0800
Message-ID: <1481106793-126356-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.109]
X-yoursite-MailScanner-ID: D20844670074.A3094
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] xkeyboard-config: 2.18 -> 2.19
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
X-List-Received-Date: Wed, 07 Dec 2016 10:33:46 -0000
Content-Type: text/plain

Upgrade xkeyboard-config from 2.18 to 2.19

Signed-off-by: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../xorg-lib/xkeyboard-config_2.18.bb              | 31 ----------------------
 .../xorg-lib/xkeyboard-config_2.19.bb              | 31 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb

diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
deleted file mode 100644
index 79fcbd8..0000000
--- a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.18.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Keyboard configuration database for X Window"
-
-DESCRIPTION = "The non-arch keyboard configuration database for X \
-Window.  The goal is to provide the consistent, well-structured, \
-frequently released open source of X keyboard configuration data for X \
-Window System implementations.  The project is targeted to XKB-based \
-systems."
-
-HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
-BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
-
-LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
-
-SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
-SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
-SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
-
-SECTION = "x11/libs"
-DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
-
-EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
-
-FILES_${PN} += "${datadir}/X11/xkb"
-
-inherit autotools pkgconfig gettext
-
-do_install_append () {
-    install -d ${D}${datadir}/X11/xkb/compiled
-    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
-}
diff --git a/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
new file mode 100644
index 0000000..79fcbd8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.19.bb
@@ -0,0 +1,31 @@
+SUMMARY = "Keyboard configuration database for X Window"
+
+DESCRIPTION = "The non-arch keyboard configuration database for X \
+Window.  The goal is to provide the consistent, well-structured, \
+frequently released open source of X keyboard configuration data for X \
+Window System implementations.  The project is targeted to XKB-based \
+systems."
+
+HOMEPAGE = "http://freedesktop.org/wiki/Software/XKeyboardConfig"
+BUGTRACKER = "https://bugs.freedesktop.org/enter_bug.cgi?product=xkeyboard-config"
+
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0e7f21ca7db975c63467d2e7624a12f9"
+
+SRC_URI = "${XORG_MIRROR}/individual/data/xkeyboard-config/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "c28cf45616bfec276879360bc36c6b27"
+SRC_URI[sha256sum] = "c41d917d6c8a59feb7ccbda51c40a6ada824fdd1e9684b52dd48c9530617ddd0"
+
+SECTION = "x11/libs"
+DEPENDS = "intltool-native virtual/gettext util-macros libxslt-native"
+
+EXTRA_OECONF = "--with-xkb-rules-symlink=xorg --disable-runtime-deps"
+
+FILES_${PN} += "${datadir}/X11/xkb"
+
+inherit autotools pkgconfig gettext
+
+do_install_append () {
+    install -d ${D}${datadir}/X11/xkb/compiled
+    cd ${D}${datadir}/X11/xkb/rules && ln -sf base xorg
+}
-- 
2.7.4




