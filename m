Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.3788.1623383460306890520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jun 2021 20:51:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: LLnHkUDzudJwWE8qV8qCeTYee+7Z8yuBhEQARWvctxYuxljz7BWcsJvsopPC4VGWvvL7P0bFye
 6p+EmpwrmN5g==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="192565997"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="192565997"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:58 -0700
IronPort-SDR: V2ofozbowyawD9egzPxCvN31D4tAaoDKw+e9BRa4IV+cbKHwL1sJavPfyokAJvbOKKgw9cyLdd
 9BfzR1YB0+hg==
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="403091588"
Received: from dlau-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.151.154])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 20:50:57 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/17] valgrind: fix a typo
Date: Fri, 11 Jun 2021 11:50:35 +0800
Message-Id: <d68c62bb93ab400878aecc42ee06df103356a2bf.1623383318.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1623383318.git.anuj.mittal@intel.com>
References: <cover.1623383318.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0478d9b04d6a6d10e439116b23b641a1e2553e26)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
index 2b1d185575..3493745828 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
@@ -123,7 +123,7 @@ VALGRINDARCH_mipsel = "mips32"
 VALGRINDARCH_mips64el = "mips64"
 VALGRINDARCH_powerpc = "ppc"
 VALGRINDARCH_powerpc64 = "ppc64"
-VALGRINDARCH_powerpc64el = "ppc64le"
+VALGRINDARCH_powerpc64le = "ppc64le"
 
 INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/valgrind/vgpreload_memcheck-${VALGRINDARCH}-linux.so"
 
-- 
2.31.1

