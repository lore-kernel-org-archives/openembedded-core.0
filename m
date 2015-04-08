Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id B784C73C3F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 12:33:42 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 69BDFF811E0; Wed,  8 Apr 2015 06:33:43 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from Zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id CEF96F811E0;
	Wed,  8 Apr 2015 06:33:42 -0600 (MDT)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 06:33:53 -0600
Message-Id: <1428496433-1853-1-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.9.1
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH] libgpg-error: Fix native build on i686
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
X-List-Received-Date: Wed, 08 Apr 2015 12:33:42 -0000

Most modern x86 systems return i686 as the system type.  This
patch handles i486, i586 and i686 correctly.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.18.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
index 6d11605..268066b 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.18.bb
@@ -30,7 +30,7 @@ do_compile_prepend() {
 	  aarch64)    TUPLE=aarch64-unknown-linux-gnu ;;
 	  arm)	      TUPLE=arm-unknown-linux-gnueabi ;;
 	  armeb)      TUPLE=arm-unknown-linux-gnueabi ;;
-	  i586)       TUPLE=i486-pc-linux-gnu ;;
+	  i586|i686)  TUPLE=i486-pc-linux-gnu ;;
 	  mipsel)     TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips64el)   TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips64)     TUPLE=mips-unknown-linux-gnu ;;
-- 
1.9.1


