Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.60233.1597726421182640826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 21:53:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2/kf/Vk6NWM0hiaUhAVEC+j8s6s66WKjwUduAx/WLKq8VLi2mwKAILF+TF+dBirEgBkggZT8ZU
 urbIzUwPDC7g==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152249967"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="152249967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:44 -0700
IronPort-SDR: q5fAVI5dVdtIKk74TkDCe4IAu4c3UHqFqOlS9N0fL+Sdi9YclSCgA0l0FKp9fzU2fKCdmw4acS
 zqckcAeiadxw==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="319960846"
Received: from ychiew-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.25])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] x264: upgrade to latest revision
Date: Tue, 18 Aug 2020 12:53:34 +0800
Message-Id: <20200818045334.121647-4-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818045334.121647-1-anuj.mittal@intel.com>
References: <20200818045334.121647-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 1ff5348b9e..f226fec3c4 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -14,9 +14,9 @@ SRC_URI = "git://github.com/mirror/x264;branch=stable \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRCREV = "296494a4011f58f32adc54304a2654627558c59a"
+SRCREV = "cde9a93319bea766a92e306d69059c76de970190"
 
-PV = "r2991+git${SRCPV}"
+PV = "r3011+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.26.2

