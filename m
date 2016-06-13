Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8E46FFEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:56:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5DFugqS024798
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jun 2016 08:56:43 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 13 Jun 2016 08:56:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 13 Jun 2016 11:56:35 -0400
Message-ID: <ba253bd207b91f37fcee656bcce2aadb87e29364.1465833140.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1465833140.git.bruce.ashfield@windriver.com>
References: <cover.1465833140.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/4.1: powerclamp: APL CPU
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
X-List-Received-Date: Mon, 13 Jun 2016 15:56:43 -0000
Content-Type: text/plain

These patches backport the upstream changes for powerclamp to support APL APU.

  Dasaratharaman Chandramouli (1):
    intel powerclamp: support Knights Landing

  Jacob Pan (2):
    thermal/powerclamp: add cpu id for denlow platform
    thermal/powerclamp: remove cpu whitelist

  Radivoje Jovanovic (2):
    thermal/powerclamp: add cpu id for skylake h/s
    thermal/powerclamp: add cpu id for Skylake u/y

Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index c609ddc92c3c..9eaecd4075c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e34d6198589347504e6c8451fc999908f9ce4752"
+SRCREV_machine ?= "576bba030082fcdcdf9e58a285c92558f27d1e73"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index acdb0dc3c52a..7e0f66fa84cd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.26"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index c785354695a8..667212f1df18 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5049ec1a05cf7c9ff19c892b42d67f17974d3a96"
-SRCREV_machine_qemuarm64 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
-SRCREV_machine_qemumips ?= "c01dfca5d22960a5b9e4aa47d9c062ecbded5857"
-SRCREV_machine_qemuppc ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
-SRCREV_machine_qemux86 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
-SRCREV_machine_qemux86-64 ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
-SRCREV_machine_qemumips64 ?= "b8342b84b3a914651c86f3ae463e4f8c6de36da0"
-SRCREV_machine ?= "c9b497be080fcd42adab967fc972f225c9f5b84e"
+SRCREV_machine_qemuarm ?= "a6899b7c294ed25d9d37afde858cdd52f41f86b0"
+SRCREV_machine_qemuarm64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine_qemumips ?= "69936a9614608b7aa893ae78bd69e5cc197816c3"
+SRCREV_machine_qemuppc ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine_qemux86 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine_qemux86-64 ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
+SRCREV_machine_qemumips64 ?= "f0eb9eabbeafa5eadf66893822ea42d80e04afbd"
+SRCREV_machine ?= "9ba8c36e9ea7419d06accab5311e7fb0d56513ff"
 SRCREV_meta ?= "9f68667031354532563766a3d04ca8a618e9177a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


