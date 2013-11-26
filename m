Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C29286DD76
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:42:11 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Nov 2013 06:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,775,1378882800"; d="scan'208";a="440218582"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.39])
	by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2013 06:42:10 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 14:41:57 +0000
Message-Id: <b05afc0c82838658d6efa5a474d1913d2151ef6c.1385476873.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1385476873.git.paul.eggleton@linux.intel.com>
References: <cover.1385476873.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 7/7] Don't set DESCRIPTION to the same value as SUMMARY
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 14:42:12 -0000

Setting DESCRIPTION to the same value as SUMMARY doesn't do anything,
since the value of DESCRIPTION will be derived from SUMMARY if not
specified.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb                  | 1 -
 meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb                | 1 -
 .../docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb   | 1 -
 meta/recipes-devtools/dosfstools/dosfstools_2.11.bb                      | 1 -
 meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb     | 1 -
 meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb                  | 1 -
 meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb                   | 1 -
 meta/recipes-extended/cups/cups.inc                                      | 1 -
 meta/recipes-extended/grep/grep_2.15.bb                                  | 1 -
 meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb                 | 1 -
 meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb                   | 1 -
 meta/recipes-extended/shadow/shadow.inc                                  | 1 -
 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb                         | 1 -
 meta/recipes-support/libevent/libevent_2.0.21.bb                         | 1 -
 14 files changed, 14 deletions(-)

diff --git a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
index f840d8b..fcc9e87 100644
--- a/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
+++ b/meta/recipes-connectivity/nfs-utils/libnfsidmap_0.25.bb
@@ -1,5 +1,4 @@
 SUMMARY = "NFS id mapping library"
-DESCRIPTION = "NFS id mapping library"
 HOMEPAGE = "http://www.citi.umich.edu/projects/nfsv4/linux/"
 SECTION = "libs"
 
diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
index 2ae3f4a..38de407 100644
--- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
+++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01a17.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "A set of tools for CD recording, including cdrecord"
-DESCRIPTION = "A set of tools for CD recording, including cdrecord"
 HOMEPAGE = "http://cdrecord.berlios.de/private/cdrecord.html"
 SECTION = "console/utils"
 LICENSE = "GPLv2 & CDDL-1.0 & LGPLv2.1+"
diff --git a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
index c70e76d..e623690 100644
--- a/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
+++ b/meta/recipes-devtools/docbook-dsssl-stylesheets/docbook-dsssl-stylesheets-native_1.79.bb
@@ -1,5 +1,4 @@
 SUMMARY = "DSSSL stylesheets used to transform SGML and XML DocBook files"
-DESCRIPTION = "DSSSL stylesheets used to transform SGML and XML DocBook files"
 HOMEPAGE= "http://docbook.sourceforge.net"
 # Simple persmissive
 LICENSE = "DSSSL"
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index b7b85f0..a6a7ddc 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -2,7 +2,6 @@
 # Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
 # Released under the MIT license (see packages/COPYING)
 SUMMARY = "DOS FAT Filesystem Utilities"
-DESCRIPTION = "DOS FAT Filesystem Utilities"
 
 SECTION = "base"
 LICENSE = "GPLv2"
diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
index ba9c72e..ea0ffcb 100644
--- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
+++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Convert LinuxDoc SGML source into other formats"
-DESCRIPTION = "Convert LinuxDoc SGML source into other formats"
 HOMEPAGE = "http://packages.debian.org/linuxdoc-tools"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=077ef64ec3ac257fb0d786531cf26931"
diff --git a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
index fbf9e77..fe03b82 100644
--- a/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
+++ b/meta/recipes-devtools/qemu/nativesdk-qemu-helper_1.0.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Qemu helper scripts"
-DESCRIPTION = "Qemu helper scripts"
 LICENSE = "GPLv2"
 RDEPENDS_${PN} = "nativesdk-qemu"
 PR = "r9"
diff --git a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
index 1b612c0..be03fc5 100644
--- a/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
+++ b/meta/recipes-devtools/sgmlspl/sgmlspl-native_1.03ii.bb
@@ -1,5 +1,4 @@
 SUMMARY = "A simple post-processor for SGMLS and NSGMLS"
-DESCRIPTION = "A simple post-processor for SGMLS and NSGMLS"
 HOMEPAGE = "http://search.cpan.org/src/DMEGG/SGMLSpm-1.03ii/DOC/HTML/SGMLSpm/sgmlspm.html"
 SECTION = "libs"
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 62295b7..cb5b1a7 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -1,5 +1,4 @@
 SUMMARY = "An Internet printing system for Unix"
-DESCRIPTION = "An Internet printing system for Unix."
 SECTION = "console/utils"
 LICENSE = "GPLv2 & LGPLv2"
 DEPENDS = "gnutls libpng jpeg dbus dbus-glib zlib libusb"
diff --git a/meta/recipes-extended/grep/grep_2.15.bb b/meta/recipes-extended/grep/grep_2.15.bb
index b6aa882..b24188f 100644
--- a/meta/recipes-extended/grep/grep_2.15.bb
+++ b/meta/recipes-extended/grep/grep_2.15.bb
@@ -1,5 +1,4 @@
 SUMMARY = "GNU grep utility"
-DESCRIPTION = "GNU grep utility"
 HOMEPAGE = "http://savannah.gnu.org/projects/grep/"
 BUGTRACKER = "http://savannah.gnu.org/bugs/?group=grep"
 SECTION = "console/utils"
diff --git a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
index 4a1f79f..9d2ca4d 100644
--- a/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-securetty_4.1.4.3.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Provider of the machine specific securetty file"
-DESCRIPTION = "Provider of the machine specific securetty file"
 SECTION = "base utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
index d379c1f..697569c 100644
--- a/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Shadow utils requirements for useradd.bbclass"
-DESCRIPTION = "Shadow utils requirements for useradd.bbclass"
 HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
 BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base utils"
diff --git a/meta/recipes-extended/shadow/shadow.inc b/meta/recipes-extended/shadow/shadow.inc
index 5ab978a..33ecc7d 100644
--- a/meta/recipes-extended/shadow/shadow.inc
+++ b/meta/recipes-extended/shadow/shadow.inc
@@ -1,5 +1,4 @@
 SUMMARY = "Tools to change and administer password and group data"
-DESCRIPTION = "Tools to change and administer password and group data"
 HOMEPAGE = "http://pkg-shadow.alioth.debian.org"
 BUGTRACKER = "https://alioth.debian.org/tracker/?group_id=30580"
 SECTION = "base utils"
diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
index c18bc11..1125e14 100644
--- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
+++ b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
@@ -1,5 +1,4 @@
 SUMMARY = "Perl module for provides screen dump of Perl data."
-DESCRIPTION = "Perl module for provides screen dump of Perl data."
 
 HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
 SECTION = "libs"
diff --git a/meta/recipes-support/libevent/libevent_2.0.21.bb b/meta/recipes-support/libevent/libevent_2.0.21.bb
index 2fbe659..5a1ff3b 100644
--- a/meta/recipes-support/libevent/libevent_2.0.21.bb
+++ b/meta/recipes-support/libevent/libevent_2.0.21.bb
@@ -1,5 +1,4 @@
 SUMMARY = "An asynchronous event notification library"
-DESCRIPTION = "An asynchronous event notification library"
 HOMEPAGE = "http://libevent.org/"
 BUGTRACKER = "http://sourceforge.net/tracker/?group_id=50884&atid=461322"
 SECTION = "libs"
-- 
1.8.1.2


