Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16ED660125
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 15:09:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2NF9AX1026921
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Mar 2016 08:09:10 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 23 Mar 2016 08:09:09 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 23 Mar 2016 11:09:01 -0400
Message-ID: <04a3625414a58057da4d97b0a0f361d300bfb4b1.1458745322.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1458745322.git.bruce.ashfield@windriver.com>
References: <cover.1458745322.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/4.1: device property : Backport device property patches
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
X-List-Received-Date: Wed, 23 Mar 2016 15:09:15 -0000
Content-Type: text/plain

Integrating the following mainline commits for Apollo Lake/Broxton support:

  568c4910b938 device property: always check for fwnode type
  bd2ac1821e91 device property: fallback to pset when gettng one string
  44a76bd61eed ACPI / property: Extend fwnode_property_* to data-only subnodes
  76f301877fab ACPI / property: Add support for data-only subnodes
  95010db1e8f9 ACPI / property: Add routine for extraction of _DSD properties
  3d257abeae4d device property: Return -ENXIO if there is no suitable FW interface
  15f7db3cd1d0 device property: attach 'else if' to the proper 'if'
  effb3f07966e ACPI / OF: Rename of_node() and acpi_node() to to_of_node() and to_acpi_node()
  30aa0ae9ebf0 ACPI / scan: Parse _CCA and setup device coherency
  c8b4218d1523 ACPI / property: Define a symbol for PRP0001
  3d20c5d27e99 ACPI / property: Refine consistency check for PRP0001
  f753cbe35057 device property: avoid allocations of 0 length
  6985a3d56431 device property: the secondary fwnode needs to depend on the primary
  6c23f8de37ff device property: add spaces to PROPERTY_ENTRY_STRING macro
  216b251c170c include/linux/property.h: fix build issues with gcc-4.4.4
  c579da0b4812 device property: Take a copy of the property set
  e0c7ce6ec1eb device property: Fallback to secondary fwnode if primary misses the property
  a657577af2af device property: improve readability of macros
  599f18f62daf device property: Add fwnode_property_match_string()
  03599b274370 device property: helper macros for property entry creation
  5247e6af02d6 device property: keep single value inplace
  c12af01cf0d4 device property: refactor built-in properties support
  1390c21efa11 device property: rename helper functions

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 16 ++++++++--------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 48f304dd2f95..cb9ecd877732 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -2,7 +2,7 @@ KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-SRCREV_machine ?= "5984d68470257f07d515b94570cd4fbdc5439380"
+SRCREV_machine ?= "147f03e2a95452d67185375e1f037696cb9b8f10"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 3de6f0efbdc7..af8228525a72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "4.1.18"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index a99ba9a160a1..093fd894c045 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "694cc606807a8e5cce762027f51b4179520c9238"
-SRCREV_machine_qemuarm64 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
-SRCREV_machine_qemumips ?= "9150f6c42a7f3d61c150dd0cc2f2de8749dceac9"
-SRCREV_machine_qemuppc ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
-SRCREV_machine_qemux86 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
-SRCREV_machine_qemux86-64 ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
-SRCREV_machine_qemumips64 ?= "e068452acbc753215c7e26d4e81cdf437b53b988"
-SRCREV_machine ?= "304caa9480f19875e717faf3cad8cb7ecd758733"
+SRCREV_machine_qemuarm ?= "608b0ecfc5c2ab27bfa6622eefa3c0948c3a2f44"
+SRCREV_machine_qemuarm64 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine_qemumips ?= "aced73e93690206a16e77b9b5dbb633690a8ea98"
+SRCREV_machine_qemuppc ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine_qemux86 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine_qemux86-64 ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
+SRCREV_machine_qemumips64 ?= "83e5af8217dc0a4e867b8a0d1d85aaf393ecb9c7"
+SRCREV_machine ?= "f753cbe35057d5df18bcf1adafd74e64dbbdff6b"
 SRCREV_meta ?= "b9023d4c8fbbb854c26f158a079a5f54dd61964d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
-- 
2.5.0


