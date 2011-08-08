Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QqKSa-0003Hm-Gm
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 09:41:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 08 Aug 2011 00:36:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,336,1309762800"; d="scan'208";a="36154997"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 08 Aug 2011 00:36:46 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2011 15:35:37 +0800
Message-Id: <4502eca9e0f5a3714a4a0051e851e4d1ff6a6bfd.1312788761.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312788761.git.dongxiao.xu@intel.com>
References: <cover.1312788761.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/2] gnome-doc-utils: Avoid RDEPENDS on bash in native case.
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
X-List-Received-Date: Mon, 08 Aug 2011 07:41:16 -0000

gnome-doc-utils-native should not RDEPENDS on bash, thus add RDEPENDS
override to fix the issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index bd7c615..7c28eab 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -16,5 +16,6 @@ do_install_append() {
 FILES_${PN} += "${datadir}/xml* ${PYTHON_SITEPACKAGES_DIR}/*"
 
 RDEPENDS_${PN} = "bash"
+RDEPENDS_${PN}_virtclass-native = ""
 
 BBCLASSEXTEND = "native"
-- 
1.7.1



