Received: from mga11.intel.com (mga11.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 1ltKb0bfoukyWeQoT6hpcqJY6IiyxxiMWvU3Cp/y9MteuERTg0sLNuHeOGyZQhlImZkv96/rRQ
 KSsmbF2Ih4Gw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049334"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049334"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:47 -0800
IronPort-SDR: CpazSEdp4rPRaWE+2hbT/3T4IhRuHJJ3an32vBC0KQRU/0M5sfhFHLMmvfOAlTiwk7LO9ufedx
 K7zxdII53sEg==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301848"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:46 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/30] tcf-agent: Fix build on riscv32
Date: Tue, 23 Feb 2021 00:00:09 +0800
Message-Id: <1f69d289b6d7ea617cd976b40908239cdb8d3f1c.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

LCL_STOP_SERVICES needs tcf/cpudefs-mdep.h ported

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ed5e0de938469a7fa4e6cd725d9e0c8325d890d3)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index ed14fe66b1..c1b05691b8 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -48,6 +48,7 @@ CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_powerpc64le = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_riscv64 = " ${LCL_STOP_SERVICES}"
+CFLAGS_append_riscv32 = " ${LCL_STOP_SERVICES}"
 
 do_install() {
 	oe_runmake install INSTALLROOT=${D}
-- 
2.29.2

