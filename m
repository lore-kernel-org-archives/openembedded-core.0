Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id A02966086B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 18:48:16 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id q55so2456387wes.28
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 11:48:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=pOkvPN/4pwuCdw8+XYpjro7HpRAwBSSvtUk3BS8YKhA=;
	b=mwRFhqnXLH1QFG/GE1lp3MfaX8RubBhdfaiEqxKyz1256CPbVRk1SdvzkZ+fut9LMW
	rqkkT08CblNf3WKKtptFgGkx/8DbD0by3Xgd88cX3sryVrlxPIoJ8Nbo0mQi5jZV8+Eb
	7l8KNcZhuGABRLMZYZ1mUNbHrjYY94sWI9uTSeJAuIzlzewEjM87myBvESKkGFb9OHqt
	HVoA3DY5wSLU/tk3H7UUYbNNU5r/Y7+JHLqc6jFF3E4S82CgtrUSmAz+QRXJmdJhzx6/
	SVofQCoz27Aglw1W8ksaEt2F6UQfkwzUf1tv03RH27NLyRHJGrbv/VETNYd5R52RbKID
	USeg==
X-Received: by 10.180.90.70 with SMTP id bu6mr27503104wib.34.1369334896987;
	Thu, 23 May 2013 11:48:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	ca19sm37546635wib.3.2013.05.23.11.48.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 23 May 2013 11:48:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 19:45:00 +0100
Message-Id: <1369334701-18752-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
References: <1369334701-18752-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmjJCzsWQEjAYt4ihQFH002DlqoJ0RqRLY9uha7pSCYBrZIN783xuy3pFkZjgdiUZupTYXf
Subject: [PATCH 2/3] test_utils: import functions directly for conciseness
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
X-List-Received-Date: Thu, 23 May 2013 18:48:17 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/tests/test_utils.py |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/tests/test_utils.py b/meta/lib/oe/tests/test_utils.py
index 779247a..8bb36f2 100644
--- a/meta/lib/oe/tests/test_utils.py
+++ b/meta/lib/oe/tests/test_utils.py
@@ -1,5 +1,5 @@
 import unittest
-import oe.utils
+from oe.utils import packages_filter_out_system
 
 class TestPackagesFilterOutSystem(unittest.TestCase):
     def test_filter(self):
@@ -15,17 +15,17 @@ class TestPackagesFilterOutSystem(unittest.TestCase):
         d.setVar("PN", "foo")
 
         d.setVar("PACKAGES", "foo foo-doc foo-dev")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, [])
 
         d.setVar("PACKAGES", "foo foo-doc foo-data foo-dev")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, ["foo-data"])
 
         d.setVar("PACKAGES", "foo foo-locale-en-gb")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, [])
 
         d.setVar("PACKAGES", "foo foo-data foo-locale-en-gb")
-        pkgs = oe.utils.packages_filter_out_system(d)
+        pkgs = packages_filter_out_system(d)
         self.assertEqual(pkgs, ["foo-data"])
-- 
1.7.10.4


