Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web12.24726.1628523364931716435
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 08:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10070"; a="278466822"
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="278466822"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:12 -0700
X-IronPort-AV: E=Sophos;i="5.84,307,1620716400"; 
   d="scan'208";a="483462895"
Received: from abinzahx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.229.181])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2021 08:36:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 07/23] linux-yocto-rt/5.10: update to -rt47
Date: Mon,  9 Aug 2021 23:35:39 +0800
Message-Id: <358a2bc5b3d071a49fd693c3e224d75f835ebaec.1628522214.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1628522214.git.anuj.mittal@intel.com>
References: <cover.1628522214.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    969fef49cbbc Linux 5.10.52-rt47
    bb5ff998ba62 Linux 5.10.47-rt46
    340f6b6cdd37 sched: Don't defer CPU pick to migration_cpu_stop()
    f3d0be7cdae8 sched: Simplify set_affinity_pending refcounts
    6b28888ca42a sched: Fix affine_move_task() self-concurrency
    ea66e426a3b7 sched: Optimize migration_cpu_stop()
    ac73ac41db62 sched: Collate affine_move_task() stoppers
    6963e6b6e008 sched: Simplify migration_cpu_stop()
    d3a5a12fd350 sched: Fix migration_cpu_stop() requeueing
    28dda3752954 Linux 5.10.47-rt45
    d5f6c5f008ee Linux 5.10.44-rt44
    ec9978fdc6aa Linux 5.10.42-rt43

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 46b1ab616a5eb792e8cb29cfbe340fecd605bea7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 2e46d72dfa..944d171928 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e1b9700217e1dd963f9b034ffde9863abb53a92d"
+SRCREV_machine ?= "969fef49cbbc8639e9622e6a0655337fbfcc7627"
 SRCREV_meta ?= "26a2a3cf764dde593325b8c08024f5990a5f6f02"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.31.1

