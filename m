Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.670.1590789816558822958
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sgBw3JsV;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id f185so5648468wmf.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ce9GU/lJXU6kl38QyB1ryo5D8beg+iTfJ1p0Yvy215Q=;
        b=sgBw3JsVWlwQCj9UzXuYdtbxz2gtcRhP5EMKz/rmEUamopqOFT6WG0zKDXumqCd5Jy
         pOS9tE3JTLpr5oY1rFCwaT2g2RQrBlsJH/LT2FxjyoymiTZf5aV0gdONEDp943EkSCLs
         P2yCanB9UODgSybwmXIFS7aR1sz7vNVnotcR+3HGc9SdwK3lV6KF5ygAdG3bCoboB9vc
         wL7vEIXu2fnxC4idvruxcWyK8viVyb+WSvSFRSTGvBXUR52JWiUOtDT1wmU9OG8eu+e4
         UvWdlIfRoEZ6NKbwx6zqd5fp5/y2U6kXvstRRsW0Xd6IvdXURs1AM0LCQ/ySpS/XYZ/m
         MZ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ce9GU/lJXU6kl38QyB1ryo5D8beg+iTfJ1p0Yvy215Q=;
        b=ulz2JYatmqQy+G4NVPZOCYs7jTEO2J1PTj0Qn2vOgh7RrwRuq483ACvF1AzOk7ewsJ
         bTxTYHKPUCTCqorb6YFzymxNMSmAGiN8j2kDKwYwbaEQlmAhVZBMTjOdVoJDwkbAmDcz
         KwNc3f+tOvyWjo3hFAzZ6bKG26ZJZHCEKwia83W60mR4aNFWCl2twVHOwBDPD8iHV1ui
         tJuBiwD1DOVFIWSdK7n+Bx5L/aBgywbv1xtszONcbk/FJn+gHbQk6FHMHSSJ+w3+7/vA
         aq3mmssNviSQa5JLV5odDwzZPIeAXmjQ7154WMk7y/uxzER9gzxIpUU4Wx5af5w/Bvud
         7AIQ==
X-Gm-Message-State: AOAM532PBj3eKiia0L0oRqqEO6aERTPTWPc3zZEouAF1GcQbnpPQA0x0
	lzG/YFXaMULFNCADQZuLQ4Gyi8eQ
X-Google-Smtp-Source: ABdhPJxTderBI0Rjcdt4XhX8KpUMe8up4zSV6zbxjQgCfFvwBH9GksM8um+ujU67CUn04Iq26SV6zg==
X-Received: by 2002:a1c:66d5:: with SMTP id a204mr10222713wmc.134.1590789814786;
        Fri, 29 May 2020 15:03:34 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 30sm11811920wrd.47.2020.05.29.15.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/6] meta-selftest: add test of .gitignore in tarball
Date: Sat, 30 May 2020 00:03:24 +0200
Message-Id: <20200529220328.3480555-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../devtool/devtool-test-ignored.bb           |   9 ++++++
 .../devtool-test-ignored.patch                |   7 +++++
 .../devtool-test-ignored.patch.expected       |  16 +++++++++++
 .../devtool-test-ignored.tar.gz               | Bin 0 -> 205 bytes
 meta/lib/oeqa/selftest/cases/devtool.py       |  26 ++++++++++++++++++
 5 files changed, 58 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.tar.gz

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
new file mode 100644
index 0000000000..6a3d58c884
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored.bb
@@ -0,0 +1,9 @@
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://${BPN}.tar.gz \
+           file://${BPN}.patch"
+
+S = "${WORKDIR}/${BPN}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
new file mode 100644
index 0000000000..96ea0eb4e3
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch
@@ -0,0 +1,7 @@
+diff --git a/ignored b/ignored
+index a579759..e3d7b43 100644
+--- a/ignored
++++ b/ignored
+@@ -1 +1 @@
+-I'm so ignored
++# I'm so ignored
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
new file mode 100644
index 0000000000..68ec6d9875
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.patch.expected
@@ -0,0 +1,16 @@
+From 3a286343cc5cadd83f41d524ee3606ae51df9ee7 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 28 May 2020 01:32:31 +0200
+Subject: [PATCH] meta-selftest: add test of .gitignore in tarball
+
+---
+ ignored | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ignored b/ignored
+index a579759..e3d7b43 100644
+--- a/ignored
++++ b/ignored
+@@ -1 +1 @@
+-I'm so ignored
++# I'm so ignored
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.tar.gz b/meta-selftest/recipes-test/devtool/devtool-test-ignored/devtool-test-ignored.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..b2e9935eb9d3fdbeb24345435b11df2438dfd6eb
GIT binary patch
literal 205
zcmb2|=3oE==C@Zbay1!<9QzpiU1ay`Q@1YUp1+XH(Z#WH!RqJvlU!S#o;6tVpZ_6`
z$hpRT<L*zdcE6kRqv(TY?AF+LF?Ye~Tyu<*ubx|R{g*;XR&G{I)>JXCbhl_l-zS!7
zv263d2X(2vuf1FMFYo1FH__ss{-$C5h6&l5&;QK+e#YKLv3_;TiTI;Z4`$n+|Gy>w
z$%T`eAMdU|e(+S<_x}M`|JC(fO0N8W|9$=J*88l#_cMvfL);7^8{Y0_d|~|5m_dVq
F0RY~yWY_=z

literal 0
HcmV?d00001

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 5886862d6c..0218f0821c 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1108,6 +1108,32 @@ class DevtoolUpdateTests(DevtoolBase):
                            ('??', '.*/0001-Add-new-file.patch$')]
         self._check_repo_status(os.path.dirname(recipefile), expected_status)
 
+    def test_devtool_update_recipe_with_gitignore(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-ignored'
+        bb_vars = get_bb_vars(['FILE'], testrecipe)
+        recipefile = bb_vars['FILE']
+        patchfile = os.path.join(os.path.dirname(recipefile), testrecipe, testrecipe + '.patch')
+        newpatchfile = os.path.join(os.path.dirname(recipefile), testrecipe, testrecipe + '.patch.expected')
+        tempdir = tempfile.mkdtemp(prefix='devtoolqa')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(self.workspacedir)
+        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
+        # (don't bother with cleaning the recipe on teardown, we won't be building it)
+        result = runCmd('devtool modify %s' % testrecipe)
+        self.add_command_to_tearDown('cd %s; rm %s/*; git checkout %s %s' % (os.path.dirname(recipefile), testrecipe, testrecipe, os.path.basename(recipefile)))
+        result = runCmd('devtool finish --force-patch-refresh %s meta-selftest' % testrecipe)
+        # Check recipe got changed as expected
+        with open(newpatchfile, 'r') as f:
+            desiredlines = f.readlines()
+        with open(patchfile, 'r') as f:
+            newlines = f.readlines()
+        # Ignore the initial lines, because oe-selftest creates own meta-selftest repo
+        # which changes the metadata subject which is added into the patch, but keep
+        # .patch.expected as it is in case someone runs devtool finish --force-patch-refresh
+        # devtool-test-ignored manually, then it should generate exactly the same .patch file
+        self.assertEqual(desiredlines[5:], newlines[5:])
+
     def test_devtool_update_recipe_local_files_3(self):
         # First, modify the recipe
         testrecipe = 'devtool-test-localonly'
-- 
2.25.1

