Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 412F96E65F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:39:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u67IdDkp004935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Jul 2016 11:39:13 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 11:39:13 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 Jul 2016 14:39:06 -0400
Message-ID: <1ce66e6ae38bf75e1a20b6f39b7b86caa2c7595d.1467916601.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467916601.git.bruce.ashfield@windriver.com>
References: <cover.1467916601.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto/4.4: cpumask: Export cpumask_any_but()
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
X-List-Received-Date: Thu, 07 Jul 2016 18:39:14 -0000
Content-Type: text/plain

Backporting a mainline commit to Intel uncore can be completely
modular.

Signed-off-by: Nilesh Bacchewar <nilesh.bacchewar@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0bf3d8bb901a..4e63eb0c5fe2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.4.13"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
 SRCREV_meta ?= "4ebb8be6799bf2b738d46a3db49ebe59187f3b96"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index ea8ce49da8e2..46a0e827c4dc 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "e26115bb79a4ea6a26c6052766f1e65553841d51"
-SRCREV_machine_qemuarm64 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_machine_qemumips ?= "1b5479c3dd579143c03cfa97c25346104aff3f30"
-SRCREV_machine_qemuppc ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_machine_qemux86 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_machine_qemux86-64 ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
-SRCREV_machine_qemumips64 ?= "565650ff074c7438081bd2ff0db4d7208d666ddf"
-SRCREV_machine ?= "26d9c4e612512486290bad4525cef5c69f5e485d"
+SRCREV_machine_qemuarm ?= "a261c06c3a13eec8ef48c2929a1cfdcceb5268a9"
+SRCREV_machine_qemuarm64 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
+SRCREV_machine_qemumips ?= "b4bde84e42e4b62702421a2c091072e97196e03c"
+SRCREV_machine_qemuppc ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
+SRCREV_machine_qemux86 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
+SRCREV_machine_qemux86-64 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
+SRCREV_machine_qemumips64 ?= "14a513a5ba6a6b6968347014040d800496339622"
+SRCREV_machine ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
 SRCREV_meta ?= "4ebb8be6799bf2b738d46a3db49ebe59187f3b96"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


