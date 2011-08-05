Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18X7P3Q79flXLe28Jpc++FM5SU7kIBENgA=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QpQnn-0005zN-5U
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 22:15:27 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p75KB2VS025075
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Aug 2011 15:11:02 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 15:11:01 -0500
Message-Id: <1312575061-27569-1-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
Subject: [PATCH] tune-ppce5500: Add a tune file for PowerPC e5500 core
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
X-List-Received-Date: Fri, 05 Aug 2011 20:15:27 -0000

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/conf/machine/include/tune-ppce5500.inc |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppce5500.inc

diff --git a/meta/conf/machine/include/tune-ppce5500.inc b/meta/conf/machine/include/tune-ppce5500.inc
new file mode 100644
index 0000000..8e6403d
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppce5500.inc
@@ -0,0 +1,14 @@
+DEFAULTTUNE ?= "ppce5500"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[ppce5500] = "Enable ppce5500 specific processor optimizations"
+TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "-mcpu=e5500", "", d)}"
+TUNE_PKGARCH = "${@bb.utils.contains("TUNE_FEATURES", "ppce5500", "ppce5500", "${PPCPKGARCH}", d)}"
+
+AVAILTUNES += "ppce5500"
+TUNE_FEATURES_tune-ppce5500 = "m64 ppce5500"
+PACKAGE_EXTRA_ARCHS_tune-ppce5500 = "powerpc64 ppce5500"
+
+# glibc configure options to get e5500 specific library (for sqrt)
+GLIBC_EXTRA_OECONF += "--with-cpu=e5500"
-- 
1.7.3.4



