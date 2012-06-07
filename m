Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Scj2d-0004s8-7c
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 22:10:47 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q57K07De018923;
	Thu, 7 Jun 2012 13:00:15 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu,  7 Jun 2012 15:59:49 -0400
Message-Id: <dafb4ceaf99afbd41753e6c818abce3d8beca572.1339098507.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339098507.git.bruce.ashfield@windriver.com>
References: <cover.1339098507.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 8/9] linux-yocto/3.0: add cedartrail kernel features
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
X-List-Received-Date: Thu, 07 Jun 2012 20:10:47 -0000

Updating meta to move Kernel Features out of the BSP and add to
the Cedartrail Machine branch.

Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 508beb1..a39b966 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "e67428d9966eecec4c081993dc64ceb5c0e64643"
 SRCREV_machine_qemuppc ?= "dcca458cb92cc287f70e4062f02460f36a881b16"
-SRCREV_meta ?= "b040132c19d70b00fc49f3b7e08c2ed52ac59f92"
+SRCREV_meta ?= "46e8fc2bbbe73514e8d99101adaaa373f760ffa7"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index cfae247..440821c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "bd9a3c4c066bd4b9f52b51aaaec9b029a7abe793"
 SRCREV_machine_qemux86 ?= "70342faea067476774eb55f4e3098af0bcc48782"
 SRCREV_machine_qemux86-64 ?= "cba836a545fbeb96f6f2392c3ecbac9d7735fa65"
 SRCREV_machine ?= "bd6ad607c754dea30d91502a237870b4c45e0f1b"
-SRCREV_meta ?= "b040132c19d70b00fc49f3b7e08c2ed52ac59f92"
+SRCREV_meta ?= "46e8fc2bbbe73514e8d99101adaaa373f760ffa7"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



