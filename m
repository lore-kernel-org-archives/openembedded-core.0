Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QskDT-0005Pw-Hb
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 01:35:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2011 16:30:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="38387544"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.242])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2011 16:30:50 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Aug 2011 16:30:42 -0700
Message-Id: <2422dbf97a9d00e61fb64f3aa4e8b260950a48c3.1313363644.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313363644.git.sgw@linux.intel.com>
References: <cover.1313363644.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 08/12] pixman: remove spurious dependency on libx11
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
X-List-Received-Date: Sun, 14 Aug 2011 23:35:39 -0000

From: Phil Blundell <philb@gnu.org>

Nothing in pixman actually uses libx11, so no need to DEPEND on it.

Signed-off-by: Phil Blundell <philb@gnu.org>
---
 meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
index e5472c0..1a33a18 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.22.0.bb
@@ -13,8 +13,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
                     file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
                    "
 
-DEPENDS = "virtual/libx11"
-
 PE = "1"
 PR = "r0"
 
-- 
1.7.6



