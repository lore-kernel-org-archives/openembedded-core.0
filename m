Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F16E77045
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 04:27:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R4Rrh4007678
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 26 Jan 2016 20:27:53 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 26 Jan 2016 20:27:52 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jan 2016 23:27:49 -0500
Message-ID: <73b9fb4ee35c729f8ad0b55b26353b412217147d.1453868682.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1453868682.git.bruce.ashfield@windriver.com>
References: <cover.1453868682.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/4.4: CVEs and preempt-rt update
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
X-List-Received-Date: Wed, 27 Jan 2016 04:27:55 -0000
Content-Type: text/plain

Integrating the following CVE update:

  Author: Yevgeny Pats <yevgeny@perception-point.io>
  Date:   Tue Jan 19 22:09:04 2016 +0000

      KEYS: Fix keyring ref leak in join_session_keyring()

      This fixes CVE-2016-0728.

We also integrate the 4.4-rt3 version.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 18 +++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index b7509bb58dfc..3c3c0c5523a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -2,8 +2,8 @@ KBRANCH ?= "standard/preempt-rt"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "86a9e1ab51b9acf71d9c2f39a9f02652886bd727"
-SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+SRCREV_machine ?= "49a18bd230aafabe793de56d3c96d62f891e77dc"
+SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index d348c0a628f8..6ecd0b97e943 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -9,8 +9,8 @@ LINUX_VERSION ?= "4.4"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+SRCREV_machine ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index a440cf7b26ce..be43a212f81b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bcfc111e6c14b9f9d6ffa9d357651c0b4489835e"
-SRCREV_machine_qemuarm64 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_machine_qemumips ?= "9d9c37432e75eaeb2232e00cc3c2252440b709b3"
-SRCREV_machine_qemuppc ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_machine_qemux86 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_machine_qemux86-64 ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_machine_qemumips64 ?= "cb3a85329501f541ebfa08febb2f36edcbc6f253"
-SRCREV_machine ?= "2dadc3524fcbce0c46f5db65b7c20c673fc60503"
-SRCREV_meta ?= "ad9d3f01300ba350563e17db00b2518302e172f6"
+SRCREV_machine_qemuarm ?= "f7bc1fb5f438f019bcd3d5fd8362e0960ed0fffc"
+SRCREV_machine_qemuarm64 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_machine_qemumips ?= "5b05677721ce8b0625a7e155dcdf93325fc460fe"
+SRCREV_machine_qemuppc ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_machine_qemux86 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_machine_qemux86-64 ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_machine_qemumips64 ?= "ac3f6e9508fb6963e9db844fe28b7a50589decc4"
+SRCREV_machine ?= "57af322eecf5750f8f09cb8b093d613caede5c48"
+SRCREV_meta ?= "dc760c3189ed868dc59050206b7899c35a4ad8e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.1.0


