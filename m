Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1RgdUV-0001dl-AG
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Dec 2011 15:31:27 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Dec 2011 06:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90858481"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.2])
	by azsmga001.ch.intel.com with ESMTP; 30 Dec 2011 06:24:10 -0800
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2011 22:33:11 +0800
Message-Id: <342b642339d1804798cbfb2edf93d806c9a85afa.1325252646.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
References: <174bd926e4a4e00426eb92a2147cd0169e5cd515.1325252646.git.shane.wang@intel.com>
In-Reply-To: <cover.1325252645.git.shane.wang@intel.com>
References: <cover.1325252645.git.shane.wang@intel.com>
Subject: [PATCH 10/14] matchbox-wm-2: ugrade to 01fa5465743c9ee43d040350f4405d35293e4869
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
X-List-Received-Date: Fri, 30 Dec 2011 14:31:27 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../matchbox-wm-2/matchbox-wm-2_git.bb             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
index c9498f7..9961728 100644
--- a/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
+++ b/meta/recipes-graphics/matchbox-wm-2/matchbox-wm-2_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://matchbox/core/mb-wm.h;endline=21;md5=1b1d328a52790635
 
 DEPENDS = "virtual/libx11 libxext libxrender startup-notification expat gconf pango libxdamage libxcomposite gtk+"
 
-SRCREV = "18ab9c7e4ffcb066b25281172ea82947bd56cb86"
+SRCREV = "01fa5465743c9ee43d040350f4405d35293e4869"
 PV = "0.1+git${SRCPV}"
 PR = "r0"
 
-- 
1.7.6



