Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.15214.1593582663879118754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 22:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0615of7E020520
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 22:50:52 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Tue, 30 Jun 2020 22:50:12 -0700
From: "Chen Qi" <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/2] oescripts.py: fix typo
Date: Wed, 1 Jul 2020 13:50:09 +0800
Message-ID: <20200701055010.18031-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 2f18d8f29c..f697d29b50 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -177,7 +177,7 @@ class OEListPackageconfigTests(OEScriptTests):
 
         self.check_endlines(results, expected_endlines)
 
-    def test_packageconfig_flags_optiins_preferred_only(self):
+    def test_packageconfig_flags_options_preferred_only(self):
         results = runCmd('%s/contrib/list-packageconfig-flags.py -p' % self.scripts_dir)
         expected_endlines = []
         expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
-- 
2.17.1

