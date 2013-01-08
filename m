Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TsXdp-0004OS-Gh
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 12:46:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Jan 2013 03:31:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="188816107"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2013 03:31:36 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Jan 2013 13:34:49 +0200
Message-Id: <1357644889-15840-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] lttng-2.0: components updated to version 2.1.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 11:46:57 -0000

lttng2-ust, lttng-modules and lttng-tools were updated to version
2.1.0. Since these should be changed together, the changes are
grouped into a single patch.

The text for the lttng-tools LICENSE file has these lines changed
(according to the license text, these shouldn't impact the actual
licensing terms of the package):

=================================================================
-) include/lttng/*
-) src/lib/lttng-ctl/*

We have some tests LGPL but should not impact anything even if we change them
in the future to GPL.
=================================================================

The text for the lttng-modules LICENSE files contains a minor change in the
MIT section (a reference to the mit-license.txt file):

=================================================================
These files are licensed under an MIT-style license. See mit-license.txt
for details.
=================================================================

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../lttng-2.0/{lttng-modules_2.0.5.bb => lttng-modules_2.1.0.bb} |    6 +++---
 .../lttng-2.0/{lttng-tools_2.0.4.bb => lttng-tools_2.1.0.bb}     |    6 +++---
 .../lttng-2.0/{lttng2-ust_2.0.5.bb => lttng2-ust_2.1.0.bb}       |    4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng-modules_2.0.5.bb => lttng-modules_2.1.0.bb} (85%)
 rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0.4.bb => lttng-tools_2.1.0.bb} (88%)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.5.bb => lttng2-ust_2.1.0.bb} (93%)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.1.0.bb
similarity index 85%
rename from meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-modules_2.1.0.bb
index 4b15d93..b3a25f9 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.1.0.bb
@@ -2,7 +2,7 @@ SECTION = "devel"
 SUMMARY = "Linux Trace Toolkit KERNEL MODULE"
 DESCRIPTION = "The lttng-modules 2.0 package contains the kernel tracer modules"
 LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1eb086682a7c65a45acd9bcdf6877b3e \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1412caf5a1aa90d6a48588a4794c0eac \
                     file://gpl-2.0.txt;md5=751419260aa954499f7abaabaa882bbe \
                     file://lgpl-2.1.txt;md5=243b725d71bb5df4a1e5920b344b86ad"
 
@@ -10,8 +10,8 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
-PV = "2.0.5"
+SRCREV = "b945d6c4083ce287f390f54dff4b5e0b73a9f845"
+PV = "2.1.0"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
similarity index 88%
rename from meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
rename to meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
index 2a5dd58..482b9a6 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
@@ -5,14 +5,14 @@ to extract program execution details from the Linux operating system \
 and interpret them."
 
 LICENSE = "GPLv2 & LGPLv2.1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
 DEPENDS = "liburcu popt lttng2-ust"
 
-SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
-PV = "v2.0.4"
+SRCREV = "917f768512b5d336d553b801f6c5308d90252a89"
+PV = "v2.1.0"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
similarity index 93%
rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
index 64ae3a2..439e006 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
@@ -12,8 +12,8 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
-SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
-PV = "2.0.5"
+SRCREV = "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
+PV = "2.1.0"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
-- 
1.7.10.4



