Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1ED6FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 06:36:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3C6ajmE006442
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 23:36:45 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 11 Apr 2016 23:36:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Apr 2016 23:36:43 -0700
Message-ID: <0877ab068513b9720c808aaeb0c8a90f9a45afc3.1460442964.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460442964.git.liezhi.yang@windriver.com>
References: <cover.1460442964.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [PATCH 1/1] linux-yocto-tiny: fix KBRANCH
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
X-List-Received-Date: Tue, 12 Apr 2016 06:36:46 -0000
Content-Type: text/plain

Fixed:
WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: After meta data application, the kernel tree branch is standard/tiny/common-pc. The
WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: SRC_URI specified branch standard/tiny/base. The branch will be forced to standard/tiny/base,
WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: but this means the board meta data (.scc files) do not match the SRC_URI specification.
WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: The meta data and branch standard/tiny/base should be inspected to ensure the proper
WARNING: linux-yocto-tiny-4.4.3+gitAUTOINC+770996a263_73481a3abd-r0 do_patch: kernel is being built.

Use standard/tiny/common-pc which is pointed by the .scc to fix problem.
Btw, standard/tiny/base and standard/tiny/common-pc points to the same
commit id.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 4c79bfd..37ff046 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -1,4 +1,4 @@
-KBRANCH ?= "standard/tiny/base"
+KBRANCH ?= "standard/tiny/common-pc"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index 9446da9..dcb545e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -1,4 +1,4 @@
-KBRANCH ?= "standard/tiny/base"
+KBRANCH ?= "standard/tiny/common-pc"
 LINUX_KERNEL_TYPE = "tiny"
 KCONFIG_MODE = "--allnoconfig"
 
-- 
2.8.0


