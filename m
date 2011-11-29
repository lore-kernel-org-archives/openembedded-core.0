Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1RVXCz-0003Ro-P6
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 00:35:29 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Nov 2011 15:28:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="81086452"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2011 15:28:48 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 07:24:13 +0800
Message-Id: <a8094242491680576c79863938243086a9fb8c52.1322608823.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1322608823.git.edwin.zhai@intel.com>
References: <cover.1322608823.git.edwin.zhai@intel.com>
Subject: [PATCH 2/8] xz: Upgrade to 5.0.3
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
X-List-Received-Date: Tue, 29 Nov 2011 23:35:30 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xz/{xz_5.0.2.bb => xz_5.0.3.bb}                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.0.2.bb => xz_5.0.3.bb} (82%)

diff --git a/meta/recipes-extended/xz/xz_5.0.2.bb b/meta/recipes-extended/xz/xz_5.0.3.bb
similarity index 82%
rename from meta/recipes-extended/xz/xz_5.0.2.bb
rename to meta/recipes-extended/xz/xz_5.0.3.bb
index 549c116..bae71ec 100644
--- a/meta/recipes-extended/xz/xz_5.0.2.bb
+++ b/meta/recipes-extended/xz/xz_5.0.3.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "03d139cc14294fd45504989b914335ff"
-SRC_URI[sha256sum] = "57e979baaa40147dde1bbb284e3618f8f18b6532c932648bd57b5aee674b98a7"
+SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
+SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
 
 PR = "r0"
 
-- 
1.7.1



