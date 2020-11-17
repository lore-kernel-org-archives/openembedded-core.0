Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 8Rd/atXCGcZgl2fMrfx8C6jUJMoJZru3zd9H4gAhLTFi6VXCNlV1qFkhV3P743fnEHC7dWflKL
 070dAm3pduHw==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158720057"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158720057"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:39 -0800
IronPort-SDR: gyaqNFPbcffW0d1FP8w66EndTtU4IjyRFqVG6sSmOK6+2mPOd+Gyw+QSZkiktNAOpKf+4OFZM3
 rvjfNl+CZ26Q==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400803031"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:38 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/19] diffstat: add nativesdk to BBCLASSEXTEND
Date: Tue, 17 Nov 2020 23:36:08 +0800
Message-Id: <1de8568a6de98111e265cdbc01e2c6c2975fffd8.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

The diffstat tool is part of HOSTTOOLS. To support hosts that do not
have it installed with buildtools-tarball it must be enabled for
nativesdk.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0ed002422bc46539f1d71ed19ee17358b6691bf0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/diffstat/diffstat_1.63.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/diffstat/diffstat_1.63.bb b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
index ee0a7e7bd6..61b2ea5dc2 100644
--- a/meta/recipes-devtools/diffstat/diffstat_1.63.bb
+++ b/meta/recipes-devtools/diffstat/diffstat_1.63.bb
@@ -27,3 +27,5 @@ LDFLAGS += "${TOOLCHAIN_OPTIONS}"
 do_install_ptest() {
 	cp -r ${S}/testing ${D}${PTEST_PATH}
 }
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.28.0

