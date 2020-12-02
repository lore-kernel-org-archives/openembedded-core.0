Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web12.1313.1606874354668721300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 17:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: D7jhnLUMQij14C/O/TebZWidTQjZab4SaC29AM/r5h+Ey9RWAbHeLqkhKvLvncFovnKrnMbyAk
 fEch0CbjGmoQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="152767908"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="152767908"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:59:07 -0800
IronPort-SDR: 1o5mVnAv1SlnWl73/2Rnszg0sBEhK7fj5m+kgfn0icagao+B/cafBNToOStRA2a35uhgRJ5j6k
 QkAWCNSlXoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="365070970"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga004.fm.intel.com with ESMTP; 01 Dec 2020 17:59:05 -0800
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: sangeeta jain <sangeeta.jain@intel.com>
Subject: [PATCH] meta/lib/oeqa/manual/oe-core.json: updated test test_bitbake_devshell
Date: Wed,  2 Dec 2020 09:58:50 +0800
Message-Id: <1606874330-15622-1-git-send-email-sangeeta.jain@intel.com>
X-Mailer: git-send-email 2.7.4

From: sangeeta jain <sangeeta.jain@intel.com>

updated command used for cross compilation to include ${CONFIGUREOPTS}
to ensure right arguments are passed for cross compiling on any host.

Signed-off-by: sangeeta jain <sangeeta.jain@intel.com>
---
 meta/lib/oeqa/manual/oe-core.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/manual/oe-core.json b/meta/lib/oeqa/manual/oe-core.json
index fb47c5e..4ad524d 100644
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
2.7.4

