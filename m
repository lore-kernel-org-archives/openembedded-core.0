Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 76D6171AEE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Nov 2016 13:25:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA3DPJxt021712
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Nov 2016 06:25:19 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 06:25:18 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 3 Nov 2016 09:25:14 -0400
Message-ID: <85d6608fcafacaac093ccffc70b6315ef810fd0d.1478179369.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1478179369.git.bruce.ashfield@windriver.com>
References: <cover.1478179369.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/4.8: update to 4.8.6
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
X-List-Received-Date: Thu, 03 Nov 2016 13:25:21 -0000
Content-Type: text/plain

Integrating the korg -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index e51c9cdcca0e..26b309d8b8f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4057556c041f6aac0d29aa3425587d414c9a0090"
-SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
+SRCREV_machine ?= "b99b6fac437104e206d30540a5cb12103049af1e"
+SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.3"
+LINUX_VERSION ?= "4.8.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index c8ddbd93dc7f..63dd11baa19e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.3"
+LINUX_VERSION ?= "4.8.6"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
+SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index 13778b9c4db6..03691982b1f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "4cc544ad09ad704322cb66fe4ba197a6a05dc71f"
-SRCREV_machine_qemuarm64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_machine_qemumips ?= "c285969d4f9376a671167ecf397578c8ad3e6a75"
-SRCREV_machine_qemuppc ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_machine_qemux86 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_machine_qemux86-64 ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_machine_qemumips64 ?= "64f96ba530e58456070f26b0f3fcce3f64988b72"
-SRCREV_machine ?= "1adf9d36338dc3c63cdbf6f98bcbdc7bba42a794"
-SRCREV_meta ?= "83110d94edeb856a3667b62903ed4ae91c24117d"
+SRCREV_machine_qemuarm ?= "94d3e8675e2fcb09f29814a33ccf79df06149104"
+SRCREV_machine_qemuarm64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_machine_qemumips ?= "046ff6344eee25dcc0eea1214e0ad8771ddfabfb"
+SRCREV_machine_qemuppc ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_machine_qemux86 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_machine_qemux86-64 ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_machine_qemumips64 ?= "edcb167f91abc071cc98cbd762418ff7ab9d839b"
+SRCREV_machine ?= "9d5f74f941c3ca234f58ff8e539f5ca64458c0a7"
+SRCREV_meta ?= "87e5fc8b7cb387f197cdd098cdde4e96e9e8ed0d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.3"
+LINUX_VERSION ?= "4.8.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


