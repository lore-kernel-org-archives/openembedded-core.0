Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBBE66AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 18:39:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u67IdGEP004939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Jul 2016 11:39:16 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Jul 2016 11:39:16 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 7 Jul 2016 14:39:09 -0400
Message-ID: <4b607e05601d027d2997b47a2c90828f36a73114.1467916601.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1467916601.git.bruce.ashfield@windriver.com>
References: <cover.1467916601.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/4.4: update to v4.4.14
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
X-List-Received-Date: Thu, 07 Jul 2016 18:39:16 -0000
Content-Type: text/plain

Updating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 63b2c7f2cece..6bf0c119dc55 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,12 +12,12 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "01ac19ede037b753d2b3f0adb20ab1becb7e1511"
+SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.13"
+LINUX_VERSION ?= "4.4.14"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 51cca1283aba..5da74c7acc24 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.13"
+LINUX_VERSION ?= "4.4.14"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_meta ?= "01ac19ede037b753d2b3f0adb20ab1becb7e1511"
+SRCREV_machine ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index bfcf04dbc2a0..cd24a25e453c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a261c06c3a13eec8ef48c2929a1cfdcceb5268a9"
-SRCREV_machine_qemuarm64 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_machine_qemumips ?= "b4bde84e42e4b62702421a2c091072e97196e03c"
-SRCREV_machine_qemuppc ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_machine_qemux86 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_machine_qemux86-64 ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_machine_qemumips64 ?= "14a513a5ba6a6b6968347014040d800496339622"
-SRCREV_machine ?= "0e30a74f2cbbab0c7014561fe4eab1c9d8bfe560"
-SRCREV_meta ?= "01ac19ede037b753d2b3f0adb20ab1becb7e1511"
+SRCREV_machine_qemuarm ?= "06702ee20de46795634c3f4e6497a73935856c99"
+SRCREV_machine_qemuarm64 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine_qemumips ?= "b7cb5132e86d30640da745b8c36727291e7109e6"
+SRCREV_machine_qemuppc ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine_qemux86 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine_qemux86-64 ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_machine_qemumips64 ?= "53c911666987c77a3171db8291d4b6df83836620"
+SRCREV_machine ?= "62acc21a6d4492d649fd6361c9cd18b9624845c6"
+SRCREV_meta ?= "e775f4ed1e1358ce0647751e69cc54aa9d5d5d06"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.13"
+LINUX_VERSION ?= "4.4.14"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


