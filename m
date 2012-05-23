Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mihaix.lindner@linux.intel.com>) id 1SXBtQ-0003vF-Ny
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 15:46:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2012 06:35:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146758152"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by azsmga001.ch.intel.com with ESMTP; 23 May 2012 06:35:09 -0700
Received: from moolinex.rb.intel.com (unknown [10.237.105.40])
	by linux.intel.com (Postfix) with ESMTP id 973172C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 06:35:09 -0700 (PDT)
Message-ID: <4FBCE7C7.5050604@linux.intel.com>
Date: Wed, 23 May 2012 16:36:07 +0300
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120420 Thunderbird/12.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xf86-video-intel: recipe upgrade from 2.18 to 2.19
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
X-List-Received-Date: Wed, 23 May 2012 13:46:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Signed-off-by: mihai lindner <mihaix.lindner@linux.intel.com>
---
  .../{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb}   |    6 +++---
  1 file changed, 3 insertions(+), 3 deletions(-)
  rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.18.0.bb => xf86-video-intel_2.19.0.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
index 637e11c..e9e43ff 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
@@ -9,7 +9,7 @@ Infrastructure (DRI)."
  
  LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
  
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
  
  DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
  	    virtual/libgl xineramaproto xf86driproto libpciaccess"
@@ -22,5 +22,5 @@ EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "
  
  COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
  
-SRC_URI[md5sum] = "34f3987ffe86e30c57abc33b7f8030e9"
-SRC_URI[sha256sum] = "dce63e33ccfada39ef1e1e6768dfd8edd4c525670dfe56d1c42b2f9570039ffc"
+SRC_URI[md5sum] = "f397bddfc88d4c9b30b56526c1e02e8e"
+SRC_URI[sha256sum] = "32133d61b14ce3b45b83a60e4ed8eb75159259d708f056144250aaeabf16e4bc"
-- 1.7.10




