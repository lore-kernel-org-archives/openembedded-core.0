Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1602D71AA1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Oct 2016 03:47:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9M3ldDJ008198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 21 Oct 2016 20:47:39 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Fri, 21 Oct 2016 20:47:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 21 Oct 2016 23:47:36 -0400
Message-ID: <59d49c0e2e66679bf5d1eccd8406ae4775599ff0.1477107618.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1477107618.git.bruce.ashfield@windriver.com>
References: <cover.1477107618.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/4.4: update to v4.4.26
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
X-List-Received-Date: Sat, 22 Oct 2016 03:47:40 -0000
Content-Type: text/plain

Integrating the 4.4.23->26 -stable releases. Among other fixes
this contains commit:

  mm: remove gup_flags FOLL_WRITE games from __get_user_pages()

Which addresses CVE-2016-5195.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 33091f1b4ff6..6c1138277e54 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6f27f97ed8466b5d7390e8fbb8696c13835a0b1f"
-SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
+SRCREV_machine ?= "652b564985db555b549ef73405aea6c38919eefc"
+SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.22"
+LINUX_VERSION ?= "4.4.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 44ddf21c04b8..76c41639c0d2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.22"
+LINUX_VERSION ?= "4.4.26"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
+SRCREV_machine ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 41db3f682ae6..e3a3d901d1b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "de294849e02680399a6dd03fedcc03a69e9a6a04"
-SRCREV_machine_qemuarm64 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_machine_qemumips ?= "a41dd187e7d42be65780f25997eb890ead6cc7d9"
-SRCREV_machine_qemuppc ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_machine_qemux86 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_machine_qemux86-64 ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_machine_qemumips64 ?= "857685d23d1e8d8a8deb4198b139b95a5bb80825"
-SRCREV_machine ?= "f4e52341c304e044dbe581a35aad6b930c9410d1"
-SRCREV_meta ?= "bbaf01752b0168a63b164978495fad4ead7e8972"
+SRCREV_machine_qemuarm ?= "187bcc13f3023c3ae0a3ba5c69ae85c4e5e693ac"
+SRCREV_machine_qemuarm64 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_machine_qemumips ?= "2f273556495dd2871f08c73fc3f40d1ad546c638"
+SRCREV_machine_qemuppc ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_machine_qemux86 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_machine_qemux86-64 ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_machine_qemumips64 ?= "0a19cacf5738876666a4b530a9fa14f05b355299"
+SRCREV_machine ?= "ca6a08bd7f86ebef11f763d26f787f7d65270473"
+SRCREV_meta ?= "3030330b066a33ce21164a8b30d0503cf9f68e5b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.22"
+LINUX_VERSION ?= "4.4.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


