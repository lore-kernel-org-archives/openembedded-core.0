Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44F9F71AB3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:41:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBH3e8TC003604
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:40:43 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:40:23 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:24 -0500
Message-ID: <1f65a74baf78d371a0fe6412c1424bdb4250d731.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 12/17] linux-yocto/4.19: configuration cleanups
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
X-List-Received-Date: Mon, 17 Dec 2018 03:41:03 -0000
Content-Type: text/plain

Integrating the following 4.19+ configuration cleanups:

  9ff5d1ee9f72 security.cfg: rename STACKPROTECTOR configs
  23e7370e9f71 media-usb-tv: remove CONFIG_DVB_USB_FRIIO
  7efbbd7def44 standard/preempt-rt.cfg: remove CONFIG_CIFS_STATS
  080ea61f0a4e netfilter: remove obsolete entries

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 06caf06d1c62..ab253fa730b8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "36ac11d2cb46f951843586935292c628d304e113"
-SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index c25202fb5f06..8924cce3f6b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "afd1ddee4ec8cc65d585e2c75bbcf31d9650c827"
 SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 815c92b93ae7..d7373c09b27b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
 SRCREV_machine_qemux86-64 ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
 SRCREV_machine_qemumips64 ?= "8c14832341502679afbfb370d48b977ecf363c82"
 SRCREV_machine ?= "ba6690e7b65aaa1d1030e51498aaf2c5eb7e88b1"
-SRCREV_meta ?= "f7bff5bff6ef6ceadfb4661a6ef3ed1f95bd6b2b"
+SRCREV_meta ?= "26bfb042ebb6e4816c5a8ce85d97a55e763430c7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


