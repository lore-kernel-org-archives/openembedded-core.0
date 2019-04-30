Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id D92EE7DAEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:47:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id z16so6933906pgv.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ukx/gFXLRoYvFPUacJl/NJuin3iR6fbJw4fyHfPDcsc=;
	b=gzhh7eO8TTaM1VFdJ1Fbsz2VoKMe/x6x/cQD7eBkIdqt9Dx1Xc/Hgf250fjN8CACOD
	fCgKlD3XWzl7SFuvgztU66ABgPtmBp4MzLFojyAvQHTMnvTVnEVFgeBhoxDH0aUmJufT
	UUuLru0cYaZOdO/vAKAnR7jyOhgOyBIonDk9dSY/9F22RVeDNKcY2sLbHs9ZT/iR+oGG
	aarhV+4ZlsXHxPy/Yi0i9NGvaZJJfpcOWVu/vQTPF9Moru5YLq7DA3/h/zdZMlHA7AsY
	kd/nhe9GThPNfv/Zpput5s9ss6jzYX4EGmeaqMdj1Cwsr1lVBz7ZvcqejNasCIP4TU6j
	1yNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ukx/gFXLRoYvFPUacJl/NJuin3iR6fbJw4fyHfPDcsc=;
	b=X+Yzxfe3SPP3LJIezMaiqJsy3OqH6eESXvWL7TdpvxDM5k08BS9l3+IWhZcrFGIXJf
	L/tLKIhJemNE/HwESqX3GeZmr0AhHHDALXiaipfNYsIYzCTSKFJ3x4O0DmefK4mKH30r
	dSqyE4+SC9FK2REmfogNPRP7hDwWxlWVlMZJX0NuzvCZJcpjpjPBzVy9UUbE5UEBIv1m
	2M4giTHCySM57eAC/MKHlgQxVPWgX5YRzpZ96fqroN7BAsgj8VFtsQdD5eK2Hhbj+Z3C
	CZHza05lGceAaD4WkO7Fnakx2XBPqHwwq8hni/6iHOD87ncd2LYUhdG7FRZ8RYHsHK7/
	Pn2Q==
X-Gm-Message-State: APjAAAVGngNSOmo4Kn4o7BP68F43yVQZCoW+zYOQKykvvYe5YIg92NB+
	F+daqdm3TnoxOeSceDJROJ76p+Sp
X-Google-Smtp-Source: APXvYqwwpjTSxl7XLwVosIWVirrAxkn72bthq3baiHprH0XIe8aUlp9FLpNtywipICqBQchSd7XIGA==
X-Received: by 2002:a63:e550:: with SMTP id z16mr10194253pgj.329.1556635621799;
	Tue, 30 Apr 2019 07:47:01 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:3820:22f7:e8b2:345d])
	by smtp.gmail.com with ESMTPSA id
	j14sm47155606pfa.57.2019.04.30.07.47.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Apr 2019 07:47:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2019 07:46:59 -0700
Message-Id: <1556635619-32075-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [v2][PATCH] manual tests migrate to selftest
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
X-List-Received-Date: Tue, 30 Apr 2019 14:47:00 -0000

[v2]
add check for python cairo module
pybootchartgui.py needs it

don't use relative path to pybootchartgui.py, use absolute

fix endline check data to reflect current output

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 97 +++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index bcdc2d5..81dd786 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,8 +1,11 @@
+import os, sys
 from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.depends import OETestDepends
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
 from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
 from oeqa.core.decorator.oeid import OETestID
 
+
 class BuildhistoryDiffTests(BuildhistoryBase):
 
     @OETestID(295)
@@ -26,3 +29,97 @@ class BuildhistoryDiffTests(BuildhistoryBase):
                 self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
+
+class OEScriptTests(OESelftestTestCase):
+    def setUp(self):
+        try:
+            import cairo
+        except ImportError:
+            self.skipTest('Python module cairo is not present')
+
+    scripts_dir = os.path.join(get_bb_var('COREBASE'), 'scripts')
+
+    def check_endlines(self, results,  expected_endlines): 
+        for line in results.output.splitlines():
+            for el in expected_endlines:
+                if line == el:
+                    expected_endlines.remove(el)
+                    break
+
+        if expected_endlines:
+            self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
+
+
+class OEPybootchartguyTests(OEScriptTests):
+
+    def test_pybootchartguy_help(self):
+        runCmd('%s/pybootchartgui/pybootchartgui.py  --help' % self.scripts_dir)
+
+    def test_pybootchartguy_to_generate_build_png_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f png' % (self.scripts_dir, tmpdir, tmpdir))
+
+    def test_pybootchartguy_to_generate_build_svg_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f svg' % (self.scripts_dir, tmpdir, tmpdir))
+
+    def test_pybootchartguy_to_generate_build_pdf_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('%s/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f pdf' % (self.scripts_dir, tmpdir, tmpdir))
+
+
+class OEListPackageconfigTests(OEScriptTests):
+    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
+    def test_packageconfig_flags_help(self):
+        runCmd('%s/contrib/list-packageconfig-flags.py -h' % self.scripts_dir)
+
+    def test_packageconfig_flags_default(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                                                        PACKAGECONFIG FLAGS")
+        expected_endlines.append("xserver-xorg-1.20.4                                                dri dri2 dri3 gcrypt glamor glx nettle openssl systemd systemd-logind udev unwind xinerama xmlto xshmfence xwayland")
+        expected_endlines.append("znc-1.7.1                                                          ipv6")
+
+        self.check_endlines(results, expected_endlines)
+
+
+    def test_packageconfig_flags_option_flags(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -f' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("PACKAGECONFIG FLAG     RECIPE NAMES")
+        expected_endlines.append("xshmfence              xserver-xorg-1.20.4")
+
+        self.check_endlines(results, expected_endlines)
+
+    def test_packageconfig_flags_option_all(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -a' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("xserver-xorg-1.20.4")
+        expected_endlines.append("PACKAGECONFIG dri2 udev openssl")
+        expected_endlines.append("PACKAGECONFIG[udev] --enable-config-udev,--disable-config-udev,udev")
+        expected_endlines.append("PACKAGECONFIG[dri] --enable-dri,--disable-dri,xorgproto virtual/mesa")
+        expected_endlines.append("PACKAGECONFIG[dri2] --enable-dri2,--disable-dri2,xorgproto")
+        expected_endlines.append("PACKAGECONFIG[dri3] --enable-dri3,--disable-dri3,xorgproto")
+        expected_endlines.append("PACKAGECONFIG[glx] --enable-glx,--disable-glx,xorgproto virtual/libgl virtual/libx11")
+        expected_endlines.append("PACKAGECONFIG[glamor] --enable-glamor,--disable-glamor,libepoxy virtual/libgbm,libegl")
+        expected_endlines.append("PACKAGECONFIG[unwind] --enable-libunwind,--disable-libunwind,libunwind")
+        expected_endlines.append("PACKAGECONFIG[xshmfence] --enable-xshmfence,--disable-xshmfence,libxshmfence")
+        expected_endlines.append("PACKAGECONFIG[xmlto] --with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native")
+        expected_endlines.append("PACKAGECONFIG[systemd-logind] --enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,")
+        expected_endlines.append("PACKAGECONFIG[systemd] --with-systemd-daemon,--without-systemd-daemon,systemd")
+        expected_endlines.append("PACKAGECONFIG[xinerama] --enable-xinerama,--disable-xinerama,xorgproto")
+        expected_endlines.append("PACKAGECONFIG[xwayland] --enable-xwayland,--disable-xwayland,wayland wayland-native wayland-protocols libepoxy")
+        expected_endlines.append("PACKAGECONFIG[openssl] --with-sha1=libcrypto,,openssl")
+        expected_endlines.append("PACKAGECONFIG[nettle] --with-sha1=libnettle,,nettle")
+        expected_endlines.append("PACKAGECONFIG[gcrypt] --with-sha1=libgcrypt,,libgcrypt")
+
+        self.check_endlines(results, expected_endlines)
+
+    def test_packageconfig_flags_optiins_preferred_only(self):
+        results = runCmd('%s/contrib/list-packageconfig-flags.py -p' % self.scripts_dir)
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                                                        PACKAGECONFIG FLAGS")
+        expected_endlines.append("xserver-xorg-1.20.4                                                dri dri2 dri3 gcrypt glamor glx nettle openssl systemd systemd-logind udev unwind xinerama xmlto xshmfence xwayland")
+
+        self.check_endlines(results, expected_endlines)
+
-- 
2.7.4


