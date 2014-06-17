Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C0B776FFE7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:26:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5HFQPeK029834
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jun 2014 08:26:27 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 17 Jun 2014 08:26:25 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 17 Jun 2014 11:26:12 -0400
Message-ID: <0f43107fd4acd4b469d1d0c6c7d4b017dc00e6e4.1403016995.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1403016995.git.bruce.ashfield@windriver.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/3.14: update to v3.14.5
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
X-List-Received-Date: Tue, 17 Jun 2014 15:26:35 -0000
Content-Type: text/plain

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 995df3e0ea50..29df6b722ea9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "08229402523bdb153dceed0a7260180837396e7f"
-SRCREV_machine_qemuppc ?= "08229402523bdb153dceed0a7260180837396e7f"
-SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
+SRCREV_machine ?= "ec7945d3abac66557de452e9c81f6f3692f187db"
+SRCREV_machine_qemuppc ?= "ec7945d3abac66557de452e9c81f6f3692f187db"
+SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.14.4"
+LINUX_VERSION ?= "3.14.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index b26ae250166d..e619fded4167 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -4,12 +4,12 @@ KBRANCH = "standard/tiny/base"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.14.4"
+LINUX_VERSION ?= "3.14.5"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
-SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
+SRCREV_machine ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
+SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 14647e9c45a5..6a500653bc1d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,18 +10,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9882294294f307dc52c29e5dbb24d7f9a2f5a635"
-SRCREV_machine_qemumips ?= "94e2f8429bcc953cb0df499446b847ba67a0f334"
-SRCREV_machine_qemuppc ?= "2795a4d16724b41fbcd62c2f9f56c427d1ce3797"
-SRCREV_machine_qemux86 ?= "4aa41764bf8dba2044ff9fae806d61cac7cdd9de"
-SRCREV_machine_qemux86-64 ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
-SRCREV_machine_qemumips64 ?= "342ccacd4e28d1cc7e30277ee4ac6caa3086ff2f"
-SRCREV_machine ?= "cb22733185cd9db3e8945dadb899d9eb3831b9ad"
-SRCREV_meta ?= "183622e8095545999a64bd72adedea2dffb6ec4b"
+SRCREV_machine_qemuarm ?= "57c7d98c639aa69ed4640aaf0077dfc6f6213b62"
+SRCREV_machine_qemumips ?= "0c95bd5e4fd9834de451197edb2f0acb7d93d1e8"
+SRCREV_machine_qemuppc ?= "9a15b569a7c7340e895327ba464e8cd852914c2b"
+SRCREV_machine_qemux86 ?= "4aa0cb556f1a3457d0cb3285d0ba2aa073b745eb"
+SRCREV_machine_qemux86-64 ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
+SRCREV_machine_qemumips64 ?= "42cb63ec0929a3e488b3c61cef31c6ee5b0e1005"
+SRCREV_machine ?= "8e552bfb9824bbfdda3b5353dab290519a7332c7"
+SRCREV_meta ?= "135b9fb4b8d66b8df9abcd22f325e77614d35d2e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.14.4"
+LINUX_VERSION ?= "3.14.5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


