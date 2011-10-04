Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RBCJt-00067o-6P
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 23:14:33 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-145-174.ottawa.windriver.com [128.224.145.174])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p94L8t8r008797;
	Tue, 4 Oct 2011 14:08:56 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  4 Oct 2011 17:08:54 -0400
Message-Id: <1a26fa5d55193094ecc52b67e8446acd9f486bc0.1317762176.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317762176.git.bruce.ashfield@windriver.com>
References: <cover.1317762176.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1317762176.git.bruce.ashfield@windriver.com>
References: <cover.1317762176.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update live boot configuration
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
X-List-Received-Date: Tue, 04 Oct 2011 21:14:33 -0000

Updating the meta SRCREV to import a series of changes to synchronize
live booting between multiple targets:

  d05450e meta/fri2: enable booting from iso
  3da7d2a meta/fishriver: enable booting from iso
  52e1c49 meta/emenlow: enable booting from iso
  87918ae meta/crownbay: enable booting from iso

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 0c59a5b..9746f1a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
 SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_meta ?= "67a46a608f47c19f16995be7de7b272025864b1b"
+SRCREV_meta ?= "d05450e4aef02c1b7137398ab3a9f8f96da74f52"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 9ece25c..c36e8b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
 SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
 SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
 SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
-SRCREV_meta ?= "67a46a608f47c19f16995be7de7b272025864b1b"
+SRCREV_meta ?= "d05450e4aef02c1b7137398ab3a9f8f96da74f52"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



