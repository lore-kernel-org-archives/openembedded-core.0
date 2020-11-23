Received: from mga18.intel.com (mga18.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.35991.1606144018748201149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: tmcFgS9F1NkK51Jd//BssKPjN2dmIt7fVbpBk5Hru4sv1D8u5C0iejRIwNQQQKxM6CDDPiUiTH
 SBk/EYFjAcjQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="159547247"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="159547247"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:06:58 -0800
IronPort-SDR: r+U24XFJZ+5V1iGNloPb+EQNIvrp6fVeWtodMrANZyomt1IzVHGavFf6XQ6oN1+S9u03rew4qZ
 tBK0xmtXro8Q==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475083"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:06:57 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 01/21] bluez5: update to 5.55
Date: Mon, 23 Nov 2020 23:06:31 +0800
Message-Id: <6ed12979194b8fb73d6f7365128b5451e580cdba.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chee Yang Lee <chee.yang.lee@intel.com>

Release note:
https://github.com/bluez/bluez/commit/5a180f2ec9edfacafd95e5fed20d36fe8e077f07

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2895e3e4eabca64cbcc8682e72d25026df5e5f0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.54.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index 260eee1402..8190924562 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.54.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -1,7 +1,7 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e637feb2dbb7582bbbff1708367a847c"
-SRC_URI[sha256sum] = "68cdab9e63e8832b130d5979dc8c96fdb087b31278f342874d992af3e56656dc"
+SRC_URI[md5sum] = "94972b8bc7ade60c72b0ffa6ccff2c0a"
+SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e0894e9b88"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.28.0

