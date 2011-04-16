Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQE-0006BT-IP
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:58 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420319398"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:53:37 -0700
Message-Id: <8670fa4d7c2f6741e6947c6eda29279459c5ad15.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 16:15:01 +0800
Date: Fri, 15 Apr 2011 23:53:37 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 11/58] gssdp: upgrade to version 0.10.0
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:58 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../{files => gssdp-0.10.0}/introspection.patch    |    5 ++++-
 .../gupnp/{gssdp_0.9.0.bb => gssdp_0.10.0.bb}      |    4 ++--
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/gupnp/{files => gssdp-0.10.0}/introspection.patch (97%)
 rename meta/recipes-connectivity/gupnp/{gssdp_0.9.0.bb => gssdp_0.10.0.bb} (83%)

diff --git a/meta/recipes-connectivity/gupnp/files/introspection.patch b/meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch
similarity index 97%
rename from meta/recipes-connectivity/gupnp/files/introspection.patch
rename to meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch
index 15de41f..39c1502 100644
--- a/meta/recipes-connectivity/gupnp/files/introspection.patch
+++ b/meta/recipes-connectivity/gupnp/gssdp-0.10.0/introspection.patch
@@ -1,5 +1,8 @@
 Copied from gobject-introspection/m4/introspection.m4
-By Dongxiao Xu <dongxiao.xu@intel.com>
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-By: Dongxiao Xu <dongxiao.xu@intel.com>
 
 diff -ruN gssdp-0.9.0-orig/m4/introspection.m4 gssdp-0.9.0/m4/introspection.m4
 --- gssdp-0.9.0-orig/m4/introspection.m4	1970-01-01 08:00:00.000000000 +0800
diff --git a/meta/recipes-connectivity/gupnp/gssdp_0.9.0.bb b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
similarity index 83%
rename from meta/recipes-connectivity/gupnp/gssdp_0.9.0.bb
rename to meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
index 3c8c698..310d8a9 100644
--- a/meta/recipes-connectivity/gupnp/gssdp_0.9.0.bb
+++ b/meta/recipes-connectivity/gupnp/gssdp_0.10.0.bb
@@ -20,7 +20,7 @@ EXTRA_OECONF = "--disable-introspection"
 
 PR = "r0"
 
-SRC_URI[md5sum] = "8605138eac1e7fb8ec8cf502a928ea81"
-SRC_URI[sha256sum] = "6e4de2ecc90d2ac8b3694af1954984d04de25fb01dd2f2748d7221add8ead9e0" 
+SRC_URI[md5sum] = "aec6a56ac1d4f8a4837da83f2d152556"
+SRC_URI[sha256sum] = "94de92bb4f7906ed2f047b0146a3b21d53d09908fe1f0149484f61c6afc598ea" 
 
 
-- 
1.7.1.1



