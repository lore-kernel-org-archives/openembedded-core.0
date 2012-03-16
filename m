Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LIr-0001of-T4
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:45:58 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 17:37:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="118172420"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2012 17:36:08 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:28 +0800
Message-Id: <f8a780f5c8560e62984fe1d603cd6e38200f1207.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 31/60] libxcursor: upgrade to 1.1.13
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
X-List-Received-Date: Fri, 16 Mar 2012 00:45:58 -0000

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../{libxcursor_1.1.12.bb => libxcursor_1.1.13.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxcursor_1.1.12.bb => libxcursor_1.1.13.bb} (79%)

diff --git a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
similarity index 79%
rename from meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb
rename to meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
index b593093..c0f1a0f 100644
--- a/meta/recipes-graphics/xorg-lib/libxcursor_1.1.12.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcursor_1.1.13.bb
@@ -18,5 +18,5 @@ PE = "1"
 
 XORG_PN = "libXcursor"
 
-SRC_URI[md5sum] = "a93b5a6f5b05976d2c0d3f8a07f6ac6a"
-SRC_URI[sha256sum] = "0c4de165e07ac66b091af50a4db1f07e3c14d1bcf80830013693a21ef03e7ba4"
+SRC_URI[md5sum] = "52efa81b7f26c8eda13510a2fba98eea"
+SRC_URI[sha256sum] = "f78827de4a1b7ce8cceca24a9ab9d1b1d2f6a61362f505166ffc19b07c0bad8f"
-- 
1.7.6



