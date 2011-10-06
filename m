Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RBqge-0008VG-Cn
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 18:20:44 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Oct 2011 09:15:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,496,1312182000"; d="scan'208";a="59495926"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.197])
	by azsmga001.ch.intel.com with ESMTP; 06 Oct 2011 09:15:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Oct 2011 09:14:49 -0700
Message-Id: <681c0e61d4aa52f00d2b06bc625226412741bb95.1317917297.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317917297.git.sgw@linux.intel.com>
References: <cover.1317917297.git.sgw@linux.intel.com>
Subject: [PATCH 10/21] icon-naming-utils: Add SRC_URI Checksum
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
X-List-Received-Date: Thu, 06 Oct 2011 16:20:44 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../icon-naming-utils-native_0.8.7.bb              |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
index 4760c96..4d1e19e 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils-native_0.8.7.bb
@@ -1,11 +1,14 @@
 LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
-PR = "r3"
+PR = "r4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "http://tango.freedesktop.org/releases/icon-naming-utils-0.8.7.tar.gz"
 
+SRC_URI[md5sum] = "4abe604721ce2ccb67f451aa7ceb44d6"
+SRC_URI[sha256sum] = "1cb49ce6a04626939893a447da696f20003903d61bd80c6d74d29dd79ca340d2"
+
 S = "${WORKDIR}/icon-naming-utils-${PV}"
 
 inherit autotools native perlnative
-- 
1.7.6.2



