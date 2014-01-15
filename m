Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 534966B4F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 05:57:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0F5vjfO026113
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Jan 2014 21:57:45 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 14 Jan 2014 21:57:44 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 15 Jan 2014 00:57:43 -0500
Message-ID: <d42eed80edc6fbaec7b8dbd614ba2292dd91ba5a.1389765320.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1389765320.git.bruce.ashfield@windriver.com>
References: <cover.1389765320.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.10: update to 3.10.25
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
X-List-Received-Date: Wed, 15 Jan 2014 05:57:45 -0000
Content-Type: text/plain

Updating the 3.10 tree to the 3.10.25 korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   | 10 ++++------
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index e81a77ba4ea5..d301c06eae37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,11 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "ee9480cd91b2b46325a2da9aa6ae779d8e4163c0"
-SRCREV_machine_qemuppc ?= "5c126504c0a2f72d80bae9d96cea7eb9d7854290"
-SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
+SRCREV_machine ?= "957ba6ae6c1d81b57da6a36b93f1b2a0ced2f45d"
+SRCREV_machine_qemuppc ?= "37e40b7017a9c78d676b19716011494dc7cb6369"
+SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
 
-SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
-
-LINUX_VERSION ?= "3.10.19"
+LINUX_VERSION ?= "3.10.25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index b25edc0baa5e..e7565c626c5a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.19"
+LINUX_VERSION ?= "3.10.25"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
+SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index cce8249e98df..33e745692b25 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7744145fcc3e4b6b6e308a1b86dc1c8b237b7575"
-SRCREV_machine_qemumips ?= "2b8e8c694c38729ce724facdb0ab20751d061a2e"
-SRCREV_machine_qemuppc ?= "9a7537cb9bcc5c835dae6ac84fbbe7298473f69c"
-SRCREV_machine_qemux86 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_machine_qemux86-64 ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_machine_qemumips64 ?= "0cd8e958d0ec7e01fd21fc7891da7eed688b0d37"
-SRCREV_machine ?= "a9ec82e355130160f9094e670bd5be0022a84194"
-SRCREV_meta ?= "d9cd83c0292bd4e2a6754a96761027252e726a42"
+SRCREV_machine_qemuarm ?= "e3163012f3e09fe48374ef22bc676f8b19aeec1a"
+SRCREV_machine_qemumips ?= "01a71aaf8e545c3ef88da1fe02f53d1b96a2640e"
+SRCREV_machine_qemuppc ?= "ae1b9115975ff235038d5da22b4cc984b4d76aae"
+SRCREV_machine_qemux86 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_machine_qemux86-64 ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_machine_qemumips64 ?= "67efb2993ec7726df5567e2572fd64e34e29b46d"
+SRCREV_machine ?= "79af968f2f26378798aec7a6d729ff5a371aae5f"
+SRCREV_meta ?= "778d5f6259f0b8e28a46d8a764979e20e5a8ffc4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.19"
+LINUX_VERSION ?= "3.10.25"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


