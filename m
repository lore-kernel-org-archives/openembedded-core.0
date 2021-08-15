Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.12642.1629043015755868597
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10077"; a="276780167"
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="276780167"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:59 -0700
X-IronPort-AV: E=Sophos;i="5.84,322,1620716400"; 
   d="scan'208";a="461820021"
Received: from fwang8-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.132.228])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2021 08:56:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 5/7] gnutls: Enable seccomp if FEATURE is set
Date: Sun, 15 Aug 2021 23:56:44 +0800
Message-Id: <f6046bc92c2e86f3cfa4bcb42091b4407aa31a09.1629041998.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629041998.git.anuj.mittal@intel.com>
References: <cover.1629041998.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f2527b5567252c7da4fbd863e119c8114e6debcd)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.1.bb b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
index 51d472c828..3e1958c969 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.1.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.1.bb
@@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "3777d7963eca5e06eb315686163b7b3f5045e2baac5e54e038ace9835e
 
 inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
 
-PACKAGECONFIG ??= "libidn"
+PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
 
 # You must also have CONFIG_SECCOMP enabled in the kernel for
 # seccomp to work.
-- 
2.31.1

