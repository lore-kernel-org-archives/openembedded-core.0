Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <shane.wang@intel.com>) id 1S8LRO-0002AU-IG
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 01:54:46 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 15 Mar 2012 17:45:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="139662859"
Received: from yocto-build5.sh.intel.com (HELO localhost) ([10.239.48.3])
	by fmsmga002.fm.intel.com with ESMTP; 15 Mar 2012 17:45:53 -0700
From: Shane Wang <shane.wang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2012 08:52:41 +0800
Message-Id: <6977fb281b374b861328f67324674e0de4682eba.1331859047.git.shane.wang@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
References: <fa4a26b05739e4f22b999571ff20a35ec84d29e7.1331859046.git.shane.wang@intel.com>
In-Reply-To: <cover.1331859046.git.shane.wang@intel.com>
References: <cover.1331859046.git.shane.wang@intel.com>
Subject: [PATCH 44/60] libXmu: upgrade to 1.1.1
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
X-List-Received-Date: Fri, 16 Mar 2012 00:54:46 -0000

The license change is:

--- libXmu-1.1.0/COPYING        2009-10-17 05:26:51.000000000 +0800
+++ libXmu-1.1.1/COPYING        2012-03-06 15:00:13.000000000 +0800
@@ -28,13 +28,13 @@

                         All Rights Reserved

-Permission to use, copy, modify, and distribute this software and its
-documentation for any purpose and without fee is hereby granted,
+Permission to use, copy, modify, and distribute this software and its
+documentation for any purpose and without fee is hereby granted,
 provided that the above copyright notice appear in all copies and that
-both that copyright notice and this permission notice appear in
+both that copyright notice and this permission notice appear in
 supporting documentation, and that the name of Digital not be
 used in advertising or publicity pertaining to distribution of the
-software without specific, written prior permission.
+software without specific, written prior permission.

 DIGITAL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
 ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../xorg-lib/{libxmu_1.1.0.bb => libxmu_1.1.1.bb}  |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxmu_1.1.0.bb => libxmu_1.1.1.bb} (78%)

diff --git a/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb b/meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
similarity index 78%
rename from meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb
rename to meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
index 4195306..18ced97 100644
--- a/meta/recipes-graphics/xorg-lib/libxmu_1.1.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libxmu_1.1.1.bb
@@ -11,7 +11,7 @@ second library, libXmuu."
 require xorg-lib-common.inc
 
 LICENSE = "MIT & MIT-style"
-LIC_FILES_CHKSUM = "file://COPYING;md5=bb8d1df693806ad17c7268086f1d5394"
+LIC_FILES_CHKSUM = "file://COPYING;md5=15f1d981860c677503992da79140669c"
 
 DEPENDS += "libxt libxext"
 PROVIDES = "xmu"
@@ -30,5 +30,5 @@ FILES_libxmuu-dev = "${libdir}/libXmuu.so"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[md5sum] = "6836883a0120e8346cf7f58dc42e465a"
-SRC_URI[sha256sum] = "0fa91f303b70decc1ef6201c88c8a5f0b4ecd68c6c88bdcc891ecd1a689d36ad"
+SRC_URI[md5sum] = "a4efff8de85bd45dd3da124285d10c00"
+SRC_URI[sha256sum] = "709081c550cc3a866d7c760a3f97384a1fe16e27fc38fe8169b8db9f33aa7edd"
-- 
1.7.6



