Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UZOV6-0004c5-EP
	for openembedded-core@lists.openembedded.org;
	Mon, 06 May 2013 18:43:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r46GOrRv009914
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 6 May 2013 09:24:53 -0700 (PDT)
Received: from yow-bashfiel-d3.corp.ad.wrs.com (128.224.130.136) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 09:24:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 6 May 2013 09:24:40 -0700
Message-ID: <e7290195897547a542f5ca0f080a1a074a728351.1367857109.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1367857109.git.bruce.ashfield@windriver.com>
References: <cover.1367857109.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/3.8: udpate to v3.8.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 16:43:23 -0000
Content-Type: text/plain

Update the linux-yocto-3.8 SRCREVs to the korg 3.8.11 -stable release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.8.bb      |   16 ++++++++--------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
index 980229c..d0e5808 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.8.4"
+LINUX_VERSION ?= "3.8.11"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "fd5af245e21d80e8700d41c1ecf3fc4b2c3d2e40"
-SRCREV_machine_qemuppc ?= "fa8b702a32cc19e77805d91224d0409f09808c88"
-SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
+SRCREV_machine ?= "eeadef5c3a0a40aa4e01b20362e40009927f3ad6"
+SRCREV_machine_qemuppc ?= "c7d4373996ddeb82ab7b8b5ea391227c8d10c6e9"
+SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
index 6ef143e..ee8e669 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.8.bb
@@ -8,12 +8,12 @@ KBRANCH = "${KBRANCH_DEFAULT}"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-LINUX_VERSION ?= "3.8.4"
+LINUX_VERSION ?= "3.8.11"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
-SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
+SRCREV_machine ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
+SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.8.bb b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
index 4bf6bf4..2fcaddd 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.8.bb
@@ -3,17 +3,17 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH_DEFAULT = "standard/base"
 KBRANCH = "${KBRANCH_DEFAULT}"
 
-SRCREV_machine_qemuarm ?= "1473dd2b4505109d45bd7099f63826a66b71103d"
-SRCREV_machine_qemumips  ?= "1695c38d04855cc225bcc1968289770f0fa0ea64"
-SRCREV_machine_qemuppc ?= "8b39c0424704a40c740b1ac61449fdf190a8460a"
-SRCREV_machine_qemux86 ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
-SRCREV_machine_qemux86-64 ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
-SRCREV_machine ?= "d9a45e3325030f7bd6f37947a7a0b12da7f602c3"
-SRCREV_meta ?= "27b63fdbd25ad1a37bacc05f49a205c150d21779"
+SRCREV_machine_qemuarm ?= "8fb1a478c9a05362e2e4e62fc30f5ef5d6c21f49"
+SRCREV_machine_qemumips  ?= "b8870f2b11f4c948ae90a19886335fa8b7fca487"
+SRCREV_machine_qemuppc ?= "e4c12f12e61a29b6605c4fcbcfd6dbe18bd7b4e4"
+SRCREV_machine_qemux86 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
+SRCREV_machine_qemux86-64 ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
+SRCREV_machine ?= "dd089cb5ba37ea14e8f90a884bf2a5be64ed817d"
+SRCREV_meta ?= "8482dcdf68f9f7501118f4c01fdcb8f851882997"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.8.git;protocol=git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-LINUX_VERSION ?= "3.8.4"
+LINUX_VERSION ?= "3.8.11"
 
 PR = "${INC_PR}.1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.10.4



