Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRern-00042u-AM
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203802"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:37 -0700
Message-Id: <cb9d282f6cfb3ee97b179ad6491d66e661944736.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/32] gobject-introspection: Update to 0.10.8 Git
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:20 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../gnome/gobject-introspection/configure.patch    |    2 ++
 .../gnome/gobject-introspection/pathfix.patch      |    2 ++
 .../gnome/gobject-introspection_git.bb             |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gobject-introspection/configure.patch b/meta/recipes-gnome/gnome/gobject-introspection/configure.patch
index c441799..5dcd9b0 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection/configure.patch
+++ b/meta/recipes-gnome/gnome/gobject-introspection/configure.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 Index: git/common.mk
 ===================================================================
 --- git.orig/common.mk	2009-08-19 11:11:26.000000000 +0100
diff --git a/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch b/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
index 472cb86..a96e4b1 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
+++ b/meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/giscanner/dumper.py
 ===================================================================
 --- git.orig/giscanner/dumper.py	2010-11-29 15:14:35.000000000 -0800
diff --git a/meta/recipes-gnome/gnome/gobject-introspection_git.bb b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
index a47e808..d5723bf 100644
--- a/meta/recipes-gnome/gnome/gobject-introspection_git.bb
+++ b/meta/recipes-gnome/gnome/gobject-introspection_git.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING.tools;md5=94d55d512a9ba36caa9b7df079bae19f \
 		    file://COPYING.lib;md5=3bf50002aefd002f49e7bb854063f7e7"
 
 SRCREV = "efa7266bcf78478ce62e8dd778a4f0417bfd4d15"
-PV = "0.0+git${SRCPV}"
-PR = "r3"
+PV = "0.10.8+git${SRCPV}"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.3.4



