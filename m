Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B960278293
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 19:21:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v58JM0ZS026393
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 8 Jun 2017 12:22:00 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 8 Jun 2017 12:21:59 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 8 Jun 2017 15:21:53 -0400
Message-ID: <1301b9ee0b695833285b416152958de828b2fe1c.1496949552.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1496949552.git.bruce.ashfield@windriver.com>
References: <cover.1496949552.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-yocto-rt: 4.9-rt18
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
X-List-Received-Date: Thu, 08 Jun 2017 19:21:59 -0000
Content-Type: text/plain

Integrating the 4.9-rt18 port that Paul Gortmaker has prepared:

 f458d12de7f1 v4.9.27-rt18
 82fcbd9f7e1f futex/rtmutex: Cure RT double blocking issue
 b4352b9fb961 futex: backported patches
 0874a0a35318 random: avoid preempt_disable()ed section
 07481e7a0e04 v4.9.27-rt17
 76c86c0787fe v4.9.20-rt16
 d394d677d188 rwsem/rt: Lift single reader restriction
 ad7b0ccf9f1f rtmutex: Provide locked slowpath
 f363d238326d rtmutex: Provide rt_mutex_lock_state()
 b3b4c3aa793e rtmutex: Make lock_killable work
 e3fa9e78c860 v4.9.20-rt15
 1e458a1a876d v4.9.18-rt14
 f57fd2fcd3e2 Add the rtmutex rework
 3829b7532ca9 lockdep: Fix per-cpu static objects
 bc1065b64955 v4.9.18-rt13
 095698fd99b4 Merge branch 'standard/base' into standard/preempt-rt/base

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index f35ae5531294..cf584be7eef6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "095698fd99b452d95188ff6f2cce3df5127beb5c"
-SRCREV_meta ?= "6300f53e21a119c8cd97988e3c44e0bb5e8594ce"
+SRCREV_machine ?= "f458d12de7f157fe050afc7c1fee08022876eae3"
+SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index c3b39cfd8dd5..49047e9c9954 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "6300f53e21a119c8cd97988e3c44e0bb5e8594ce"
+SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index c3cb8594963b..e9fe07761de3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemux86-64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
 SRCREV_machine_qemumips64 ?= "bfdb9d2cf36f5ded1cd8d03e58465d9f6250bba8"
 SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
-SRCREV_meta ?= "6300f53e21a119c8cd97988e3c44e0bb5e8594ce"
+SRCREV_meta ?= "de57de86e23493d9356fc4cc0e92a3df58a29032"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


