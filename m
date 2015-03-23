Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id 486A96AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:42:21 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:42:21 +0100
Message-Id: <1427125341-5101-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] python: fix cached config value for /dev/ptmx
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
X-List-Received-Date: Mon, 23 Mar 2015 15:42:21 -0000

Linux usually has /dev/ptmx, so set set it to yes.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/python/python_2.7.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.9.bb b/meta/recipes-devtools/python/python_2.7.9.bb
index 4087c2c..bc44c72 100644
--- a/meta/recipes-devtools/python/python_2.7.9.bb
+++ b/meta/recipes-devtools/python/python_2.7.9.bb
@@ -37,7 +37,7 @@ TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
 TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
 
 # The following is a hack until we drop ac_cv_sizeof_off_t from site files
-EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=no ac_cv_file__dev_ptc=no"
+EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', 'ac_cv_sizeof_off_t=8', '', d)} ac_cv_file__dev_ptmx=yes ac_cv_file__dev_ptc=no"
 
 do_configure_append() {
 	rm -f ${S}/Makefile.orig
-- 
1.9.1


