Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.29837.1607916928036729184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5J09YJvTSLbqRS+wmjNrtJ2VTwvQ2qUYOAkhoAujs4vMSRib8Y27RFxew2ropJQ2vTQzEm56ER
 jg2FM8camBJA==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752414"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752414"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:42 -0800
IronPort-SDR: CR/3Y9nr6hHAoTk5Ucvi/Ma/G3u6L98NF3BkwaiOEeqkZkxb1Ec6LjhT8eTv5CP9J+HRJKJipS
 P9hYam0y0wiQ==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670814"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:41 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 16/19] coreutils: add SUSE-specific issues to CVE whitelist
Date: Mon, 14 Dec 2020 11:35:13 +0800
Message-Id: <b76b2b304368eaf77800fc4f957cad05169040ca.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607916826.git.anuj.mittal@intel.com>
References: <cover.1607916826.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

CVE-2013-0221 through -223 are all SUSE-specific, so add them to the
whitelist.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59f2120de3b6d53bbfb9db858ffb8b7b20c8d1ce)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/coreutils/coreutils_8.32.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index 9d1eceef54..4eb357e310 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -199,3 +199,6 @@ do_install_ptest () {
 }
 
 FILES_${PN}-ptest += "${bindir}/getlimits"
+
+# These are specific to Opensuse
+CVE_WHITELIST += "CVE-2013-0221 CVE-2013-0222 CVE-2013-0223"
-- 
2.29.2

