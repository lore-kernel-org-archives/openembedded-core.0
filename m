Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: MljvlUX8pwQoBTccQ1V9XmTaTUYnfxgFAQX+WW4tLfPvBAiuUES2l5DDZaQ0h2OWj7h5qabmeq
 YrkbGTZuVOVw==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211576"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:45 -0700
IronPort-SDR: hRfrTX7ghfOOZxQkZOqxeqTZtcUHBCunuW2WdDzPAr2j+1hlq3kUCWkYA15+3bZcl2pVrmy+bc
 5zyR4Ulql0mw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295127"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 04/25] local.conf.sample: fix typo
Date: Mon, 22 Mar 2021 09:41:06 +0800
Message-Id: <f85772cd4387894d1123f7a28b65d1e907fca1fe.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ulrich Ölmann <u.oelmann@pengutronix.de>

Signed-off-by: Ulrich Ölmann <u.oelmann@pengutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6413f56a19417fe9d2aaa0f3dba4fd12c41b98c4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/conf/local.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 22d43b20d4..985bab19f8 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -185,7 +185,7 @@ BB_DISKMON_DIRS ??= "\
 #
 # Shared-state files from other locations
 #
-# As mentioned above, shared state files are prebuilt cache data objects which can
+# As mentioned above, shared state files are prebuilt cache data objects which can be
 # used to accelerate build time. This variable can be used to configure the system
 # to search other mirror locations for these objects before it builds the data itself.
 #
-- 
2.30.2

