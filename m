Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RcPvf-0006Ry-6i
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 00:14:05 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id C10712FE8A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 18:06:57 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 15:06:57 -0800
Message-Id: <885bb4bef9f138e14598bbc28d30e5c24c7cf3de.1324249522.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324249522.git.scott.a.garman@intel.com>
References: <cover.1324249522.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1324249522.git.scott.a.garman@intel.com>
References: <cover.1324249522.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: C10712FE8A.A5A9F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/1] Add missing SUMMARY fields to various recipes
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
X-List-Received-Date: Sun, 18 Dec 2011 23:14:05 -0000

This adds the SUMMARY field to the following recipes which were
missing it:

* dosfstools
* grep
* icu
* libevent
* libnfsidmap
* qemu-helper-nativesdk

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
 .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
 meta/recipes-extended/grep/grep_2.9.bb             |    1 +
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
 6 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
index 101ecab..eff75ec 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.24.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "nfs idmapping library"
+SUMMARY = "NFS id mapping library"
+DESCRIPTION = "NFS id mapping library"
 HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
 SECTION = "libs"
 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index ec75ac9..eca54f1 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -1,7 +1,7 @@
 # dosfstools OE build file
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
-
+SUMMARY = "DOS FAT Filesystem Utilities"
 DESCRIPTION = "DOS FAT Filesystem Utilities"
 
 SECTION = "base"
diff --git a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
index a3dca3d..df0cae0 100644
--- a/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-helper-nativesdk_1.0.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "Qemu helper scripts from Poky"
+SUMMARY = "Qemu helper scripts"
+DESCRIPTION = "Qemu helper scripts"
 LICENSE = "GPLv2"
 RDEPENDS_${PN} = "qemu-nativesdk"
 PR = "r9"
diff --git a/meta/recipes-extended/grep/grep_2.9.bb b/meta/recipes-extended/grep/grep_2.9.bb
index 08ac527..9099bed 100644
--- a/meta/recipes-extended/grep/grep_2.9.bb
+++ b/meta/recipes-extended/grep/grep_2.9.bb
@@ -1,3 +1,4 @@
+SUMMARY = "GNU grep utility"
 DESCRIPTION = "GNU grep utility"
 HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
diff --git a/meta/recipes-support/icu/icu-3.6.inc b/meta/recipes-support/icu/icu-3.6.inc
index 8fadc92..e3f9dd2 100644
--- a/meta/recipes-support/icu/icu-3.6.inc
+++ b/meta/recipes-support/icu/icu-3.6.inc
@@ -1,3 +1,4 @@
+SUMMARY = "International Component for Unicode libraries"
 DESCRIPTION = "The International Component for Unicode (ICU) is a mature, portable set of C/C++ and Java libraries for Unicode support, software internationalization (I18N) and globalization (G11N), giving applications the same results on all platforms."
 HOMEPAGE = "http://www-01.ibm.com/software/globalization/icu/index.jsp"
 
diff --git a/meta/recipes-support/libevent/libevent_1.4.14b.bb b/meta/recipes-support/libevent/libevent_1.4.14b.bb
index 1a369b5..36468dc 100644
--- a/meta/recipes-support/libevent/libevent_1.4.14b.bb
+++ b/meta/recipes-support/libevent/libevent_1.4.14b.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "an asynchronous event notification library"
+SUMMARY = "An asynchronous event notification library"
+DESCRIPTION = "An asynchronous event notification library"
 HOMEPAGE = "http://www.monkey.org/~provos/libevent/"
 SECTION = "libs"
 
-- 
1.7.5.4



