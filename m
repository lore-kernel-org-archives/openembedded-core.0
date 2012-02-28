Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2USt-0005j3-II
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:20:07 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1SLBZEX028690;
	Tue, 28 Feb 2012 13:11:37 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Feb 2012 16:09:59 -0500
Message-Id: <911acbce41ed6055a8e67e11edf2cee0a51d4382.1330463101.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto/meta: add pvr feature description
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
X-List-Received-Date: Tue, 28 Feb 2012 21:20:08 -0000

Updating the 3.0 and 3.2 kernel SRCREVS to make the PVR feature
description available to machines with the appropriate hardware.

Signed-off-by: Kishore Bodke <kishore.k.bodke@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 41a37fe..8090535 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "03705f7f066d83b4cd3a6088781d47e3b9e45b71"
 SRCREV_machine_qemuppc ?= "c8b184e8171f6f5a8017be4c5bf1e7a38c3f3002"
-SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
+SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 3370729..b0dacb4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "2043e8b786dfd06a41a66780141f731d2d788696"
 SRCREV_machine_qemuppc ?= "ec400326633f011c3b7d390beb765ad955145a29"
-SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
+SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
 
 PR = "r0"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index f4eedb7..32d502f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -8,7 +8,7 @@ KBRANCH = "${KMACHINE}"
 LINUX_VERSION ?= "3.0.22"
 
 SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
-SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
+SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 8e7842e..58e1f6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "804aff4612bb7a53ac4679412c2a78bc06e3c4ce"
 SRCREV_machine_qemux86 ?= "7b0476fde681e828417d8fa86c47b0ca539ade70"
 SRCREV_machine_qemux86-64 ?= "14fe1742198bd5a85fbcf6e53d336838ff87b2ef"
 SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
-SRCREV_meta ?= "808b49474268040ab27c8ee687b60807a11547b4"
+SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 9be1bd9..65e1ea0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -24,7 +24,7 @@ SRCREV_machine_qemuppc ?= "8fc0489fffe4c626f9a8053ad86014e75073a3d0"
 SRCREV_machine_qemux86 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
 SRCREV_machine_qemux86-64 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
 SRCREV_machine ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
-SRCREV_meta ?= "5db8963f9aefc70b4483ca4ccce8f2ef6964e2c3"
+SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.0.4



