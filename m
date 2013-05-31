Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF2B619E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 19:15:52 +0000 (UTC)
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 6E5C621402
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 21:15:52 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 21:15:57 +0200
Message-Id: <1370027758-22849-3-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
References: <1370027758-22849-1-git-send-email-dv@pseudoterminal.org>
Subject: [PATCH 2/3] gstreamer: moved LIBV out of gst-plugins-package.inc file
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
X-List-Received-Date: Fri, 31 May 2013 19:15:52 -0000

Since gst-plugins-package.inc is going to be used by the following
GStreamer 1.0 recipes as well, LIBV has to be set outside of the .inc file.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc | 1 -
 meta/recipes-multimedia/gstreamer/gst-plugins.inc         | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
index 5962e4b..0503b34 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
@@ -1,6 +1,5 @@
 PACKAGESPLITFUNCS_prepend = " split_gstreamer10_packages "
 PACKAGESPLITFUNCS_append = " set_metapkg_rdepends "
-LIBV = "0.10"
 
 python split_gstreamer10_packages () {
     gst_libdir = d.expand('${libdir}/gstreamer-${LIBV}')
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index fc9567a..4c9716d 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -15,6 +15,7 @@ EXTRA_OECONF = "--disable-valgrind ${GSTREAMER_DEBUG} --disable-examples "
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
+LIBV = "0.10"
 require gst-plugins-package.inc
 
 PACKAGES_DYNAMIC += "^${PN}-.*"
-- 
1.8.3


