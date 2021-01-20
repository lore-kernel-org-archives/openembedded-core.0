Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.24792.1611128477823315504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 23:41:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 3U5Qe96Nj2l7qSInXhh5zntACeFoxMHKXIJbThZQwOicf9V0d+iAcFjasfJLrMKy44nrbUXkRQ
 qKvNBgYt+rGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9869"; a="158240474"
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="158240474"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:26 -0800
IronPort-SDR: FKQOJn3lKGaQ6Yvfgqgp7lhy78Hz02Oz5slW0DJxH4rXVVuRPRiIhHjxH2hFl2yu4iGqBQYZ7t
 yeLeYLju8gBA==
X-IronPort-AV: E=Sophos;i="5.79,360,1602572400"; 
   d="scan'208";a="350958531"
Received: from mrengasa-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.144.190])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2021 23:41:24 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] git: upgrade 2.29.2 -> 2.30.0
Date: Wed, 20 Jan 2021 15:40:56 +0800
Message-Id: <20210120074058.252462-8-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120074058.252462-1-anuj.mittal@intel.com>
References: <20210120074058.252462-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.29.2.bb => git_2.30.0.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.29.2.bb b/meta/recipes-devtools/git/git_2.30.0.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.29.2.bb
rename to meta/recipes-devtools/git/git_2.30.0.bb
index 6433a2e2b7..93f8ed298b 100644
--- a/meta/recipes-devtools/git/git_2.29.2.bb
+++ b/meta/recipes-devtools/git/git_2.30.0.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "869a121e1d75e4c28213df03d204156a17f02fce2dc77be9795b327830f54195"
-SRC_URI[manpages.sha256sum] = "68b258e6d590cb78e02c0df741bbaeab94cbbac6d25de9da4fb3882ee098307b"
+SRC_URI[tarball.sha256sum] = "d24c4fa2a658318c2e66e25ab67cc30038a35696d2d39e6b12ceccf024de1e5e"
+SRC_URI[manpages.sha256sum] = "e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6"
-- 
2.29.2

