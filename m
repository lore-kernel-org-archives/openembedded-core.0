Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC266BCF1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:41 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r24so10109121wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=VCelXHrq6lZGOrSR7xhDGTo8ylf2XB9Pl3LZT09GkSg=;
	b=Y2Z1qsH4sqjFxR7q0/yScOb/npXZNBYHL67k5svFKz5bfy5kr/6U6yRF82Roq9RcDU
	7w6wIPbdo4DyLGQ6Mh/dxZY7O9kIX/DpD8EUmBLKfqBEW0yAQ/gv4hnXWfhUVGyONaDH
	pTDzXItPIeT6BabfJcwFdIBLyMsDRQavkCiMISqfj2NY9sZSOU51zQAowaMzOrOYYTFw
	LYa6+oT5K5nD9sx8BuFpGSHs5MGZPusmgUce/TFB0rYVTefKiKIl5XYkZL3FMGMQC9Tn
	KZibqsKfuAXh/pTC8/03VtINFqlWfDDLQ6SpbrrjdtC8kJ0E58RPmqwAQWAFsoZiY7WF
	xtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=VCelXHrq6lZGOrSR7xhDGTo8ylf2XB9Pl3LZT09GkSg=;
	b=IiwSMOTi9V4KTA1ZaLtfxlLFJp86cBK4dDLoRTmZlxWBzg3D3h8xUm18C9cEou+zpT
	5s6IhCbXN15dEKHXFt4yp5dhL/C1jlBDIy3BpkHrgoDg9A+Mhy4cc2gKuKD0/GLlc/9z
	hph/aEICyZhzjBby6s6Cj5qyjg6F/Hk/iGhtq2YBFgdaxSb8F/MkDFBCWCfvtFRDQk6+
	eWehuS/xQnfk0tnISvVfRQIGw9qwmdaS4Nb7/AC7MA5y5xotKN5TfXsbT4eu7DsiBuY9
	px1RVSBwq6WluWqYKV5xpSiy6da3qd8is45/0RNsHR+zaclYOuJfbvMhjQ8BD+r1svs1
	mJFw==
X-Gm-Message-State: AA+aEWaDUbATCQ8hnmZs9oEsgpzCY5oIl75JNx+8LneL+OdlAPOF4ETc
	A7jpOZP1GfH/Tq70I+n5+myI1fqg1/k=
X-Google-Smtp-Source: AFSGD/VZU1iIy7HYmQMtueE+JiPIyj9jogc+4fHl/8XxPOCq3DCH0JUc/FmB7MDrhBYEJ5eI8+Xqtg==
X-Received: by 2002:a1c:b1d5:: with SMTP id a204mr4420412wmf.32.1544570801748; 
	Tue, 11 Dec 2018 15:26:41 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm30194595wrd.46.2018.12.11.15.26.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Dec 2018 15:26:41 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 23:26:34 +0000
Message-Id: <20181211232636.13113-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181211232636.13113-1-ross.burton@intel.com>
References: <20181211232636.13113-1-ross.burton@intel.com>
Subject: [PATCH V2 3/5] oeqa/sdk: clean up galculator test
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
X-List-Received-Date: Tue, 11 Dec 2018 23:26:41 -0000

Drop redundant imports and variables, and use os.makedirs() instead of
bb.utils.mkdirhier().

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildgalculator.py | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
index 7beb55884d3..164a695637a 100644
--- a/meta/lib/oeqa/sdk/cases/buildgalculator.py
+++ b/meta/lib/oeqa/sdk/cases/buildgalculator.py
@@ -3,17 +3,14 @@ import subprocess
 import tempfile
 import unittest
 
-import bb
-
 from oeqa.sdk.case import OESDKTestCase
-from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
-
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
 
 class GalculatorTest(OESDKTestCase):
-    td_vars = ['DATETIME']
-
+    """
+    Test that autotools and GTK+ 3 compiles correctly.
+    """
     def setUp(self):
         if not (self.tc.hasTargetPackage("gtk+3", multilib=True) or \
                 self.tc.hasTargetPackage("libgtk-3.0", multilib=True)):
@@ -33,8 +30,8 @@ class GalculatorTest(OESDKTestCase):
 
             subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
             self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-            bb.utils.mkdirhier(dirs["build"])
             self._run("cd {source} && autoreconf -i -f -I $OECORE_TARGET_SYSROOT/usr/share/aclocal -I m4".format(**dirs))
             self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
             self._run("cd {build} && make -j".format(**dirs))
-- 
2.11.0


