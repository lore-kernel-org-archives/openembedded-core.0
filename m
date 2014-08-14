Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id 3360B70C27
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:04 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j65JK; Thu, 14 Aug 2014 12:06:05 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:53 -0500
Message-Id: <1408043159-8108-4-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 3/9] gcc-4.9: Ensure c++ includes are in /usr/include/c++/${BINV}
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:05 -0000

Apply to gcc 4.9 the recent fix to the --with-gxx-include-dir override.

Original OE-Core rev: 5a2ff3e8f7cd7a47a5ab4e581847ecc4df87fca

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 01dfde1..bdea3405e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -120,7 +120,7 @@ EXTRA_OECONF_INTERMEDIATE = "\
 EXTRA_OECONF_append_libc-uclibc = " --disable-decimal-float "
 
 EXTRA_OECONF_PATHS = "\ 
-    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++ \ 
+    --with-gxx-include-dir=${STAGING_DIR_TARGET}${target_includedir}/c++/${BINV} \ 
     --with-sysroot=${STAGING_DIR_TARGET} \ 
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
-- 
1.8.5.5


