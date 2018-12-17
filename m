Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB3A17BE6E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 03:41:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBH3fDcl029828
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 16 Dec 2018 19:41:13 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sun, 16 Dec 2018 19:41:13 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 16 Dec 2018 22:38:29 -0500
Message-ID: <4f6f107d36c1f3dd88ff3e3a2277f2a49f32bcb0.1545017775.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1545017774.git.bruce.ashfield@windriver.com>
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/17] linux-yocto: configuration updates (virtio and tpm)
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
X-List-Received-Date: Mon, 17 Dec 2018 03:41:13 -0000
Content-Type: text/plain

Integrating the following configuration changes:

  1992fb4dad30 virtio.cfg: enable CONFIG_DRM_VIRTIO_GPU
  9e9ba7cb6756 features/tpm: enable tpm support

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.18.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index aa8c58030197..ae620f578f6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6228ee37a46479d624e608c572d241f74eee11b6"
-SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
+SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index e80d376b5c8c..ffdebec73b40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "bd456d13d8bea4c416209a59f9e0bf50f8511c47"
-SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
+SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 01aeed99997f..24a12fc05283 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "bd4312baf01b5aca2745245c3856b5143bf0c6ad"
 SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
+SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 52dc2c10ef23..8f6e993d6d4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b8f2e8e00f8ddbdf5d7d7614c14eab52f8ee9275"
 SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
+SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index ae4359810412..94f2c9c47340 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9eddc793f95f4e7e283996a007e205622c633539"
 SRCREV_machine_qemux86-64 ?= "9eddc793f95f4e7e283996a007e205622c633539"
 SRCREV_machine_qemumips64 ?= "6641acbf076ba3f7ad96e846581272215a537904"
 SRCREV_machine ?= "9eddc793f95f4e7e283996a007e205622c633539"
-SRCREV_meta ?= "9e7df3b788749a9b804bf3856fe032089b79d1c1"
+SRCREV_meta ?= "cc2fb5bd0e71f4beec5c4ce726da0a87e2d55337"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 2eb174cfc9a8..9b998c75e53a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
 SRCREV_machine_qemux86-64 ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
 SRCREV_machine_qemumips64 ?= "d21ff98864241c971c7a42a3c4f1eb940b9b8855"
 SRCREV_machine ?= "e727c70583a78cf1dc53e8e219722e2f9d1bc858"
-SRCREV_meta ?= "085d8f700a427a0c07e01339915ac04f501ecd29"
+SRCREV_meta ?= "1992fb4dad3012f71d319273d61da22ed9aa0469"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
-- 
2.5.0


