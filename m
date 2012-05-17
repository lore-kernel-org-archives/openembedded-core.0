Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44w-0006LK-O8
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478140"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:12 +0300
Message-Id: <0df81457bb3514bedafdad0d1f43811ce0fcee8d.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/12] xf86-video-vmware: update package to 12.0.2
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
X-List-Received-Date: Thu, 17 May 2012 17:01:32 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch updates the package version for the vmware xorg driver
to 12.0.2, following upstream. No other changes made beside updating
the checksums.
---
 ...mware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} (74%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
similarity index 74%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
index a5655fc..71f0339 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
@@ -9,10 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 DEPENDS += "virtual/libx11 libxvmc drm glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.0"
 
-SRC_URI[md5sum] = "08101a9b09774ec2f432db5118928c53"
-SRC_URI[sha256sum] = "ded644af1f74ca0ebdc759e3db715519c476b341c1783c3d92c93a76591ed496"
+SRC_URI[md5sum] = "0743ec7c479603fba60d118858fd5783"
+SRC_URI[sha256sum] = "c827875fd94805ec9b925fe09aaa973e7e3f9096c7ef311d449c3f134ae75147"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
1.7.7.6



