Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SPLHD-0000o3-Hv
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 00:10:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 May 2012 15:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="135871094"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2012 15:00:46 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 15:00:41 -0700
Message-Id: <f21bcc16a9afaaf57cb8363d7ee475350fd8f937.1335909595.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
References: <b0d5193248111699e406cf352793898293bc2f89.1335909595.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1335909595.git.nitin.a.kamble@intel.com>
References: <cover.1335909595.git.nitin.a.kamble@intel.com>
Subject: [PATCH 2/6] makedepend: upgrade from 1.0.3 to 1.0.4
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
X-List-Received-Date: Tue, 01 May 2012 22:10:31 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../{makedepend_1.0.3.bb => makedepend_1.0.4.bb}   |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.3.bb => makedepend_1.0.4.bb} (82%)

diff --git a/meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb b/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
similarity index 82%
rename from meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb
rename to meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
index 86e5d81..fea0b22 100644
--- a/meta/recipes-graphics/xorg-util/makedepend_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-util/makedepend_1.0.4.bb
@@ -18,6 +18,5 @@ BBCLASSEXTEND = "native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=43a6eda34b48ee821b3b66f4f753ce4f"
 
-SRC_URI[md5sum] = "ec37ca8b810a40cdfb16a736b3360f6c"
-SRC_URI[sha256sum] = "2d3466acc29b382a4368b30371f17a4083933281b97f8ef67fc8b785a60d52dc"
-
+SRC_URI[md5sum] = "bf1c54028427829c9c3193bef710dbee"
+SRC_URI[sha256sum] = "f53b8ce5dec02a05f8994036a8ebac485a96324143ff2382e29578fdc096b04f"
-- 
1.7.7



