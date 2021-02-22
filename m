Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.36802.1614009670915969052
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:01:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: kZQijYnScJ1gsAcyit1qP8nxCnn5jEGyWeAPxwD9p6Ymx7m+aa214crOgNok7TF5uoGdg9L70h
 MkHy2G5KyEoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="163706075"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163706075"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:12 -0800
IronPort-SDR: Pi2/orT0p0JwjbRXZG77rCWuAUQYAECWOy7Odj9dzUcgMpVoUHE5/crjuZsgIEAra6w2mWJ6eU
 8ERkyBvnrEaw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430302056"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:01:11 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 22/30] oeqa: reproducible: Fix SSTATE_MIRRORS variable
Date: Tue, 23 Feb 2021 00:00:25 +0800
Message-Id: <99fc5a5847b82620904a0e120d92cad6bb79021a.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614009417.git.anuj.mittal@intel.com>
References: <cover.1614009417.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joshua Watt <JPEWhacker@gmail.com>

The SSTATE_MIRRORS variable was misspelled, which allowed the "clean"
test build to pull from the mirror.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e42497bd84d0bb370a9f7b0448bff29f01fd1b0c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a7ef336143..2d675f1771 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -184,7 +184,7 @@ class ReproducibleTests(OESelftestTestCase):
             # mirror, forcing a complete build from scratch
             config += textwrap.dedent('''\
                 SSTATE_DIR = "${TMPDIR}/sstate"
-                SSTATE_MIRROR = ""
+                SSTATE_MIRRORS = ""
                 ''')
 
         self.write_config(config)
-- 
2.29.2

