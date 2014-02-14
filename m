Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC1AC6EFB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 19:14:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1EJE3P3015932
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Feb 2014 11:14:03 -0800 (PST)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Fri, 14 Feb 2014 11:14:02 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 14 Feb 2014 14:13:54 -0500
Message-ID: <8eb185405881da879728810dc74dec7fceaf2b6c.1392404866.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392404866.git.bruce.ashfield@windriver.com>
References: <cover.1392404866.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/3.10: update to v3.10.28
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
X-List-Received-Date: Fri, 14 Feb 2014 19:14:04 -0000
Content-Type: text/plain

Updating the 3.10 kernel SRCREVs to integrate the v3.10.27, 27 and 28 -stable
releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.10.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
index fa6415aa4f42..5e387a5f13c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.10.bb
@@ -3,13 +3,13 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "14651317755a87f03f8399299f2eb0b4042a2d0c"
-SRCREV_machine_qemuppc ?= "2918b5d9ee82304d67aae61a427fcb02d3edee8f"
+SRCREV_machine ?= "6a0719e6623a22991fae0fa45e8949d7c79e7451"
+SRCREV_machine_qemuppc ?= "9742f3fd2260676ed73d0a1b4f1bc9fc621609ef"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.10.25"
+LINUX_VERSION ?= "3.10.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
index 923f9123322b..6b1cbc6cadce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.10.bb
@@ -5,11 +5,11 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.10.25"
+LINUX_VERSION ?= "3.10.28"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
+SRCREV_machine ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.10.bb b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
index 8b90d6b5ed5d..ee27db2a0e36 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.10.bb
@@ -11,18 +11,18 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2a4d8c0884c8d08896c052a6e42c51e861cf48b5"
-SRCREV_machine_qemumips ?= "08872a160571b9bf45b6cd262b977063f12aca46"
-SRCREV_machine_qemuppc ?= "eba0c4fcc962ffddd384251b5b6ee0c61bd5ea4d"
-SRCREV_machine_qemux86 ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
-SRCREV_machine_qemux86-64 ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
-SRCREV_machine_qemumips64 ?= "de555074575d2997a8cd7a4b2d6dbf22e7ddfc9b"
-SRCREV_machine ?= "78d2a615b13a1c307d482eaa9499c1b2dee40599"
+SRCREV_machine_qemuarm ?= "ccf8a3041cd815d3b401000345176870903cf77f"
+SRCREV_machine_qemumips ?= "5233fddda6c698399eca44320027d5ee3ba662a8"
+SRCREV_machine_qemuppc ?= "265e7bcceaa36d7cddbc20d73e451d376b66fb30"
+SRCREV_machine_qemux86 ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
+SRCREV_machine_qemux86-64 ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
+SRCREV_machine_qemumips64 ?= "7a092b58f5f8f8f7893b2ee05d3d725ac2968d99"
+SRCREV_machine ?= "25d0ebad3e2bf9f12bd6d386ead68e1f64ceaf29"
 SRCREV_meta ?= "713abc0efa9fc21234b2f342d0a849e4a4a36c65"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.10.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.10.25"
+LINUX_VERSION ?= "3.10.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
1.8.1.2


