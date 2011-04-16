Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QAzQ2-00069q-5H
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Apr 2011 08:55:46 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Apr 2011 23:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,223,1301900400"; d="scan'208";a="734219545"
Received: from unknown (HELO localhost) ([10.255.12.232])
	by orsmga001.jf.intel.com with ESMTP; 15 Apr 2011 23:53:28 -0700
Message-Id: <4f24be79963376b34c420bf8e76913596146de57.1302936483.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302936483.git.sgw@linux.intel.com>
References: <cover.1302936483.git.sgw@linux.intel.com>
Old-Date: Wed, 13 Apr 2011 13:38:25 +0800
Date: Fri, 15 Apr 2011 23:53:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 16 Apr 2011 12:03:17 +0200
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Jingdong Lu <jingdong.lu@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>
Subject: [PATCH 07/58] alsa-lib: upgrade to version 1.0.24.1
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
X-List-Received-Date: Sat, 16 Apr 2011 06:55:46 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../fix-tstamp-declaration.patch                   |    2 ++
 .../unbreak_plugindir.patch                        |    2 ++
 .../{alsa-lib_1.0.23.bb => alsa-lib_1.0.24.1.bb}   |    4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.23 => alsa-lib-1.0.24.1}/fix-tstamp-declaration.patch (95%)
 rename meta/recipes-multimedia/alsa/{alsa-lib-1.0.23 => alsa-lib-1.0.24.1}/unbreak_plugindir.patch (91%)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.23.bb => alsa-lib_1.0.24.1.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.23/fix-tstamp-declaration.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch
similarity index 95%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.23/fix-tstamp-declaration.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch
index 9016b34..32b84b7 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib-1.0.23/fix-tstamp-declaration.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/fix-tstamp-declaration.patch
@@ -4,6 +4,8 @@
 #
 # Acquired from OpenEmbedded
 
+Upstream-Status: Pending
+
 Index: alsa-lib-1.0.13/include/global.h
 ===================================================================
 --- alsa-lib-1.0.13.orig/include/global.h
diff --git a/meta/recipes-multimedia/alsa/alsa-lib-1.0.23/unbreak_plugindir.patch b/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib-1.0.23/unbreak_plugindir.patch
rename to meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch
index 7d13166..1f3edd0 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib-1.0.23/unbreak_plugindir.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib-1.0.24.1/unbreak_plugindir.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Inappropriate [configuration]
+
 diff -Nur alsa-lib-1.0.14.orig/configure.in alsa-lib-1.0.14/configure.in
 --- alsa-lib-1.0.14.orig/configure.in	2007-05-31 03:05:13.000000000 -0500
 +++ alsa-lib-1.0.14/configure.in	2007-08-18 13:05:49.000000000 -0500
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
index 936f299..53f4d29 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.23.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb
@@ -19,8 +19,8 @@ PR = "r0"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-${PV}.tar.bz2 \
            file://fix-tstamp-declaration.patch;patch=1"
 
-SRC_URI[md5sum] = "f48b50421d8a69d2d806d9c47e534f0d"
-SRC_URI[sha256sum] = "b4238ecaba5e4a1383af06180611a57ef29f9bf47bc177136dba1bb5b70ff423"
+SRC_URI[md5sum] = "7cc05f25e1d5b65da8fb3fdcd540f226"
+SRC_URI[sha256sum] = "a32f7c21015b6c71f9a80ff70a2b6a50e4ff4d5c77c744ff0793dea7ba7a2517"
 
 inherit autotools pkgconfig
 
-- 
1.7.1.1



