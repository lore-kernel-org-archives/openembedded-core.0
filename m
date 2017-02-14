Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A1693763F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 21:14:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1ELEaRt023953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Feb 2017 13:14:36 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Feb 2017 13:14:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Feb 2017 16:14:23 -0500
Message-ID: <6285c535bf66eddb6ce77d7f279bd8f4c1662932.1487106757.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1487106757.git.bruce.ashfield@windriver.com>
References: <cover.1487106757.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] linux-yocto/4.4: meta/configuration updates
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
X-List-Received-Date: Tue, 14 Feb 2017 21:14:36 -0000
Content-Type: text/plain

Integrating the following commit already in 4.9 and 4.8:

  intel-quark: Add intel-quark-preempt-rt bsp configuration

  While there are intel-quark configurations for the KTYPEs standard
  and tiny in bsp/intel-common, there's none for the preempt-rt KTYPE.
  Trying to build preempt-rt enabled kernels such as linux-yocto-rt for
  intel-quark yields a .config having a potentially misconfigured
  architecture. More importantly, however, preempt-rt related CONFIG
  options are not enabled. Hence, a build of, e.g., linux-yocto-rt, does
  not result in a preempt-rt enabled kernel.

  This patch qualifies to be (back)ported to other branches than
  master.

  Signed-off-by: Christian Storm <christian.storm@siemens.com>
  Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index f5169b81bdd5..82f1a94f162f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "6622c6471016005d5588aa4338ce57aced713dcd"
-SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
+SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 0baba1de53fe..6cb580dc3e90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
+SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5ac3f561a54f..34e0f38c030b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
 SRCREV_machine_qemux86-64 ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
 SRCREV_machine_qemumips64 ?= "c74cc42106745bab08de6263b9320ac029f2cca9"
 SRCREV_machine ?= "ad8b1d659ddd2699ebf7d50ef9de8940b157bfc2"
-SRCREV_meta ?= "78a26182e20c0a49c1adda63faa15ccd3f4ecb27"
+SRCREV_meta ?= "f4a781388fae67caec79a5a571c8aadef0185044"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


