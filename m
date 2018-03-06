Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06CAF78AB1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBQmO014572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:26 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:53 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:15 -0500
Message-ID: <f5971af169fa67412a2d66f3ba1e1596ea439ca7.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] linux-yocto: aufs and systemtap
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:26 -0000
Content-Type: text/plain

Integrating a configuration change for systemtap:

  features/systemtap/systemtap.cfg: enable CONFIG_KERNEL_DEBUG

And porting the aufs warning fix to 4.14 and 4.15:

  aufs: fix compile warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      |  2 +-
 9 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index d6ffcc86a5ca..3f2a1ef7afa7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "27c21aed67a28d08b13c5cc1fe4287b2cf389ede"
-SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
+SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 7d2812fafe8f..fd003e4d2bec 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6c699ea6debe70c60d41d9df23f558ffea2de7cb"
-SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
+SRCREV_machine ?= "4832801a14130645d2251a368cba79d937a775ab"
+SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index a4dd17d1cb3a..38589927037d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
+SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 860b68cda6af..2ecb1cd70d49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
+SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index ae9e7691367d..1ccbf6283e43 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.14.24"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fccf7693fe5dd00d7b6d391b7405b5d58eb959f2"
-SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
+SRCREV_machine ?= "09828ddd8d8c91b2d68afdcd8eb99a48e0253582"
+SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 858a318f3d7b..0c0abf38f286 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
+SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index e1ec88bdc920..0a6b2b883e0c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
 SRCREV_machine_qemux86-64 ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
 SRCREV_machine_qemumips64 ?= "d25e0aa3f09dff2b8b908c7764c3c5244134d1a4"
 SRCREV_machine ?= "073873cb152cf254d229d548c3bdcc57460a4ff0"
-SRCREV_meta ?= "6d6037cc054350140df49c309e155f5a7b48f480"
+SRCREV_meta ?= "5a06598524482b43b9e502bf02c1f4fd5c2e598b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index df998ade6a4b..a714e39751ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "833523192da4c50dfbae5a06d9fcc578e091daf4"
-SRCREV_machine_qemuarm64 ?= "dda8175b9f7ba47d308dd80c2a53e3c7e996d2dd"
-SRCREV_machine_qemumips ?= "43e496c5172a6f1035ecc98e2fac9c5874cefcc1"
-SRCREV_machine_qemuppc ?= "4507887bfd1ba5b3a337e71315fb8cad3be6670f"
-SRCREV_machine_qemux86 ?= "e8410925ef1cdc57f4f367761e94863193014033"
-SRCREV_machine_qemux86-64 ?= "e8410925ef1cdc57f4f367761e94863193014033"
-SRCREV_machine_qemumips64 ?= "b2df75031185b81757c61e95142e0472314c8389"
-SRCREV_machine ?= "e8410925ef1cdc57f4f367761e94863193014033"
-SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
+SRCREV_machine_qemuarm ?= "bb61314e5c67a13c7da2217e434dfb20053a0203"
+SRCREV_machine_qemuarm64 ?= "eb7faf5b9bfe94ac2cb8e6a28e18fb39a8b720a7"
+SRCREV_machine_qemumips ?= "4bcebcabb514ba8f9b3f8f487f3595a5c2b5860f"
+SRCREV_machine_qemuppc ?= "3913c9c8dad1a3fef93d3d5721146ebe15dcc4d3"
+SRCREV_machine_qemux86 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
+SRCREV_machine_qemux86-64 ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
+SRCREV_machine_qemumips64 ?= "6d7fbdbb7e466be645c34eed7bb2b532a9431a85"
+SRCREV_machine ?= "edc90f45a716ffe8e16cebaaf3b5db070af0280a"
+SRCREV_meta ?= "54b3e9b768651ca15bf65ae1c72dfe6d957285f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index ebbdfcb3b0c8..50be40d9e928 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
 SRCREV_machine_qemux86-64 ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
 SRCREV_machine_qemumips64 ?= "38face5dfd94733484822f392f9469fed18cca7e"
 SRCREV_machine ?= "3247d5a26cab529bd4acc137c119bcdf71c3d5ae"
-SRCREV_meta ?= "03267fd15a97748105bfec2866820a8c1512fe70"
+SRCREV_meta ?= "40cef533a17de9d7a1de9b6e3578ac9125486a4a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


