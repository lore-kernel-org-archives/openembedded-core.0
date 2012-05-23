Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1SWzDF-0006Ll-BD
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 02:14:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="146507172"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2012 17:03:48 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 May 2012 17:03:33 -0700
Message-Id: <fabb3f392691608a2031cae79f4301f926521d56.1337731367.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
References: <1f3e6932358a90ba8402191fb495729c873634cb.1337731367.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1337731367.git.nitin.a.kamble@intel.com>
References: <cover.1337731367.git.nitin.a.kamble@intel.com>
Subject: [PATCH 18/30] minicom: fix build with automake 1.12
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
X-List-Received-Date: Wed, 23 May 2012 00:14:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../minicom_fix_for_automake-1.12.patch            |   21 ++++++++++++++++++++
 meta/recipes-extended/minicom/minicom_2.6.1.bb     |    3 ++
 2 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch

diff --git a/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch b/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
new file mode 100644
index 0000000..aba6298
--- /dev/null
+++ b/meta/recipes-extended/minicom/minicom-2.6.1/minicom_fix_for_automake-1.12.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Pending
+
+This patch fixes following issue with automake 1.12
+
+| configure.in:193: error: automatic de-ANSI-fication support has been removed
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2012/05/03
+
+Index: minicom-2.6.1/configure.in
+===================================================================
+--- minicom-2.6.1.orig/configure.in
++++ minicom-2.6.1/configure.in
+@@ -190,7 +190,6 @@ AC_CHECK_HEADERS(stdarg.h varargs.h term
+ 
+ dnl Checks for typedefs, structures, and compiler characteristics.
+ AC_C_CONST
+-AM_C_PROTOTYPES
+ AC_TYPE_UID_T
+ AC_TYPE_MODE_T
+ AC_TYPE_PID_T
diff --git a/meta/recipes-extended/minicom/minicom_2.6.1.bb b/meta/recipes-extended/minicom/minicom_2.6.1.bb
index 3a9f934..b54853d 100644
--- a/meta/recipes-extended/minicom/minicom_2.6.1.bb
+++ b/meta/recipes-extended/minicom/minicom_2.6.1.bb
@@ -6,8 +6,11 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
+PR = "r1"
+
 SRC_URI = "http://alioth.debian.org/frs/download.php/3700/minicom-${PV}.tar.gz \
 	file://rename-conflicting-functions.patch \
+	file://minicom_fix_for_automake-1.12.patch \
 	"
 #	file://gcc4-scope.patch
 
-- 
1.7.7



