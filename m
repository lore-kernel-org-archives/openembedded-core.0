Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TBSPr-0000Xl-2O
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 17:30:19 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFHgws015656;
	Tue, 11 Sep 2012 08:17:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 11 Sep 2012 11:17:28 -0400
Message-Id: <28fa55723ec7c338c2400f54382656d5d21cb8e7.1347376358.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1347376358.git.bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347376358.git.bruce.ashfield@windriver.com>
References: <cover.1347376358.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto*: append to KERNEL_FEATURES instead of assigning
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2012 15:30:19 -0000

It is sometimes useful for KERNEL_FEATURES to be set in a machine
or other configuration file. The linux-yocto recipes currently
initialize the variable, which clobbers any values set by .conf
files.

Appending to the variables allows these settings to propagate to
the kernel configuration, while maintaining the existing set of
added kernel features.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index a16b549..0cdc7c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -22,7 +22,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0.git;protocol=git;bareclone
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 05362ef..a3900ce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2.git;protocol=git;bareclone
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = "features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 3b36378..4fd3845 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;bareclone
 COMPATIBLE_MACHINE = "(qemux86|qemux86-64|qemuarm)"
 
 # Functionality flags
-KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index d16cdf0..e917beb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.0;protocol=git;bareclone=1;b
 COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
-KERNEL_FEATURES = "features/netfilter"
+KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append = " features/taskstats"
 KERNEL_FEATURES_append_qemux86 = " cfg/sound"
 KERNEL_FEATURES_append_qemux86-64 = " cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index ba4b536..45414d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -27,7 +27,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.2;protocol=git;bareclone=1;b
 COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
-KERNEL_FEATURES="features/netfilter"
+KERNEL_FEATURES_append=" features/netfilter"
 KERNEL_FEATURES_append=" features/taskstats"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 7258cba..59ad4b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -24,6 +24,6 @@ COMPATIBLE_MACHINE = "qemuarm|qemux86|qemuppc|qemumips|qemux86-64"
 
 # Functionality flags
 KERNEL_REVISION_CHECKING=""
-KERNEL_FEATURES="features/netfilter"
+KERNEL_FEATURES_append = " features/netfilter"
 KERNEL_FEATURES_append_qemux86=" cfg/sound"
 KERNEL_FEATURES_append_qemux86-64=" cfg/sound"
-- 
1.7.5.4



