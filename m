Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 11 Apr 2017 08:02:12 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 1FBEC77CFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:02:12 +0000 (UTC)
Received: from localhost.localdomain (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 7A8DF45252
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 09:54:51 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 09:54:45 +0200
Message-Id: <1491897285-6179-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kmscube: add recipe
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
X-List-Received-Date: Tue, 11 Apr 2017 08:02:13 -0000

This is a useful tool to test KMS and GBM-based EGL & OpenGL ES drawing

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/recipes-graphics/kmscube/kmscube_git.bb

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
new file mode 100644
index 0000000..518c98e
--- /dev/null
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Demo application to showcase 3D graphics using kms and gbm"
+HOMEPAGE = "https://cgit.freedesktop.org/mesa/kmscube/"
+LICENSE = "MIT"
+SECTION = "graphics"
+DEPENDS = "virtual/libgles2 virtual/egl libdrm gstreamer1.0 gstreamer1.0-plugins-base"
+
+LIC_FILES_CHKSUM = "file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff7381270dd631fb"
+
+SRCREV = "e56980c28766ffb0bf8edee96b529a5b47f97137"
+SRC_URI = "git://anongit.freedesktop.org/mesa/kmscube;branch=master;protocol=git"
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
-- 
2.7.4


