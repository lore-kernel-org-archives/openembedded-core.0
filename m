Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: VP3fJuuQh0DgcM4Kg5ncBWUz4nnwxFFbXLLYYDGr00XXfZn1b7onmPKiO/qg3cTzZJY+vUMsFg
 NV6W2/4i2IZQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247066"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247066"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:21 -0800
IronPort-SDR: Ojp0wBB0LdiCrmPRsgcMNOKjskbffYLUtyncHFQw3E3DuB+RYHo4vd1HDwDP3+2+KS525PJM7x
 RVY5oHWMs5XA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825388"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/27] stress-ng: upgrade 0.12.02 -> 0.12.03
Date: Wed, 17 Feb 2021 13:51:48 +0800
Message-Id: <20210217055210.22019-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../stress-ng/{stress-ng_0.12.02.bb => stress-ng_0.12.03.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.12.02.bb => stress-ng_0.12.03.bb} (90%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb b/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
similarity index 90%
rename from meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
index a5851b43f2..73539c9268 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.12.02.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.12.03.bb
@@ -9,7 +9,7 @@ SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
            file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
            file://no_daddr_t.patch \
            "
-SRC_URI[sha256sum] = "f847be115f60d3ad7d37c806fd1bfb1412aa3c631fca581d6dc233322f50d6a5"
+SRC_URI[sha256sum] = "f27ff439b76a17641291d4234c73655cddcb0a5a588441d6ade290b06ca4b805"
 
 DEPENDS = "coreutils-native"
 
-- 
2.29.2

