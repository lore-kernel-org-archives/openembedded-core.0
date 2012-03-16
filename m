Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LHt-0001YA-9e
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:44:57 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:36:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121478585"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 17:36:07 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:27 +0800
Message-Id: <467039de601e15753cc6dd87e81bef3560b1d940.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 30/60] util-macros: upgrade to 1.17
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
X-List-Received-Date: Fri, 16 Mar 2012 00:44:57 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{util-macros_1.16.1.bb => util-macros_1.17.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.16.1.bb => util-macros_1.17.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb b/meta/recipes-graphics/xorg-util/util-macros_1.17.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb
rename to meta/recipes-graphics/xorg-util/util-macros_1.17.bb
index e0af8a9..7698e7a 100644
--- a/meta/recipes-graphics/xorg-util/util-macros_1.16.1.bb
+++ b/meta/recipes-graphics/xorg-util/util-macros_1.17.bb
@@ -16,5 +16,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[md5sum] = "01a4d42cfa952488d7bd391099a92bb0"
-SRC_URI[sha256sum] = "06494a0afb53881041ae4171d8ddb8433fa0bde7bd4e0ecc2aeaf536a02da183"
+SRC_URI[md5sum] = "e162e8921cd08c50bf17b9de5131b3f1"
+SRC_URI[sha256sum] = "a7de22d6828b2a4469d32b4744ac2fe9103fcb85e72dd70794ef77f188946371"
-- 
1.7.6



