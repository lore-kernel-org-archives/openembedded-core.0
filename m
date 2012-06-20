Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ShU8m-0001Fx-1w
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 01:16:48 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 040E030411
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 19:05:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jun 2012 16:05:52 -0700
Message-Id: <6ff6f377dd9e44c0fe19d211774b2541e91ad64b.1340233133.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1340233133.git.scott.a.garman@intel.com>
References: <cover.1340233133.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1340233133.git.scott.a.garman@intel.com>
References: <cover.1340233133.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 040E030411.28965
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 5/6] linux-yocto/3.0: update to v3.0.32
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
X-List-Received-Date: Wed, 20 Jun 2012 23:16:48 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

Updating the 3.0 kernel SRCREVs to integrate the v3.0.32 -stable
release.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   16 ++++++++--------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 36dcb6e..b6215c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,11 +11,11 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.24"
+LINUX_VERSION ?= "3.0.32"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "cf280f1dc5877d4ca43d21307222326efa68bb27"
-SRCREV_machine_qemuppc ?= "afaa5baa6a9ca9c8a03a9a3eee2ba9fba089f416"
+SRCREV_machine ?= "e67428d9966eecec4c081993dc64ceb5c0e64643"
+SRCREV_machine_qemuppc ?= "dcca458cb92cc287f70e4062f02460f36a881b16"
 SRCREV_meta ?= "34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23"
 
 PR = "r2"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 074b1ed..c4f976d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,14 +10,14 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.24"
-
-SRCREV_machine_qemuarm ?= "62bbe1d7a0e5c1200a99dabca889a52c9417b96b"
-SRCREV_machine_qemumips ?= "66de88919f24f1e590a48dae6de752a68fed2353"
-SRCREV_machine_qemuppc ?= "7528f1d06ef5665eed8c1498f62d5403b82bbbd6"
-SRCREV_machine_qemux86 ?= "f153b0eb8264dc1e69f59d4c9173619feb4d5bd9"
-SRCREV_machine_qemux86-64 ?= "aac580659dc0ce083f250fb05abf82e58d7f4531"
-SRCREV_machine ?= "da7c40006b08916ff3a3db104def82aaf9ac2716"
+LINUX_VERSION ?= "3.0.32"
+
+SRCREV_machine_qemuarm ?= "b8b6c3b6b3edf129ac26a27d779dd972c36e8ebd"
+SRCREV_machine_qemumips ?= "33a643547e983adb442ff8e15645881816b17a7d"
+SRCREV_machine_qemuppc ?= "bd9a3c4c066bd4b9f52b51aaaec9b029a7abe793"
+SRCREV_machine_qemux86 ?= "70342faea067476774eb55f4e3098af0bcc48782"
+SRCREV_machine_qemux86-64 ?= "cba836a545fbeb96f6f2392c3ecbac9d7735fa65"
+SRCREV_machine ?= "bd6ad607c754dea30d91502a237870b4c45e0f1b"
 SRCREV_meta ?= "34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23"
 
 PR = "r4"
-- 
1.7.9.5



