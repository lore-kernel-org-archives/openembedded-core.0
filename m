Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKz-0004cO-GM
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:23 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472136"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:04 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:48 -0800
Message-Id: <4a7b8606399614f6949794b45c383956c3e1ef1c.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/33] bdwgc: new recipe for autogen
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:24 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This recipe is needed by guile.
And guile is needed for autogen.

As per Beth's recommondation changed the license specification of the
recipe as

LICENSE = "MIT & FSF-Unlimited & GPL-2.0"

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/bdwgc/bdwgc_20110107.bb |   37 ++++++++++++++++++++++++++
 1 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
new file mode 100644
index 0000000..327e59b
--- /dev/null
+++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
@@ -0,0 +1,37 @@
+SUMMARY = "A garbage collector for C and C++"
+
+DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can be\
+ used as a garbage collecting replacement for C malloc or C++ new. It allows\
+ you to allocate memory basically as you normally would, without explicitly\
+ deallocating memory that is no longer useful. The collector automatically\
+ recycles memory when it determines that it can no longer be otherwise\
+ accessed.\
+  The collector is also used by a number of programming language\
+ implementations that either use C as intermediate code, want to facilitate\
+ easier interoperation with C libraries, or just prefer the simple collector\
+ interface.\
+  Alternatively, the garbage collector may be used as a leak detector for C\
+ or C++ programs, though that is not its primary goal.\
+  Empirically, this collector works with most unmodified C programs, simply\
+ by replacing malloc with GC_malloc calls, replacing realloc with GC_realloc\
+ calls, and removing free calls."
+
+HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
+SECTION = "devel"
+LICENSE = "MIT & FSF-Unlimited & GPL-2.0"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc \
+                    file://doc/README;md5=6d74ce18ff55d936a4d6bd35a98e9eb9 \
+                    file://libatomic_ops/doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab"
+
+SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-20110107.tar.bz2"
+
+SRC_URI[md5sum] = "4f3c130fc71ff23584edaa19a37739ee"
+SRC_URI[sha256sum] = "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
+FILES_${PN}-doc = "/usr/share"
+
+PR = "r1"
+
+S = "${WORKDIR}/bdwgc"
+
+inherit autotools
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.5



