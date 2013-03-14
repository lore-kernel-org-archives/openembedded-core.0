Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UGCQ5-0002p7-DW
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 18:58:27 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 80833D22B2;
	Thu, 14 Mar 2013 18:41:39 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 18:41:33 +0100
Message-Id: <1363282893-19390-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] Add architecture files for AArch64 architecture.
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
X-List-Received-Date: Thu, 14 Mar 2013 17:58:28 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta/conf/machine/include/aarch64/README           |  9 +++++++++
 meta/conf/machine/include/aarch64/arch-aarch64.inc | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/conf/machine/include/aarch64/README
 create mode 100644 meta/conf/machine/include/aarch64/arch-aarch64.inc

diff --git a/meta/conf/machine/include/aarch64/README b/meta/conf/machine/include/aarch64/README
new file mode 100644
index 0000000..59c8710
--- /dev/null
+++ b/meta/conf/machine/include/aarch64/README
@@ -0,0 +1,9 @@
+2013-03-14 - Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
+ - Initial Revision
+
+Currently only little endian is defined for AArch64.
+
+AArch64 is 64-bit ARM architecture.
+
+Also known as ARMv8 (instruction set) or ARM64 (name in Linux kernel and
+architecture name in Debian and derived).
diff --git a/meta/conf/machine/include/aarch64/arch-aarch64.inc b/meta/conf/machine/include/aarch64/arch-aarch64.inc
new file mode 100644
index 0000000..5177d7f
--- /dev/null
+++ b/meta/conf/machine/include/aarch64/arch-aarch64.inc
@@ -0,0 +1,16 @@
+DEFAULTTUNE ?= "aarch64"
+
+ARMPKGARCH ?= "aarch64"
+
+TUNEVALID[aarch64] = "Enable instructions for aarch64"
+TUNECONFLICTS[aarch64] = ""
+MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", ":aarch64", "" ,d)}"
+
+# Little Endian base configs
+AVAILTUNES += "aarch64"
+TUNE_FEATURES_tune-aarch64 ?= "aarch64"
+
+TUNE_ARCH = "aarch64"
+TUNE_PKGARCH = "aarch64"
+
+PACKAGE_EXTRA_ARCHS += "aarch64"
-- 
1.8.1.2



