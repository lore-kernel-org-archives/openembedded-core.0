Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 831BA6A38A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:24 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 499739532
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:25 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:17 +0100
Message-Id: <1369134259-12091-7-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v3 6/8] New clutter-gtk recipe (1.4.2)
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
X-List-Received-Date: Tue, 21 May 2013 11:04:25 -0000

From: Tomas Frydrych <tomas@sleepfive.com>


Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc      |   12 ++++++++++++
 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb |    6 ++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb

diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
new file mode 100644
index 0000000..3717f48
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0.inc
@@ -0,0 +1,12 @@
+DESCRIPTION = "ClutterGtk"
+HOMEPAGE = "http://www.clutter-project.org/"
+LICENSE = "LGPLv2+"
+
+inherit clutter
+
+DEPENDS = "clutter-1.0 gtk+3"
+PACKAGES  =+ "${PN}-examples"
+AUTOTOOLS_AUXDIR = "${S}/build"
+
+EXTRA_OECONF += "--disable-introspection"
+
diff --git a/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb
new file mode 100644
index 0000000..64eb70c
--- /dev/null
+++ b/meta/recipes-graphics/clutter/clutter-gtk-1.0_1.4.2.bb
@@ -0,0 +1,6 @@
+require clutter-gtk-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
+
+SRC_URI[archive.md5sum] = "842601b584daf4447a46799a4ba88df6"
+SRC_URI[archive.sha256sum] = "dc3ec6e90bc742c8a68ed7fa4c0d25b9b376828f1a7f013c363fbaf14f3a6974"
-- 
1.7.10.4


