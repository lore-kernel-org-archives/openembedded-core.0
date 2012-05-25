Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoOS-00085R-RW
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:01 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:42:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115438"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:30 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:04 -0700
Message-Id: <7358ba74cd09c3ec1affafd498aea03a00564c52.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 25/45] minicom: fix build with automake 1.12
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
X-List-Received-Date: Fri, 25 May 2012 06:53:02 -0000

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
1.7.7.6



