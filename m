Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 890A97872E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 02:25:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1J2Pu8L011519
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 18 Feb 2018 18:25:56 -0800
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 18 Feb 2018 18:25:38 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 18 Feb 2018 21:25:47 -0500
Message-ID: <448dac3b33f45c6ba009bba0919c53b4f7eecb87.1519006338.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1519006338.git.bruce.ashfield@windriver.com>
References: <cover.1519006338.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/4.14: update to v4.14.19
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
X-List-Received-Date: Mon, 19 Feb 2018 02:25:55 -0000
Content-Type: text/plain

Integrating the korg -stable release with the following change summary:

   1722fe372784 Linux 4.14.19
   d2aeb4e2bd8d Revert "x86/alternative: Print unadorned pointers"
   22f16a74c474 scsi: storvsc: missing error code in storvsc_probe()
   f18046f7a50a kernel/exit.c: export abort() to modules
   c5c91d830507 arch: define weak abort()
   3a570cfe785a crypto: tcrypt - fix S/G table for test_aead_speed()
   68a9f19264fd media: soc_camera: soc_scale_crop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   1bf81cff1bad media: mtk-vcodec: add missing MODULE_LICENSE/DESCRIPTION
   981f20bc7595 soreuseport: fix mem leak in reuseport_add_sock()
   456add4c9bd3 ipv6: Fix SO_REUSEPORT UDP socket with implicit sk_ipv6only
   c04818abad46 tcp_bbr: fix pacing_gain to always be unity when using lt_bw
   1da27118f419 rocker: fix possible null pointer dereference in rocker_router_fib_event_work
   07ca93e3176b net: ipv6: send unsolicited NA after DAD
   799a34d5b048 Revert "defer call to mem_cgroup_sk_alloc()"
   b9b70c876a7a vhost_net: stop device during reset owner
   6d35430fdaf4 tcp: release sk_frag.page in tcp_disconnect
   e8513f250d1b r8169: fix RTL8168EP take too long to complete driver initialization.
   a7c2cf702a40 qmi_wwan: Add support for Quectel EP06
   fcee7812ea05 qlcnic: fix deadlock bug
   166f27322f8c net: igmp: add a missing rcu locking section
   2726946dfcd2 ip6mr: fix stale iterator
   806d61d66900 kbuild: rpm-pkg: keep spec file until make mrproper
   abc5896b7785 .gitignore: move *.dtb and *.dtb.S patterns to the top-level .gitignore
   bafda5d37527 .gitignore: sort normal pattern rules alphabetically

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index 841d5f03b8f3..d1f338f52ca9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b91765955a6403e4b68b9e0735b439b7fea5e1b7"
-SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
+SRCREV_machine ?= "801d947020635762ac9af9ddf2edfaa1b2858414"
+SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.18"
+LINUX_VERSION ?= "4.14.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index 3bfd0b6c93b1..62d6a34fb0fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.18"
+LINUX_VERSION ?= "4.14.19"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
+SRCREV_machine ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index 660807555975..070d08e01038 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3144baf8ff07651b13bc2043266eac713aafb965"
-SRCREV_machine_qemuarm64 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_machine_qemumips ?= "bbb7ba114946c2aa95d86ccbf543dede7f147470"
-SRCREV_machine_qemuppc ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_machine_qemux86 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_machine_qemux86-64 ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_machine_qemumips64 ?= "74e50a115b86a392c610e73193b49dd029391cb4"
-SRCREV_machine ?= "47cfdc0923bd6af61cea53e7bd6d9a23761efd32"
-SRCREV_meta ?= "245d701df6c3691a078a268eff54009959beb842"
+SRCREV_machine_qemuarm ?= "773cb1d2d59644bf9574abed9803f8ec12bbabe1"
+SRCREV_machine_qemuarm64 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_machine_qemumips ?= "5fad9fa9377a7badd71ae4c1f1b1108d8cfcb047"
+SRCREV_machine_qemuppc ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_machine_qemux86 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_machine_qemux86-64 ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_machine_qemumips64 ?= "141cd6a1644eade83d4d43675a9ab11824ea01ea"
+SRCREV_machine ?= "537602db26fe2d26c1959f1ecb43966770c10ff2"
+SRCREV_meta ?= "b4468b54b2a7e7fbdf207ead7ca925bc24976d1b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.18"
+LINUX_VERSION ?= "4.14.19"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


