Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQS-0006CM-3q
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:56:12 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Apr 2011 23:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="420319536"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by azsmga001.ch.intel.com with ESMTP; 15 Apr 2011 23:53:51 -0700
Message-Id: <45910740467f2a1a2fa7ce8edff8fd538df918fd.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 11:00:48 +0800
Date: Fri, 15 Apr 2011 23:53:51 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 16/58] x11perf: Upgrade to 1.5.3 (from 1.5.2)
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
X-List-Received-Date: Sat, 16 Apr 2011 06:56:12 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    2 +-
 .../{x11perf_1.5.2.bb => x11perf_1.5.3.bb}         |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-app/{x11perf_1.5.2.bb => x11perf_1.5.3.bb} (76%)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index b164b77..4b7c1a9 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -96,7 +96,7 @@ PREFERRED_VERSION_util-macros ?= "1.11.0"
 PREFERRED_VERSION_util-macros-native ?= "1.11.0"
 PREFERRED_VERSION_videoproto ?= "2.3.1"
 PREFERRED_VERSION_windowswmproto ?= "1.0.4"
-PREFERRED_VERSION_x11perf ?= "1.5.2"
+PREFERRED_VERSION_x11perf ?= "1.5.3"
 PREFERRED_VERSION_xauth ?= "1.0.5"
 PREFERRED_VERSION_xcmiscproto ?= "1.2.1"
 PREFERRED_VERSION_xcmiscproto-native ?= "1.2.1"
diff --git a/meta/recipes-graphics/xorg-app/x11perf_1.5.2.bb b/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
similarity index 76%
rename from meta/recipes-graphics/xorg-app/x11perf_1.5.2.bb
rename to meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
index e10fcf0..8faffe0 100644
--- a/meta/recipes-graphics/xorg-app/x11perf_1.5.2.bb
+++ b/meta/recipes-graphics/xorg-app/x11perf_1.5.3.bb
@@ -14,5 +14,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=428ca4d67a41fcd4fc3283dce9bbda7e \
 PR = "r0"
 PE = "1"
 
-SRC_URI[md5sum] = "3459958a7fdccf02fa43b70fda9cd87f"
-SRC_URI[sha256sum] = "a1fd752abd3496568614c2f2209d21452bdd5b8c9a5c14a5705725bd8c298e12"
+SRC_URI[md5sum] = "c3ac3667a6f5c3cead9847fbf4b5f36e"
+SRC_URI[sha256sum] = "394d7355afe7f3b054ce6f30db78794c6305c6593d48b7fb86a9c89d9d9e21bd"
-- 
1.7.1.1



