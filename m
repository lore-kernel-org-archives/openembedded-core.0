Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RJd7F-00067E-Ol
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 05:28:22 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Oct 2011 20:22:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,416,1315206000"; d="scan'208";a="78820660"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2011 20:22:17 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 11:35:47 +0800
Message-Id: <6b8f9c40e1ed6b6399663016869a3f6ae337aef7.1319772853.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1319772853.git.dongxiao.xu@intel.com>
References: <cover.1319772853.git.dongxiao.xu@intel.com>
Subject: [PATCH 08/11] telepathy-mission-control: Upgrade to version 5.9.3
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
X-List-Received-Date: Fri, 28 Oct 2011 03:28:23 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...5.7.9.bb => telepathy-mission-control_5.9.3.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-mission-control_5.7.9.bb => telepathy-mission-control_5.9.3.bb} (92%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb
similarity index 92%
rename from meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb
rename to meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb
index 7805db6..a4663cc 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.7.9.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-mission-control_5.9.3.bb
@@ -40,5 +40,5 @@ FILES_libmissioncontrol-dbg = "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg = "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg = "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-SRC_URI[md5sum] = "df7e63d857676fab9ec2261cffe5eb4a"
-SRC_URI[sha256sum] = "bc430238d2fb6663d8376702a43251000a75b741ab55af88006cbdb37d8cc086"
+SRC_URI[md5sum] = "15fc8e560bc67a86393a3138d7ac38e3"
+SRC_URI[sha256sum] = "774af104627513e7881fa6695912c962ddedcc7628ec859e020fa30000e32cab"
-- 
1.7.1



