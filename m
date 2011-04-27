Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEG-0005Jw-LE
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:08 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683222"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:39 -0700
Message-Id: <fc2bf2cc639e11e628cba76f15920997c656e15a.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Wed, 20 Apr 2011 15:09:14 +0800
Date: Wed, 27 Apr 2011  0:29:39 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 18/52] libsamplerate0: upgrade to version 0.1.7
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:08 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

Add libsamplerate-0.1.7-macro-quoting.patch to fix autoreconf issue

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 .../libsamplerate-0.1.7-macro-quoting.patch        |   22 ++++++++++++++++++++
 ...amplerate0_0.1.2.bb => libsamplerate0_0.1.7.bb} |   11 +++++----
 2 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
 rename meta/recipes-multimedia/libsamplerate/{libsamplerate0_0.1.2.bb => libsamplerate0_0.1.7.bb} (59%)

diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch b/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
new file mode 100644
index 0000000..878f969
--- /dev/null
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0-0.1.7/libsamplerate-0.1.7-macro-quoting.patch
@@ -0,0 +1,22 @@
+Upstream-Status: Pending
+
+diff -ruN libsamplerate-0.1.7-orig//acinclude.m4 libsamplerate-0.1.7/acinclude.m4
+--- libsamplerate-0.1.7-orig//acinclude.m4	2011-04-20 15:04:25.147664992 +0800
++++ libsamplerate-0.1.7/acinclude.m4	2011-04-20 15:04:45.397665029 +0800
+@@ -135,7 +135,6 @@
+ 	fi
+ 
+ )
+-]
+ 
+ if test $ac_cv_c_byte_order = big ; then
+ 	ac_cv_c_big_endian=1
+@@ -154,7 +153,7 @@
+ 	AC_MSG_WARN([[*****************************************************************]])
+ 	fi
+ 
+-)# AC_C_FIND_ENDIAN
++])# AC_C_FIND_ENDIAN
+ 
+ 
+ 
diff --git a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.2.bb b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
similarity index 59%
rename from meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.2.bb
rename to meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
index 85eb7bc..d08640f 100644
--- a/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.2.bb
+++ b/meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.7.bb
@@ -2,14 +2,15 @@ DESCRIPTION = "An audio Sample Rate Conversion library"
 SECTION = "libs"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
-                    file://src/samplerate.c;beginline=1;endline=17;md5=2deac26142757e825d957e5ac149b292"
+                    file://src/samplerate.c;beginline=1;endline=17;md5=ed4dfdaa3bdf0f817ebc70cee0cccc88"
 DEPENDS = "flac"
-PR = "r3"
+PR = "r0"
 
-SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz"
+SRC_URI = "http://www.mega-nerd.com/SRC/libsamplerate-${PV}.tar.gz \
+           file://libsamplerate-0.1.7-macro-quoting.patch"
 
-SRC_URI[md5sum] = "06861c2c6b8e5273c9b80cf736b9fd0e"
-SRC_URI[sha256sum] = "98b8766323c78b7b718dfd4ef6b9292bbf0796b742abb2319b8278cbeee731d4"
+SRC_URI[md5sum] = "6731a81cb0c622c483b28c0d7f90867d"
+SRC_URI[sha256sum] = "78ed5d9ff1bf162c4a078f6a3e7432a537dd2f22dc58872b081fb01156027fcc"
 S = "${WORKDIR}/libsamplerate-${PV}"
 
 inherit autotools pkgconfig
-- 
1.7.1.1



