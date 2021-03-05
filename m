Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: T1flUZ5QiINW6ZO4tC5LlrPu+yYhu2qyqhnGf2A16ct4giqjliXuNT2budrHsn2hl/QxTw5X1V
 DXa8zvGhj9bQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671087"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671087"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:37 -0800
IronPort-SDR: ZQ1Rrt1gpXK1mR3ybt9+c/IGnga0SFZiuQHCBdnUvWdVobfNLlMZxQe1pjXFb6puKTXjPxQ8+n
 Ph+ZdtXWVEQQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128950"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 29/52] babeltrace2: Fix reproducibility
Date: Fri,  5 Mar 2021 12:21:05 +0800
Message-Id: <aebeffdc571f998d003e097962995d3c3af153b5.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

babeltrace2-ptest was referencing the host's python version in it's
makefiles. Whilst this could be fixed, its easier to correct the
python version being found to the target one which works much
more effectively and solves the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 559f16d2fef4f8b04a9db1104b4a5b63f7876c68)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
index c65882581d..32ba75bf36 100644
--- a/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
+++ b/meta/recipes-kernel/lttng/babeltrace2_2.0.3.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>2(\.\d+)+)$"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig ptest
+inherit autotools pkgconfig ptest python3targetconfig
 
 EXTRA_OECONF = "--disable-debug-info"
 
-- 
2.29.2

