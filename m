Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8237.1595926357616374658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jul 2020 01:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: aAapPY2yKa1hWu5oZxOSnnRSeAvIQLTiKKWsKjvJ/1P/h+fkfbrmxtntja39Ygtfr5XqIk+UuU
 Dhyh8oiacUYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="215699753"
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="215699753"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:14 -0700
IronPort-SDR: 60/qrMkpZ+tM+6rEE7izFa/bxPuSFIM0Mr/ue2iuE1p2igW2qn2fLMTBrZh96PpTaclMGeRvSG
 0rC96lVe2VpA==
X-IronPort-AV: E=Sophos;i="5.75,405,1589266800"; 
   d="scan'208";a="434245916"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.137.161])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 01:53:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 21/32] iso-codes: switch upstream branch master -> main
Date: Tue, 28 Jul 2020 16:51:22 +0800
Message-Id: <add9b04f0596ade188224104595406d638a6fa73.1595924916.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <cover.1595924916.git.anuj.mittal@intel.com>
References: <cover.1595924916.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongxu Jia <hongxu.jia@windriver.com>

(From OE-Core rev: 6e16ef0c2e0ec2bbb862231cd84e7650bd5789af)

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 75e91b8e52ec77398e6b0fc09456e971662d9d7e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/iso-codes/iso-codes_4.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/iso-codes/iso-codes_4.3.bb b/meta/recipes-support/iso-codes/iso-codes_4.3.bb
index 5651a96c66..566c147690 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.3.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.3.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "https://salsa.debian.org/iso-codes-team/iso-codes/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http"
+SRC_URI = "git://salsa.debian.org/iso-codes-team/iso-codes.git;protocol=http;branch=main;"
 SRCREV = "43398a317371e309361ce43072603863cb2f57e1"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
-- 
2.25.4

