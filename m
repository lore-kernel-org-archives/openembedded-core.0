Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQ9-0006Az-KQ
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:53 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 15 Apr 2011 23:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="910410452"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2011 23:53:33 -0700
Message-Id: <47273f722b2728900bd24be80f01c9d248606e19.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 14:20:26 +0800
Date: Fri, 15 Apr 2011 23:53:32 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 09/58] telepathy-idle: upgrade to version 0.1.8
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:53 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...pathy-idle_0.1.7.bb => telepathy-idle_0.1.8.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-idle_0.1.7.bb => telepathy-idle_0.1.8.bb} (81%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.7.bb b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
similarity index 81%
rename from meta/recipes-connectivity/telepathy/telepathy-idle_0.1.7.bb
rename to meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
index 0ee3ca8..5bd4e28 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.7.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-idle_0.1.8.bb
@@ -9,8 +9,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/${BPN}/${P}.tar.gz"
 
-SRC_URI[md5sum] = "5ee3aa5c6e1112922b11711e6a209331"
-SRC_URI[sha256sum] = "b65df4f8ebdf1039e1f1e406f53cc7b6106fab6c4d8e784e360709f8d85df0c3"
+SRC_URI[md5sum] = "82f5eafa07df5e1abc785061143bbfd2"
+SRC_URI[sha256sum] = "384119cc64022626b6f51aaaef605abf248602d8fae25baff82762a097f20fe9"
 
 inherit autotools pkgconfig
 
-- 
1.7.1.1



