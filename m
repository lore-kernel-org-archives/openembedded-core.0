Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEO-0005Nr-Sd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:17 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Apr 2011 00:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="426203298"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by azsmga001.ch.intel.com with ESMTP; 27 Apr 2011 00:29:47 -0700
Message-Id: <bc4bcf18b627307a195073e598dae3b808bf7888.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Thu, 31 Mar 2011 20:59:32 -0700
Date: Wed, 27 Apr 2011  0:29:47 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 26/52] xorg-lib: inherit gettext class instead of adding gettext to DEPENDS directly
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:17 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb   |    4 +++-
 meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb |    4 ++--
 meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb   |    3 ++-
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
index 79078ef..793008b 100644
--- a/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
+++ b/meta/recipes-graphics/xorg-lib/libxau_1.0.6.bb
@@ -6,10 +6,12 @@ both client-side and server-side."
 
 require xorg-lib-common.inc
 
+inherit gettext
+
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7908e342491198401321cec1956807ec"
 
-DEPENDS += " xproto gettext"
+DEPENDS += " xproto"
 PROVIDES = "xau"
 
 PR = "r0"
diff --git a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
index d897dab..483dce3 100644
--- a/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.0.bb
@@ -8,6 +8,8 @@ autonomous display."
 
 require xorg-lib-common.inc
 
+inherit gettext
+
 LICENSE = "MIT-style"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d559fb26e129626022e052a5e6e0e123"
 
@@ -17,8 +19,6 @@ PROVIDES = "xdmcp"
 PR = "r0"
 PE = "1"
 
-DEPENDS += "gettext"
-
 XORG_PN = "libXdmcp"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
index 335f020..19abe5a 100644
--- a/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
+++ b/meta/recipes-graphics/xorg-lib/xtrans_1.2.6.bb
@@ -16,7 +16,8 @@ PE = "1"
 PR = "r0"
 
 RDEPENDS_${PN}-dev = ""
-DEPENDS += "gettext"
+
+inherit gettext
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.1.1



