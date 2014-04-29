Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11D0165D19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Apr 2014 08:51:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Apr 2014 01:51:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,949,1389772800"; d="scan'208";a="531450502"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 29 Apr 2014 01:51:13 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Apr 2014 11:54:22 +0300
Message-Id: <ffb02d4bc62d18c963c390663f69d9f8363a14a1.1398761629.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1398761629.git.cristian.iorga@intel.com>
References: <cover.1398761629.git.cristian.iorga@intel.com>
Subject: [PATCH 1/7] telepathy-glib: upgrade to 0.24.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Apr 2014 08:51:13 -0000

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../telepathy/{telepathy-glib_0.23.2.bb => telepathy-glib_0.24.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.23.2.bb => telepathy-glib_0.24.0.bb} (80%)

diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
similarity index 80%
rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb
rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
index 7d849a0..6b8c20c 100644
--- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.23.2.bb
+++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.24.0.bb
@@ -5,8 +5,8 @@ DEPENDS = "glib-2.0 dbus python-native-runtime dbus-native dbus-glib libxslt-nat
 LICENSE = "LGPLv2.1+"
 
 SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BP}.tar.gz"
-SRC_URI[md5sum] = "834ff3b4e2f0e696492a525fe1838f06"
-SRC_URI[sha256sum] = "37d5d0eb8cb801822d579182b84a9abdc24e51e5a54b663f865fd1ba2e062c83"
+SRC_URI[md5sum] = "93c429e37750b25dcf8de86bb514664f"
+SRC_URI[sha256sum] = "ae0002134991217f42e503c43dea7817853afc18863b913744d51ffa029818cf"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
 
-- 
1.9.1


