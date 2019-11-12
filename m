Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 00B547FBBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:55 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z24so10990378pgu.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=hcjAAoY9Hau0I1VTsmOyaDmxBQV30JOOLVqMbd+mDzw=;
	b=BboSnS4Ab95ttSjXo7m2S1FFGXGgKvfdIgJpdEP3osZd59320PoYtP6djUcSE/s5CL
	pyzHbK1kG9YCgXOdxM7THvmDO3yjVplwBYr/YI88xUWTL5AvPVQLVWpo7UMAoWuhdyA+
	wTo+MAJquCPNF1t0P3E3C+kvmHnQYGU7m7Xah0ogT+vUFVGRAN+oTRmxuiXfQrn8l5lI
	1+x2Iszbo58YhQItTNCsb/Uby8PgIX6u23oELrnnErzAgC/cqVmh2bOp9X+0nTji7WWV
	oeBwtQGLMLkhSVdRhgYPmBu3PrLxtWxdLGWksSjib/gx3UiHSW0lO+uUqJ1co2G7m8bo
	G8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=hcjAAoY9Hau0I1VTsmOyaDmxBQV30JOOLVqMbd+mDzw=;
	b=MZGv/GZMPaWHG1qBQaG48mnoXDEy+v1C37+iTknbCu1Ot5Tk50dltr5ixhlV3bTTG5
	nD50ZDVZxzxxuq3fSnD7SESTaTK8MZjqqf6URhBIvaekqF6oddWw4b5KGRK3snfAySjY
	lpTGRcU2ByrTBuG3AR0l7+W5UbWcm/ZVnYlh/nMP/9D9yN5AbDXSshn3+WkUOCHUhMFK
	9l5OXCx+hd0r4zoEWwra7d8z97y7r9vRcGQk8Ill04LzbV7fp5EXMbew9JdcN9y1nMQ6
	fhL5hweK26PBJIf+cvu6x2O5CJ+uvJ9d79CJ/SA3mxrkiQ73RKRiE8CLkLah7n7KwPHf
	hQSg==
X-Gm-Message-State: APjAAAW+IYPCgqaqt0UbaSbVN5LNuWfkx5588b2XAWZTd0W0ulaU4HiJ
	zbeVRDAFZ6YK8S8TQwOD8m/7snbk
X-Google-Smtp-Source: APXvYqxpPEuozHssDNgzHu0U9MxusspSmHHtb2ONZO7DyJKfXbouzXvA/ukexHIe6sQ4WRSVNNrHng==
X-Received: by 2002:a62:7c92:: with SMTP id
	x140mr33006423pfc.171.1573533236899; 
	Mon, 11 Nov 2019 20:33:56 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:56 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:36 -0800
Message-Id: <742e15137b45f260f133a3c3ab64682fef7cbdb8.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 17/20] OEQA: move list-packageconfig-flags tests from manual to self
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:56 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 59 +++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 80d8b2c..41cbe04 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -65,6 +65,7 @@ class OEPybootchartguyTests(OEScriptTests):
         runCmd('%s/pybootchartgui/pybootchartgui.py  %s -o %s/charts -f pdf' % (self.scripts_dir, self.buildstats, self.tmpdir))
         self.assertTrue(os.path.exists(self.tmpdir + "/charts.pdf"))
 
+
 class OEGitproxyTests(OESelftestTestCase):
 
     scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
@@ -127,3 +128,61 @@ class OeRunNativeTest(OESelftestTestCase):
         bitbake("qemu-helper-native -c addto_recipe_sysroot")
         result = runCmd("oe-run-native qemu-helper-native tunctl -h")
         self.assertIn("Delete: tunctl -d device-name [-f tun-clone-device]", result.output)
+
+class OEListPackageconfigTests(OEScriptTests):
+    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
+    def check_endlines(self, results,  expected_endlines): 
+        for line in results.output.splitlines():
+            for el in expected_endlines:
+                if line == el:
+                    expected_endlines.remove(el)
+                    break
+
+        if expected_endlines:
+            self.fail('Missing expected listings:\n  %s' % '\n  '.join(expected_endlines))
+
+
+    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
+    def test_packageconfig_flags_help(self):
+        runCmd('%s/contrib/list-packageconfig-flags.py -h' % self.scripts_dir)
+
+    def test_packageconfig_flags_default(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
+        expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
+        expected_endlines.append("tar                          acl")
+
+        self.check_endlines(results, expected_endlines)
+
+
+    def test_packageconfig_flags_option_flags(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -f' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("PACKAGECONFIG FLAG     RECIPE NAMES")
+        expected_endlines.append("qt                     nativesdk-pinentry  pinentry  pinentry-native")
+        expected_endlines.append("secret                 nativesdk-pinentry  pinentry  pinentry-native")
+
+        self.check_endlines(results, expected_endlines)
+
+    def test_packageconfig_flags_option_all(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("pinentry-1.1.0")
+        expected_endlines.append("PACKAGECONFIG ncurses libcap")
+        expected_endlines.append("PACKAGECONFIG[qt] --enable-pinentry-qt, --disable-pinentry-qt, qtbase-native qtbase")
+        expected_endlines.append("PACKAGECONFIG[gtk2] --enable-pinentry-gtk2, --disable-pinentry-gtk2, gtk+ glib-2.0")
+        expected_endlines.append("PACKAGECONFIG[libcap] --with-libcap, --without-libcap, libcap")
+        expected_endlines.append("PACKAGECONFIG[ncurses] --enable-ncurses  --with-ncurses-include-dir=${STAGING_INCDIR}, --disable-ncurses, ncurses")
+        expected_endlines.append("PACKAGECONFIG[secret] --enable-libsecret, --disable-libsecret, libsecret")
+
+        self.check_endlines(results, expected_endlines)
+
+    def test_packageconfig_flags_optiins_preferred_only(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -p' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                  PACKAGECONFIG FLAGS")
+        expected_endlines.append("pinentry                     gtk2 libcap ncurses qt secret")
+
+        self.check_endlines(results, expected_endlines)
+
-- 
2.7.4


