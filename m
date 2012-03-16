Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHm-0001Vn-DR
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 17:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119576001"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 17:36:01 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:23 +0800
Message-Id: <d49c93db3981468083e3443a5255f086a07d30c1.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 26/60] avahi-ui: upgrade to 0.6.31
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 00:44:50 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb}     |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/avahi/{avahi-ui_0.6.30.bb => avahi-ui_0.6.31.bb} (93%)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
similarity index 93%
rename from meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
rename to meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index d7b9ed8..8eb4488 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.30.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.0"
 
 DEPENDS += "avahi gtk+ libglade"
 
@@ -34,8 +34,8 @@ RDEPENDS_avahi-discover = "python-avahi python-pygtk"
 RDEPENDS_python-avahi = "python-dbus"
 
 
-SRC_URI[md5sum] = "e4db89a2a403ff4c47d66ac66fad1f43"
-SRC_URI[sha256sum] = "f9e4316c2339d0020726edd846d01bee0c39980906db0c247479e5807457ff1f"
+SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
+SRC_URI[sha256sum] = "8372719b24e2dd75de6f59bb1315e600db4fd092805bd1201ed0cb651a2dab48"
 
 do_install_append () {
 	rm ${D}${sysconfdir} -rf
-- 
1.7.6



