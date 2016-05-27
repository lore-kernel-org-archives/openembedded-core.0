Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1384173219
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 14:32:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4REWReO028502
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 27 May 2016 07:32:27 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 May 2016 07:32:26 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 27 May 2016 10:32:21 -0400
Message-ID: <e3d0b26507ae18ea55b8a887dbf27c6a7a773b88.1464359230.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1464359230.git.bruce.ashfield@windriver.com>
References: <cover.1464359230.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: tom.zanussi@intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: create intel branches
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
X-List-Received-Date: Fri, 27 May 2016 14:32:30 -0000
Content-Type: text/plain

To provide timely support for Intel platforms, without risking
issues with other platforms, we create intel branches from the
common variants.

i.e. We now have standard/intel, which is from standard/base

These branches will be managed like any other in the tree, and
will get common -stable, -rt, bugs and CVE updates.

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 51fa3adeb209..dcdc74578311 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "320892013ad33ab41f530ad321939aec07d09d22"
-SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
+SRCREV_meta ?= "2b07d06557a049b6ef7038a31651279c33794dbd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index a6f7dcca5ec4..15740f9b8ea9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -1,4 +1,4 @@
-KBRANCH ?= "standard/preempt-rt"
+KBRANCH ?= "standard/preempt-rt/base"
 
 require recipes-kernel/linux/linux-yocto.inc
 
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "3bdc347cc2087a0217e3acddccda5bb775cd570b"
-SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
+SRCREV_meta ?= "1465ac389f22979618852aa04298049cfdd5dcb4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 35a76ef0cd07..ce69c55fd597 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
+SRCREV_meta ?= "2b07d06557a049b6ef7038a31651279c33794dbd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index e05b27a769d4..30a9ecb7c096 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
+SRCREV_meta ?= "1465ac389f22979618852aa04298049cfdd5dcb4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index 2332e11f42ed..39fab5f4a4f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "ecc983477682203619da0e456fa4a8689ac41097"
 SRCREV_machine_qemux86-64 ?= "ecc983477682203619da0e456fa4a8689ac41097"
 SRCREV_machine_qemumips64 ?= "1db47ec6c39071b29f82a040b9b9a81584f50461"
 SRCREV_machine ?= "ecc983477682203619da0e456fa4a8689ac41097"
-SRCREV_meta ?= "d6e1f4bfc254c677a8dfef92f0ad8c78bdeeea75"
+SRCREV_meta ?= "2b07d06557a049b6ef7038a31651279c33794dbd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 984a49c85e51..117fe5bc2c46 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
 SRCREV_machine_qemux86-64 ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
 SRCREV_machine_qemumips64 ?= "7ce6e58742b2f1f79cc8b1a1fff8bc408a3b585e"
 SRCREV_machine ?= "53e84104c5e68eb468823dd0d262a64623d01a55"
-SRCREV_meta ?= "6ec93aaa70f838b551f58b91d0c6ffeff6f6094b"
+SRCREV_meta ?= "1465ac389f22979618852aa04298049cfdd5dcb4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
-- 
2.5.0


