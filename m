Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B0F3E70EE0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLd3J012417
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:39 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:39 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:32 -0400
Message-ID: <bfd3ab2ad54e84b2f8c4cbf0163e4e1dda6cd400.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/3.14: feature merges and configuration updates
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
X-List-Received-Date: Wed, 20 Aug 2014 16:21:46 -0000
Content-Type: text/plain

As part of LTSI efforts, the 3.14 kernel is receiving feature backports
from newer kernels.

With this change, we update the 3.14 SRCREVs to make the following
changes available:

 - full nohz backports (v3.16)
 - loopback NFS (v3.16)
 - numa updates (v3.16)
 - cgroups: vm_cgroup: basic infrastructure
 - cgroups: Resource controller for open files

And the following configuration change:

 - meta: features/ieee802154: add configuration fragment for IEEE 802.15.4
 - meta: features/bluetooth: add configuration fragment for Bluetooth support
 - meta: intel-common-standard: add ericson-3g to intel-common-standard.scc
 - cgroups: enable virtual memory resource controller
 - full nohz: Enable full dynticks system for nohz

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 16 ++++++++--------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 11b8dd9a5c4c..0c5767a49e5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,9 +3,9 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "41b789900aa5f2626069989710603ad1b9ab010f"
-SRCREV_machine_qemuppc ?= "b4edefacfca31c880cf3a2188e92c99f69fcb97a"
-SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
+SRCREV_machine ?= "77d54dcdf1e078290d88e85adbbe3f90d41f4c9e"
+SRCREV_machine_qemuppc ?= "ba132753cc6688c1c22d7147b02e434a3441833c"
+SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index b37e07d21601..3e8c0bc67127 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,8 +8,8 @@ LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
-SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
+SRCREV_machine ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
+SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 9cf522d9b27d..8c3cceec7d8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,14 +10,14 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b712808b59883692245fc2f28defcc03cdb60dd1"
-SRCREV_machine_qemumips ?= "f5b6f121c61c72f91b25f85f19e5d410b7f66b21"
-SRCREV_machine_qemuppc ?= "047f8cacac6a0f160ea15fb9f6de6a063ddceb63"
-SRCREV_machine_qemux86 ?= "f148e056dbce4206edd68b4fbd913f2757b3a7bb"
-SRCREV_machine_qemux86-64 ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
-SRCREV_machine_qemumips64 ?= "cc1dad65948575548188866c85fae5fbd55c7e66"
-SRCREV_machine ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
-SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
+SRCREV_machine_qemuarm ?= "92de8060e113e4a13f16c6b4b5333f538e291c6d"
+SRCREV_machine_qemumips ?= "313647599dd3cd7f42374d918a9397f82eed36fb"
+SRCREV_machine_qemuppc ?= "45ef97bc22532a5a2d2fb94df3eec0aca27d0335"
+SRCREV_machine_qemux86 ?= "edec15a07d310c4368b8149496da0548b564a413"
+SRCREV_machine_qemux86-64 ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
+SRCREV_machine_qemumips64 ?= "474fc6753d80afbd4483ea5531b03bc5b9c1ac18"
+SRCREV_machine ?= "d2f8bdb8818bf2b83ac75b6b5e8428be61242d19"
+SRCREV_meta ?= "3c987080bc943b8eae37fb6672368bb74978e484"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
1.8.1.2


