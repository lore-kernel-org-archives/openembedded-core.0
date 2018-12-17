Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C48367BDA3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:38:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3cXI4029801
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:38:33 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:38:32 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:13 -0500
Message-ID: <d2d8482a9c10155d75d57b06e023bccc24327fce.1545017774.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/17] linux-yocto: remove obselete options from lxc config
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
X-List-Received-Date: Mon, 17 Dec 2018 03:38:34 -0000
Content-Type: text/plain

The lxc config fragments have some options that are no long valid. So we
can safely drop them.

  721f3cfcb199 lxc: drop CONFIG_MM_OWNER
  3b5f717d0311 vfio: drop CONFIG_KVM_DEVICE_ASSIGNMENT

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index f77de3a05ff8..b30c9ac14960 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "8e00c30ce22f378ecb7f243b1df3d209b8ee29bc"
-SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
+SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 591d41bd1b1a..a7fe7e9a0e1d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -14,7 +14,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
+SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 81160ca50f33..5dc772addb0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_machine_qemux86-64 ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
 SRCREV_machine_qemumips64 ?= "6d91dc62811f4688efc67845185858645b4ccfb8"
 SRCREV_machine ?= "33859b3077c83d8a024946ba06a59990546fcbc7"
-SRCREV_meta ?= "bf98e195a4cf2404a064056b3593e83a7de84f25"
+SRCREV_meta ?= "0a45d79311edece055050075b13ac7e273bc0695"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
-- 
2.5.0


