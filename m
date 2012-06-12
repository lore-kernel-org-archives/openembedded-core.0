Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SeUyV-0004cr-74
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 19:33:51 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CHN9EC023927;
	Tue, 12 Jun 2012 10:23:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 12 Jun 2012 13:22:49 -0400
Message-Id: <37e3329f8891cf6e430aee04a97e9ea2db6ec3ff.1339521554.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339521554.git.bruce.ashfield@windriver.com>
References: <cover.1339521554.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339521554.git.bruce.ashfield@windriver.com>
References: <cover.1339521554.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto/meta-yocto: update yaffs2 and drop rc6
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
X-List-Received-Date: Tue, 12 Jun 2012 17:33:51 -0000

Updating the 3.4 SRCREVs to pickup a yaffs2 update and the removal
of a feature that was required in the 3.2 kernel tree.

1/2 [
    meta: rc6: remove rc6 patches for snb

    The sandybridge rc6 patches are part of the released v3.4 kernel.
    Hence there is no need to keep these patches in the 3.4 linux
    yocto kernel repository.

    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
]

2/2 [
    yaffs2: update core support

    Uprev yaffs2 to latest version as of 2012-05-29
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../recipes-kernel/linux/linux-yocto_3.4.bbappend  |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-yocto/recipes-kernel/linux/linux-yocto_3.4.bbappend b/meta-yocto/recipes-kernel/linux/linux-yocto_3.4.bbappend
index cb8c3aa..6d7d54d 100644
--- a/meta-yocto/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/meta-yocto/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -3,10 +3,10 @@ KBRANCH_routerstationpro = "standard/routerstationpro"
 KBRANCH_mpc8315e-rdb = "standard/fsl-mpc8315e-rdb"
 KBRANCH_beagleboard = "standard/beagleboard"
 
-SRCREV_machine_atom-pc ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
-SRCREV_machine_routerstationpro ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
-SRCREV_machine_mpc8315e-rdb ?= "2d99f67fe6b4301cefd4e6f9a5ce75a9cc84686b"
-SRCREV_machine_beagleboard ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
+SRCREV_machine_atom-pc ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
+SRCREV_machine_routerstationpro ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
+SRCREV_machine_mpc8315e-rdb ?= "a371ff9dc5cbf9629fd3257d57120d5182e0d981"
+SRCREV_machine_beagleboard ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
 
 COMPATIBLE_MACHINE_mpc8315e-rdb = "mpc8315e-rdb"
 # COMPATIBLE_MACHINE_routerstationpro = "routerstationpro"
-- 
1.7.5.4



