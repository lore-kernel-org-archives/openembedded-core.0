Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q912v-0007f8-Uv
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:15:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2011 13:13:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,334,1299484800"; d="scan'208";a="731482993"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2011 13:13:30 -0700
Message-Id: <dad30ea629f1f39560d391e459d655145762ce05.1302466269.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302466269.git.sgw@linux.intel.com>
References: <cover.1302466269.git.sgw@linux.intel.com>
Old-Date: Sat, 9 Apr 2011 23:50:17 -0700
Date: Sun, 10 Apr 2011 13:13:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 4/6] clutter-1.6: fix SRC_URI[md5sum]
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
X-List-Received-Date: Sun, 10 Apr 2011 20:15:46 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
index 7ead5f9..04935e3 100644
--- a/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.6_1.6.8.bb
@@ -21,5 +21,5 @@ do_configure_prepend () {
 	sed -i -e 's/^DOLT//' ${S}/configure.ac
 }
 
-SRC_URI[md5sum] = "5a3c6d8414d4e286aba0a936f344c9b1""
+SRC_URI[md5sum] = "9eedac4216f709a9f144940d24bfbb3e"
 SRC_URI[sha256sum] = "cc147b8e7e62ed4b9b8a83df3db9788cf37db0c83970ba876228433f32bda442"
-- 
1.7.1.1



