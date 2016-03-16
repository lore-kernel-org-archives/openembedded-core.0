Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD6766FFD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 16:48:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2GGmSYW025181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 16 Mar 2016 09:48:28 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 16 Mar 2016 09:48:28 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 16 Mar 2016 12:48:21 -0400
Message-ID: <5c31a76511dd2e10adec264ac337e3678f5d5490.1458146315.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458146315.git.bruce.ashfield@windriver.com>
References: <cover.1458146315.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] linux-yocto/4.1: usb: add usb_otg_caps to usb_gadget structure.
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
X-List-Received-Date: Wed, 16 Mar 2016 16:48:28 -0000
Content-Type: text/plain

We backported a series of usb OTG commits for BSPs that required
updated support, but this commit was missed. We backport it as
well to fix build issues in some configurations.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index bd4fbbd33d1e..48f304dd2f95 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "fe96b2fe1c896675ef3b62d2aae9ec2082a48899"
+SRCREV_machine ?= "5984d68470257f07d515b94570cd4fbdc5439380"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 1002b29ae7bd..3de6f0efbdc7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index ff82047c5488..a99ba9a160a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3c2c6e8e8b528b9be1e034975623fd98e51bfc52"
-SRCREV_machine_qemuarm64 ?= "9073fd86a770707cceb817867460db72eaa9f107"
-SRCREV_machine_qemumips ?= "bee0b4b4981c34ea515758d0da3ad68012b8d0bf"
-SRCREV_machine_qemuppc ?= "9073fd86a770707cceb817867460db72eaa9f107"
-SRCREV_machine_qemux86 ?= "9073fd86a770707cceb817867460db72eaa9f107"
-SRCREV_machine_qemux86-64 ?= "9073fd86a770707cceb817867460db72eaa9f107"
-SRCREV_machine_qemumips64 ?= "600bca3cd7994a86ce1899132d1665ae0290c67a"
-SRCREV_machine ?= "9073fd86a770707cceb817867460db72eaa9f107"
+SRCREV_machine_qemuarm ?= "694cc606807a8e5cce762027f51b4179520c9238"
+SRCREV_machine_qemuarm64 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine_qemumips ?= "9150f6c42a7f3d61c150dd0cc2f2de8749dceac9"
+SRCREV_machine_qemuppc ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine_qemux86 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine_qemux86-64 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine_qemumips64 ?= "e068452acbc753215c7e26d4e81cdf437b53b988"
+SRCREV_machine ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


