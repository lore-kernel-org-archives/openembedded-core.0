Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.36807.1614009685491576194
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: aM98emnhQTVkRbkTML+ngPNfLxt91RTuEmVz8L3EO56m4+AqfrxWowMc4htCe5gC08QEJCCNJS
 d+/4NvZe2v3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706173"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706173"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:18 -0800
IronPort-SDR: apBJbMGqma3fGfr1X5BKthJ8WfwK9YbzdqbxJpnzWlnul6xixciloucKZuYyD+CG+FtTn2Te4M
 QWIIf1v2ZnOQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302103"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:16 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 26/30] xmlto: Fix reproducibility
Date: Tue, 23 Feb 2021 00:00:29 +0800
Message-Id: <efbe26600076c4fe2df1f45ce3cfc20c379bdd26.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Don't hardcode the host's grep path into xmlto.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a7d78971df193c321c309481749fc30cae77788c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 7d27c43c83..5ed2709e31 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -29,7 +29,7 @@ RDEPENDS_${PN}_append_class-target = " \
                   libxslt-bin \
                   coreutils \
 "
-CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail"
+CACHED_CONFIGUREVARS += "ac_cv_path_TAIL=tail ac_cv_path_GREP=grep"
 
 BBCLASSEXTEND = "native"
 
-- 
2.29.2

