Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RVtGM-0003KH-PR
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:08:26 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 30 Nov 2011 15:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="81793781"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 30 Nov 2011 15:01:44 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 07:21:35 +0800
Message-Id: <76088422c52623529e7a3f5cc660f7116c0f5332.1322695203.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1322695203.git.dongxiao.xu@intel.com>
References: <cover.1322695203.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/5] telepathy-idle: upgrade to version 0.1.11
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
X-List-Received-Date: Wed, 30 Nov 2011 23:08:27 -0000

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-idle_0.1.10.bb => telepathy-idle_0.1.11.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.10.bb => telepathy-idle_0.1.11.bb} (81%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb
similarity index 81%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb
index 470df50..291f4f6 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.10.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.11.bb
@@ -9,8 +9,8 @@ PR = "r1"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "570a431e3e28ca6ebf3f0c84198f0b9a"
-SRC_URI[sha256sum] = "e14327a8b47c83ed32c73c5fdad1d9c2291ae8592d3da4482e0a6cbd541f35b0"
+SRC_URI[md5sum] = "be277e8f0bd32ae56af799f0ff4ec72e"
+SRC_URI[sha256sum] = "047ccbec0b91ac187467ede5a90966f9ec881df56fd8c80cb3bce3710f66fda0"
 
 inherit autotools pkgconfig
 
-- 
1.7.1



