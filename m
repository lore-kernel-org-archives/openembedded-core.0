Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LEG-0000rV-FM
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:41:14 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Mar 2012 17:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139657260"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:32:24 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:03 +0800
Message-Id: <2c7455c64e4ea70fef683ebca4be9f0f4e33560b.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 06/60] libvorbis: upgrade to 1.3.3
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
X-List-Received-Date: Fri, 16 Mar 2012 00:41:14 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libvorbis_1.3.2.bb => libvorbis_1.3.3.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/libvorbis/{libvorbis_1.3.2.bb => libvorbis_1.3.3.bb} (86%)

diff --git a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.2.bb b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb
similarity index 86%
rename from meta/recipes-multimedia/libvorbis/libvorbis_1.3.2.bb
rename to meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb
index 5961d9d..e846a63 100644
--- a/meta/recipes-multimedia/libvorbis/libvorbis_1.3.2.bb
+++ b/meta/recipes-multimedia/libvorbis/libvorbis_1.3.3.bb
@@ -14,8 +14,8 @@ PR = "r0"
 
 SRC_URI = "http://downloads.xiph.org/releases/vorbis/libvorbis-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "c870b9bd5858a0ecb5275c14486d9554"
-SRC_URI[sha256sum] = "eeb4dcada143846dfba760d982954a02f82e08845cbc33871f5dac547b8b6124"
+SRC_URI[md5sum] = "6b1a36f0d72332fae5130688e65efe1f"
+SRC_URI[sha256sum] = "6d747efe7ac4ad249bf711527882cef79fb61d9194c45b5ca5498aa60f290762"
 
 inherit autotools pkgconfig
 
-- 
1.7.6



