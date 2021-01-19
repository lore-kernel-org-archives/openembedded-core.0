Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.8244.1611038799087798389
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 22:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: bR3hoDJ76AUmz9s113XMpG18WHfwCJkWJICfIiQBsvx3Rtedbe/bihOGafZ3mYNkNspJCgN1ML
 LqDR9446dvBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9868"; a="179035653"
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="179035653"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:27 -0800
IronPort-SDR: tIh1jvMuWW/J9YOQMPSS0i9dMzcyI5ZobuuuaV62CshTyHToBCY3fQc3jqT0yOM/8f8e3qq3lE
 aZQHDlPPEdgw==
X-IronPort-AV: E=Sophos;i="5.79,358,1602572400"; 
   d="scan'208";a="355441816"
Received: from jchen110-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.183.94])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 22:46:25 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 23/30] python3-pygments: upgrade 2.7.3 -> 2.7.4
Date: Tue, 19 Jan 2021 14:45:45 +0800
Message-Id: <20210119064552.115692-23-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210119064552.115692-1-anuj.mittal@intel.com>
References: <20210119064552.115692-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: change in copyright years

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{python3-pygments_2.7.3.bb => python3-pygments_2.7.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pygments_2.7.3.bb => python3-pygments_2.7.4.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pygments_2.7.3.bb b/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pygments_2.7.3.bb
rename to meta/recipes-devtools/python/python3-pygments_2.7.4.bb
index 379d85dbd7..24bbaaf38c 100644
--- a/meta/recipes-devtools/python/python3-pygments_2.7.3.bb
+++ b/meta/recipes-devtools/python/python3-pygments_2.7.4.bb
@@ -2,10 +2,10 @@ SUMMARY = "Pygments is a syntax highlighting package written in Python."
 DESCRIPTION = "Pygments is a syntax highlighting package written in Python."
 HOMEPAGE = "http://pygments.org/"
 LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=1f5d0c4cf38dfc8122c00d6f1a97a0cc"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=98419e351433ac106a24e3ad435930bc"
 
 inherit setuptools3
-SRC_URI[sha256sum] = "ccf3acacf3782cbed4a989426012f1c535c9a90d3a7fc3f16d231b9372d2b716"
+SRC_URI[sha256sum] = "df49d09b498e83c1a73128295860250b0b7edd4c723a32e9bc0d295c7c2ec337"
 
 DEPENDS += "\
             ${PYTHON_PN} \
-- 
2.29.2

