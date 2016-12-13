Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2809A71E1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 16:33:03 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id v7so105512959wjy.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 08:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=iRCnxEWzejuBZWKX4cKwE1/zo2i9CeAdZ/7jUGWqirI=;
	b=gRGpPGg6ZyzIwSHGHjXYXgptuyZ1HB/4vEuGgfGcToRHLjf/GEsD1ct0wOBtTiIbfh
	jskREd3b+YiHgLzhuEWVCzZjYXmvLZ2jezoy98wRwAvCu+e28UlV+tYgHuvhN5XQZsuM
	3GbrYeSmtpnqd096lVxs9rzp7J8XQiy5V7UaqpAYHAWJmF4ux5ctg+SC2P9KXM8ot8+6
	9ENtDhF8JREshuJMNFn3PIbbQDjTmnQnHWQZvKpZZsxzWCf+2qirH26cpAo/u5BLL/sr
	24RD+RoaKtCNM28Wu+gN3tlbFekrup/rATcotGogEaGtX08lHN0brZkogd+t8aqFU5Z2
	FpVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=iRCnxEWzejuBZWKX4cKwE1/zo2i9CeAdZ/7jUGWqirI=;
	b=gmRLPe9lLKQKMuoxBC3VbV3OHFSN8TjxxX5SRcEs8s8lWootw1fOQOEwpMNc9jRgDF
	+bhLaqzOawHV1TUXQikrZ9SLOB6pyrZ4c5PF0ZzeptZABhml+0BCDZqCPldXWMAFUrww
	x9/REFsBgYPBmrv32D2JoEr4J7wAKAE/CYHhY9kmPTH1/qu8rc+3J7dazXOq0BswAaef
	fsU+ejneIoZxdZfY/jxBqDVvphE/qGbiTRfBXjtGfUbdqB1QYAR+px4WqkGXdc7mMCQH
	wiEVXidaQ1eTAaf8C4oxuIE2RbXQSHMP8nPyz72wrUKXRy1QMPra6EkaUbP0ZWHGqpBg
	NCZg==
X-Gm-Message-State: AKaTC00VMilD/ekFsaEVg/IY2/57S2oKUe0jchoFpxmQarFnJHnXNBbFvVZdpKHdysbYY4aI
X-Received: by 10.194.97.8 with SMTP id dw8mr59432493wjb.84.1481646784319;
	Tue, 13 Dec 2016 08:33:04 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r138sm3359216wme.9.2016.12.13.08.33.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Dec 2016 08:33:03 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 16:33:00 +0000
Message-Id: <1481646780-28253-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] oeqa: move lib/oe tests to oe-selftest
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
X-List-Received-Date: Tue, 13 Dec 2016 16:33:04 -0000

These tests don't get ran often (as demonstrated by the fact that some were not
ported to Python 3), so move them to oeqa/selftest so they get executed
frequently and can be extended easily.

[ YOCTO #7376 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/{oe/tests => oeqa/selftest/oelib}/__init__.py |  0
 .../tests/test_elf.py => oeqa/selftest/oelib/elf.py}   |  0
 .../test_license.py => oeqa/selftest/oelib/license.py} |  0
 .../tests/test_path.py => oeqa/selftest/oelib/path.py} |  0
 .../test_types.py => oeqa/selftest/oelib/types.py}     | 18 +++---------------
 .../test_utils.py => oeqa/selftest/oelib/utils.py}     |  2 +-
 6 files changed, 4 insertions(+), 16 deletions(-)
 rename meta/lib/{oe/tests => oeqa/selftest/oelib}/__init__.py (100%)
 rename meta/lib/{oe/tests/test_elf.py => oeqa/selftest/oelib/elf.py} (100%)
 rename meta/lib/{oe/tests/test_license.py => oeqa/selftest/oelib/license.py} (100%)
 rename meta/lib/{oe/tests/test_path.py => oeqa/selftest/oelib/path.py} (100%)
 rename meta/lib/{oe/tests/test_types.py => oeqa/selftest/oelib/types.py} (79%)
 rename meta/lib/{oe/tests/test_utils.py => oeqa/selftest/oelib/utils.py} (96%)

diff --git a/meta/lib/oe/tests/__init__.py b/meta/lib/oeqa/selftest/oelib/__init__.py
similarity index 100%
rename from meta/lib/oe/tests/__init__.py
rename to meta/lib/oeqa/selftest/oelib/__init__.py
diff --git a/meta/lib/oe/tests/test_elf.py b/meta/lib/oeqa/selftest/oelib/elf.py
similarity index 100%
rename from meta/lib/oe/tests/test_elf.py
rename to meta/lib/oeqa/selftest/oelib/elf.py
diff --git a/meta/lib/oe/tests/test_license.py b/meta/lib/oeqa/selftest/oelib/license.py
similarity index 100%
rename from meta/lib/oe/tests/test_license.py
rename to meta/lib/oeqa/selftest/oelib/license.py
diff --git a/meta/lib/oe/tests/test_path.py b/meta/lib/oeqa/selftest/oelib/path.py
similarity index 100%
rename from meta/lib/oe/tests/test_path.py
rename to meta/lib/oeqa/selftest/oelib/path.py
diff --git a/meta/lib/oe/tests/test_types.py b/meta/lib/oeqa/selftest/oelib/types.py
similarity index 79%
rename from meta/lib/oe/tests/test_types.py
rename to meta/lib/oeqa/selftest/oelib/types.py
index 367cc30..4fe2746 100644
--- a/meta/lib/oe/tests/test_types.py
+++ b/meta/lib/oeqa/selftest/oelib/types.py
@@ -1,19 +1,7 @@
 import unittest
-from oe.maketype import create, factory
+from oe.maketype import create
 
-class TestTypes(unittest.TestCase):
-    def assertIsInstance(self, obj, cls):
-        return self.assertTrue(isinstance(obj, cls))
-
-    def assertIsNot(self, obj, other):
-        return self.assertFalse(obj is other)
-
-    def assertFactoryCreated(self, value, type, **flags):
-        cls = factory(type)
-        self.assertIsNot(cls, None)
-        self.assertIsInstance(create(value, type, **flags), cls)
-
-class TestBooleanType(TestTypes):
+class TestBooleanType(unittest.TestCase):
     def test_invalid(self):
         self.assertRaises(ValueError, create, '', 'boolean')
         self.assertRaises(ValueError, create, 'foo', 'boolean')
@@ -43,7 +31,7 @@ class TestBooleanType(TestTypes):
         self.assertEqual(create('y', 'boolean'), True)
         self.assertNotEqual(create('y', 'boolean'), False)
 
-class TestList(TestTypes):
+class TestList(unittest.TestCase):
     def assertListEqual(self, value, valid, sep=None):
         obj = create(value, 'list', separator=sep)
         self.assertEqual(obj, valid)
diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oeqa/selftest/oelib/utils.py
similarity index 96%
rename from meta/lib/oe/tests/test_utils.py
rename to meta/lib/oeqa/selftest/oelib/utils.py
index 5d9ac52..7deb10f 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oeqa/selftest/oelib/utils.py
@@ -1,5 +1,5 @@
 import unittest
-from oe.utils import packages_filter_out_system
+from oe.utils import packages_filter_out_system, trim_version
 
 class TestPackagesFilterOutSystem(unittest.TestCase):
     def test_filter(self):
-- 
2.8.1


