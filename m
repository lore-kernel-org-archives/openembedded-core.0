Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TQK3N-0003lE-Jl
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 17:36:33 +0200
Received: by mail-pb0-f47.google.com with SMTP id ro12so1804685pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=0wtwfhAgkp7UcsYP+C7ktk+lY5b3MLz1Yo73bV/0Ttg=;
	b=IckmJzXHAg0ATFWb0w8ki0yrgKui9HW7DXbDYS79aX6x0BuWEeBCwKt+QdIrmnAuB0
	7B00fQAFCTkXkl6oOU4quQR6q8TKxdycVbeX/gM90pPHRS3gbTNE//XNYyYfRCGL1edF
	KysHKcgxwZXL0IamSMdN4M5YaKbzNYdU6ScW2S1jRrOkSe5g0BJFp67tXo1GDpZnyr5N
	8z1lXKbl1mT18fD0fMtmzcj4+s6ol9B/irt0UIfSAG/QuMfGAu6HAcqD6Ej8hCdwtU29
	JR7evkXg9By92o9rcDyPtAVpTO9K/U9jw2QlUXwPXAbDmeHz2zM24Ei7sBj2mCxI+4sm
	dXUw==
Received: by 10.68.216.131 with SMTP id oq3mr30301533pbc.147.1350919387948;
	Mon, 22 Oct 2012 08:23:07 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id kn8sm6088843pbc.24.2012.10.22.08.23.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Oct 2012 08:23:07 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2012 08:23:12 -0700
Message-Id: <1350919392-28079-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.12.4
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] lttng-2.0: fix srcrev/pv to match the recipe filenames
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
X-List-Received-Date: Mon, 22 Oct 2012 15:36:33 -0000

From: Christopher Larson <chris_larson@mentor.com>

Somehow the recipe names got bumped, but the SRCREV and PVs in the recipes
didn't get updated, so they were still building old versions.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb | 9 ++++-----
 meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb   | 6 +++---
 meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb    | 6 +++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
index d81e9b8..4b15d93 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
@@ -10,13 +10,12 @@ DEPENDS = "virtual/kernel"
 
 inherit module
 
-SRCREV = "4d3e89e379fc66480d729abe8daa5c86eb585400"
-PV = "2.0.pre11+git${SRCREV}"
-PR = "r1"
+SRCREV = "a848cad4cc82d05493c487a709f6b55f22695ec6"
+PV = "2.0.5"
+PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-modules.git;protocol=git \
-           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch \
-           file://lttng-sycalls-protect-is_compat_task-from-redefiniti.patch"
+           file://lttng-modules-replace-KERNELDIR-with-KERNEL_SRC.patch"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 export KERNEL_SRC="${STAGING_KERNEL_DIR}"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
index cf5731d..2a5dd58 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
 
 DEPENDS = "liburcu popt lttng2-ust"
 
-SRCREV = "8c3919ea2dc77fdd47fb1c90e41490a20bb4d478"
-PV = "v2.0.1+git${SRCREV}"
-PR = "r2"
+SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
+PV = "v2.0.4"
+PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-tools.git;protocol=git"
 
diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
index 5e9a529..64ae3a2 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
@@ -12,9 +12,9 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
-SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
-PV = "2.0.2+git${SRCPV}"
-PR = "r1"
+SRCREV = "5fbf75f52c808b648feebea1ed4874c5f6264b05"
+PV = "2.0.5"
+PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
 
-- 
1.7.12.4



