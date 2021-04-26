Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: lzZHCKMT7RRRBRuEiaFfo1BrqyJqHrRc+KG+AL1k9OuAoDoE+QrM7cQ8RJZUYcK+f/FQTxxVUI
 y9WrjeA7FdPw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818246"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818246"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:55 -0700
IronPort-SDR: s32rbKIRjTymIxx+tOKyv/nO42TH6t9K/artZGhXO+D/iO2zC/ewzeEqKtRiOWKDxOUvmxLDlX
 u8E3nbuMdDcQ==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067478"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 43/64] packagegroup-core-tools-profile: Remove valgrind for riscv32
Date: Mon, 26 Apr 2021 08:53:14 +0800
Message-Id: <aeb9a929ef34e61820916227358061e9b0ef9724.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

valgrind is not yet ported to riscv32.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit df70bc4c60838af1dd7e7f31aba43e8d190def77)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index b8e2c718e6..194dca76d0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -57,6 +57,7 @@ VALGRIND_armv6 = ""
 VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
 VALGRIND_riscv64 = ""
+VALGRIND_riscv32 = ""
 VALGRIND_powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', '', 'valgrind', d)}"
 VALGRIND_linux-gnux32 = ""
 VALGRIND_linux-gnun32 = ""
-- 
2.30.2

