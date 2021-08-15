Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780172"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780172"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:57:01 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820027"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:57:00 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 7/7] gnutls: upgrade 3.7.1 -> 3.7.2
Date: Sun, 15 Aug 2021 23:56:46 +0800
Message-Id: <01321ed982a8553672808afe2d9c1bee6628055d.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3593a4c47d5e8faccb27c7cd975f18f90b9cd86f)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnutls/{gnutls_3.7.1.bb => gnutls_3.7.2.bb} (96%)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
similarity index 96%
rename from meta/recipes-support/gnutls/gnutls_3.7.1.bb
rename to meta/recipes-support/gnutls/gnutls_3.7.2.bb
index 350d0a018b..430d1f2d7d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.2.bb
@@ -23,7 +23,7 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://arm_eabi.patch \
            "
 
-SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e5cac6f"
+SRC_URI[sha256sum] = "646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752"
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-- 
2.31.1

