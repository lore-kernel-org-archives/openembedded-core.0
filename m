Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A83E86FDEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Aug 2014 16:21:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7KGLcnw024554
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Aug 2014 09:21:38 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 20 Aug 2014 09:21:38 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Aug 2014 12:21:31 -0400
Message-ID: <d7ce43cabe3c0831fd0afeef84924163313d47d2.1408551509.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1408551509.git.bruce.ashfield@windriver.com>
References: <cover.1408551509.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/3.14: cgroups and hugetlb updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Aug 2014 16:21:59 -0000
Content-Type: text/plain

Update SRCREVs for the following feature ports:

    d61940e2aaee fs/hugetlbfs/inode.c: remove null test before kfree
    01a9d1b96a67 fs/hugetlbfs/inode.c: use static const for dentry_operations
    b58086c38038 fs/hugetlbfs/inode.c: add static to hugetlbfs_i_mmap_mutex_key
    182a45b35b74 fs/hugetlbfs/inode.c: complete conversion to pr_foo()
    a3c4b02bbb05 mm: hugetlb: fix copy_hugetlb_page_range()
    3757fbab4c89 hugetlb: rename hugepage_migration_support() to ..._supported()
    4d91ab2d26a0 mm, hugetlb: move the error handle logic out of normal code path
    49ea68f6eb8b hugetlb: add support for gigantic page allocation at runtime
    78dcff916fdf hugetlb: move helpers up in the file
    07b911e0a765 hugetlb: update_and_free_page(): don't clear PG_reserved bit
    d38ffe086659 hugetlb: add hstate_is_gigantic()
    46b2dd4acbaa hugetlb: prep_compound_gigantic_page(): drop __init marker
    8b4da9338c22 hugetlb: ensure hugepage access is denied if hugepages are not supported
    450e7d23d98c mm/hugetlb.c: add NULL check of return value of huge_pte_offset
    370cd4423fc4 mm, hugetlb: mark some bootstrap functions as __init
    31f0f8869bc9 mm, hugetlb: improve page-fault scalability
    f57f488c939b mm, hugetlb: use vma_resv_map() map types
    3263ee955d10 mm, hugetlb: remove resv_map_put
    92067ee5ebfd mm, hugetlb: fix race in region tracking
    30e1ab0b7502 mm, hugetlb: improve, cleanup resv_map parameters
    2d5919397a7b mm, hugetlb: unify region structure handling
    a36af1327d41 Fix [RFC] cgroups: Resource controller for open files.
    7dc531576e41 cgroups: Resource controller for open files.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb   |  4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.14.bb      | 14 +++++++-------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
index 22895275ba82..11b8dd9a5c4c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.14.bb
@@ -3,8 +3,8 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-SRCREV_machine ?= "a334a20f77b8f2063d13fc87a56485f7a2fca6f4"
-SRCREV_machine_qemuppc ?= "a9c0ad109be109f00752be0cf085d6c8c8758d84"
+SRCREV_machine ?= "41b789900aa5f2626069989710603ad1b9ab010f"
+SRCREV_machine_qemuppc ?= "b4edefacfca31c880cf3a2188e92c99f69fcb97a"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},meta;name=machine,meta"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
index 9c0f133287f0..b37e07d21601 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.14.bb
@@ -8,7 +8,7 @@ LINUX_VERSION ?= "3.14.13"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
+SRCREV_machine ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.14.bb b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
index 8c40433b2562..9cf522d9b27d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.14.bb
@@ -10,13 +10,13 @@ KBRANCH_qemux86  = "standard/common-pc/base"
 KBRANCH_qemux86-64  = "standard/common-pc-64/base"
 KBRANCH_qemumips64 = "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ac43643f8f35e4f5f068a9bb8c74c88a6ed7d447"
-SRCREV_machine_qemumips ?= "a8b3d0215f52c1e7e1c241323ed393e4f4c37162"
-SRCREV_machine_qemuppc ?= "9f92eada918f43ff6c06532aaba69718c20bb189"
-SRCREV_machine_qemux86 ?= "a89b66bba2c9c77d21b8ba519981df2137a8f6e3"
-SRCREV_machine_qemux86-64 ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
-SRCREV_machine_qemumips64 ?= "862e58b06d5fdc67f7b2c636d6b5b179def5c10e"
-SRCREV_machine ?= "abf013a41ba30ca5a3dd76e96cfde36bf7f3c5fa"
+SRCREV_machine_qemuarm ?= "b712808b59883692245fc2f28defcc03cdb60dd1"
+SRCREV_machine_qemumips ?= "f5b6f121c61c72f91b25f85f19e5d410b7f66b21"
+SRCREV_machine_qemuppc ?= "047f8cacac6a0f160ea15fb9f6de6a063ddceb63"
+SRCREV_machine_qemux86 ?= "f148e056dbce4206edd68b4fbd913f2757b3a7bb"
+SRCREV_machine_qemux86-64 ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
+SRCREV_machine_qemumips64 ?= "cc1dad65948575548188866c85fae5fbd55c7e66"
+SRCREV_machine ?= "d61940e2aaeeedc43f166c9e7ac763461f380cd2"
 SRCREV_meta ?= "3eefa4379f073768df150184e9dad1ff3228a0ff"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.14.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
1.8.1.2


