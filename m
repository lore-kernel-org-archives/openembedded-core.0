Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SoyKf-0004wP-9q
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 16:56:02 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6BEic1t003278;
	Wed, 11 Jul 2012 07:44:39 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jul 2012 10:44:20 -0400
Message-Id: <fcdfa310117415fdc5ed49b93f2c4695fde8b084.1342017706.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1342017706.git.bruce.ashfield@windriver.com>
References: <cover.1342017706.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1342017706.git.bruce.ashfield@windriver.com>
References: <cover.1342017706.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/3.0: perf scripting support
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
X-List-Received-Date: Wed, 11 Jul 2012 14:56:10 -0000

Updating the 3.0 SRCREVs to pickup the recent perf scripting fixes.

  cef17a1 perf: add sgidefs.h to for mips builds
  3258da3 perf: change --root to --prefix for python install
  1f9c25b perf: add 'libperl not found' warning
  f2b1bf1 perf: use pkg-config instead of python-config
  568e05f perf tools: Add support to install perf python extension
  7e47f81 Revert "perf: hard-code NO_LIBPERL/NO_LIBPYTHON"

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 1dd95c6..c7d6ced 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -7,8 +7,8 @@ LINUX_VERSION ?= "3.0.32"
 LINUX_KERNEL_TYPE = "preempt-rt"
 KMETA = "meta"
 
-SRCREV_machine ?= "e67428d9966eecec4c081993dc64ceb5c0e64643"
-SRCREV_machine_qemuppc ?= "dcca458cb92cc287f70e4062f02460f36a881b16"
+SRCREV_machine ?= "bbd5bfe49403fdcca294ca4b163d5f7195ea3a8e"
+SRCREV_machine_qemuppc ?= "c3575ad0016173b6e0b953404eb6a770e75a1f11"
 SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
 
 PR = "${INC_PR}.0"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index d178cd0..2adbc46 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -11,12 +11,12 @@ KMETA = "meta"
 
 LINUX_VERSION ?= "3.0.32"
 
-SRCREV_machine_qemuarm ?= "b8b6c3b6b3edf129ac26a27d779dd972c36e8ebd"
-SRCREV_machine_qemumips ?= "33a643547e983adb442ff8e15645881816b17a7d"
-SRCREV_machine_qemuppc ?= "bd9a3c4c066bd4b9f52b51aaaec9b029a7abe793"
-SRCREV_machine_qemux86 ?= "70342faea067476774eb55f4e3098af0bcc48782"
-SRCREV_machine_qemux86-64 ?= "cba836a545fbeb96f6f2392c3ecbac9d7735fa65"
-SRCREV_machine ?= "bd6ad607c754dea30d91502a237870b4c45e0f1b"
+SRCREV_machine_qemuarm ?= "f2d606dfbc61d10847783f1e7c1dcb0ecabf3220"
+SRCREV_machine_qemumips  ?= "57f4bbfb4c65e4c8e349401b877f1661fb026ed6"
+SRCREV_machine_qemuppc ?= "d8779a6245d13c3b56eabac36a14c8896f448566"
+SRCREV_machine_qemux86 ?= "33d5d1ea371dad280e5bcfadd12c3a360c6bc5b8"
+SRCREV_machine_qemux86-64 ?= "fe23c7dd94eb94dd5887028683093615ac921086"
+SRCREV_machine ?= "cef17a18d72eae749dc78de3c83772f52815d842"
 SRCREV_meta ?= "d282029891bba5440630a885b940dea5e34e3e2c"
 
 PR = "${INC_PR}.0"
-- 
1.7.5.4



