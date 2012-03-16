Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S8aJm-0001DP-1a
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:47:54 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GGcx38023581;
	Fri, 16 Mar 2012 09:39:02 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 16 Mar 2012 12:38:48 -0400
Message-Id: <74f2350cdfd764f022e6a37f5e0c44046c84a786.1331915755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 4/4] linux-yocto/3.0: update to v3.0.24
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
X-List-Received-Date: Fri, 16 Mar 2012 16:47:54 -0000

Updating the meta and machine branches to the latest 3.0 -stable
release.

To see the full changelog: git log v3.0.23..v3.0.24

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |   18 +++++++++---------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index a9a921d..d8644b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0.23"
+LINUX_VERSION ?= "3.0.24"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "49d1d57f98a9ac378a1f12f5d23301c11495a5df"
-SRCREV_machine_qemuppc ?= "7b3162e269c49c6a4653d43292c62c188add8d67"
-SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
+SRCREV_machine ?= "cf280f1dc5877d4ca43d21307222326efa68bb27"
+SRCREV_machine_qemuppc ?= "afaa5baa6a9ca9c8a03a9a3eee2ba9fba089f416"
+SRCREV_meta ?= "a4ac64fe873f08ef718e2849b88914725dc99c1c"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index b67ddee..e8bd633 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -8,10 +8,10 @@ DEPENDS += "xz-native"
 KMACHINE = "yocto/standard/base"
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.23"
+LINUX_VERSION ?= "3.0.24"
 
-SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
-SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
+SRCREV_machine ?= "da7c40006b08916ff3a3db104def82aaf9ac2716"
+SRCREV_meta ?= "a4ac64fe873f08ef718e2849b88914725dc99c1c"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index cb4ded2..e56e1d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -10,15 +10,15 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 
 KBRANCH = "${KMACHINE}"
 
-LINUX_VERSION ?= "3.0.23"
-
-SRCREV_machine_qemuarm ?= "927c56dcc7dc9199923a86cc0dac741b6b080953"
-SRCREV_machine_qemumips ?= "b1f7eb611a30a46692c11ea1164d17f0d44e911b"
-SRCREV_machine_qemuppc ?= "16f1ebf66ce2b58cbfc0ff7c8883c91c883e216a"
-SRCREV_machine_qemux86 ?= "bc2cb6560d3dedf8337b5df8228a6e8002b6a98c"
-SRCREV_machine_qemux86-64 ?= "b9cbe895ce0c259b4684355ea1602402b2653ca5"
-SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
-SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
+LINUX_VERSION ?= "3.0.24"
+
+SRCREV_machine_qemuarm ?= "62bbe1d7a0e5c1200a99dabca889a52c9417b96b"
+SRCREV_machine_qemumips ?= "66de88919f24f1e590a48dae6de752a68fed2353"
+SRCREV_machine_qemuppc ?= "7528f1d06ef5665eed8c1498f62d5403b82bbbd6"
+SRCREV_machine_qemux86 ?= "f153b0eb8264dc1e69f59d4c9173619feb4d5bd9"
+SRCREV_machine_qemux86-64 ?= "aac580659dc0ce083f250fb05abf82e58d7f4531"
+SRCREV_machine ?= "da7c40006b08916ff3a3db104def82aaf9ac2716"
+SRCREV_meta ?= "a4ac64fe873f08ef718e2849b88914725dc99c1c"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



