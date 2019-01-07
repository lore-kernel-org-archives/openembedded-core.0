Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8737BEAD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:40 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id y185so6513948wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4/fFP9x0vmlSYZ+oHB1lVcOV+1/2UGEDzG4PvEBNI9s=;
	b=aVKPQr1JE7Yl4Kg2eSR6PyWnAlb5LClgODYExDyL9iJi4L+0H82chh2q8yyeQvw07V
	zy67cJ8CbqJU++Iq2iumO8NfIXXFOKSP+TG6OQghSNDggOzwdPkl/lee1g8JB/FQPUpD
	fzh533anD5wISomqr9s+nqOZbGyJ3KM7s8V4AlgnXBjsMK3KB1SY28/rNX2hCWuMM2Ab
	eTxcern3SrUWOTX2jhRPCKXmnj/SyGwauUqmXuYvOAjrQm1L3M5k/sIRN6AMk3GmflVI
	WeqD4NVWKHEqeyFEp7a7OhgSr2zfJBW2gXhg2VSAHxG/6HG7jpjY5Fx1OwB8jT2cFHqE
	fcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4/fFP9x0vmlSYZ+oHB1lVcOV+1/2UGEDzG4PvEBNI9s=;
	b=PgZOTyYq1arBmqnEMPO3zzr6D3Ni+Lrd6Ol3dAKsQRNuwnJEgj18OJbpUPS6v+4w6/
	rMW/9hkZj4AOvmMLeMlTUcuchZV90lyv+jkEN2PFcNY7GPXF5YajksUXh/T8fvm9Co2b
	k8L9N0pahoFpkbPg2B85CC+eXg7AmB9WLJeUayqSps9yc0Paa2aMIKi813BQlM4nL6zE
	uwTEG7S9VMqQkn0Tid8yOn54r0q3OHxZ8BEwqUFh5CFapQu8yyDMbccLR2ur81r0c/2O
	NYOGROfaPrKhwtjY1MFKURqpMkswKForN6tkOgLUOT4jMHRbFWxzB06Q3sKROoUjVgca
	QoCA==
X-Gm-Message-State: AJcUukf/AYVwJR8udolS1reZMFvxS52sQWYp5oO4KXItKZWhZG7hxcY+
	sqfchniYGb9WyVHasml2SXCecK1FSMY=
X-Google-Smtp-Source: ALg8bN5XovEMjfmwNtezYSZVnAxzcj+i8d8gY6vbg76UDFn3ZbmQckiUDwv2zJUyTx1sP7ZcfjuLOQ==
X-Received: by 2002:a1c:f509:: with SMTP id t9mr9935732wmh.76.1546879120648;
	Mon, 07 Jan 2019 08:38:40 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:39 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:23 +0000
Message-Id: <20190107163823.31816-7-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 7/7] oeqa/sdk: add test to exercise Meson
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:41 -0000

(From OE-Core rev: 29359493e391d68a5a6b4fa4d09ffdc1fe6db620)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/buildepoxy.py

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
new file mode 100644
index 00000000000..ef24b4f4ac1
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -0,0 +1,35 @@
+import os
+import subprocess
+import tempfile
+import unittest
+
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class EpoxyTest(OESDKTestCase):
+    """
+    Test that Meson builds correctly.
+    """
+    def setUp(self):
+        if not (self.tc.hasHostPackage("nativesdk-meson")):
+            raise unittest.SkipTest("GalculatorTest class: SDK doesn't contain Meson")
+
+    def test_epoxy(self):
+        with tempfile.TemporaryDirectory(prefix="epoxy", dir=self.tc.sdk_dir) as testdir:
+            tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz")
+
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "libepoxy-1.5.3")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
+
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
+
+            self._run("meson -Degl=no -Dglx=no -Dx11=false {build} {source}".format(**dirs))
+            self._run("ninja -C {build} -v".format(**dirs))
+            self._run("DESTDIR={install} ninja -C {build} -v install".format(**dirs))
+
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libepoxy.so"))
-- 
2.11.0


