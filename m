Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjuIH-0001NI-2V
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 17:36:37 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5RFPdti017601;
	Wed, 27 Jun 2012 08:25:41 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 27 Jun 2012 11:25:16 -0400
Message-Id: <79530b87e6aba46b328b91abb368a4796b116964.1340741590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340741590.git.bruce.ashfield@windriver.com>
References: <cover.1340741590.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340741590.git.bruce.ashfield@windriver.com>
References: <cover.1340741590.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.0: update BSP descriptions to new kern-tools format
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
X-List-Received-Date: Wed, 27 Jun 2012 15:36:37 -0000

In tree linux-yocto 3.0 boards indicate that they are BSPs via
the older/obsolete syntax "scc_leaf". This line in their board
description is detected by the build process and is used to find
the BSP description and the kernel type they use as their base.

To work with the latest kern tools, the BSP descriptions should
be updated to "include <ktype> branch <machine>" to acheive the
same result.

All trees newer than 3.0 already have this change and do not need
to be updated.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 971d1a8..1de0411 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "e67428d9966eecec4c081993dc64ceb5c0e64643"
 SRCREV_machine_qemuppc ?= "dcca458cb92cc287f70e4062f02460f36a881b16"
-SRCREV_meta ?= "46e8fc2bbbe73514e8d99101adaaa373f760ffa7"
+SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 5cdff95..362e65a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "bd9a3c4c066bd4b9f52b51aaaec9b029a7abe793"
 SRCREV_machine_qemux86 ?= "70342faea067476774eb55f4e3098af0bcc48782"
 SRCREV_machine_qemux86-64 ?= "cba836a545fbeb96f6f2392c3ecbac9d7735fa65"
 SRCREV_machine ?= "bd6ad607c754dea30d91502a237870b4c45e0f1b"
-SRCREV_meta ?= "46e8fc2bbbe73514e8d99101adaaa373f760ffa7"
+SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



