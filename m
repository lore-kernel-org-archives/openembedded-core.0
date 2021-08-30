Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.13900.1630308851415211051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 00:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="197789547"
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="197789547"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:13 -0700
X-IronPort-AV: E=Sophos;i="5.84,362,1620716400"; 
   d="scan'208";a="509469248"
Received: from hongkekh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.105])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2021 00:34:12 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 2/9] openssl: upgrade from 1.1.1k to 1.1.1l
Date: Mon, 30 Aug 2021 15:33:53 +0800
Message-Id: <9b39e14809da170634ef99e611d26e6b5497e793.1630306698.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1630306698.git.anuj.mittal@intel.com>
References: <cover.1630306698.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Randy MacLeod <randy.macleod@windriver.com>

Includes fixes for:

CVE: CVE-2021-3711
CVE: CVE-2021-3712

as described by:
   https://www.openssl.org/news/secadv/20210824.txt

Ptest results on qemux86-64 with kvm:
   All tests successful.
   Files=158, Tests=2532, 93 wallclock secs \
     ( 1.31 usr  0.14 sys + 73.43 cusr 12.65 csys = 87.53 CPU)
   Result: PASS
   DURATION: 93

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1k.bb => openssl_1.1.1l.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
rename to meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
index e518cb6a02..9ea5c4c81f 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1l.bb
@@ -28,7 +28,7 @@ SRC_URI_append_riscv32 = " \
            file://0004-Fixup-support-for-io_pgetevents_time64-syscall.patch \
            "
 
-SRC_URI[sha256sum] = "892a0875b9872acd04a9fde79b1f943075d5ea162415de3047c327df33fbaee5"
+SRC_URI[sha256sum] = "0b7a3e5e59c34827fe0c3a74b7ec8baef302b98fa80088d7f9153aa16fa76bd1"
 
 inherit lib_package multilib_header multilib_script ptest
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.31.1

