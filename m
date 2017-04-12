Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CE64A77C3C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:14:21 +0000 (UTC)
Received: from soylentgreen.sue.net (vpn.streamunlimited.com [91.114.0.140])
	by ptmx.org (Postfix) with ESMTPSA id 57408453A7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 14:14:22 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 14:14:08 +0200
Message-Id: <1491999248-3509-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
References: <8d9c24ce-6a90-e080-dbe9-b3edba59aac4@linux.intel.com>
Subject: [PATCH v2] kmscube: add recipe
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
X-List-Received-Date: Wed, 12 Apr 2017 12:14:23 -0000

This is a demo application that draws a three-dimensional spinning cube
using EGL on top of KMS, via Mesa's GBM library. A rough counterpart to
glxgears, it is a useful tool for BSP makers to try the 3D rendering
functionality based on EGL and OpenGL ES in a KMS environment, without
having to set up Wayland or X11.

It is also interesting for Yocto-based  projects that do not need any
windowing environment and instead render their visual output fullscreen
to KMS directly, since they can use it as a reference.

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


