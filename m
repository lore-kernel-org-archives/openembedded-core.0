Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 731546AF54
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:52:02 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7D6pf1T010844; 
	Tue, 13 Aug 2013 01:52:02 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:52:38 +0500
Message-Id: <1376376758-24991-3-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376376758-24991-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376376758-24991-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 3/3] nfs-utils: Replace spaces with tabs in shell function
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
X-List-Received-Date: Tue, 13 Aug 2013 06:52:02 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

As per OE-Core convention, indentation should be TAB for shell.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 .../nfs-utils/nfs-utils_1.2.8.bb                   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
index 40b897b..fd6d33e 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.8.bb
@@ -58,7 +58,7 @@ RDEPENDS_${PN}-stats = "python"
 # Make clean needed because the package comes with
 # precompiled 64-bit objects that break the build
 do_compile_prepend() {
-    make clean
+	make clean
 }
 
 do_install_append () {
-- 
1.7.9.5


