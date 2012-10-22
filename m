Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TQK8P-0003vH-5r
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:41:45 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so1808227pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZpRDaoBNdvTk+/cSnRdQgvL2pc7h3yttKQV+wPAGVMg=;
	b=gqJCNTTClqwX8IQKDB4z648v9nFoqg3n/z9YqZRXDdlVnjpQPSZulQA8571YN0VQcC
	zz3J9AZc093JD11SXsPJBHwNW1IuduOR5xpg2iA/EbmEwtzGiaqbThSP9T31P6zkwSq7
	LhSfbYRcbA7X4PU4gL8GtytZbrSWsyidTWjfepdcec+3YAW1XMiYlm2W6Cod2AG0NuP9
	jrJOfTOFm8WVVcxID1xuocpYWavozh3jfdphdPKgkaQNVfBV8oCNduNWc1f9x5y5gIq1
	efvBuvyZ3XLDZLGVOD14JDZyZyfXOden/4TLkTOgcvMUxa0eFhYSPjLP9H96+HFphKLD
	TSYQ==
Received: by 10.66.85.66 with SMTP id f2mr26824987paz.56.1350919699669;
	Mon, 22 Oct 2012 08:28:19 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id ni3sm6098969pbc.2.2012.10.22.08.28.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 08:28:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 08:28:23 -0700
Message-Id: <1350919703-6105-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH][for-danny] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Mon, 22 Oct 2012 15:41:45 -0000

From: Christopher Larson <chris_larson@mentor.com>

Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
didn't get updated, so they were still building old versions.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb | 7 +++----
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   | 4 ++--
 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    | 4 ++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
index 4c78f36..baae25f 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
@@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
-PV = "2.0.pre11+git${SRCREV}"
+SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
+PV = "2.0.5"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
index e7f1016..0bafcb3 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
 
 DEPENDS = "liburcu popt lttng2-ust"
 
-SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
-PV = "v2.0.1+git${SRCREV}"
+SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
+PV = "v2.0.4"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
index 8f650a4..0574fe9 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
@@ -12,8 +12,8 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
-SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
-PV = "2.0.2+git${SRCPV}"
+SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
+PV = "2.0.5"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
-- 
1.7.12.4



