Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QCRwJ-0008A6-1s
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 09:35:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 20 Apr 2011 00:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,245,1301900400"; d="scan'208";a="422439297"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.13.51])
	by azsmga001.ch.intel.com with ESMTP; 20 Apr 2011 00:32:43 -0700
Message-Id: <50f8254f7aeed0a7b439eb88b92c9f678096771e.1303284287.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1303284287.git.dexuan.cui@intel.com>
References: <cover.1303284287.git.dexuan.cui@intel.com>
Old-Date: Tue, 19 Apr 2011 13:19:08 +0800
Date: Wed, 20 Apr 2011 15:30:31 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Dexuan Cui <dexuan.cui@intel.com>
Subject: [PATCH 3/9] preferred-xorg-versions.inc: update libxfixes, util-macros, xorg-cf-files
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
X-List-Received-Date: Wed, 20 Apr 2011 07:35:07 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../distro/include/preferred-xorg-versions.inc     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/preferred-xorg-versions.inc b/meta/conf/distro/include/preferred-xorg-versions.inc
index 23eaace..da730e6 100644
--- a/meta/conf/distro/include/preferred-xorg-versions.inc
+++ b/meta/conf/distro/include/preferred-xorg-versions.inc
@@ -51,7 +51,7 @@ PREFERRED_VERSION_libxdmcp-nativesdk ?= "1.1.0"
 PREFERRED_VERSION_libxevie ?= "1.0.2"
 PREFERRED_VERSION_libxext ?= "1.2.0"
 PREFERRED_VERSION_libxext-nativesdk ?= "1.2.0"
-PREFERRED_VERSION_libxfixes ?= "4.0.5"
+PREFERRED_VERSION_libxfixes ?= "5.0"
 PREFERRED_VERSION_libxfont ?= "1.4.3"
 PREFERRED_VERSION_libxfont-native ?= "1.4.3"
 PREFERRED_VERSION_libxfontcache ?= "1.0.5"
@@ -92,8 +92,8 @@ PREFERRED_VERSION_renderproto-nativesdk ?= "0.11.1"
 PREFERRED_VERSION_resourceproto ?= "1.1.1"
 PREFERRED_VERSION_scrnsaverproto ?= "1.2.1"
 PREFERRED_VERSION_trapproto ?= "3.4.3"
-PREFERRED_VERSION_util-macros ?= "1.11.0"
-PREFERRED_VERSION_util-macros-native ?= "1.11.0"
+PREFERRED_VERSION_util-macros ?= "1.13.0"
+PREFERRED_VERSION_util-macros-native ?= "1.13.0"
 PREFERRED_VERSION_videoproto ?= "2.3.1"
 PREFERRED_VERSION_windowswmproto ?= "1.0.4"
 PREFERRED_VERSION_x11perf ?= "1.5.3"
@@ -119,7 +119,7 @@ PREFERRED_VERSION_xhost ?= "1.0.4"
 PREFERRED_VERSION_xinit ?= "1.3.0"
 PREFERRED_VERSION_xineramaproto ?= "1.2.1"
 PREFERRED_VERSION_xmodmap ?= "1.0.5"
-PREFERRED_VERSION_xorg-cf-files ?= "1.0.3"
+PREFERRED_VERSION_xorg-cf-files ?= "1.0.4"
 PREFERRED_VERSION_xprop ?= "1.2.0"
 PREFERRED_VERSION_xproto ?= "7.0.21"
 PREFERRED_VERSION_xproto-native ?= "7.0.21"
-- 
1.7.2



