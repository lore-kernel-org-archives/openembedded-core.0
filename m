Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQV-0006CS-JN
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:53:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629634878"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:53:57 -0700
Message-Id: <de50e24c43a04a39cdf1e4897907129f5f47a90c.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:18:28 +0800
Date: Fri, 15 Apr 2011 23:53:56 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 18/58] xz: Upgrade to 5.0.2 (from 5.0.0)
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:15 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../xz/{xz_5.0.0.bb => xz_5.0.2.bb}                |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/xz/{xz_5.0.0.bb => xz_5.0.2.bb} (82%)

diff --git a/meta/recipes-extended/xz/xz_5.0.0.bb b/meta/recipes-extended/xz/xz_5.0.2.bb
similarity index 82%
rename from meta/recipes-extended/xz/xz_5.0.0.bb
rename to meta/recipes-extended/xz/xz_5.0.2.bb
index 629ea9a..549c116 100644
--- a/meta/recipes-extended/xz/xz_5.0.0.bb
+++ b/meta/recipes-extended/xz/xz_5.0.2.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
 
 SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "f3c0706d100ad2b6d63327584d026c50"
-SRC_URI[sha256sum] = "eba9211990a642fc2c35ea02618b710c7fa898d78ccca48b546a07bdde03c44d"
+SRC_URI[md5sum] = "03d139cc14294fd45504989b914335ff"
+SRC_URI[sha256sum] = "57e979baaa40147dde1bbb284e3618f8f18b6532c932648bd57b5aee674b98a7"
 
 PR = "r0"
 
-- 
1.7.1.1



