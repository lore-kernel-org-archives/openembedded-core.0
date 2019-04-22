Return-Path: <akuster808@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4F3536D6DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:42:09 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id n11so9388608ioh.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=OW9x0yhlRIdon/PJsjlbM6h6VSgA0axxVrv27vPRcS0=;
	b=hfCEstjxHyVcMTeTUyiTz1tMk108ohy+auNe8iaEOCUZbSYNcYC76b4JUQWVWMrh7W
	93gBJITcJ7H/JxquUd6H6MKvr/DI0pzcUqocd+WyZMtahqiuq2SzgmDqt9hTEM+vGZK4
	WDqY4hgdDo/t4MQfTkGu+m0u7bI0V3EndKTJ1KfW/hPePnL0BTMczUeT3lIHpC/4wh5X
	wXOnokSdKLw8mtnqdXykoEgfB4ybJt8/5Tnf6ze4LvojSslSM7amtF0h7JwokoDT1Hct
	b2ty2Ha0mfeit3LFyREtHj3VEjCmUIR0Pfv3qr9vJ9HGmrEOxhB+6iLWm3kFkI807MDs
	GptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=OW9x0yhlRIdon/PJsjlbM6h6VSgA0axxVrv27vPRcS0=;
	b=WWINOCCaCNndXqOu80FCZs39ZzZCnlTKQd7kxviGEzb3bY81hYo09B0ORpCsg6ata4
	JE7TCl4q724xV6rYIpirPXoeH0PiUHf24xxq8GvTuNcurSgrtiBkHu4U9hFH2tiGXAm+
	jsNFSuwIXEB6NizLqPrvnvQ5TPWKx1g0X9LaEwo9VFXD8b3vxLP0fBqNpNRGB2eQ+g0a
	TR6bqozzo0vKfS/aXzdmYyZCL3wbDZkhn6/HJPNSowEeylWYiS9/tW/hNrRQggsYR71c
	uwn+PAQBv2zaYicX23EGoh/GVSsRcHNsyy5QcQNSt0U0juY5xjziKLxE+j7x+n5LCX4e
	OVBg==
X-Gm-Message-State: APjAAAURchbsp+XVKmJU0WFBBTBex5THjH//OyjiQF21fJbvM6TNaDtC
	/kJLk/GF5QEcmmLvhReq5XtplOA+
X-Google-Smtp-Source: APXvYqxbKafvON3vLhLA9N6sYD6fVY1yUpuMmLYEWenzvp8pVgGTX2AmnDqV4YvExg2jLLccAhrxWQ==
X-Received: by 2002:a5e:8304:: with SMTP id x4mr2787426iom.254.1555936930256; 
	Mon, 22 Apr 2019 05:42:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	h133sm6173634itb.34.2019.04.22.05.42.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:42:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:41:53 -0600
Message-Id: <1555936919-19078-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
References: <1555936919-19078-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 1/7] manual tests migrate to selftest
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
X-List-Received-Date: Mon, 22 Apr 2019 12:42:09 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 89 +++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index bcdc2d5..36074c9 100644
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
@@ -26,3 +29,89 @@ class BuildhistoryDiffTests(BuildhistoryBase):
                 self.fail('Unexpected line:\n%s\nExpected line endings:\n  %s' % (line, '\n  '.join(expected_endlines)))
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
+
+
+class OEScriptTests(OESelftestTestCase):
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
+    def test_pybootchartguy_help(self):
+        runCmd('../scripts/pybootchartgui/pybootchartgui.py  --help')
+
+    def test_pybootchartguy_to_generate_build_png_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('../scripts/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f png' % (tmpdir, tmpdir))
+
+    def test_pybootchartguy_to_generate_build_svg_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('../scripts/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f svg' % (tmpdir, tmpdir))
+
+    def test_pybootchartguy_to_generate_build_pdf_output(self):
+        tmpdir = get_bb_var('TMPDIR')
+        runCmd('../scripts/pybootchartgui/pybootchartgui.py  %s/buildstats -o %s/charts -f pdf' % (tmpdir, tmpdir))
+
+
+class OEListPackageconfigTests(OEScriptTests):
+    #oe-core.scripts.List_all_the_PACKAGECONFIG's_flags
+    def test_packageconfig_flags_help(self):
+        runCmd('../scripts/contrib/list-packageconfig-flags.py -h')
+
+    def test_packageconfig_flags_default(self):
+        results = runCmd('../scripts/contrib/list-packageconfig-flags.py')
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                                                                    PACKAGECONFIG FLAGS")
+        expected_endlines.append("xserver-xorg-1.20.3                                                            dri dri2 dri3 gcrypt glamor glx nettle openssl systemd systemd-logind udev unwind xinerama xmlto xshmfence xwayland")
+        expected_endlines.append("znc-1.7.1                                                                      ipv6")
+
+        self.check_endlines(results, expected_endlines)
+
+
+    def test_packageconfig_flags_option_flags(self):
+        results = runCmd('../scripts/contrib/list-packageconfig-flags.py -f')
+        expected_endlines = []
+        expected_endlines.append("PACKAGECONFIG FLAG     RECIPE NAMES")
+        expected_endlines.append("xshmfence              xserver-xorg-1.20.3")
+
+        self.check_endlines(results, expected_endlines)
+
+    def test_packageconfig_flags_option_all(self):
+        results = runCmd('../scripts/contrib/list-packageconfig-flags.py -a')
+        expected_endlines = []
+        expected_endlines.append("xserver-xorg-1.20.3")
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
+        results = runCmd('../scripts/contrib/list-packageconfig-flags.py -p')
+        expected_endlines = []
+        expected_endlines.append("RECIPE NAME                                      PACKAGECONFIG FLAGS")
+        expected_endlines.append("xserver-xorg-1.20.3                              dri dri2 dri3 gcrypt glamor glx nettle openssl systemd systemd-logind udev unwind xinerama xmlto xshmfence xwayland")
+
+        self.check_endlines(results, expected_endlines)
+
-- 
2.7.4


