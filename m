Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.10233.1608736733177759099
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:07 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3+Jrmwslog54KV3PgqJfVhNPfFb+TNKXgm4DbqSh8uDtaRAGI2+HW0uy1JNyAXyWB73vR16idC
 HIrM45iIT6+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236015"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236015"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:07 -0800
IronPort-SDR: IorESZhQTDZwBihEAQLu+BL7sIYjpzV4Ew4I2rgc/Sc4rgsIwgD16hiZ7kILaLIPXAXqhVuAhJ
 ziUAOXELLt+A==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027548"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:06 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/35] linux-yocto-rt/5.4: update to -rt44
Date: Wed, 23 Dec 2020 23:18:21 +0800
Message-Id: <043d6b0910f378b04185615e851647ebedc439aa.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s):

    375e7ee20260 Linux 5.4.78-rt44
    c948a34d2755 Linux 5.4.77-rt43
    8189406f8f2b Linux 5.4.74-rt42
    0856261877e2 timers: Don't block on ->expiry_lock for TIMER_IRQSAFE
    416edb155e5d ptrace: fix ptrace_unfreeze_traced() race with rt-lock
    6bd85935ab11 mm/memcontrol: Disable preemption in __mod_memcg_lruvec_state()
    57ada856a2a8 net: Properly annotate the try-lock for the seqlock
    1c80ecf69d2d Linux 5.4.74-rt41
    d4318c110dc6 Linux 5.4.70-rt40
    bdfc6168388d Linux 5.4.69-rt39
    b6e0ef250594 Linux 5.4.66-rt38
    151876f794fc Linux 5.4.61-rt37
    4bdac3f47b53 Linux 5.4.59-rt36
    cf9b41798238 Linux 5.4.58-rt35
    631b98ae597b Linux 5.4.55-rt34
    77d701a69ebb Linux 5.4.54-rt33
    130cf1b82691 rwsem: Provide down_read_non_owner() and up_read_non_owner() for -RT
    6ab4141069fc net: phy: fixed_phy: Remove unused seqcount
    291d163db65a Bluetooth: Acquire sk_lock.slock without disabling interrupts
    4c9f5d78fed4 workqueue: Sync with upstream

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfae903dd2538d57cc75e3b8b731515deb7f5526)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 104ada2db5..893388ac6b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "97576fb7447efba82eb025bde3ae9ceb29939d5e"
+SRCREV_machine ?= "375e7ee20260d4448761605ae55b5cc50e38d516"
 SRCREV_meta ?= "d626f9108d590d41e82b97cbffc380aa699e86e1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.29.2

