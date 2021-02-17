Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 0m38CoJOI/7QUUNkBinCDQQgmK4a1GPKE7MUys8EnKRAuYS7anktlKLAXf/SzZMSja9j0g4Nw2
 xIQxibqISWUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247106"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:28 -0800
IronPort-SDR: VNEyrLzv1vxp/3OIk7wv19OAP/YFGR0upqiqW1dpYMd69VaO/8PmrJ3/6BPae3Z8dZaeCRoh1M
 RyfC7mxvYlsg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825417"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/27] piglit: upgrade to latest revision
Date: Wed, 17 Feb 2021 13:51:53 +0800
Message-Id: <20210217055210.22019-10-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-graphics/piglit/piglit_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 484b59df00..52c39fd681 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d3a6e1293c43a6d989d4bcd59132317195d420c6"
+SRCREV = "d4d9353b7290ed22cb7349226a8e4017402d3f02"
 # (when PV goes above 1.0 remove the trailing r)
 PV = "1.0+gitr${SRCPV}"
 
-- 
2.29.2

