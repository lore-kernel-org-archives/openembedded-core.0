Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrQ-0004pi-1I
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:36 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752262"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:21:08 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:20:03 -0800
Message-Id: <5683cd23a4e7bd2bedcbd55229896bf4f7e69426.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 077/113] misc patches: fix patch headers
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:38 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These patches were marked by "UpstreamStatus:" line, fix it to use
"Upstream-Status:" instead.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../libacpi/files/libacpi_fix_for_x32.patch        |    2 +-
 .../openssl-1.0.0e/openssl_fix_for_x32.patch       |    2 +-
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |    2 +-
 .../findutils-4.4.2/findutils_fix_for_x32.patch    |    2 +-
 .../mdadm/files/mdadm-3.2.2_fix_for_x32.patch      |    2 +-
 .../pax/pax/pax-3.4_fix_for_x32.patch              |    2 +-
 .../mesa/mesa/mesa_fix_for_x32.patch               |    2 +-
 .../xorg-lib/libxt/libxt_fix_for_x32.patch         |    2 +-
 .../xorg-proto/xproto/xproto_fix_for_x32.patch     |    2 +-
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |    2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
index 5f2d034..2fed344 100644
--- a/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
+++ b/meta/recipes-bsp/libacpi/files/libacpi_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Fix libacpi for x32
     
diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
index 2dbcd01..3191ce9 100644
--- a/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Received from H J Liu @ Intel
 Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
index 70cbbbe..2920e2f 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Pass CC & CFLAGS vars so that tune parameters get used.
 This fixes compilation with x32 toolchain.
diff --git a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
index dd2ab0e..b78cc75 100644
--- a/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
+++ b/meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Author: H.J. Lu <hjl.tools@gmail.com>
 
diff --git a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
index 79ba2cf..58d54f9 100644
--- a/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
+++ b/meta/recipes-extended/mdadm/files/mdadm-3.2.2_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: pending
+Upstream-Status: pending
 
 By hardcoding CC's definition in the Makefile, all the gcc parameters 
 set by tune settings are lost. Causing compile failure with x32 toolchain
diff --git a/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
index 11dfa0f..80878f3 100644
--- a/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
+++ b/meta/recipes-extended/pax/pax/pax-3.4_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Author: H.J. Lu <hjl.tools@gmail.com>
 Date:   Tue Dec 6 10:34:53 2011 -0800
diff --git a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
index dfd67fe..8994faf 100644
--- a/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
+++ b/meta/recipes-graphics/mesa/mesa/mesa_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 get correct compiler options for x32 gcc.
 
diff --git a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
index 57ddbeb..ce6c756 100644
--- a/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-lib/libxt/libxt_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 This fixes compilation with x32 toolchain.
 
diff --git a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
index c9fbb6f..540ad27 100644
--- a/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
+++ b/meta/recipes-graphics/xorg-proto/xproto/xproto_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 Don't always define LONG64 for AMD64
     
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
index 39dad32..b68ac5b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
@@ -1,4 +1,4 @@
-UpstreamStatus: Pending
+Upstream-Status: Pending
 
 This patch makes assembly syntax compatible to the x32 toolchain.
 
-- 
1.7.6.4



