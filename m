Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGQ-0003Kh-DX
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:30 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Nov 2011 15:01:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,273,1320652800"; d="scan'208";a="90788542"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2011 15:01:48 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:38 +0800
Message-Id: <a10eb0a588c74dbfbb1fe9041c957bc117818885.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
Subject: [PATCH 4/5] telepathy-mission-control: upgrade to version 5.10.1
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:30 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ....9.3.bb => telepathy-mission-control_5.10.1.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.9.3.bb => telepathy-mission-control_5.10.1.bb} (92%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
similarity index 92%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
index a4663cc..f7ce736 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.10.1.bb
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "15fc8e560bc67a86393a3138d7ac38e3"
-SRC_URI[sha256sum] = "774af104627513e7881fa6695912c962ddedcc7628ec859e020fa30000e32cab"
+SRC_URI[md5sum] = "50594028ebb2dba0181fec99e6f56ff5"
+SRC_URI[sha256sum] = "e1d9ce7b8827c19bf2e5d522641ae86ff2476c605de2533d608721ea49023a10"
-- 
1.7.1



