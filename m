Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RnGIr-0008Lj-TB
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 22:10:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jan 2012 13:03:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97559479"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 13:03:11 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jan 2012 13:03:03 -0800
Message-Id: <b042b10b86d6e28290a64e42e1e23de81621630b.1326834014.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1326834014.git.nitin.a.kamble@intel.com>
References: <cover.1326834014.git.nitin.a.kamble@intel.com>
Subject: [PATCHv2 1/6] bdwgc: new recipe for autogen
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
X-List-Received-Date: Tue, 17 Jan 2012 21:10:50 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This recipe is needed by guile.
And guile is needed for autogen.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-support/bdwgc/bdwgc_20110107.bb |   38 ++++++++++++++++++++++++++
 1 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb

diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
new file mode 100644
index 0000000..1aaa5b8
--- /dev/null
+++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
@@ -0,0 +1,38 @@
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
+LICENSE = "custom"
+LIC_FILES_CHKSUM = "file://README.QUICK;md5=9b9dd874f6940641b6ab19893ee8f1cc" 
+
+SRC_URI = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/bdwgc-7_2alpha5-20110107.tar.bz2"
+
+SRC_URI[md5sum] = "4f3c130fc71ff23584edaa19a37739ee"
+SRC_URI[sha256sum] = "1f57b959ae1144e1e5fa59d52d7cb4ed626fd74cf47da1c9c119b8b46ae2722d"
+
+PR = "r0"
+
+S = "${WORKDIR}/bdwgc"
+
+do_install_append (){
+	rm -f ${D}${datadir}/${PN}
+}
+
+inherit autotools
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.6.4



