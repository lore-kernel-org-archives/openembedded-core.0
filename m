Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.909.1619398455294766979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.115, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YUP8fy2UC7QmuI2kDm89+l6+Rb/UUD8fMXTGsGUrU3i9TSvI8EKhMqxYJyCnBwjpAU/BapndYq
 rbVIjTBWKVgg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818066"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:15 -0700
IronPort-SDR: AuyidsOEyDeanVkXh2Yr/VCugmtvYTlrRWjQw2earAxBe4dF064hDQAbwV7+iTBAMooJyXjZGf
 /JiCa2HCJBSQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067289"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/64] linux-yocto-rt/5.10: update to -rt34
Date: Mon, 26 Apr 2021 08:52:45 +0800
Message-Id: <a55ddf4892af79b900a1f5adf0a95f39023a878d.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/5.10:

    ac98a75ef2bc net/xfrm: fixup 5.10.30 -stable merge

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2e7dd8afd0dbe7803170006297309b6699b98f34)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index b22eb94e41..20faff811a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,7 +11,7 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "60ca2b8c07383a2d46fef1b668e34dff90c1b404"
+SRCREV_machine ?= "ac98a75ef2bc550f67454bd738ede581c8846ff3"
 SRCREV_meta ?= "b7125842b7ce188e7846a49fcb15a71c54806d6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
-- 
2.30.2

