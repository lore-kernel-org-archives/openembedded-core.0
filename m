Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SeaBJ-0000gZ-Re
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 01:07:26 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5CMujoq010832;
	Tue, 12 Jun 2012 15:56:47 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue, 12 Jun 2012 18:56:24 -0400
Message-Id: <a9c48f05ea9eb0901715cd628280eff22da766aa.1339541557.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1339541557.git.bruce.ashfield@windriver.com>
References: <cover.1339541557.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1339541557.git.bruce.ashfield@windriver.com>
References: <cover.1339541557.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 1/2] linux-yocto/3.4: update yaffs2 and drop rc6
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
X-List-Received-Date: Tue, 12 Jun 2012 23:07:26 -0000

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

    To include the following commits:

    662466a yaffs2 checkpointing: Add further checkpoint data sanity checking
    d9cae0a yaffs2: Make checkpoint block scanning skip bad blocks.
    eb12d56 Remove trace that should not be in mounting.
    9ee5d06 yaffs for u-boot: Cleanups to make patches acceptable for u-boot
    83d9993 Merge remote branch 'origin/master'
    07353dd Clean up checkin. Do not use
    00ebf30 Update timothy test Makefile
    1658295 yaffsfs: Allocate directory searches from a table rather than via malloc.
    8dae7f1 Fix compilation of python tests.
    14ff4e1 yaffs u-boot: Fix problem if an illegal nand chip number is entered.
    8b34846 Set up u-boot glue code and patching scripts.
    1a17e3a Add more descriptive comment for using the yaffs commands.
    80f8530 Add files to hook up yaffs direct to u-boot
    95ff7ef Merge branch 'master' of ssh://www.aleph1.co.uk/home/aleph1/git/yaffs2
    e49491a Put both the summary and checkpoint version stamps together, update checkpoint version
    468d72b Fix compilation of mkyaffsimage and mkyaffs2image
    87166df Fix resizing of large files.
    eeb0f17 Fix summary header validation
    d308180 Add a summary header
    7862c13 Remove extra line from banner.
    d14c6a6 Add script to handle common Linux and direct files
    6518138 Change Makefiles to support new way to structure yaffs_strxxx renaming for yaffs direct
    8429784 Update README about linux patching
    6ee2533 Update Makefiles for new sed-based way case-insensitive handling
    2369fad Set up new version of case insensitive code using sed
    4d8ae2f Add large file support changes to yaffs_vfs_single.c
    ce0a5fb Merge branch 'big-files':  Merge in large file support
    80d031a Add Waldemar's patches for Linux 3.2
    a7ae50c yaffs large file support: Fix max file size issue that prevented the scanning working.
    a7cb3a3 WIP Changes to tests
    2360446 yaffs large file support: Add more tests
    0ed6086 yaffs large file support: Saves and restores large files fine under yaffs direct.
    fc4028b large file storage WIP. Can save and verify a large file under yaffs direct.
    20de150 WIP large file support
    b4d93e2 First cut of changes to support large files.

    Signed-off-by: Michel Thebeau <michel.thebeau@windriver.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.4.bb |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 81816b1..9205901 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,13 +10,13 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "bc7dd2ebe7f5443fb9d89d46106053cfc69b5d7f"
-SRCREV_machine_qemumips ?= "5a2ad0078de3d24a6e8e3f3c9a7426a08a86717d"
-SRCREV_machine_qemuppc ?= "f92ab2a332627c0213ecfdfc873d470be008f86b"
-SRCREV_machine_qemux86 ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
-SRCREV_machine_qemux86-64 ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
-SRCREV_machine ?= "780ab7e11f03931295e8f0e29707f2abb688e9ad"
-SRCREV_meta ?= "3fd089debe624c642d7b4d9363f853021d1675b2"
+SRCREV_machine_qemuarm ?= "1b83eb1b99e937b67dafa4dedba9440d596cbd9f"
+SRCREV_machine_qemumips ?= "c6104a63aae262ff4238b45905ab1c57145334bc"
+SRCREV_machine_qemuppc ?= "4988a7e34bccd531b511c57f93358de9fcc672a0"
+SRCREV_machine_qemux86 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
+SRCREV_machine_qemux86-64 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
+SRCREV_machine ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
+SRCREV_meta ?= "978f876e4368cdd0ef781e74ea28a6771bf69b79"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



