Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.3701.1610640599644781266
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 08:10:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SHyGShczp2394AI102LgJmdkM/cl2lMtcwI10PElqt3++KKlYQhP9RGKamU2mRm3bVcGQ8NXXt
 jHxau+14YHAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="166062637"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="166062637"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:01 -0800
IronPort-SDR: dwH0aRIlNvA2OqprXhEr9YVc3EhHM4Q0Xy7hrglxG86zhXRxd7cEha+nFcv2mB4TB+BHfz11Wd
 Yb7+dM/F2/FQ==
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="424986515"
Received: from ykoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.50])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 08:10:00 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/14] pseudo: Update to print PSEUDO_LOGFILE in abort message on path mismatches
Date: Fri, 15 Jan 2021 00:09:39 +0800
Message-Id: <f3f88700ee6e8995c264c802337f492d3447bd6a.1610639458.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610639458.git.anuj.mittal@intel.com>
References: <cover.1610639458.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9259d684415e3e7923de74359a4ed3487e0e9da7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 2e13fec540..600885b5c2 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "cca0d7f15b7197095cd587420d31b187620c3093"
+SRCREV = "69f205c41902e17933b81b1450636848e8da2126"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

