Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789579"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789579"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:19 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469297"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 5/9] tcf-agent: fetching over git:// no longer works
Date: Mon, 30 Aug 2021 15:33:56 +0800
Message-Id: <04caef3d9c0318c9169883650615af37aab30678.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 44a6cd03721b51cbb4e05870375fa347527b0db5)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 854269a0fa..a143b09656 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "a022ef2f1acfd9209a1bf792dda14ae4b0d1b60f"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/gitroot/tcf/org.eclipse.tcf.agent \
+SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https \
            file://fix_ranlib.patch \
            file://ldflags.patch \
            file://tcf-agent.init \
-- 
2.31.1

