Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id EB2BD7BDBE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:40:49 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t27so2228514wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=z2tPgVwKI9SfZJf0/x9NrLtyiudPIyK8r1f0sjoE4eA=;
	b=FvCJaxZJ23UHPIIs1UOGe4OHWqw93kQUUYZ/ip0LCDhBbzNjoQ25ezt0G+TNwyiPlP
	uTHAkSay/nif0zI2e8VqU7ja9T8Tcg4v7A03xj8hLZko6fOcrBWi6cA2xdBwrt+RaLIm
	eepxmNnk7FI6OOZdQlbLxPJaCAnnCIoexWq84NV2IiNlryfgALoInvnTdnBvSfazxw26
	v/XX5iB/bW7R3zwxpdMUrfIHmWe2tyNNXKRJQvN51D9WRW48HhfGjv4Ka6S7DkT+N9zz
	M0SjzR8Nsu3RwL3/bVNYfAhONCxTEjErvCMLg1++hG9LrhEieIsrXYLZzy/8G3DDrVx8
	Mifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=z2tPgVwKI9SfZJf0/x9NrLtyiudPIyK8r1f0sjoE4eA=;
	b=B5SiU1Tvi9k6ykz9K+1AMKiRIQxmfoQUvWWbvZjTJ/lo634eYAgRC7UfPoo9p9JtDc
	FHywpUSOtKXGZnXruJIPVQRi8bzOTCxZgDv46tpyHEw+GVCHA7lwjQLgu5PLAV8GdZcv
	mGV3+X9HXXYwyumGfS9XWukcM5tc6JJdzYKCM0fkkUmFQw4AG+FEg9ePCSEKfsqV0vBw
	AbDqxgqVSW5rSFpu3sbLZjmzILlKhnEh91D9rO0uS34ZuL05hZzS/82R8VCpOgcADotO
	MRb+U3N5fKveUlQZ2NzBhj4nSCdiISk4B7N6s9zDkPd5VpOd0PWcAmnuqHXXusWps0ZV
	FmOQ==
X-Gm-Message-State: AA+aEWZwYRQuV2Fx9lQm0VkUjFlJDyIoK7XO29UUas0FNlqV4d9dkyCQ
	Mmc4rZHllWQ61MgXRK7v/IWfZtk/GZE=
X-Google-Smtp-Source: AFSGD/U39mBkwAwnlL/kOL2aI6JnF447PRMlKBykUEZuFR8oqN8MjyyMnXL6hiySwtWV6AgeJymyuw==
X-Received: by 2002:adf:c846:: with SMTP id e6mr22245114wrh.243.1545320450107; 
	Thu, 20 Dec 2018 07:40:50 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	h10sm8178307wmf.44.2018.12.20.07.40.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Dec 2018 07:40:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Dec 2018 15:40:43 +0000
Message-Id: <20181220154043.7860-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181220154043.7860-1-ross.burton@intel.com>
References: <20181220154043.7860-1-ross.burton@intel.com>
Subject: [PATCH 3/3] oeqa/sdk: add test to exercise Meson
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
X-List-Received-Date: Thu, 20 Dec 2018 15:40:50 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/buildepoxy.py | 36 +++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/buildepoxy.py

diff --git a/meta/lib/oeqa/sdk/cases/buildepoxy.py b/meta/lib/oeqa/sdk/cases/buildepoxy.py
new file mode 100644
index 00000000000..47ae5e96df3
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/buildepoxy.py
@@ -0,0 +1,36 @@
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
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "https://github.com/anholt/libepoxy/releases/download/1.5.3/libepoxy-1.5.3.tar.xz")
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


