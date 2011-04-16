Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQ7-0006As-7N
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Apr 2011 23:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="629634712"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga002.jf.intel.com with ESMTP; 15 Apr 2011 23:53:31 -0700
Message-Id: <989e0c92177d83ba43d56a1eab52f68acdb36fd0.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 14:17:42 +0800
Date: Fri, 15 Apr 2011 23:53:30 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 08/58] telepathy-glib: upgrade to version 0.14.3
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:51 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 ...thy-glib_0.13.6.bb => telepathy-glib_0.14.3.bb} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.13.6.bb => telepathy-glib_0.14.3.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
index 476ed7f..9351be4 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.13.6.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.14.3.bb
@@ -7,8 +7,8 @@ PR = "r0"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${P}.tar.gz"
 
-SRC_URI[md5sum] = "db997b1575e9186887caf211c0b94dd9"
-SRC_URI[sha256sum] = "76a38a64d1b7fbaa6e1aaf6a9f8b898840c551aea5d9121bdcb35fdbb66c5877"
+SRC_URI[md5sum] = "fe9a4f781651593fd4afddb343ff50bf"
+SRC_URI[sha256sum] = "62e759084355ac0fce61feb561a7535a6707b223f0d1e4305fd47c83fa5494d0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.7.1.1



