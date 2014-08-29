Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EEACF710C5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 18:54:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Aug 2014 11:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,425,1406617200"; d="scan'208";a="595239764"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by orsmga002.jf.intel.com with ESMTP; 29 Aug 2014 11:54:03 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 21:53:47 +0300
Message-Id: <0aac25efc994a28d9e1e2dff8efc2d01c645f609.1409338378.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409338378.git.cristian.iorga@intel.com>
References: <cover.1409338378.git.cristian.iorga@intel.com>
Subject: [PATCH 5/7] gstreamer1.0-plugins-bad: upgrade to 1.4.1
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
X-List-Received-Date: Fri, 29 Aug 2014 18:54:55 -0000

Bugfix release.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...amer1.0-plugins-bad_1.4.0.bb => gstreamer1.0-plugins-bad_1.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.0.bb => gstreamer1.0-plugins-bad_1.4.1.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb
index ff92f09..f0116c0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch"
 
-SRC_URI[md5sum] = "3bc0fcfe8d16ad1295f0454c1fcb4ba3"
-SRC_URI[sha256sum] = "ff2cb754f7725b205aec66002b1406e440f3a03194b6cad2d126ef5cd00902f9"
+SRC_URI[md5sum] = "20cb190b18dc63017326321cdb7c91e5"
+SRC_URI[sha256sum] = "0268db2faaf0bb22e5b709a11633abbca4f3d289b1f513bb262d0bf3f53e19ae"
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.9.1


