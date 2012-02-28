Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2FhS-0008QH-5y
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 06:34:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="130197463"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga002.fm.intel.com with ESMTP; 27 Feb 2012 21:25:39 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 21:25:16 -0800
Message-Id: <742d24f640e58f21e000636fbae2e4c4b705ffc0.1330406574.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
In-Reply-To: <cover.1330406574.git.sgw@linux.intel.com>
References: <cover.1330406574.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 18/36] xf86-video-intel: Update to version 2.18.0
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
X-List-Received-Date: Tue, 28 Feb 2012 05:34:10 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 ...-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} (84%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
similarity index 84%
rename from meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
index ca90be2..637e11c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.17.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.18.0.bb
@@ -14,8 +14,6 @@ PR = "${INC_PR}.0"
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
 
-SRC_URI[md5sum] = "6d7b1f199dba5820f250888b136186ff"
-SRC_URI[sha256sum] = "8b8450f2a2cc52ef31a83414e2f290e748a956690e11b41759d5650aaedc4387"
 
 EXTRA_OECONF += "--disable-xvmc"
 
@@ -23,3 +21,6 @@ EXTRA_OECONF += "--disable-xvmc"
 EXTRA_OECONF += '${@base_conditional( "ROOTLESS_X", "1", " --enable-kms-only", "", d )}'
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
+
+SRC_URI[md5sum] = "34f3987ffe86e30c57abc33b7f8030e9"
+SRC_URI[sha256sum] = "dce63e33ccfada39ef1e1e6768dfd8edd4c525670dfe56d1c42b2f9570039ffc"
-- 
1.7.7.6



