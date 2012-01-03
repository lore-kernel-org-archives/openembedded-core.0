Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrC-0004O6-R9
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752170"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:52 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:18 -0800
Message-Id: <86ead283629303c835316974d5682e0f29bb9655.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 032/113] libsamplerate0: upgrade to 0.1.8
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
X-List-Received-Date: Tue, 03 Jan 2012 06:28:25 -0000

From: Shane Wang <shane.wang@intel.com>

This patch is to upgrade libsamplerate0 to 0.1.8 and remove the patch for 0.1.7.
In the new code, the fix is there in M4/endian.m4 (which is part of acinclude.m4 in 0.1.7)
The license is changed from "Copyright (C) 2002-2008 Erik de Castro Lopo <erikd@mega-nerd.com>" to "Copyright (C) 2002-2011 Erik de Castro Lopo <erikd@mega-nerd.com>".

Signed-off-by: Shane Wang <shane.wang@intel.com>
---
 .../libsamplerate-0.1.7-macro-quoting.patch        |   22 --------------------
 ...amplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} |    9 +++----
 2 files changed, 4 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.7.bb => libsamplerate0_0.1.8.bb} (61%)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
deleted file mode 100644
index 1518d7e..0000000
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff -ruN libsamplerate-0.1.7-orig//acinclude.m4 libsamplerate-0.1.7/acinclude.m4
---- libsamplerate-0.1.7-orig//acinclude.m4	2011-04-20 15:04:25.147664992 +0800
-+++ libsamplerate-0.1.7/acinclude.m4	2011-04-20 15:04:45.397665029 +0800
-@@ -135,7 +135,6 @@
- 	fi
- 
- )
--]
- 
- if test $ac_cv_c_byte_order = big ; then
- 	ac_cv_c_big_endian=1
-@@ -154,7 +153,7 @@
- 	AC_MSG_WARN([[*****************************************************************]])
- 	fi
- 
--)# AC_C_FIND_ENDIAN
-+])# AC_C_FIND_ENDIAN
- 
- 
- 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
similarity index 61%
rename from meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
rename to meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
index d08640f..949b3d0 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
@@ -2,15 +2,14 @@ DESCRIPTION = "An audio Sample Rate Conversion library"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/samplerate.c;beginline=1;endline=17;md5=ed4dfdaa3bdf0f817ebc70cee0cccc88"
+                    file://src/samplerate.c;beginline=1;endline=17;md5=d0807c35fc906466d24a50463534815a"
 DEPENDS = "flac"
 PR = "r0"
 
-SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
-           file://libsamplerate-0.1.7-macro-quoting.patch"
+SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "6731a81cb0c622c483b28c0d7f90867d"
-SRC_URI[sha256sum] = "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
+SRC_URI[md5sum] = "1c7fb25191b4e6e3628d198a66a84f47"
+SRC_URI[sha256sum] = "93b54bdf46d5e6d2354b7034395fe329c222a966790de34520702bb9642f1c06"
 S = "${WORKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.6.4



