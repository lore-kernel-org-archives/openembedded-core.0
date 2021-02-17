Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.3969.1613541137571349163
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: fuuAN3PzOzghtNhGDrbviUZsIBM47uhRALa+TlH6z8AHne9dd80eMSJZ5ZKrdA+0AdFHW/cI/G
 kIXrI8WU4OEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247051"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247051"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:16 -0800
IronPort-SDR: FTjDmIer4pfy8GcwiBviteJ9itO/noD4pyaJvZqXpvnD0FJpYgCbBkzgXUtpfuts6JEMZW/+Fs
 XpkQhjOg5kbg==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825384"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/27] git: upgrade 2.30.0 -> 2.30.1
Date: Wed, 17 Feb 2021 13:51:44 +0800
Message-Id: <20210217055210.22019-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/git/{git_2.30.0.bb => git_2.30.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.30.0.bb => git_2.30.1.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.30.0.bb b/meta/recipes-devtools/git/git_2.30.1.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.30.0.bb
rename to meta/recipes-devtools/git/git_2.30.1.bb
index 93f8ed298b..bc1635ada9 100644
--- a/meta/recipes-devtools/git/git_2.30.0.bb
+++ b/meta/recipes-devtools/git/git_2.30.1.bb
@@ -5,5 +5,5 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "d24c4fa2a658318c2e66e25ab67cc30038a35696d2d39e6b12ceccf024de1e5e"
-SRC_URI[manpages.sha256sum] = "e23035ae232c9a5eda57db258bc3b7f1c1060cfd66920f92c7d388b6439773a6"
+SRC_URI[tarball.sha256sum] = "23a3e53f0d2dd3e62a8147b24a1a91d6ffe95b92123ef4dbae04e9a6205e71c0"
+SRC_URI[manpages.sha256sum] = "db323e1b242e9d0337363b1e538c8b879e4c46eedbf94d3bee9e65dab6d49138"
-- 
2.29.2

