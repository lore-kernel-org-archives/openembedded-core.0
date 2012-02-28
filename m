Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S2USu-0005j4-It
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 22:20:09 +0100
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1SLBZEY028690;
	Tue, 28 Feb 2012 13:11:38 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 28 Feb 2012 16:10:00 -0500
Message-Id: <9b13ea5b0e43f21c4e34a04c84ecb565cba229be.1330463101.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1330463101.git.bruce.ashfield@windriver.com>
References: <cover.1330463101.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: update to v3.2.8
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
X-List-Received-Date: Tue, 28 Feb 2012 21:20:09 -0000

3.2.8 was released and contains a floating point fix for x86 32
bit and some x86-64 fixes. So it's worth picking up right away.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    6 +++---
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |   14 +++++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index b0dacb4..bbb227f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -11,11 +11,11 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.2.7"
+LINUX_VERSION ?= "3.2.8"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
-SRCREV_machine ?= "2043e8b786dfd06a41a66780141f731d2d788696"
-SRCREV_machine_qemuppc ?= "ec400326633f011c3b7d390beb765ad955145a29"
+SRCREV_machine ?= "6ab03c43328172425a6f632bff694a8da6c99f0e"
+SRCREV_machine_qemuppc ?= "470deb222a704f84f3acf3a013a19d2da399d511"
 SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index 65e1ea0..ecde039 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -15,15 +15,15 @@ KBRANCH_qemuppc  = "standard/default/qemu-ppc32"
 KBRANCH_qemumips = "standard/default/mti-malta32-be"
 KBRANCH_qemuarm  = "standard/default/arm-versatile-926ejs"
 
-LINUX_VERSION ?= "3.2.7"
+LINUX_VERSION ?= "3.2.8"
 
 
-SRCREV_machine_qemuarm ?= "c2028a144fe035719af7c5e9989fedc62ccf3c2c"
-SRCREV_machine_qemumips ?= "7dfffd937d4755cba0fcf3f2b9b69a1c62262084"
-SRCREV_machine_qemuppc ?= "8fc0489fffe4c626f9a8053ad86014e75073a3d0"
-SRCREV_machine_qemux86 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
-SRCREV_machine_qemux86-64 ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
-SRCREV_machine ?= "0fae9c2722039df3e93398d314ee10e3f4330b86"
+SRCREV_machine_qemuarm ?= "2fdc18ce2b9bf95519a02640cb45930ae7587dd4"
+SRCREV_machine_qemumips ?= "2b2a6bad57fe403f1180c4b9021210da87d02c20"
+SRCREV_machine_qemuppc ?= "eabeabc4c8a17822772895d3ba22989ae18a58c3"
+SRCREV_machine_qemux86 ?= "ea5bd45e564520ca4ecdb10f7af63263d5fe33f7"
+SRCREV_machine_qemux86-64 ?= "f54af84c64408a0259a919d1fd2405c0115c0a0b"
+SRCREV_machine ?= "21ab5dca134a6bf1316aa59f69f9ee9e091d5702"
 SRCREV_meta ?= "4c648bbbc7d2204d1b24f444aebb10f91c4ecae3"
 
 PR = "r0"
-- 
1.7.0.4



