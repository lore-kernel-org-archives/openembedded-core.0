Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 101FE7151A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvsQG029691
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:54 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:44 -0400
Message-ID: <486c6287ebf5f8069013d6e73e903ec499a93706.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.10: update to v3.10.55
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:55 -0000
Content-Type: text/plain

Updating to the latest korg -stable update.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index b08d7c34c324..10759720580c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "74d7df0601f4879b525a0f2a0a187c33a23be580"
-SRCREV_machine_qemuppc ?= "087f9fff0860e9a357fe9d4b1f514031e2c2597b"
-SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
+SRCREV_machine ?= "0abce5181274dbf37788ab8d2c62e135defd9956"
+SRCREV_machine_qemuppc ?= "c31f38edf5dec2c295632199dbfe3f5a221f7c16"
+SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.54"
+LINUX_VERSION ?= "3.10.55"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 6885723977e8..a53ce544a39b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.54"
+LINUX_VERSION ?= "3.10.55"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
-SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
+SRCREV_machine ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 3cb8c582578d..ea6985659598 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f075141532317cb7f8b88843354cd901c18c13a1"
-SRCREV_machine_qemumips ?= "e7582bdb55376801e9749141af9f1cc0a9425a31"
-SRCREV_machine_qemuppc ?= "fdc57cf78d788a5efc44ffaafa09db1a3799e5f0"
-SRCREV_machine_qemux86 ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
-SRCREV_machine_qemux86-64 ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
-SRCREV_machine_qemumips64 ?= "e8fdd57656858f06547f61336e130d006fc88de5"
-SRCREV_machine ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
-SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
+SRCREV_machine_qemuarm ?= "a4195791d27ef50feb454765149ea34621ef8ed7"
+SRCREV_machine_qemumips ?= "ff747b3dff7dfa643b3447a348b901cacc5b6a16"
+SRCREV_machine_qemuppc ?= "46e30d608f4268b0ea77362398aae91f1d410ee3"
+SRCREV_machine_qemux86 ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_machine_qemux86-64 ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_machine_qemumips64 ?= "42457c568170cb11a9011382ebca4677f22b35c1"
+SRCREV_machine ?= "8e055f3b669c65e83ba7128c248c632eedafad72"
+SRCREV_meta ?= "f79a00265eefbe2fffc2cdb03f67235497a9a87e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.54"
+LINUX_VERSION ?= "3.10.55"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


