Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SmpmF-0002vC-TY
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:23:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167438311"
Received: from miles.jf.intel.com (HELO localhost) ([10.7.199.51])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:12:25 -0700
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2012 10:12:20 -0700
Message-Id: <d4003e2fcb2d239e6c90d1be48553b202b2b3907.1341508255.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1341508255.git.scott.a.garman@intel.com>
References: <cover.1341508255.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1341508255.git.scott.a.garman@intel.com>
References: <cover.1341508255.git.scott.a.garman@intel.com>
Subject: [PATCH 1/2] runqemu: fix support for ext4 rootfs images
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
X-List-Received-Date: Thu, 05 Jul 2012 17:23:40 -0000

Partial fix for [YOCTO #2611]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 scripts/runqemu |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 9fdbd54..84674e2 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -98,7 +98,7 @@ while true; do
             [ -z "$MACHINE" ] && MACHINE=$arg || \
                 error "conflicting MACHINE types [$MACHINE] and [$arg]"
             ;;
-        "ext2" | "ext3" | "jffs2" | "nfs" | "btrfs")
+        "ext2" | "ext3" | "ext4" | "jffs2" | "nfs" | "btrfs")
             [ -z "$FSTYPE" -o "$FSTYPE" = "$arg" ] && FSTYPE=$arg || \
                 error "conflicting FSTYPE types [$FSTYPE] and [$arg]"
             ;;
-- 
1.7.9.5



