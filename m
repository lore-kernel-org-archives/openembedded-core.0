Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@adamian-desktop>) id 1SUeyz-00089r-TJ
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 16:13:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 07:02:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="141284685"
Received: from adamian-desktop.rb.intel.com (HELO adamian-desktop)
	([10.237.104.73])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2012 07:02:33 -0700
Received: by adamian-desktop (Postfix, from userid 1000)
	id 1407D8413AD; Wed, 16 May 2012 17:05:15 +0300 (EEST)
From: Alexandru DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 May 2012 17:05:05 +0300
Message-Id: <1337177105-22386-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/1] xf86-video-vmware: update package to 12.0.2
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
X-List-Received-Date: Wed, 16 May 2012 14:13:42 -0000

This patch updates the package version for the vmware xorg driver
to 12.0.2, following upstream. No other changes made beside updating
the checksums.
---
 ...mware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_12.0.1.bb => xf86-video-vmware_12.0.2.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
index a5655fc..4b9844d 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.1.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_12.0.2.bb
@@ -11,8 +11,8 @@ DEPENDS += "virtual/libx11 libxvmc drm glproto \
 
 PR = "${INC_PR}.1"
 
-SRC_URI[md5sum] = "08101a9b09774ec2f432db5118928c53"
-SRC_URI[sha256sum] = "ded644af1f74ca0ebdc759e3db715519c476b341c1783c3d92c93a76591ed496"
+SRC_URI[md5sum] = "0743ec7c479603fba60d118858fd5783"
+SRC_URI[sha256sum] = "c827875fd94805ec9b925fe09aaa973e7e3f9096c7ef311d449c3f134ae75147"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
 
-- 
1.7.9.5



