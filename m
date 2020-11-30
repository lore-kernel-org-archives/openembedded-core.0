Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.53737.1606698751849314392
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 17:12:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TopfueFShfZuh4oQ8meW0dCZ9jfCkfoyBHl1+u+wTixIuSxZKEkAlMs1oEqRyXsrIgsnlD3B2M
 JAnjsyU62H6g==
X-IronPort-AV: E=McAfee;i="6000,8403,9820"; a="170004445"
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="170004445"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:22 -0800
IronPort-SDR: 6J295oewcLyHwVDPS17Qjhz0pU3XJ8dmpGt3vbDmSUbaEBY4ayLpiedkpm6mfBEK8qWfP9YLSO
 NNPmzrd4xNMw==
X-IronPort-AV: E=Sophos;i="5.78,379,1599548400"; 
   d="scan'208";a="372302737"
Received: from ajraj-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.114.166])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2020 17:12:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 19/21] distutils-common-base: fix LINKSHARED expansion
Date: Mon, 30 Nov 2020 09:11:34 +0800
Message-Id: <26bd176e221789e9592d71e8c469eb40f506029a.1606698421.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606698421.git.anuj.mittal@intel.com>
References: <cover.1606698421.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing $ so SECURITY_CFLAGS actually gets expanded.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6ed2f892ebb0b4e30a3bf167eac68027ea378a2d)
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

