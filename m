Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A325BC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 11:38:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web12.6373.1646221085930728712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AMfKr/4t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 v2-20020a7bcb42000000b0037b9d960079so3086237wmj.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 03:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q25MDOqIi1d1xToARmpLFkefAuo0C1ct4F8jzbAaUto=;
        b=AMfKr/4t/48H22mp/je1JsF5+sqDRMDJ+oXdx+KhkWQpqBshMK3bj4y17Io/usLT+X
         4iazg+T/CEvWcAsIn/rzftUDMUyjFxwY9Y7zTNZwYryn3gOb4N3zyoRmAOv8s51xPIls
         J19rweHwbSFS7y11vbSkxGONAixUNVBgQuwZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q25MDOqIi1d1xToARmpLFkefAuo0C1ct4F8jzbAaUto=;
        b=rb1HgF/PsScjamf2gg+Rsv21PVhih8iSGjOHFiLEnRkTWFFTmThUr1kMJZ4ZzZ7Kqu
         C4klmqGIb8S9EurdH+Dhw77CfzHCMY8tI/ba3Gzy0leR01VV4L50pcoeKuFJo87w+jfD
         dKABCNcD46871a9wdCy/LCPInKIWcFFHLDN5v1HtwdHT5EJgETRLwuJYLDDqbIeVPxKf
         zbK99H+3XXGe0peCDp0jiGQjDh2y1zGL1ZtevKcia/1ivYdpObx2nlfo6EfbRokhUYG+
         2HfBZ3oUAy3/QWS+9AUgPnxiqPKAxfS9lnwkHcmEoIIKBBBcjP7InQvT3nq8GUOTr3GM
         Azwg==
X-Gm-Message-State: AOAM531YfhsI+dwAb0+xQSOPiHHJSiO/MOnXRtiw+rgmWk+9y9HYTFCd
	yQEYJQuyFPmy8ZGjjaPF63C3cvs7Di2KqIIb
X-Google-Smtp-Source: 
 ABdhPJxXcziqo9sZ3Zw6kwjQZwIJFfG7VHg3HyF4aGYnl7e2t5b4iFRKuQ6mKFGqxOhYv4ZRybcXkQ==
X-Received: by 2002:a05:600c:29c7:b0:381:1e6d:feb7 with SMTP id
 s7-20020a05600c29c700b003811e6dfeb7mr20446152wmd.84.1646221083855;
        Wed, 02 Mar 2022 03:38:03 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 m12-20020a7bcb8c000000b003811afe1d45sm5195910wmi.37.2022.03.02.03.38.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:38:03 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] recipetool/devtool: Further SPDX identifier cleanups
Date: Wed,  2 Mar 2022 11:38:02 +0000
Message-Id: <20220302113802.277757-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 11:38:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162607

Some of these are hard to know what to do with since the original source
files for the checksum aren't present. The safe option is to use "-only"
as often the main license is ambiguous and the source files themselves
determine the "or-later" possibility. The "-only" option therefore is
realistically what we need to use in this code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/oelib/license.py | 22 +++---
 meta/lib/oeqa/selftest/cases/recipetool.py    |  8 +--
 scripts/lib/recipetool/create.py              | 10 +--
 scripts/lib/recipetool/licenses.csv           | 72 +++++++++----------
 4 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 6ebbee589fb..3b359396b67 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -15,11 +15,11 @@ class SeenVisitor(oe.license.LicenseVisitor):
 
 class TestSingleLicense(TestCase):
     licenses = [
-        "GPLv2",
-        "LGPL-2.0",
-        "Artistic",
+        "GPL-2.0-only",
+        "LGPL-2.0-only",
+        "Artistic-1.0",
         "MIT",
-        "GPLv3+",
+        "GPL-3.0-or-later",
         "FOO_BAR",
     ]
     invalid_licenses = ["GPL/BSD"]
@@ -67,9 +67,9 @@ class TestComplexCombinations(TestSimpleCombinations):
         "FOO & (BAR | BAZ)&MOO": ["FOO", "BAR", "MOO"],
         "(ALPHA|(BETA&THETA)|OMEGA)&DELTA": ["OMEGA", "DELTA"],
         "((ALPHA|BETA)&FOO)|BAZ": ["BETA", "FOO"],
-        "(GPL-2.0|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0", "BSD-4-clause", "MIT"],
+        "(GPL-2.0-only|Proprietary)&BSD-4-clause&MIT": ["GPL-2.0-only", "BSD-4-clause", "MIT"],
     }
-    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0"]
+    preferred = ["BAR", "OMEGA", "BETA", "GPL-2.0-only"]
 
 class TestIsIncluded(TestCase):
     tests = {
@@ -87,12 +87,12 @@ class TestIsIncluded(TestCase):
             [True, ["BAR", "FOOBAR"]],
         ("(FOO | BAR) & FOOBAR | BAZ & MOO & BARFOO", None, "FOO"):
             [True, ["BAZ", "MOO", "BARFOO"]],
-        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, None):
-            [True, ["GPL-3.0", "GPL-2.0", "LGPL-2.1"]],
-        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, "GPL-3.0"):
+        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, None):
+            [True, ["GPL-3.0-or-later", "GPL-2.0-only", "LGPL-2.1-only"]],
+        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, "GPL-3.0-or-later"):
             [True, ["Proprietary"]],
-        ("GPL-3.0 & GPL-2.0 & LGPL-2.1 | Proprietary", None, "GPL-3.0 Proprietary"):
-            [False, ["GPL-3.0"]]
+        ("GPL-3.0-or-later & GPL-2.0-only & LGPL-2.1-only | Proprietary", None, "GPL-3.0-or-later Proprietary"):
+            [False, ["GPL-3.0-or-later"]]
     }
 
     def test_tests(self):
diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index ca3cf8942d9..510dae6badf 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -343,7 +343,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s -x %s' % (recipefile, srcuri, tempsrc))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = 'GPL-2.0'
+        checkvars['LICENSE'] = 'GPL-2.0-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'
         checkvars['SRC_URI'] = 'https://github.com/logrotate/logrotate/releases/download/${PV}/logrotate-${PV}.tar.xz'
         checkvars['SRC_URI[md5sum]'] = 'a560c57fac87c45b2fc17406cdf79288'
@@ -363,7 +363,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri + ";rev=9f7cf8895ae2d39c465c04cc78e918c157420269", '-x', tempsrc])
         self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
         checkvars = {}
-        checkvars['LICENSE'] = 'LGPL-2.1'
+        checkvars['LICENSE'] = 'LGPL-2.1-only'
         checkvars['LIC_FILES_CHKSUM'] = 'file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34'
         checkvars['S'] = '${WORKDIR}/git'
         checkvars['PV'] = '1.11+git${SRCPV}'
@@ -386,7 +386,7 @@ class RecipetoolCreateTests(RecipetoolBase):
             self.fail('recipetool did not create recipe file; output:\n%s\ndirlist:\n%s' % (result.output, str(dirlist)))
         self.assertEqual(dirlist[0], 'socat_%s.bb' % pv, 'Recipe file incorrectly named')
         checkvars = {}
-        checkvars['LICENSE'] = set(['Unknown', 'GPL-2.0'])
+        checkvars['LICENSE'] = set(['Unknown', 'GPL-2.0-only'])
         checkvars['LIC_FILES_CHKSUM'] = set(['file://COPYING.OpenSSL;md5=5c9bccc77f67a8328ef4ebaf468116f4', 'file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263'])
         # We don't check DEPENDS since they are variable for this recipe depending on what's in the sysroot
         checkvars['S'] = None
@@ -402,7 +402,7 @@ class RecipetoolCreateTests(RecipetoolBase):
         result = runCmd('recipetool create -o %s %s' % (temprecipe, srcuri))
         self.assertTrue(os.path.isfile(recipefile))
         checkvars = {}
-        checkvars['LICENSE'] = set(['LGPL-2.1', 'MPL-1.1'])
+        checkvars['LICENSE'] = set(['LGPL-2.1-only', 'MPL-1.1-only'])
         checkvars['SRC_URI'] = 'http://taglib.github.io/releases/taglib-${PV}.tar.gz'
         checkvars['SRC_URI[md5sum]'] = 'cee7be0ccfc892fa433d6c837df9522a'
         checkvars['SRC_URI[sha256sum]'] = 'b6d1a5a610aae6ff39d93de5efd0fdc787aa9e9dc1e7026fa4c961b26563526b'
diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 0b5d5466ba5..220465ed2f4 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -1108,15 +1108,15 @@ def crunch_license(licfile):
     # https://github.com/waffle-gl/waffle/blob/master/LICENSE.txt
     crunched_md5sums['50fab24ce589d69af8964fdbfe414c60'] = 'BSD-2-Clause'
     # https://github.com/spigwitmer/fakeds1963s/blob/master/LICENSE
-    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] = 'GPL-2.0'
+    crunched_md5sums['88a4355858a1433fea99fae34a44da88'] = 'GPL-2.0-only'
     # http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
-    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] = 'GPL-2.0'
+    crunched_md5sums['063b5c3ebb5f3aa4c85a2ed18a31fbe7'] = 'GPL-2.0-only'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv2.1
-    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] = 'LGPL-2.1'
+    crunched_md5sums['7f5202f4d44ed15dcd4915f5210417d8'] = 'LGPL-2.1-only'
     # unixODBC-2.3.4 COPYING
-    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] = 'LGPL-2.1'
+    crunched_md5sums['3debde09238a8c8e1f6a847e1ec9055b'] = 'LGPL-2.1-only'
     # https://github.com/FFmpeg/FFmpeg/blob/master/COPYING.LGPLv3
-    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] = 'LGPL-3.0'
+    crunched_md5sums['f90c613c51aa35da4d79dd55fc724ceb'] = 'LGPL-3.0-only'
     # https://raw.githubusercontent.com/eclipse/mosquitto/v1.4.14/epl-v10
     crunched_md5sums['efe2cb9a35826992b9df68224e3c2628'] = 'EPL-1.0'
 
diff --git a/scripts/lib/recipetool/licenses.csv b/scripts/lib/recipetool/licenses.csv
index 2a8fdfac05f..9bc11d39a11 100644
--- a/scripts/lib/recipetool/licenses.csv
+++ b/scripts/lib/recipetool/licenses.csv
@@ -1,37 +1,37 @@
-0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0
-12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0
-18810669f13b87348459e611d31ab760,GPL-2.0
-252890d9eee26aab7b432e8b8a616475,LGPL-2.0
-2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1
-3214f080875748938ba060314b4f727d,LGPL-2.0
-385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0
-393a5ca445f6965873eca0259a17f833,GPL-2.0
-3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0
-3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0
-4325afd396febcb659c36b49533135d4,GPL-2.0
-4fbd65380cdd255951079008b364516c,LGPL-2.1
+0636e73ff0215e8d672dc4c32c317bb3,GPL-2.0-only
+12f884d2ae1ff87c09e5b7ccc2c4ca7e,GPL-2.0-only
+18810669f13b87348459e611d31ab760,GPL-2.0-only
+252890d9eee26aab7b432e8b8a616475,LGPL-2.0-only
+2d5025d4aa3495befef8f17206a5b0a1,LGPL-2.1-only
+3214f080875748938ba060314b4f727d,LGPL-2.0-only
+385c55653886acac3821999a3ccd17b3,Artistic-1.0 | GPL-2.0-only
+393a5ca445f6965873eca0259a17f833,GPL-2.0-only
+3b83ef96387f14655fc854ddc3c6bd57,Apache-2.0-only
+3bf50002aefd002f49e7bb854063f7e7,LGPL-2.0-only
+4325afd396febcb659c36b49533135d4,GPL-2.0-only
+4fbd65380cdd255951079008b364516c,LGPL-2.1-only
 54c7042be62e169199200bc6477f04d1,BSD-3-Clause
-55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0
-59530bdf33659b29e73d4adb9f9f6552,GPL-2.0
-5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0
-6a6a8e020838b23406c81b19c1d46df6,LGPL-3
-751419260aa954499f7abaabaa882bbe,GPL-2.0
-7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1
-8ca43cbc842c2336e835926c2166c28b,GPL-2.0
-94d55d512a9ba36caa9b7df079bae19f,GPL-2.0
-9ac2e7cff1ddaf48b6eab6028f23ef88,GPL-2.0
-9f604d8a4f8e74f4f5140845a21b6674,LGPL-2.0
-a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1
-b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0
-bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1
-bfe1f75d606912a4111c90743d6c7325,MPL-1.1
-c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0
-d32239bcb673463ab874e80d47fae504,GPL-3.0
-d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0
-d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1
-db979804f025cf55aabec7129cb671ed,LGPL-2.0
-eb723b61539feef013de476e68b5c50a,GPL-2.0
-ebb5c50ab7cab4baeffba14977030c07,GPL-2.0
-f27defe1e96c2e1ecd4e0c9be8967949,GPL-3.0
-fad9b3332be894bab9bc501572864b29,LGPL-2.1
-fbc093901857fcd118f065f900982c24,LGPL-2.1
+55ca817ccb7d5b5b66355690e9abc605,LGPL-2.0-only
+59530bdf33659b29e73d4adb9f9f6552,GPL-2.0-only
+5f30f0716dfdd0d91eb439ebec522ec2,LGPL-2.0-only
+6a6a8e020838b23406c81b19c1d46df6,LGPL-3.0-only
+751419260aa954499f7abaabaa882bbe,GPL-2.0-only
+7fbc338309ac38fefcd64b04bb903e34,LGPL-2.1-only
+8ca43cbc842c2336e835926c2166c28b,GPL-2.0-only
+94d55d512a9ba36caa9b7df079bae19f,GPL-2.0-only
+9ac2e7cff1ddaf48b6eab6028f23ef88,GPL-2.0-only
+9f604d8a4f8e74f4f5140845a21b6674,LGPL-2.0-only
+a6f89e2100d9b6cdffcea4f398e37343,LGPL-2.1-only
+b234ee4d69f5fce4486a80fdaf4a4263,GPL-2.0-only
+bbb461211a33b134d42ed5ee802b37ff,LGPL-2.1-only
+bfe1f75d606912a4111c90743d6c7325,MPL-1.1-only
+c93c0550bd3173f4504b2cbd8991e50b,GPL-2.0-only
+d32239bcb673463ab874e80d47fae504,GPL-3.0-only
+d7810fab7487fb0aad327b76f1be7cd7,GPL-2.0-only
+d8045f3b8f929c1cb29a1e3fd737b499,LGPL-2.1-only
+db979804f025cf55aabec7129cb671ed,LGPL-2.0-only
+eb723b61539feef013de476e68b5c50a,GPL-2.0-only
+ebb5c50ab7cab4baeffba14977030c07,GPL-2.0-only
+f27defe1e96c2e1ecd4e0c9be8967949,GPL-3.0-only
+fad9b3332be894bab9bc501572864b29,LGPL-2.1-only
+fbc093901857fcd118f065f900982c24,LGPL-2.1-only
-- 
2.32.0


