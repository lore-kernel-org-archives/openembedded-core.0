Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.60233.1597726421182640826
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 21:53:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: HfCaI4BRQnVCvvaQFjqH/S6QtCAfuAZ/e/wzAldfqucJUfl0LR61h6oVKQCXEwq4/SnQy8Z9QY
 RIWWbm/7T9+w==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="152249959"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="152249959"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:42 -0700
IronPort-SDR: +/236+/W4oF2O4bF2iqgdE4vkyTVyK1aqBoE56HLlvhVuIFrJyAYeWVesz05C/Sxg9zXauOXjQ
 NbHmRtpNE1NA==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="319960841"
Received: from ychiew-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.25])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2020 21:53:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] stress-ng: upgrade 0.11.17 -> 0.11.18
Date: Tue, 18 Aug 2020 12:53:33 +0800
Message-Id: <20200818045334.121647-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200818045334.121647-1-anuj.mittal@intel.com>
References: <20200818045334.121647-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.11.17.bb => stress-ng_0.11.18.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.11.17.bb => stress-ng_0.11.18.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb b/meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb
index a67df24dca..c668d8cbde 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.11.17.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.11.18.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "860291dd3a18b985b3483190a627bbede2b5c52113766c1921001b3fb4b83af0"
+SRC_URI[sha256sum] = "07c82a5c89538b5b696a79192faa70d0232352004c9e532946f7f3613d0adf23"
 
 DEPENDS = "coreutils-native"
 
-- 
2.26.2

