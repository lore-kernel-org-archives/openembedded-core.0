Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlj-0001ob-A5
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:27:11 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 00:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="632520219"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2011 00:24:47 -0700
Message-Id: <0460963419da43ab48df25da8a488c5286fcef49.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 11:02:51 +0800
Date: Fri, 22 Apr 2011  0:24:47 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 18/33] lttng-viewer: upgrade from 0.12.36 to the latest version 0.12.38
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
X-List-Received-Date: Fri, 22 Apr 2011 07:27:11 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 ...g-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-viewer_0.12.36.bb => lttng-viewer_0.12.38.bb} (85%)

diff --git a/meta/recipes-kernel/lttng/lttng-viewer_0.12.36.bb b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
similarity index 85%
rename from meta/recipes-kernel/lttng/lttng-viewer_0.12.36.bb
rename to meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
index fc13210..b8f2f2c 100644
--- a/meta/recipes-kernel/lttng/lttng-viewer_0.12.36.bb
+++ b/meta/recipes-kernel/lttng/lttng-viewer_0.12.38.bb
@@ -14,12 +14,12 @@ DEPENDS = "gtk+ pango popt"
 
 SECTION = "devel"
 
-ALTNAME = "lttv-${PV}-18112010"
+ALTNAME = "lttv-${PV}-21032011"
 
 SRC_URI = "http://lttng.org/files/packages/${ALTNAME}.tar.gz"
 
-SRC_URI[md5sum] = "967f7c9c843a43e2ec2ef9216edabc70"
-SRC_URI[sha256sum] = "a7d14ae84f9bb123298840922730d3121fa073dc036dccac63083d9686adeacd"
+SRC_URI[md5sum] = "071bf3dd13e7562c08ee8f8971cfc76d"
+SRC_URI[sha256sum] = "cf87ffcf5d266b18979418e610a180a0b4214de41677f0be867885e15b2f7647"
 S = "${WORKDIR}/${ALTNAME}"
 
 inherit autotools
-- 
1.7.1



