Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2D27150E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 14:57:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8NEvong025458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 23 Sep 2014 07:57:50 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 23 Sep 2014 07:57:50 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 23 Sep 2014 10:57:39 -0400
Message-ID: <ba77fd558ee2cb327483084c202cc1df628b5d5f.1411483823.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1411483823.git.bruce.ashfield@windriver.com>
References: <cover.1411483823.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/7] linux-yocto/3.10: update to v3.10.54 and -rt55
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
X-List-Received-Date: Tue, 23 Sep 2014 14:57:51 -0000
Content-Type: text/plain

The 3.10 kernel needed a refresh to the latest -stable and -rt releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index 2f22ba8ea690..b08d7c34c324 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ KBRANCH_qemuppc ?= "standard/preempt-rt/qemuppc"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "1dfc94848e05989ab6c5fde2080f35546d81e798"
-SRCREV_machine_qemuppc ?= "81334ed6f11da157e13c306c48f3d49a051d9d89"
-SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
+SRCREV_machine ?= "74d7df0601f4879b525a0f2a0a187c33a23be580"
+SRCREV_machine_qemuppc ?= "087f9fff0860e9a357fe9d4b1f514031e2c2597b"
+SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.43"
+LINUX_VERSION ?= "3.10.54"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index bd762f9fff29..6885723977e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,12 +5,12 @@ require recipes-kernel/linux/linux-yocto.inc
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.43"
+LINUX_VERSION ?= "3.10.54"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
+SRCREV_machine ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
+SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 298d2ca79923..3cb8c582578d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  ?= "standard/common-pc/base"
 KBRANCH_qemux86-64  ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "cf951fb02f9eb89bd36f30fd6d426d6a06be8739"
-SRCREV_machine_qemumips ?= "82c743bcc8103c82f8cb673eb810a9329a9441d7"
-SRCREV_machine_qemuppc ?= "1deb0e97e9262b02b3ff9b707b13c42c8fa95a13"
-SRCREV_machine_qemux86 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_machine_qemux86-64 ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_machine_qemumips64 ?= "8affc1996043dfe2061953c074c714a9885fde6e"
-SRCREV_machine ?= "e4f08d724d6663e6d23d19668c97f9e6792c94d2"
-SRCREV_meta ?= "fab23a4d44de25ee77e497cbf8605eadc3aaf3d8"
+SRCREV_machine_qemuarm ?= "f075141532317cb7f8b88843354cd901c18c13a1"
+SRCREV_machine_qemumips ?= "e7582bdb55376801e9749141af9f1cc0a9425a31"
+SRCREV_machine_qemuppc ?= "fdc57cf78d788a5efc44ffaafa09db1a3799e5f0"
+SRCREV_machine_qemux86 ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
+SRCREV_machine_qemux86-64 ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
+SRCREV_machine_qemumips64 ?= "e8fdd57656858f06547f61336e130d006fc88de5"
+SRCREV_machine ?= "e001d3cbec5320c03d2a316aa0e287012be19133"
+SRCREV_meta ?= "5ea3fd0817c2a3173e85102c61c51a5a6268cad6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.43"
+LINUX_VERSION ?= "3.10.54"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


