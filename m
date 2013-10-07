Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4C81260FAF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Oct 2013 17:49:19 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so5247218wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Oct 2013 10:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PM/0covZvoi4WixWA60ooNzq+ZqG84khSNE3+GdhMeQ=;
	b=aml44V5vdcG/bMkYHJzG8Mmz6nxefYRHnT5ZUU5zqrWS4lhFGxC3Rai2yykcrml3q3
	eKgvqdHC9Oe8M3rSNINvw9wNQZMF8VR9PeBkEhqEtRtOHO+ySmFtup9ZR0hzdwIJ00Fw
	ijBIKl1ups5Gkb9WDL0HWnWfdJQB6oO+/6zjN9sxcKf32gJFqo01Eep9xf1+iyafep4/
	TKFSRoA3nCWBZ7lHkTUewdqvBTSyfBnJJ5gdKd0BUkYR5nHIO2Xw1cL9daA9IBB1RO3w
	z1agowQ2+bj/oSOhluPxc4hUY2G0RY7oC1xLkCGMkE9wpQ7wKakOJLTPbo/HU4YYvhkX
	7E7w==
X-Gm-Message-State: ALoCoQmJmhPzk2mqgPNypQXGVPuV3e7vl0dXKQgtITKUgayXbiL02hDmdU5WffQW4wyAgjowMcGR
X-Received: by 10.194.219.1 with SMTP id pk1mr6683693wjc.36.1381168160847;
	Mon, 07 Oct 2013 10:49:20 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id jf2sm41481831wic.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Oct 2013 10:49:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Oct 2013 18:49:10 +0100
Message-Id: <1381168150-25518-5-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
References: <1381168150-25518-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 5/5] at-spi2-gtk: upgrade to 2.10.0
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
X-List-Received-Date: Mon, 07 Oct 2013 17:49:19 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.10.0.bb |   19 +++++++++++++++++++
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 -------------------
 2 files changed, 19 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.10.0.bb
 delete mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.10.0.bb b/meta/recipes-support/atk/at-spi2-atk_2.10.0.bb
new file mode 100644
index 0000000..f8cb4e6
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-atk_2.10.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "AT-SPI 2 Toolkit Bridge"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "38e4f7e2898f7ba3cc3ec269d9402789"
+SRC_URI[sha256sum] = "dea7ff2f9bc9bbdb0351112616d738de718b55739cd2511afecac51604c31a94"
+
+DEPENDS = "dbus glib-2.0 atk at-spi2-core"
+
+inherit autotools
+
+PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
+
+FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
+FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
diff --git a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
deleted file mode 100644
index 32cbe3b..0000000
--- a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "AT-SPI 2 Toolkit Bridge"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
-
-MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
-
-SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "854e36a2538bea50bc08d33aa9499bb2"
-SRC_URI[sha256sum] = "eb659b94fde6dc0a2f584c9121a5e6d39a4c8aa297d21d8f9032f7a8a775fd06"
-
-DEPENDS = "dbus glib-2.0 atk at-spi2-core"
-
-inherit autotools
-
-PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
-
-FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
-FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
-FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
-- 
1.7.10.4


