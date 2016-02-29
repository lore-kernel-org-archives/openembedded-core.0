Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 65889759B4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 22:10:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u1TMAcGG025901
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Feb 2016 14:10:38 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 29 Feb 2016 14:10:37 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Feb 2016 17:10:26 -0500
Message-ID: <06c1b0e68c106ad71f65d8ccc30adb80c94e8b60.1456782981.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456782981.git.bruce.ashfield@windriver.com>
References: <cover.1456782981.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, california.l.sullivan@intel.com,
	saul.wold@intel.com
Subject: [PATCH 6/8] linux-yocto/4.4: update to -stable 4.4.2
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
X-List-Received-Date: Mon, 29 Feb 2016 22:10:39 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index 65fc9ab94154..80d54f4ca0d9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,13 +2,13 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "10a99cd2bfbbea9fa82b5a988eb8cb9c5f7b6600"
+SRCREV_machine ?= "48ef1e28a2a8904d287f9fde5f35d506ac42f4bb"
 SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.1"
+LINUX_VERSION ?= "4.4.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0b2975c0e9b7..c840f771799a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,12 +4,12 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.1"
+LINUX_VERSION ?= "4.4.2"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
 SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 6645c98048fa..dc7f75e1b98a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1505f695c60842fa591ca6bc1e3cb0bba1be0055"
-SRCREV_machine_qemuarm64 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_machine_qemumips ?= "257ab9142b29e01b257977f5a3afe7f40f79f7bc"
-SRCREV_machine_qemuppc ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_machine_qemux86 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_machine_qemux86-64 ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
-SRCREV_machine_qemumips64 ?= "de5aa76a9b909645533b44018bed0aa110e2dbd0"
-SRCREV_machine ?= "d4eb3ab036f8c37c5bc5f45ad0fa4dc34b7228c8"
+SRCREV_machine_qemuarm ?= "10de32377332ffc163525e850817780f5c577827"
+SRCREV_machine_qemuarm64 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
+SRCREV_machine_qemumips ?= "6b8a34fc2d605ac87c4769670a8ea05804779ad0"
+SRCREV_machine_qemuppc ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
+SRCREV_machine_qemux86 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
+SRCREV_machine_qemux86-64 ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
+SRCREV_machine_qemumips64 ?= "ebc3b0add55a3906616334fd4179b5dc04128276"
+SRCREV_machine ?= "abb7da90b75c0f2e0bd2f57da3ddbbe8ab670f73"
 SRCREV_meta ?= "4d2d541ae090e9646e6fb06ad296bdba54fd7497"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.1"
+LINUX_VERSION ?= "4.4.2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


