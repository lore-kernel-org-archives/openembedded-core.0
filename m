Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1039777045
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 02:08:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w57284rm017798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Jun 2018 19:08:04 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 6 Jun 2018 19:08:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 6 Jun 2018 22:07:24 -0400
Message-ID: <29992e77f96b2ed382e618e6a4aabe8e97d75d7f.1528336755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1528336755.git.bruce.ashfield@windriver.com>
References: <cover.1528336755.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/4.14/4.15: gcc8 fixes
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
X-List-Received-Date: Thu, 07 Jun 2018 02:08:04 -0000
Content-Type: text/plain

Integrating Khem's gcc8 kernel patches so that 4.14 and 4.15 can build
with the gcc8 compiler updates.

  51273ff79f4a tools/lib/subcmd/pager.c: do not alias select() params
  b632c05a6263 objtool, perf: Fix GCC 8 -Wrestrict error
  20bc5eb24ac1 mips64: Disable attribute-alias warning
  975042cc72dd mips: Disable attribute-alias warnings
  8632f470f02c powerpc/ptrace: Disable array-bounds warning with gcc8
  59e401ffeda4 powerpc: Disable attribute-alias warnings from gcc8

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 5829fe00fd96..db7941abd178 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "edcd1a1cbc535ff827e682fa8e78a11f60efc03f"
-SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
+SRCREV_machine ?= "5518de2bf72df8f5274f7fd6a909db8bb09e9216"
+SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 004f3b666f90..c440d2fa9f2e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
+SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index a9196e3dc10a..ae459761f9cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -12,8 +12,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0cdc68d3404d2738d43e9e22b572814e238dae3f"
-SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
+SRCREV_machine ?= "ebe519f7ad579fedcdff91c2e32c4eef976299a6"
+SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 575d3fe04648..e6da0935d0ae 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.15.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
+SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 28812484dda2..c8f31a6ebcd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0270dc3fc64e8df96067a5cc0d3cdcc7da448967"
-SRCREV_machine_qemuarm64 ?= "cc01b6df5e42a636339020123f9e36e76feb217a"
-SRCREV_machine_qemumips ?= "7100705d087727cec0f353b430910dbd56c0b14f"
-SRCREV_machine_qemuppc ?= "9e2c25e06bd9b9c799c0c7103566d587fdd16858"
-SRCREV_machine_qemux86 ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
-SRCREV_machine_qemux86-64 ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
-SRCREV_machine_qemumips64 ?= "149f8eee22d52a287994c1d0c54d4d37631629ef"
-SRCREV_machine ?= "3a3979936c8a3b70488af80a7dcadd41e2480603"
-SRCREV_meta ?= "0a24859cef9c3352aa3bf153d202cece587caf24"
+SRCREV_machine_qemuarm ?= "493254190708d94e0bd22f6eb6e6c17cbdbf9764"
+SRCREV_machine_qemuarm64 ?= "eeba95930402de2c0290b423c69e86b84955bf09"
+SRCREV_machine_qemumips ?= "42b5e2db78595024d2fddfcadc8cd8af1266b52b"
+SRCREV_machine_qemuppc ?= "b87ce52358105e318fbdb7087185de9622b420b3"
+SRCREV_machine_qemux86 ?= "0e21580445573276ec320da0c36d56f8921f682b"
+SRCREV_machine_qemux86-64 ?= "0e21580445573276ec320da0c36d56f8921f682b"
+SRCREV_machine_qemumips64 ?= "c8885bcf579812bd6cfbb58b96d5d3423ccc45fc"
+SRCREV_machine ?= "0e21580445573276ec320da0c36d56f8921f682b"
+SRCREV_meta ?= "d1e170692e978b08f4736375cafccd58e331feb1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index f1233fd9faf8..0d82318bcf4c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5400ff2d394e933487c7d3d16d1a295d850232e5"
-SRCREV_machine_qemuarm64 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_machine_qemumips ?= "9e9b14f6ef913ea00a01dc0766666f2c86f5bc63"
-SRCREV_machine_qemuppc ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_machine_qemux86 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_machine_qemux86-64 ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_machine_qemumips64 ?= "0175d25d470adf5604a59b020a6de86493b1a78e"
-SRCREV_machine ?= "260fd9356917fb3bd73abd36a6bdd7df402ef1a1"
-SRCREV_meta ?= "125963a34eebf4ee3d2b62d97c8090d912c8eb03"
+SRCREV_machine_qemuarm ?= "da407e5a3514aa6cfc579f52aca8afa279b10669"
+SRCREV_machine_qemuarm64 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine_qemumips ?= "8d8f48f09e07bc9ba4db489eab80ae653709fb91"
+SRCREV_machine_qemuppc ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine_qemux86 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine_qemux86-64 ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_machine_qemumips64 ?= "9435d73112c64ae058372322d8c7a41ae9e8c000"
+SRCREV_machine ?= "51273ff79f4ad930f4a788257f58e1266cb236e3"
+SRCREV_meta ?= "9bbc5bd75e5322bd80769802c5062b2f3f0d6c7d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
-- 
2.5.0


