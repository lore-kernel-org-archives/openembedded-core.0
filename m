Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1C2776CB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 13:31:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2EDVMv3001385
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 14 Mar 2017 06:31:22 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 14 Mar 2017 06:31:22 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 14 Mar 2017 09:31:13 -0400
Message-ID: <f6eb461aa0a2c7395cf3d50ebc0f8074f57baeee.1489498044.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1489498044.git.bruce.ashfield@windriver.com>
References: <cover.1489498044.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/4.10: update to v4.10.1
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
X-List-Received-Date: Tue, 14 Mar 2017 13:31:24 -0000
Content-Type: text/plain

Integrating the korg -stable release with the following change summary:

  d23a9821d397 Linux 4.10.1
  289ab6e9b7ce xfs: clear delalloc and cache on buffered write failure
  c1f105b5dc83 rtlwifi: rtl_usb: Fix for URB leaking when doing ifconfig up/down
  dea972f381a1 block: fix double-free in the failure path of cgwb_bdi_init()
  96081d826cb3 ACPICA: Linuxize: Restore and fix Intel compiler build
  8ab75da134c1 netfilter: nf_ct_helper: warn when not applying default helper assignment
  910c3e4d118d goldfish: Sanitize the broken interrupt handler
  adf7f1350a0c x86/platform/goldfish: Prevent unconditional loading
  33b11454af5d USB: serial: console: fix uninitialised spinlock
  122b5f43f6ea USB: serial: ark3116: fix register-accessor error handling
  199d9b3e02b2 USB: serial: opticon: fix CTS retrieval at open
  ecf5c9f1e5ea USB: serial: spcp8x5: fix modem-status handling
  2a503750ae13 USB: serial: ftdi_sio: fix line-status over-reporting
  c9b8c246fa3a USB: serial: ftdi_sio: fix extreme low-latency setting
  4f53d5eaccab USB: serial: ftdi_sio: fix modem-status error handling
  b9296dd8a66a USB: serial: cp210x: add new IDs for GE Bx50v3 boards
  4f91f13d483e USB: serial: mos7840: fix another NULL-deref at open
  8e5eb8e9ad74 tty: serial: msm: Fix module autoload
  cc8937cd74f9 net: socket: fix recvmmsg not returning error from sock_error
  7e963e31ded6 ip: fix IP_CHECKSUM handling
  ccff0ed8c48c ptr_ring: fix race conditions when resizing

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index 150fda5473aa..d9d82ea7bef2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10"
+LINUX_VERSION ?= "4.10.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index 4d4639a97f3d..2a9f4a93cc85 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10"
+LINUX_VERSION ?= "4.10.1"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index db6fa7eca5a2..6dd86b67910f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "371697c9008e2f26edba9b4a3baaf327a530fb7f"
-SRCREV_machine_qemuarm64 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_machine_qemumips ?= "ea0bdf9b515d2ceafaf333564594ca1bfbc0e50a"
-SRCREV_machine_qemuppc ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_machine_qemux86 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_machine_qemux86-64 ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_machine_qemumips64 ?= "d5434bd8cfdbefbe4dcde9743e61383ce8a944c9"
-SRCREV_machine ?= "b259a5d744e8955a03405c6b59c5a61724755ea8"
-SRCREV_meta ?= "805ea440c791acee4617820ab32e93f1ccbd9ae2"
+SRCREV_machine_qemuarm ?= "267235eab850fed3af60c39005103062cd5831ac"
+SRCREV_machine_qemuarm64 ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_machine_qemumips ?= "af9f7f526fdd08da2eff38933448c0e7cd202786"
+SRCREV_machine_qemuppc ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_machine_qemux86 ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_machine_qemux86-64 ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_machine_qemumips64 ?= "85f89e2f7f33de72815995de6025e0b217f64c9a"
+SRCREV_machine ?= "705df692910849e38f734f5bff121070e35118f1"
+SRCREV_meta ?= "976e613c7010132ab306ca4e7f7f385356a42492"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10"
+LINUX_VERSION ?= "4.10.1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


