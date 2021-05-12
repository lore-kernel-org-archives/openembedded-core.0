Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 9ew1UEC4bmORx7mCtITqLw9taqJNZ+Ae5TgbV9ZJVhDdQTbXqu+I1JW1qcpLoy9Rb53BtxbO4Z
 B5BdzFst3sXQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917813"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917813"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:16 -0700
IronPort-SDR: EGQUHbuOsBVcjzqQQFlcKhTHFb8mkpBLV7RjwqDZ9+MkS9KLOvb4i9X4eC79icF0E6/zrtVU+5
 dndZ4RFxgukw==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645803"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:14 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/15] dejagnu: needs expect at runtime
Date: Wed, 12 May 2021 16:35:42 +0800
Message-Id: <9dc044fdbd20085dfa99fd4a7189763365334ede.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@gmail.com>

runtest return an error due to missing expect on the target.
Add expect as runtime dependency.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d9a3a08edc1efcbe7b02e80be98370792d3c6cc2)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
index 0a007bb2cd..ce242c3593 100644
--- a/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
+++ b/meta/recipes-devtools/dejagnu/dejagnu_1.6.2.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SECTION = "devel"
 
 DEPENDS += "expect-native"
+RDEPENDS_${PN} = "expect"
 
 inherit autotools
 
-- 
2.31.1

