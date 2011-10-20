Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUv-0002oE-Lm
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982228"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:56 -0700
Message-Id: <0e4abf19825cf8ca65ca2efdfed15a1f02f260b8.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 20/26] chkconfig: Update to 1.3.55
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:06 -0000

From: Wenzong Fan <wenzong.fan@windriver.com>

Update chkconfig to 1.3.55 from 1.3.52.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb}   |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb} (83%)

diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
similarity index 83%
rename from meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
rename to meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
index 6dc8a0e..0e50936 100644
--- a/meta/recipes-extended/chkconfig/chkconfig_1.3.52.bb
+++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.55.bb
@@ -12,12 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
 
 DEPENDS = "libnewt popt"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "a576808a6d66763606d750ec451bab6d"
-SRC_URI[sha256sum] = "aa36bf7fd3f7c6e3371eddd8a7846b83435c48f132cc5919d83a830504b797d6"
+SRC_URI[md5sum] = "de562d5bff5116d1acf2d3191603096b"
+SRC_URI[sha256sum] = "ac5e8f6c5ed83f5b65a3dd9187f8c534f167193446082e6a6576a0d9f72ba968"
 
 inherit autotools gettext
 
-- 
1.7.6.2



