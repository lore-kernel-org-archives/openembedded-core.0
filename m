Return-Path: <obi@opendreambox.org>
Received: from mail.saftware.de (mail.saftware.de [83.141.3.46])
	by mail.openembedded.org (Postfix) with ESMTP id BEFE473BE3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 15:37:00 +0000 (UTC)
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 16:30:03 +0100
Message-Id: <1427124603-14191-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] valgrind: enable build for MIPS
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
X-List-Received-Date: Mon, 23 Mar 2015 15:37:03 -0000

Since 3.8.0, valgrind supports MIPS32. MIPS64 was added in 3.9.0.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
index 365e968..bf80b16 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "60ddae962bc79e7c95cfc4667245707f"
 SRC_URI[sha256sum] = "fa253dc26ddb661b6269df58144eff607ea3f76a9bcfe574b0c7726e1dfcb997"
 
-COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
 COMPATIBLE_HOST_armv7a = 'arm.*-linux'
 
 inherit autotools ptest
-- 
1.9.1


