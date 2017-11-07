Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC2978438
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 10:32:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r68so2725226wmr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Nov 2017 02:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=KN2hvlylm6clVcxuyOjd6LEJ4VUSVd2njEbDGE8jBEo=;
	b=MtrX/RcVPGUcKRRS25ADpByOWMCqjgCrN5e9Pelt6yhUqxwnN4ahBoEZb/bkYY/aO/
	9FohoN1fb9JpAnxIpxBs/Ara1u2XV7h+4yAWAbfZmHrzXHyZgBwLbgijnbD+mNfq8czK
	ST9UkDmV98i9KaPxtHLuKH1GRtZ+VWGGCokNWBEhksgIboOLFXShuAPCcTGAmUYPxVPq
	KLNopjr1X2kzOCoDcuMhY+qvEYjklC5Hv9W5ggnNRMRIhFLPkzC3Ow/ofhhtIM7bdKrd
	zbq0CGUPYU6C6tUEpi8hVxHDF/WSBSCX2tjM5wqSNZn2aVY1veoGVLIlAlHaCLppl3oo
	rRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=KN2hvlylm6clVcxuyOjd6LEJ4VUSVd2njEbDGE8jBEo=;
	b=foFZ05+I45+6yrKT1MLQBS0YvVxsSPw1ztw7VblUHN9Jd3xnkWLECVYgoWGuWhx6Fy
	3hEPZ2wSxUJjDtInvCtBXE/PQ8UXRx10FqytuZzTXalD/aE1Ygj22BNWZFg5rhHiW+Rf
	vw4pa7oIYSGXz5EsgTslrTb1a/AgCrMd6ZYVjv9mJtgjCPf0MJbdy7ZLshNaStM1x8ny
	5fCTugDBEBPnmaSLbSGgPAGiFRg4UwogAZN8dsdLqvA+p42sD6h6ISbIRO3DGSrTNQUR
	PNqp8Tqxg/cMxJ5LUf3QUozn64z0r/NIgDhO8jGAzyvil4j1D8PJSAq0Vtll7fj1Mrup
	RkYw==
X-Gm-Message-State: AJaThX6ZE01kYWn2VhOYu3WI0fUWOHANbLCZErwM+UL4bbmH7F46qd/q
	IhCCFpAqgEu/J0+eKg+aRC9vaqw9
X-Google-Smtp-Source: ABhQp+Q2OeieBalb7UNpAF+U6VKFD0Trm7UP89zVD/IPSCr3UawMThXXdXiaz8g9RAPYeSNNNFHgGQ==
X-Received: by 10.28.228.197 with SMTP id b188mr956108wmh.59.1510050761849;
	Tue, 07 Nov 2017 02:32:41 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id c67sm653126wmd.25.2017.11.07.02.32.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 02:32:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Nov 2017 10:32:39 +0000
Message-Id: <20171107103239.9357-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/runtime/python: port to Python 3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Nov 2017 10:32:41 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/runtime/cases/python.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/python.py b/meta/lib/oeqa/runtime/cases/python.py
index bf3e1791638..3d6eb088024 100644
--- a/meta/lib/oeqa/runtime/cases/python.py
+++ b/meta/lib/oeqa/runtime/cases/python.py
@@ -20,16 +20,16 @@ class PythonTest(OERuntimeTestCase):
 
     @OETestID(1145)
     @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['python-core'])
+    @OEHasPackage(['python3-core'])
     def test_python_exists(self):
-        status, output = self.target.run('which python')
+        status, output = self.target.run('which python3')
         msg = 'Python binary not in PATH or not on target.'
         self.assertEqual(status, 0, msg=msg)
 
     @OETestID(965)
     @OETestDepends(['python.PythonTest.test_python_exists'])
     def test_python_stdout(self):
-        status, output = self.target.run('python /tmp/test.py')
+        status, output = self.target.run('python3 /tmp/test.py')
         msg = 'Exit status was not 0. Output: %s' % output
         self.assertEqual(status, 0, msg=msg)
 
-- 
2.11.0


