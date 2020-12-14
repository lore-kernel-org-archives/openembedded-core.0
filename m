Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +cvMCKCyQIhUzJyg1kfhtc0Eop7I2Dem5gESb7Usq3lHn4rN0sBHStPIyIxsDB1v+Uzj7rkJAN
 ndKiMhrgdzAw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752389"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752389"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:35 -0800
IronPort-SDR: fKlCX6jUb6s+h8Kaf7zUXT6QxYR6dJquwHjPS1Z3BTquKFJBuUwW4u0WwH2y+nzChkdNbZ9y2W
 lRDfKS3ij6JQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670773"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:34 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 11/19] meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell
Date: Mon, 14 Dec 2020 11:35:08 +0800
Message-Id: <b1a1e936169d9db8d5de46aace9370f5e695c24d.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: sangeeta jain <sangeeta.jain@intel.com>

Update command used for cross compilation to include ${CONFIGUREOPTS}
to ensure right arguments are passed for cross compiling on any host.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e995e67bc7a3d30adf9f8d0d2f4df92a941baeae)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/manual/oe-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index fb47c5ec36..4ad524d89b 100644
--- a/meta/lib/oeqa/manual/oe-core.json
+++ b/meta/lib/oeqa/manual/oe-core.json
@@ -80,7 +80,7 @@
           "expected_results": ""
         },
         "7": {
-          "action": "Run command:./configure && make ",
+          "action": "Run command:./configure ${CONFIGUREOPTS} && make ",
           "expected_results": "Verify that \"matchbox-desktop\" binary file was created successfully under \"src/\" directory "
         },
         "8": {
-- 
2.29.2

