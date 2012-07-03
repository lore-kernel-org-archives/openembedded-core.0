Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sm4yo-0007lG-5i
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:25:30 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63FELje005061;
	Tue, 3 Jul 2012 08:14:25 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  3 Jul 2012 11:14:15 -0400
Message-Id: <49aa0be539d4fc90e277cf8386c85c1bb99af361.1341327590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto-tiny: add KMETA specification
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
X-List-Received-Date: Tue, 03 Jul 2012 15:25:30 -0000

With recent kern tools changes, having a meta branch is opt-in. The
other linux-yocto recipes were updated, but linux-yocto-tiny was
missed.

Without specifying a meta branch, the kernel configuration audit
won't return any useful results, and throws a warning message.

 WARNING: Can't find any BSP hardware or required configuration fragments.
 WARNING: Looked at //cfg///hdw_frags.txt and //cfg///required_frags.txt in directory: //cfg//
 NOTE: package linux-yocto-tiny-3.2.18+git1+ee78519365bdb25287703bbc31c06b193263c654_1+27b68a93eb791e830da8d3a2c0fc99780897ad89-r3.0: task do_kernel

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
index 78337fb..5381770 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb
@@ -9,6 +9,8 @@ KCONFIG_MODE = "--allnoconfig"
 
 LINUX_VERSION ?= "3.2.18"
 
+KMETA = "meta"
+
 SRCREV_machine ?= "27b68a93eb791e830da8d3a2c0fc99780897ad89"
 SRCREV_meta ?= "ee78519365bdb25287703bbc31c06b193263c654"
 
-- 
1.7.5.4



