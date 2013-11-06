Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B4EDF6D437
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Nov 2013 23:31:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Nov 2013 15:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,647,1378882800"; d="scan'208";a="429088233"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.249])
	by fmsmga002.fm.intel.com with ESMTP; 06 Nov 2013 15:31:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Nov 2013 15:31:59 -0800
Message-Id: <1383780719-21615-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] binutils: remove embedspu
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
X-List-Received-Date: Wed, 06 Nov 2013 23:31:58 -0000

This is only built for PPC and not needed, so remove it to fix the QA Issue

ERROR: QA Issue: binutils: Files/directories were installed but not shipped
  /usr/bin/embedspu

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v2: fix spelling and add powerpc override

 meta/recipes-devtools/binutils/binutils_2.23.2.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/binutils/binutils_2.23.2.bb b/meta/recipes-devtools/binutils/binutils_2.23.2.bb
index 1523e87..c8c77a0 100644
--- a/meta/recipes-devtools/binutils/binutils_2.23.2.bb
+++ b/meta/recipes-devtools/binutils/binutils_2.23.2.bb
@@ -10,6 +10,12 @@ EXTRA_OECONF += "--with-sysroot=/ \
 
 EXTRA_OECONF_class-native = "--enable-targets=all --enable-64-bit-bfd --enable-install-libbfd"
 
+do_install_append_class-target_powerpc () {
+        # we dont really care about embedspu for ppc so remove it
+        rm -f ${D}/${bindir}/embedspu || :
+}
+
+
 do_install_class-native () {
 	autotools_do_install
 
-- 
1.8.3.1


