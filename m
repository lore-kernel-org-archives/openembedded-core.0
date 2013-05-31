Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9967360653
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 03:28:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4V3Su2L023015
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 30 May 2013 20:28:56 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.130.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 30 May 2013 20:28:54 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 30 May 2013 23:28:47 -0400
Message-ID: <55f7f343d0386d53e2391581d24492cf4ddd8278.1369970703.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369970703.git.bruce.ashfield@windriver.com>
References: <cover.1369970703.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto: v3.8.13 and v3.4.46
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
X-List-Received-Date: Fri, 31 May 2013 03:28:55 -0000
Content-Type: text/plain

Updating the -stable linux-yocto trees to the latest korg -stable releases.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |   16 ++++++++--------
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   17 ++++++++---------
 6 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 0c882f2..d9a894a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.43"
+LINUX_VERSION ?= "3.4.46"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "cd1372eb10dc0b20815916205fa91d84c1c012fc"
-SRCREV_machine_qemuppc ?= "5e5ef5cca422434085b4e158674dc642b79dedda"
-SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
+SRCREV_machine ?= "a4a8406d906163dcdab2d29420a9bc46668fc8d9"
+SRCREV_machine_qemuppc ?= "0c20eafa8b950b1180f1701ba45026ea5e713482"
+SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index d0e5808..c156be7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.8.11"
+LINUX_VERSION ?= "3.8.13"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "eeadef5c3a0a40aa4e01b20362e40009927f3ad6"
-SRCREV_machine_qemuppc ?= "c7d4373996ddeb82ab7b8b5ea391227c8d10c6e9"
-SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
+SRCREV_machine ?= "e0ac9992f1bf4830de49df884a3d2f273d02637b"
+SRCREV_machine_qemuppc ?= "ea4de76a916dd3620e74e565ff42fafb5bb40843"
+SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 1cdc2a5..0955846 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.4.43"
+LINUX_VERSION ?= "3.4.46"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
-SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
+SRCREV_machine ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index ee8e669..2073ee3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.8.11"
+LINUX_VERSION ?= "3.8.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
-SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
+SRCREV_machine ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
+SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index e03b293..818367a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "a4026fce19f8b2d28f37ea264693bd70126a7ade"
-SRCREV_machine_qemumips  ?= "372aba9e80c5f86a1f6795a7b2292a05159ef108"
-SRCREV_machine_qemuppc ?= "c456ec65de4d2ac099312b0ed8e4098b29447929"
-SRCREV_machine_qemux86 ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
-SRCREV_machine_qemux86-64 ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
-SRCREV_machine ?= "fff57da7886cf5e99c07adf6649610cb1cd89330"
-SRCREV_meta ?= "1bab5bd090948b4cc4c4ed57c834603a3cf9f235"
+SRCREV_machine_qemuarm ?= "7054a5db2c1869e0e0b294459fc4770113a8df52"
+SRCREV_machine_qemumips  ?= "46b3cf22c01e40ef035b78f0542a9007aa0cf507"
+SRCREV_machine_qemuppc ?= "1f2475ab9eefbb479c8a481475ddb3043d47b74a"
+SRCREV_machine_qemux86 ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_machine_qemux86-64 ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_machine ?= "de0c0ed674dfdbd808657e299fc720d8a97cb868"
+SRCREV_meta ?= "9473a39c59bf9c07a316486d272652bacb9ad3ac"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.4.43"
+LINUX_VERSION ?= "3.4.46"
 
 PR = "${INC_PR}.4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index d458212..1517f40 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,18 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "8fb1a478c9a05362e2e4e62fc30f5ef5d6c21f49"
-SRCREV_machine_qemumips  ?= "b8870f2b11f4c948ae90a19886335fa8b7fca487"
-SRCREV_machine_qemumips64  ?= "49041e56a3c4ff552bf9f8195809b8040e2e2723"
-SRCREV_machine_qemuppc ?= "e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4"
-SRCREV_machine_qemux86 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
-SRCREV_machine_qemux86-64 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
-SRCREV_machine ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
-SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
+SRCREV_machine_qemuarm ?= "e267fe88798892416828d89bde7f778380b87a90"
+SRCREV_machine_qemumips  ?= "813bae2e17db9310f220935e87d168c8e52fafaf"
+SRCREV_machine_qemuppc ?= "f90923775f9bcec3ce23246e8fb59d8f9551e566"
+SRCREV_machine_qemux86 ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
+SRCREV_machine_qemux86-64 ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
+SRCREV_machine ?= "1f973c0fc8eea9a8f9758f47cf689ba89dbe9a25"
+SRCREV_meta ?= "edd6461602f6c2fc27bc72997e4437f422a9dccd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.8.11"
+LINUX_VERSION ?= "3.8.13"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4


