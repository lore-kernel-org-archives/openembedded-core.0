Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.4031.1613541139240922185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 21:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: hbuQVucUod/yvbx1Fz2vFXGKj55rH6gCG+6wq33k3Pf5ocOkage9+2xgoGpSMEABom1UmcJuKJ
 JDPHwhU27BAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="162247197"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="162247197"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:48 -0800
IronPort-SDR: 7di1oArzhEKiJZhZjsnco3QTvJSvVgsf9JLuZmRB40+i6+qyFMuZtt1FFNz9trf3HnQIxKyOYj
 v52OAkzWJMbA==
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; 
   d="scan'208";a="399825468"
Received: from rjangidx-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.185.188])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 21:52:47 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 24/27] lighttpd: upgrade 1.4.58 -> 1.4.59
Date: Wed, 17 Feb 2021 13:52:07 +0800
Message-Id: <20210217055210.22019-24-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210217055210.22019-1-anuj.mittal@intel.com>
References: <20210217055210.22019-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../lighttpd/{lighttpd_1.4.58.bb => lighttpd_1.4.59.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.58.bb => lighttpd_1.4.59.bb} (97%)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
similarity index 97%
rename from meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
rename to meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
index f0589e94c0..705ece8e19 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.58.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.59.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://0001-Use-pkg-config-for-pcre-dependency-instead-of-config.patch \
         "
 
-SRC_URI[sha256sum] = "267feffda13a190ebdce7b15172d8be16da98008457f30fddecd72832d126d0e"
+SRC_URI[sha256sum] = "fb953db273daef08edb6e202556cae8a3d07eed6081c96bd9903db957d1084d5"
 
 PACKAGECONFIG ??= "openssl pcre zlib \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
-- 
2.29.2

