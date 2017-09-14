Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E04B785DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8EDl4AM030755
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Sep 2017 06:47:04 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:03 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:54 -0400
Message-ID: <1d5098d4e485e54ccc7a6e6f52cfecf5bd81fc1a.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/9] linux-yocto/meta: configuration feature additions
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:04 -0000
Content-Type: text/plain

Introducing the following configuration features:

  d67d2221cc2d bpf: add bpf kernel config
  3f9fb678aa31 sysrq: add sysrq kernel config
  729eb982ffd8 kexec/kdump: Add config fragments
  e00e63ef3068 kdump: add config fragments

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index 37ccc727fc0c..f3130ad91b7d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
+SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index a9db5ae18753..a1ba04102ec3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
+SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 026d72e1f7a0..6cd82df8d2ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
 SRCREV_machine_qemux86-64 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
 SRCREV_machine_qemumips64 ?= "ec95c3aebd1d653a409e844779d2a34666627f59"
 SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "42965d664ffcac13ff4dffddcd4959ab08f19508"
+SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
-- 
2.5.0


