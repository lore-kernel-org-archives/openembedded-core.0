Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 1469C60068
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Feb 2017 18:58:18 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 07 Feb 2017 10:58:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="61935671"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.85.39])
	by orsmga005.jf.intel.com with ESMTP; 07 Feb 2017 10:58:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  7 Feb 2017 10:58:17 -0800
Message-Id: <1486493897-10996-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libva: Update to new 01.org github location
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
X-List-Received-Date: Tue, 07 Feb 2017 18:58:19 -0000

Upstream has moved to use 01.org and github, Update the various URIs
that track info. S needs to be changed to WORKDIR/git as we are now a
git repo.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/libva/libva_1.7.3.bb | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/libva/libva_1.7.3.bb b/meta/recipes-graphics/libva/libva_1.7.3.bb
index c7b723b..a7b4b90 100644
--- a/meta/recipes-graphics/libva/libva_1.7.3.bb
+++ b/meta/recipes-graphics/libva/libva_1.7.3.bb
@@ -10,16 +10,17 @@ limited to GPUs or Intel specific hardware, as other hardware and \
 manufacturers can also freely use this API for hardware accelerated \
 video decoding."
 
-HOMEPAGE = "http://www.freedesktop.org/wiki/Software/vaapi"
-BUGTRACKER = "https://bugs.freedesktop.org"
+HOMEPAGE = "https://01.org/linuxmedia/vaapi"
+BUGTRACKER = "https://github.com/01org/libva/issues"
 
 SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
 
-SRC_URI = "http://www.freedesktop.org/software/vaapi/releases/libva/${BP}.tar.bz2"
-SRC_URI[md5sum] = "dafb1d7d6449e850e9eb1a099895c683"
-SRC_URI[sha256sum] = "22bc139498065a7950d966dbdb000cad04905cbd3dc8f3541f80d36c4670b9d9"
+SRC_URI = "git://github.com/01org/libva.git;protocol=http;branch=v1.7-branch"
+SRCREV = "dbf9f7e33349c3cee8d131e93a6a4f91255635cb"
+
+S = "${WORKDIR}/git"
 
 DEPENDS = "libdrm virtual/mesa virtual/libgles1 virtual/libgles2 virtual/egl"
 
-- 
2.7.4


