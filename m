Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.1397.1611246150445140456
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: R8M7ElYEwAnzlDsczdAsUDZTLXsoKOc90prD7pTePeqPspuBXsYZCQxTaoMZ9qyrntpC9N+W3b
 SJ0gKokcMbnQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="166392445"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="166392445"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:28 -0800
IronPort-SDR: hYJCJa6hyRANsD7+IDdkLgn8jVVBRfhzFCIvAjF4zGitkjOwNE1eOE5TzIgleaXaCW5NXWtBtp
 iFgM1x8mG2vw==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413662"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 09/20] lib/oe/utils: Return empty string in parallel_make
Date: Fri, 22 Jan 2021 00:21:54 +0800
Message-Id: <7ee65c50f7a38c22e3fb43b0c89e81aff24a2b7f.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>

In cmake.bbclass we set CMAKE_BUILD_PARALLEL_LEVEL using parallel_make
function and if PARALLEL_MAKE is set to empty string then this variable
is exported as "None" causing cmake to fail with:
"'CMAKE_BUILD_PARALLEL_LEVEL' environment variable
invalid number 'None' given."

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2f790ded554a52ac18d1c28002142f9c62abec8b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 468c76f30f..9a2187e36f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -193,7 +193,7 @@ def parallel_make(d, makeinst=False):
 
         return int(v)
 
-    return None
+    return ''
 
 def parallel_make_argument(d, fmt, limit=None, makeinst=False):
     """
-- 
2.29.2

