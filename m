Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99764600B3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 15:59:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMFx3Hn017274
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 22 Nov 2016 07:59:03 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 22 Nov 2016 07:59:03 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 22 Nov 2016 10:58:55 -0500
Message-ID: <4ef9d9c8123a6559d77e938b5fee8da17d5f754c.1479830169.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1479830169.git.bruce.ashfield@windriver.com>
References: <cover.1479830169.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/4.8: update to v4.8.6-rt5
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
X-List-Received-Date: Tue, 22 Nov 2016 15:59:02 -0000
Content-Type: text/plain

Paul Gortmaker sent along updates to the latest 4.8 -rt version.
Updating the SRCREVs to include the following commits:

   f83a3d4a643b v4.8.6-rt5
   74c7ffc2e3f2 NFSv4: don't disable preemption on !RT
   9711dc408890 kbuild: Add -fno-pie to KBUILD_AFLAGS:
   7b4d4278e307 v4.8.6-rt4
   24aa22031f3c v4.8.2-rt3
   8541163464e2 kbuild: add -fno-PIE
   81b61ced2d45 NFSv4: replace seqcount_t with a seqlock_t
   a8300ce29d0c worqueue: document the proper argument
   9711591ebdc3 genirq: document swork member
   1aace69fd88f rbtree: include barrier.h
   74d4589809f2 rxrpc: remove unused static variables
   a941e2f0611c x86/apic: get rid of "warning: 'acpi_ioapic_lock' defined but not used"
   9888d1c2e3ab hotplug: Call mmdrop_delayed() in sched_cpu_dying() if PREEMPT_RT_FULL
   debf0ec42b2e drivers/zram: Don't disable preemption in zcomp_stream_get/put()
   c84b472ee376 mm/zs_malloc: Fix bit spinlock replacement
   c17de80bfeba zsmalloc: turn that get_cpu_light() into a local_lock()
   33586701e8ad connector/cn_proc: Protect send_msg() with a local lock on RT
   b20867d36bcd ftrace: Fix trace header alignment

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index e70523a30784..a03ea3782b3e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ab1036645c083ebb30fee3eab591b0c3b5040ebb"
-SRCREV_meta ?= "d7a58814eee97e7bf410e418ad087a1f7bb05ab9"
+SRCREV_machine ?= "c3376689934aaf58b78cf7dd19af260a5386619e"
+SRCREV_meta ?= "860c23564d26e750f6c0a57a33580f316a10e19a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
-- 
2.5.0


