Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S4PFa-0007Q4-Tu
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 05:10:19 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2541bng002549;
	Sun, 4 Mar 2012 20:01:40 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Sun,  4 Mar 2012 23:01:21 -0500
Message-Id: <a1ed2ace8b2f1fdab2c17a570f612b58f17fca7b.1330919584.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330919584.git.bruce.ashfield@windriver.com>
References: <cover.1330919584.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: v3.2.9, v3.0.23 + fixes and updates
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
X-List-Received-Date: Mon, 05 Mar 2012 04:10:19 -0000

This is an update of the linux-yocto 3.0 and 3.2 SRCREVs to bring
in the following updates:

  - v3.0.23 stable update
  - v3.2.9 stable update
  - 3.0/3.2: fri2 updates (pch + configuration changes) from Darren Hart
  - 3.0: pvr merge from Kishore Bodke
  - linux-yocto/rt: update to 3.0.23-rt38
  - linux-yocto/rt: update to 3.2.9-rt15

These have been built for all qemu targets, and built for the appropriate
hardware platforms.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    9 ++++-----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
 meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   19 +++++++++----------
 5 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 8120300..e944416 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.22"
+LINUX_VERSION ?= "3.0.23"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "03705f7f066d83b4cd3a6088781d47e3b9e45b71"
-SRCREV_machine_qemuppc ?= "c8b184e8171f6f5a8017be4c5bf1e7a38c3f3002"
-SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
+SRCREV_machine ?= "49d1d57f98a9ac378a1f12f5d23301c11495a5df"
+SRCREV_machine_qemuppc ?= "7b3162e269c49c6a4653d43292c62c188add8d67"
+SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index e5db5df..efb1bc9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,13 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.8"
+LINUX_VERSION ?= "3.2.9"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "6ab03c43328172425a6f632bff694a8da6c99f0e"
-SRCREV_machine_qemuppc ?= "470deb222a704f84f3acf3a013a19d2da399d511"
-SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
-
+SRCREV_machine ?= "3652b606f1ab7769a7ecc86c70d22db4ef99fb2a"
+SRCREV_machine_qemuppc ?= "0c8f5214bc15699b41369751cdecea45f717c79c"
+SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index 61706ea..5cad513 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -5,10 +5,10 @@ require recipes-kernel/linux/linux-yocto.inc
 KMACHINE = "yocto/standard/base"
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.22"
+LINUX_VERSION ?= "3.0.23"
 
-SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
-SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
+SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
+SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 819bf70..d76bac8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.22"
-
-SRCREV_machine_qemuarm ?= "6d4d3334bf648b97a0d44b7833060f4da40840d5"
-SRCREV_machine_qemumips ?= "1d8d58d120c92510be8a97b0ed493a25a3010d6c"
-SRCREV_machine_qemuppc ?= "804aff4612bb7a53ac4679412c2a78bc06e3c4ce"
-SRCREV_machine_qemux86 ?= "7b0476fde681e828417d8fa86c47b0ca539ade70"
-SRCREV_machine_qemux86-64 ?= "14fe1742198bd5a85fbcf6e53d336838ff87b2ef"
-SRCREV_machine ?= "c578f3a1f357142a6e02a1df4ae9aa16f45094d6"
-SRCREV_meta ?= "d7b46785d6781e2c23d754f35f09bebd3b74b5bb"
+LINUX_VERSION ?= "3.0.23"
+
+SRCREV_machine_qemuarm ?= "927c56dcc7dc9199923a86cc0dac741b6b080953"
+SRCREV_machine_qemumips ?= "b1f7eb611a30a46692c11ea1164d17f0d44e911b"
+SRCREV_machine_qemuppc ?= "16f1ebf66ce2b58cbfc0ff7c8883c91c883e216a"
+SRCREV_machine_qemux86 ?= "bc2cb6560d3dedf8337b5df8228a6e8002b6a98c"
+SRCREV_machine_qemux86-64 ?= "b9cbe895ce0c259b4684355ea1602402b2653ca5"
+SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
+SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index bad6f5e..2d2542a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,16 +15,15 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.8"
-
-
-SRCREV_machine_qemuarm ?= "2fdc18ce2b9bf95519a02640cb45930ae7587dd4"
-SRCREV_machine_qemumips ?= "2b2a6bad57fe403f1180c4b9021210da87d02c20"
-SRCREV_machine_qemuppc ?= "eabeabc4c8a17822772895d3ba22989ae18a58c3"
-SRCREV_machine_qemux86 ?= "ea5bd45e564520ca4ecdb10f7af63263d5fe33f7"
-SRCREV_machine_qemux86-64 ?= "f54af84c64408a0259a919d1fd2405c0115c0a0b"
-SRCREV_machine ?= "21ab5dca134a6bf1316aa59f69f9ee9e091d5702"
-SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
+LINUX_VERSION ?= "3.2.9"
+
+SRCREV_machine_qemuarm ?= "a4d4d3dd9a69611bd1915626d1f2e9f2b1571b39"
+SRCREV_machine_qemumips ?= "79a0a4c9872ebc70af688f9b09f6be4e4d2249e0"
+SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
+SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
+SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
+SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
+SRCREV_meta ?= "fa83c7b0b47d1aa3e25594ddbcd125a1108d3aaa"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



