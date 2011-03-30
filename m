Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Q4yhx-0007Bn-Du
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Mar 2011 18:57:30 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p2UGsiPT024272;
	Wed, 30 Mar 2011 09:54:47 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 30 Mar 2011 12:55:14 -0400
Message-Id: <80eb591ef244f2a9ebaeca3ed2da985c72b98daf.1301503818.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1301503818.git.bruce.ashfield@windriver.com>
References: <cover.1301503818.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1301503818.git.bruce.ashfield@windriver.com>
References: <cover.1301503818.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/qemux86-64: enable profiling and latency
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
X-List-Received-Date: Wed, 30 Mar 2011 16:57:31 -0000

The configuration chunks for profiling and latency top have
been enabled in tree now, so we can drop optional feature
additions in the recipe itself.

build tests show identical configurations.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_git.bb |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_git.bb b/meta/recipes-kernel/linux/linux-yocto_git.bb
index f35d1a2..38fbba3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_git.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_git.bb
@@ -31,10 +31,6 @@ KERNEL_FEATURES="features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
 
-# Temporary fix for oprofile and latencytop on qemux86-64
-KERNEL_FEATURES_append_qemux86-64=" features/profiling"
-KERNEL_FEATURES_append_qemux86-64=" features/latencytop"
-
 # extra tasks
 addtask kernel_link_vmlinux after do_compile before do_install
 addtask validate_branches before do_patch after do_kernel_checkout
-- 
1.7.0.4



