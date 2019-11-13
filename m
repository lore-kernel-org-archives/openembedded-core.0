Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id 280F37F7A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 15:20:03 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id ay6so1214957plb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2019 07:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PohExFcCdTBeqtY1XOUz4RY9bw3hljSRSH0QP5u3fVQ=;
	b=HkAyQTXY/iZoUHqKuqICOpdD5I3G3vOZx8sk27hPOo3UKPjcccfgsJWORxZEChPf37
	38iPwyu9S6/+84QRwZNB5qD93QQMyD0zqEbCBB2cKVg5dv/6Ty1+ZgMzUMAMX8Pl7YJL
	2yfbzFPaymJsD7fSczfpHI/damsqCfCAjfcccYvqb/thpPPjQznqSOvPOluKXBexRH1r
	Ymkxl2bPkA/k3WNXRDBumpmbS/Xx0MBY4bUBO2bLzoMwGWwi7K5EcF+mGEd1mQI4QHRr
	CF9rFfz3nupVeRC1kMfhG8GfLMFJj4I1yfMgFu47etN/sH+4LuidvJg8zhLzI6b6mKSJ
	fGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PohExFcCdTBeqtY1XOUz4RY9bw3hljSRSH0QP5u3fVQ=;
	b=EdG3MLcGw6eATRxhkADWnVMn7yRG+lQe8gRaRClpDtoMEv/qmOeJCnWy9QzOhCU74n
	mgFR1M0bDasjuprRPZ2Wg5VxJYR/v4c7C9LUUY6ySgk7Twhuci8d/XBkfNuwUxIcMl8B
	tPT38YiX7m5CttHPjZT0zNoBdmkWLQpQKY0qxV62bd1z6YU0CP5d9uj+KAguP7Iz5D30
	407+IDvBjohN2ao3Fos5cejkk7dy37tqxODCIj7YfRT6Sj90VjlA1YTRwcM0HLweY5l3
	LJ61mvL3BYz3LwiX/SGn0wlhxxfT+pF6wqQyvvd6xDIhKmP4q6i6a9U4hLNCEEZEx1er
	Hj1A==
X-Gm-Message-State: APjAAAUyIBTqxwitKgESNxozqzHHlwEaVUBWXY+2t/19517CV9f3Zuig
	RnTG1imWjgpouRJN7nApEJKAPlDu
X-Google-Smtp-Source: APXvYqxKPhW4c2fS0EUqk/WXm117VfLDUNh4Hl85ELszArqPgK4lsdmj5M4SJ4BTr8CiewT5/tOXTQ==
X-Received: by 2002:a17:902:8e82:: with SMTP id
	bg2mr4342521plb.240.1573658404086; 
	Wed, 13 Nov 2019 07:20:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id t8sm2622242pjr.25.2019.11.13.07.20.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Nov 2019 07:20:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Nov 2019 07:19:21 -0800
Message-Id: <5b8022db53d9ef50ea35b034a6e27477038a508b.1573658232.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573658232.git.akuster808@gmail.com>
References: <cover.1573658232.git.akuster808@gmail.com>
Subject: [warrior 18/25] python3: fix the test_locale output format
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
X-List-Received-Date: Wed, 13 Nov 2019 15:20:03 -0000

From: Mingli Yu <mingli.yu@windriver.com>

Before this patch:
 # python3 -m test -v test_locale
 [snip]
 test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9') ok
 [snip]

 After this patch:
 # python3 -m test -v test_locale
 [snip]
 test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9')... ok
 [snip]

Make the test ended with "... ok" is common in python
unittest world, we should make it keep consistent
with other test cases in case it may be ignored to
record in the report if we use the common filter
"... ok".

[YOCTO #13298]

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ..._locale.py-correct-the-test-output-format.patch | 46 ++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.7.4.bb      |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch

diff --git a/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
new file mode 100644
index 0000000..35b7e0c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-test_locale.py-correct-the-test-output-format.patch
@@ -0,0 +1,46 @@
+From b94995e0c694ec9561efec0d1a59b323340e6105 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 5 Aug 2019 15:57:39 +0800
+Subject: [PATCH] test_locale.py: correct the test output format
+
+Before this patch:
+ # python3 -m test -v test_locale
+ [snip]
+ test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9') ok
+ [snip]
+
+ After this patch:
+ # python3 -m test -v test_locale
+ [snip]
+ test_getsetlocale_issue1813 (test.test_locale.TestMiscellaneous) ... testing with ('tr_TR', 'ISO8859-9')... ok
+ [snip]
+
+ Make the test ended with "... ok" is common in python
+ unittest world, we should make it keep consistent
+ with other test cases in case it may be ignored to
+ record in the report if we use the common filter
+ "... ok".
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/15132]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Lib/test/test_locale.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_locale.py b/Lib/test/test_locale.py
+index e2c2178..558d63c 100644
+--- a/Lib/test/test_locale.py
++++ b/Lib/test/test_locale.py
+@@ -527,7 +527,7 @@ class TestMiscellaneous(unittest.TestCase):
+             self.skipTest('test needs Turkish locale')
+         loc = locale.getlocale(locale.LC_CTYPE)
+         if verbose:
+-            print('testing with %a' % (loc,), end=' ', flush=True)
++            print('testing with %a...' % (loc,), end=' ', flush=True)
+         locale.setlocale(locale.LC_CTYPE, loc)
+         self.assertEqual(loc, locale.getlocale(locale.LC_CTYPE))
+ 
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/python/python3_3.7.4.bb b/meta/recipes-devtools/python/python3_3.7.4.bb
index bd86d51..a3933b5 100644
--- a/meta/recipes-devtools/python/python3_3.7.4.bb
+++ b/meta/recipes-devtools/python/python3_3.7.4.bb
@@ -27,6 +27,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
 	   file://crosspythonpath.patch \
            file://reformat_sysconfig.py \
            file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
+           file://0001-test_locale.py-correct-the-test-output-format.patch \
            "
 
 SRC_URI_append_class-native = " \
-- 
2.7.4


