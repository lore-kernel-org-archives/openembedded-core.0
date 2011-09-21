Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R6SVP-0003F8-8v
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:30:51 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(overflow-147-248.ottawa.windriver.com [128.224.147.248])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8LJPSVU023222;
	Wed, 21 Sep 2011 12:25:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Sep 2011 15:25:22 -0400
Message-Id: <5248a7676ca408fc4245d9b269b10cc46a37d51b.1316632767.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316632767.git.bruce.ashfield@windriver.com>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1316632767.git.bruce.ashfield@windriver.com>
References: <cover.1316632767.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: add blktrace feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 19:30:51 -0000

Updating the 3.0 kernel to enable blktrace to match our previous
functionality. This is done by the following meta branch commit:

[
    meta: add blktrace feature

    Add a 'blktrace feature' that turns on kernel support for blktrace, a
    block I/O tracing tool.  Added to 'standard' alongside similar tracing
    tool config.

    Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index b3bb4ac..eb329c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
 SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_meta ?= "12574e5a77597f6938315ef82d18fc5e229fb79c"
+SRCREV_meta ?= "334b8479297954d94c97f81164e3363ed7ae70e5"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 4b1bdb2..0160966 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
 SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
 SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
 SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
-SRCREV_meta ?= "12574e5a77597f6938315ef82d18fc5e229fb79c"
+SRCREV_meta ?= "334b8479297954d94c97f81164e3363ed7ae70e5"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



