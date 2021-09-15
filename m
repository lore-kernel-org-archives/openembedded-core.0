Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565547"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565547"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:16:00 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597322"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:59 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 09/17] tcl: Exclude CVE-2021-35331 from checks
Date: Thu, 16 Sep 2021 07:15:33 +0800
Message-Id: <d0ff86bccdbcd91e8760001037168043725ef8f4.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream don't believe this is an issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit adf7bafee3f8884e525b5639ba092a1cd8e3beb9)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index efb36b32dd..a993d7c959 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -30,6 +30,9 @@ SRC_URI[sha256sum] = "8c0486668586672c5693d7d95817cb05a18c5ecca2f40e2836b9578064
 SRC_URI_class-native = "${BASE_SRC_URI}"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
+# Upstream don't believe this is an exploitable issue
+# https://core.tcl-lang.org/tcl/info/7079e4f91601e9c7
+CVE_CHECK_WHITELIST += "CVE-2021-35331"
 
 PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${BPN}${PV}"
 VER = "${PV}"
-- 
2.31.1

