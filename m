Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.673.1590789821387991408
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2020 15:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TEviViTL;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id e1so5656604wrt.5
        for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2020 15:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3HZ5bWRb7Uo617csvWRTDf1HmozQWmHiiETbPr3Nhtg=;
        b=TEviViTLSIr7QNOyKBzvfRzCcMgPGqtpQ5u4Q2YS8cXrxi6Pkf6+qUpWWulzBlRsDa
         HeQ992HiChm/742kp6fl/VZeo9DnbRljagwFvXD7i/YKIBGFjqn01TvB24bEOVNLtbGe
         hCUIc8jhcpL07p0XUmosQdaWLx8LK+re4xCuKBMqO62N9kckyAEz7t32TnZeGEmNpy5c
         FlzozYpzDzqzybntcVU7tvchNKkRajxL19YqUpB0i4LnaZz/xlaHk++PaKcwpG117mqt
         /Dwv3ThTXkOxv23cZkRv9RUIy0MyB9/jb3PnrK22IqtCdGmOkqL4miJmXPgP7SkQmYu9
         EkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HZ5bWRb7Uo617csvWRTDf1HmozQWmHiiETbPr3Nhtg=;
        b=KS9SitPToC+AsTXTCB/iV7kMqSnesqLBngDntNHnbRCx7liurb8EZScp/HBg4rxDG4
         bZl7OTVX1a9A+ycaUmMhZ0XnoPXUdfwZ+vh4L/84Lezkm0A4/qPIXfL5i2ep/m2HasQ/
         YRKrkRVoxoPcg8jbaUjO1/OKCvvZU7DwLF9RgaGVL7/Ap4voFHVICF/SpD75mZHDjjJa
         0VD11JcQyQmfsqPUNPsNOLWThdQQlGRfXzfazHroBYo4ryvb+bGOO005/GxppAr4fPvl
         zX/BziFwZyI2t1HY0IRo+Jh7N0r7aXsTPia0zTRUa5awAN8kGYSqih/+hde18BI9RDIm
         zGqg==
X-Gm-Message-State: AOAM533887QCM0KlgCNFF/7HpQxq6nuNgGGrfHH6PSTPuhK985sSfHXJ
	XgBh8BSLmT7MUDulf6V86ELAn2oc
X-Google-Smtp-Source: ABdhPJx5auHxgnJQdu9IyYIxOGsNGFLVAq074laPZmOYHtr6FJy1vJk3T/GX8IOYfoCUV6dZMJeGUA==
X-Received: by 2002:a5d:45c2:: with SMTP id b2mr10016953wrs.323.1590789819671;
        Fri, 29 May 2020 15:03:39 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id s132sm1287106wmf.12.2020.05.29.15.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 15:03:39 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 6/6] meta-selftest: add test for .patch file with long filename and without subject
Date: Sat, 30 May 2020 00:03:28 +0200
Message-Id: <20200529220328.3480555-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
References: <20200529220328.3480555-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../devtool/devtool-test-long-filename.bb     |   9 ++++++
 ...nly-if-devtool-lets-me-to-do-it-corr.patch |   7 +++++
 ...vtool-lets-me-to-do-it-corr.patch.expected |  16 +++++++++++
 .../devtool-test-long-filename.tar.gz         | Bin 0 -> 180 bytes
 meta/lib/oeqa/selftest/cases/devtool.py       |  27 ++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-test-long-filename/devtool-test-long-filename.tar.gz

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
new file mode 100644
index 0000000000..3ec22cae7f
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename.bb
@@ -0,0 +1,9 @@
+LICENSE = "CLOSED"
+INHIBIT_DEFAULT_DEPS = "1"
+
+SRC_URI = "file://${BPN}.tar.gz \
+           file://0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch"
+
+S = "${WORKDIR}/${BPN}"
+
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
new file mode 100644
index 0000000000..6aaf409ebc
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch
@@ -0,0 +1,7 @@
+diff --git a/patch-me b/patch-me
+index a20b29a..5e35d1b 100644
+--- a/patch-me
++++ b/patch-me
+@@ -1 +1 @@
+-please
++NO
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
new file mode 100644
index 0000000000..1bf25a61d0
--- /dev/null
+++ b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch.expected
@@ -0,0 +1,16 @@
+From 45ba3d107ea60777a6b6e134fd00fe5009749177 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Thu, 28 May 2020 02:03:39 +0200
+Subject: [PATCH] meta-selftest: add test for .patch file with long filename
+
+---
+ patch-me | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/patch-me b/patch-me
+index a20b29a..5e35d1b 100644
+--- a/patch-me
++++ b/patch-me
+@@ -1 +1 @@
+-please
++NO
diff --git a/meta-selftest/recipes-test/devtool/devtool-test-long-filename/devtool-test-long-filename.tar.gz b/meta-selftest/recipes-test/devtool/devtool-test-long-filename/devtool-test-long-filename.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..ab6242aae78dfc2257d44e5caef94f89a269f668
GIT binary patch
literal 180
zcmb2|=3oE==C>Dpxegf!v^`v7>#8T<Q$J~r`i&K>U)ZH>_rG-#Sg4!fc;x%dGf8Y|
zZR@$VUnvb-YM>&z``ePfQl7Q>hvITv`{x)3pPh5@{8z`6)~&6De$yYvq~%QG&NSPd
zaIn<lpVHEdKdM*X{<#zN-#zs6&+m4!=T>pbzn{UhZClKV`+J|f|K!BI()>sM)%nlw
bAAiuk;rBO5h{K@dy#jV)qm{E6G#D5Fy|+>h

literal 0
HcmV?d00001

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0218f0821c..49cee6d6a8 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -1134,6 +1134,33 @@ class DevtoolUpdateTests(DevtoolBase):
         # devtool-test-ignored manually, then it should generate exactly the same .patch file
         self.assertEqual(desiredlines[5:], newlines[5:])
 
+    def test_devtool_update_recipe_long_filename(self):
+        # First, modify the recipe
+        testrecipe = 'devtool-test-long-filename'
+        bb_vars = get_bb_vars(['FILE'], testrecipe)
+        recipefile = bb_vars['FILE']
+        patchfilename = '0001-I-ll-patch-you-only-if-devtool-lets-me-to-do-it-corr.patch'
+        patchfile = os.path.join(os.path.dirname(recipefile), testrecipe, patchfilename)
+        newpatchfile = os.path.join(os.path.dirname(recipefile), testrecipe, patchfilename + '.expected')
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

