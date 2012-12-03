Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TfdAv-0007R4-3M
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 22:03:37 +0100
Received: from yow-bashfiel-d3.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB3Kn7lu013095;
	Mon, 3 Dec 2012 12:49:10 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon,  3 Dec 2012 15:49:05 -0500
Message-Id: <da3e50d3425f39e837a23828feaedfb1418f1d92.1354566708.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1354566708.git.bruce.ashfield@windriver.com>
References: <cover.1354566708.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/3.4: emenlow: switch from psb to emgd graphics
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
X-List-Received-Date: Mon, 03 Dec 2012 21:03:37 -0000

Updating the meta branch SRCREVs for the following commit:

[
   meta/emenlow: use emgd instead of psb graphics driver

    This commit essentially does just this:
      Remove all the references of psb patches for emenlow BSP.
      Change the emenlow scc files to use emgd instead of psb.
]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index d524120..6412edc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "61a6e7a812b3b49988c4eb29a78c5db94d380197"
 SRCREV_machine_qemuppc ?= "0d29fe9056288412b8b538e48af3c78bac3494f1"
-SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
+SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index d6fe8bb..a18a561 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.20"
 KMETA = "meta"
 
 SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
+SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 814492d..0e795c6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "67a370223d695ec08b6e5a38860fa1fe5d0d9f1e"
 SRCREV_machine_qemux86 ?= "b13bef6377719a488293af196236cc290566fad3"
 SRCREV_machine_qemux86-64 ?= "b13bef6377719a488293af196236cc290566fad3"
 SRCREV_machine ?= "b13bef6377719a488293af196236cc290566fad3"
-SRCREV_meta ?= "8b0a93c0a224c9b91f90545b123b055b2e313bfc"
+SRCREV_meta ?= "6737e890fff2a423fbb022ab1f7f82ef187fd8b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4



