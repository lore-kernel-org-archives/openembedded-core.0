Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web11.9653.1589194625613061595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 03:57:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: m4bQ66qqxiUk+EY3GZjLFEuyeYAFCkmsvSxs4FksU8h1dAFjsH428O9gL01JIIfK34JvDGvlu0
 lyqfEzmyg5qw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 03:57:04 -0700
IronPort-SDR: FDt9mUfSE1B2uDurc3nmZTJ30jO92BilRA8sYuS1iQ2gjMhPC262JTg8sALqIgwnirdcVk/MTM
 XJd1AxH6U/VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,379,1583222400"; 
   d="scan'208";a="306147310"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2020 03:57:04 -0700
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bison: fix Argument list too long error
Date: Mon, 11 May 2020 18:57:02 +0800
Message-Id: <1589194622-40563-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4

From: Lee Chee Yang <chee.yang.lee@intel.com>

fix Argument list too long error when len(TMPDIR) = 410

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/bison/bison_3.5.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/bison/bison_3.5.4.bb b/meta/recipes-devtools/bison/bison_3.5.4.bb
index 59c34f7..e78afb6 100644
--- a/meta/recipes-devtools/bison/bison_3.5.4.bb
+++ b/meta/recipes-devtools/bison/bison_3.5.4.bb
@@ -27,7 +27,7 @@ EXTRA_OEMAKE_append = " -l"
 inherit autotools gettext texinfo
 
 # The automatic m4 path detection gets confused, so force the right value
-acpaths = "-I ${S}/m4"
+acpaths = "-I ./m4"
 
 do_compile_prepend() {
 	for i in mfcalc calc++ rpcalc; do mkdir -p ${B}/examples/$i; done
-- 
2.7.4

