Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.12227.1612886002393736054
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:53:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: OPzTtr6paQjtsJh+Ik7ovitpOSNdg/HvEOYpLTxzlVz/VwgLqZC/i16mfS/+ZijohyqMgbSDMV
 uuLdJAm4G91A==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="182045274"
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="182045274"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:27 -0800
IronPort-SDR: w2S/GbdmBPbb3XTKo1VGWCjRoi2Ffl7nYoSay3RNXIzGGXyK+DrMgrvuC20ukRPhnxbsqqZk7X
 hzFi34NBFQgQ==
X-IronPort-AV: E=Sophos;i="5.81,165,1610438400"; 
   d="scan'208";a="359215668"
Received: from ytee-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.146.52])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2021 07:53:26 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 34/35] gpgme: use python3targetconfig
Date: Tue,  9 Feb 2021 23:52:19 +0800
Message-Id: <61a2aa03498fb734641b06654c369b80f1012eec.1612885583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1612885583.git.anuj.mittal@intel.com>
References: <cover.1612885583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 375d13fcb362b48e57ba8851b03f2b72dd44da11)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/gpgme/gpgme_1.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.14.0.bb b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
index 9fa8212808..fb7215381c 100644
--- a/meta/recipes-support/gpgme/gpgme_1.14.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.14.0.bb
@@ -48,7 +48,7 @@ DEFAULT_LANGUAGES_class-target = "cpp"
 LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
-PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
-- 
2.29.2

