Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: eS1aPNC8q97yNdAqK8cXPVsZXdJW9afzxFkdqp5hTLB/swpWRGnyuteRAvAxfpE95Fskol60FN
 QhBtiUeD5uuA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568929"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568929"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:23 -0700
IronPort-SDR: GVvwdOiZIw3G0o0DX8P04Kz5dwdC//me9ee0dj3D0DYgYftddEfwShNOz9B4ApphcFYus5vHrN
 lSzt1xeR7xIQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067623"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 64/64] go: Use dl.google.com for SRC_URI
Date: Mon, 26 Apr 2021 08:53:35 +0800
Message-Id: <3357bbf0dad31306d5e16ad306d3e931042eec61.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

golang.org/dl is resolving to this anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8470e38ac1d9f9bb6d8a4ee43724af452d080057)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 39a681a712..c368b95b69 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.30.2

