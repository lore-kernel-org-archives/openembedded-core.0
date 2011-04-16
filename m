Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQU-0006CS-QM
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219691"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:53:54 -0700
Message-Id: <4b687bb2f49dfd28ab551415cb0c93c59a4f68bf.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:01:29 +0800
Date: Fri, 15 Apr 2011 23:53:53 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 17/58] libcanberry: Upgrade to 0.28 (from 0.26)
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:15 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../{libcanberra_0.26.bb => libcanberra_0.28.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{libcanberra_0.26.bb => libcanberra_0.28.bb} (85%)

diff --git a/meta/recipes-multimedia/pulseaudio/libcanberra_0.26.bb b/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
similarity index 85%
rename from meta/recipes-multimedia/pulseaudio/libcanberra_0.26.bb
rename to meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
index 0daeb0e..1922f72 100644
--- a/meta/recipes-multimedia/pulseaudio/libcanberra_0.26.bb
+++ b/meta/recipes-multimedia/pulseaudio/libcanberra_0.28.bb
@@ -11,8 +11,8 @@ inherit gconf autotools
 
 SRC_URI = "http://0pointer.de/lennart/projects/libcanberra/libcanberra-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "ee2c66ada7c851a4e7b6eb1682285a24"
-SRC_URI[sha256sum] = "4b5d8d2c2835133620adbc53745dd107b6e58b9a2963059e8f457143fee00982"
+SRC_URI[md5sum] = "c198b4811598c4c161ff505e4531b02c"
+SRC_URI[sha256sum] = "eb1f8b2cabad7f07b6e44d606a91d73e1efca4b46daf92bd553e7222bc68868c"
 
 EXTRA_OECONF = " --disable-oss --disable-ltdl-install" 
 
-- 
1.7.1.1



