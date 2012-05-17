Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SV44p-0006K2-VD
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 19:01:24 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 May 2012 09:51:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144478050"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.96])
	by azsmga001.ch.intel.com with ESMTP; 17 May 2012 09:51:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 19:51:03 +0300
Message-Id: <17d7f2a9ee4c56bc697f05a8e703ddb02c262d99.1337273095.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337273095.git.sgw@linux.intel.com>
References: <cover.1337273095.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 01/12] xinetd: Update to 2.3.15
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
X-List-Received-Date: Thu, 17 May 2012 17:01:24 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb}  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/xinetd/{xinetd_2.3.14.bb => xinetd_2.3.15.bb} (90%)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
similarity index 90%
rename from meta/recipes-extended/xinetd/xinetd_2.3.14.bb
rename to meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 26ba78f..3d55e99 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.14.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR ="r1"
+PR = "r0"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
@@ -17,8 +17,8 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
       "
 
-SRC_URI[md5sum] = "567382d7972613090215c6c54f9b82d9"
-SRC_URI[sha256sum] = "760e0e617c609a0509ef63fc7e9580d2f1d88c6113bb6d63273de7de7cd0bc1f"
+SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
+SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
 
 inherit autotools update-rc.d
 
-- 
1.7.7.6



