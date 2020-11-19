Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web12.3607.1605752259129788335
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 18:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TrPdsWegPVZzhL9uscEadR3dgrMgfDLvMSDVrQC7NuO66qnLHEHUYvU43IvyV3G5b3x499WfYK
 LdpbYxDtuS9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="255929299"
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="255929299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 18:17:37 -0800
IronPort-SDR: WajP99UCReGzu+jcua9kk3Owaqay7j1sdR67TihLksYoKmG+utZOfw8zJLbPUBbZUckHlIC+C6
 gcLtcieXWeaQ==
X-IronPort-AV: E=Sophos;i="5.77,489,1596524400"; 
   d="scan'208";a="310891504"
Received: from baizasni-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.149.79])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2020 18:17:36 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] distutils-common-base: fix LINKSHARED expansion
Date: Thu, 19 Nov 2020 10:17:32 +0800
Message-Id: <20201119021732.7426-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing $ so SECURITY_CFLAGS actually gets expanded.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/distutils-common-base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
index 94b5fd426d..43a38e5a3a 100644
--- a/meta/classes/distutils-common-base.bbclass
+++ b/meta/classes/distutils-common-base.bbclass
@@ -11,7 +11,7 @@ export LDCXXSHARED  = "${CXX} -shared"
 export CCSHARED  = "-fPIC -DPIC"
 # LINKFORSHARED are the flags passed to the $(CC) command that links
 # the python executable
-export LINKFORSHARED = "{SECURITY_CFLAGS} -Xlinker -export-dynamic"
+export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
 
 FILES_${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
-- 
2.28.0

