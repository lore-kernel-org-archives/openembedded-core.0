Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AE5FD6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 01:06:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 16 Mar 2015 18:03:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,412,1422950400"; d="scan'208";a="699635821"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga002.jf.intel.com with ESMTP; 16 Mar 2015 18:06:13 -0700
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	t2H16AN1003533; Tue, 17 Mar 2015 01:06:10 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id t2H16ASf005023;
	Tue, 17 Mar 2015 01:06:10 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id t2H16AUQ005019;
	Tue, 17 Mar 2015 01:06:10 GMT
From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Mar 2015 01:05:40 +0000
Message-Id: <1426554340-4898-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.8.2
Subject: [meta-mingw][dylan][PATCH] mingw headers to be built before gcc-crosssdk-initial
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
X-List-Received-Date: Tue, 17 Mar 2015 01:06:13 -0000

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
---
 recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bbappend | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bbappend b/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bbappend
index 7a7ca37..7e6c51c 100644
--- a/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bbappend
+++ b/recipes-devtools/gcc/gcc-crosssdk-initial_4.7.bbappend
@@ -1,3 +1,4 @@
+DEPENDS_append_mingw32 = " nativesdk-mingw-w64-headers"
 
 do_install_append_mingw32 () {
 	ln -s  ${STAGING_DIR_TARGET}/${target_exec_prefix}/ ${D}/${exec_prefix}/${TARGET_SYS}
@@ -5,4 +6,4 @@ do_install_append_mingw32 () {
 
 sysroot_stage_all_append_mingw32 () {
 	sysroot_stage_dir ${D}${exec_prefix}/${TARGET_SYS} ${SYSROOT_DESTDIR}${exec_prefix}/${TARGET_SYS}
-}
\ No newline at end of file
+}
-- 
1.8.2


