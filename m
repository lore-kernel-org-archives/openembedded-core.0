Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQH-0006Bg-A8
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:53:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219617"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:53:40 -0700
Message-Id: <e80cd43637444eda89060ccf8ecc59b11f88fe04.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 16:25:26 +0800
Date: Fri, 15 Apr 2011 23:53:40 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 12/58] gupnp: upgrade to version 0.16.0
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:01 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Remove introspection.patch since it is already in upsteram.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../gupnp/{gupnp_0.14.0.bb => gupnp_0.16.0.bb}     |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-connectivity/gupnp/{gupnp_0.14.0.bb => gupnp_0.16.0.bb} (85%)

diff --git a/meta/recipes-connectivity/gupnp/gupnp_0.14.0.bb b/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
similarity index 85%
rename from meta/recipes-connectivity/gupnp/gupnp_0.14.0.bb
rename to meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
index 43a3645..07b6b90 100644
--- a/meta/recipes-connectivity/gupnp/gupnp_0.14.0.bb
+++ b/meta/recipes-connectivity/gupnp/gupnp_0.16.0.bb
@@ -5,11 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
                     file://libgupnp/gupnp.h;beginline=1;endline=20;md5=28c49b17d623afc3335efc2e511879e1"
 DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme"
 
-SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz \
-           file://introspection.patch"
+SRC_URI = "http://gupnp.org/sites/all/files/sources/${BPN}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "8598922256faa5adb28657d0c10a3e3e"
-SRC_URI[sha256sum] = "6ac13efe46c6f1e5d05e48e1041bf37dfa702839ce5fbb01e0f314f3904b6a16"
+SRC_URI[md5sum] = "61b240c1a9fdf8ca82c5c3adde0d6757"
+SRC_URI[sha256sum] = "1b77201866b7632fb68bc2a3bdea22ef8ead34ba850b3ee367797432cfc0f04a"
 
 PR = "r0"
 
-- 
1.7.1.1



