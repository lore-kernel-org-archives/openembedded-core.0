Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO0-0005Bj-Np
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:08 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 23:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="737332128"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 23:29:17 -0700
Message-Id: <3623f24182ad592a93656665fb76258ff7e68b36.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Thu, 7 Apr 2011 10:47:16 -0700
Date: Fri, 22 Apr 2011 23:29:16 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 23/37] python-gst: upgrade from 0.10.19 to 0.10.21
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../python/python-gst/python-path.patch            |    2 ++
 ...python-gst_0.10.19.bb => python-gst_0.10.21.bb} |    6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python-gst_0.10.19.bb => python-gst_0.10.21.bb} (82%)

diff --git a/meta/recipes-devtools/python/python-gst/python-path.patch b/meta/recipes-devtools/python/python-gst/python-path.patch
index 00bab2c..21b5bbf 100644
--- a/meta/recipes-devtools/python/python-gst/python-path.patch
+++ b/meta/recipes-devtools/python/python-gst/python-path.patch
@@ -1,3 +1,5 @@
+Upstream-Status:Pending
+
 Index: gst-python-0.10.19/acinclude.m4
 ===================================================================
 --- gst-python-0.10.19.orig/acinclude.m4	2010-04-21 15:23:44.000000000 -0700
diff --git a/meta/recipes-devtools/python/python-gst_0.10.19.bb b/meta/recipes-devtools/python/python-gst_0.10.21.bb
similarity index 82%
rename from meta/recipes-devtools/python/python-gst_0.10.19.bb
rename to meta/recipes-devtools/python/python-gst_0.10.21.bb
index 22d6339..dd1ad5f 100644
--- a/meta/recipes-devtools/python/python-gst_0.10.19.bb
+++ b/meta/recipes-devtools/python/python-gst_0.10.21.bb
@@ -3,13 +3,13 @@ SECTION = "devel/python"
 LICENSE = "LGPLv2.1"
 DEPENDS = "gstreamer gst-plugins-base python-pygobject"
 RDEPENDS_${PN} += "python-pygtk"
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/gst-python/gst-python-${PV}.tar.bz2 \
            file://python-path.patch"
 
-SRC_URI[md5sum] = "ddcef7d00bd88b0591cd6d910c36ec4b"
-SRC_URI[sha256sum] = "956f81a8c15daa3f17e688a0dc5a5d18a3118141066952d3b201a6ac0c52b415"
+SRC_URI[md5sum] = "31340ae3e877797a10d088a226d74b16"
+SRC_URI[sha256sum] = "d5962132c84b88b54d0f63832b8dfcc383a7805827da5abc2d1d215ba86a6f92"
 S = "${WORKDIR}/gst-python-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=39ff67e932b7bdfa9b78bad67151690b"
-- 
1.7.1.1



