Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: jKTXEULH6+Z4wKMpvIep6uVYE3UqKcAnZKhG9/8xFfgxWimSWPphhxNvubB1SxJkOCinz3MMRH
 11szsvLOY7Ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247085"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247085"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:24 -0800
IronPort-SDR: +W8qmubSwlDZn0HncLUgisPOBienJUZxSmuzcCU0WUC7KLp06o5wyzCtFGg2HkMGd5v5BB0GTj
 BeQuGTnkaNEQ==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825401"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:23 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/27] x264: upgrade to latest revision
Date: Wed, 17 Feb 2021 13:51:50 +0800
Message-Id: <20210217055210.22019-7-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 25ab72c66d..f95fb0c41e 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,9 +14,9 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "d198931a63049db1f2c92d96c34904c69fde8117"
+SRCREV = "544c61f082194728d0391fb280a6e138ba320a96"
 
-PV = "r3011+git${SRCPV}"
+PV = "r3039+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.29.2

