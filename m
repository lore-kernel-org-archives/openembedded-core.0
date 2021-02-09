Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by mx.groups.io with SMTP id smtpd.web09.12238.1612885998528261394
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.151, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: cr2fBSmUFTAhtn7aTqun3RpRQXvdZ5uwJ4p+pLJYORG4svPjPbLnC0Nd/1yu0C+BiLAkSTPb+R
 0yOUYZDHrTSw==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="161650491"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="161650491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:17 -0800
IronPort-SDR: 4T1WlH+hM6o3uzPxhIZXcd2/cH0yy8gfuiBgAyMhZOLMREsAYEb/m1ipyByaPeG0PDHAr1Ejpr
 xs5s3rTvwgDg==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215586"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:15 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 27/35] pseudo: Update to work with glibc 2.33
Date: Tue,  9 Feb 2021 23:52:12 +0800
Message-Id: <4a28f22f9d8a0a5329030c68d33c43683c3e7cf3.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to a pseudo version which contains some heqader fixes for
glibc 2.33.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c897ac317926b132547578b1f6bd347fe5677dfc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0ba7b50355..0072e0558b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://fallback-group \
            "
 
-SRCREV = "8317c0ab172db47dabcef909bae02cd77b1f1010"
+SRCREV = "f332f5633b5dd73fa2b6e5d605eb33e4a446d7ad"
 S = "${WORKDIR}/git"
 PV = "1.9.0+git${SRCPV}"
 
-- 
2.29.2

