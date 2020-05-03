Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.25491.1588523195886091744
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkN3VEYg;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id d17so17954930wrg.11
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0kx+A1ok1kbPHly7Q7sp7RMGnlSpOifDRaaJbyEmNbQ=;
        b=dkN3VEYgLPMpV/O5cZ9AUf0DifC4zoTfMIZuFnzWrvlY6JMIyygmfcwRGzKi4Yl7ju
         fAcFrjQjEJwozI1Lt35DoZF3h5G4jjEgV7e88jt+GMrRf36n8SSYUTKJXLYFmCF0IIqh
         Vsw3dit3GoWPg34Ogvd7DJE/+E1i75nam6ZgpHCcFDXnKNzmXfgh3wddYh39j5oJzqCw
         hsn6AfVuw1RLDLxmSC5+9E5wVTKPrcQFDWwvt3coa1lyKGYAqnuJ7Xz5Xb2Bx+EqnddR
         xf5JdvDKtFjC0FLPgeotzRRUL93ecZzU0WvnMm7RgDDISDBqQXalhN3sRu8zM3WwP+Hp
         KhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0kx+A1ok1kbPHly7Q7sp7RMGnlSpOifDRaaJbyEmNbQ=;
        b=fqCVMgltYgBpV+H1zlgH1N6zQgE+HAXIm2rfODXbXuOjA+gUQd+U7qoZZHPo/zh3IX
         Q0uGjZBj2dMI/8HpKRnXM8TW/XTwtyi3LQKdpZ9mg/wd//hSaG8P16EHNgCbYQkkiY5E
         ORMYEj7cvRE0sBrzjZHW7gTMErWapqPVQtRhaxZjaanHXgnAhynu1FZdTWToIdGNU9Us
         Ch7INSJwsFne4fga46ICFP+aeajT4NRNmYKxbieBQ9gfv4cJaYLdgT6k3jC0TAoT6JdJ
         F9DzpifZ4gEvTnTrzhUjvP5EPUOkGgTnEKJI1LsxeQXZ6G4/uBstqNGi9On/CA8iSWdu
         dSOQ==
X-Gm-Message-State: AGi0PuZbSHwJDY36wRrTYw0LdezZoekoKyblm4FtJTWFcSj0EqsFo7ps
	MoM/W2LYCKz1Me7RcbJy5pfIYvEb
X-Google-Smtp-Source: APiQypKUPfji41MNYTcvwGkTxjcTRbsxBgY+3lfpEeDMXnkHPmJIO1FY83ZZ6MuqxNM6DyrtIHr2Yg==
X-Received: by 2002:adf:fe41:: with SMTP id m1mr14542740wrs.52.1588523194178;
        Sun, 03 May 2020 09:26:34 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:33 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/17] clutter-1.0: update to 1.26.4
Date: Sun,  3 May 2020 18:25:48 +0200
Message-Id: <20200503162559.946-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/clutter/clutter-1.0.inc    |  2 +-
 .../run-installed-tests-with-tap-output.patch    | 16 +++++++---------
 ...utter-1.0_1.26.2.bb => clutter-1.0_1.26.4.bb} |  4 ++--
 3 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-graphics/clutter/{clutter-1.0_1.26.2.bb => clutter-1.0_1.26.4.bb} (67%)

diff --git a/meta/recipes-graphics/clutter/clutter-1.0.inc b/meta/recipes-graphics/clutter/clutter-1.0.inc
index e0ac819e4c..80472178be 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-1.0.inc
@@ -11,7 +11,7 @@ REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 DEPENDS = "pango glib-2.0 json-glib atk udev cogl-1.0"
 PACKAGE_BEFORE_PN += "${PN}-examples"
-AUTOTOOLS_AUXDIR = "${S}/build"
+AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
 EDEPENDS_X11 = "virtual/libx11 libxi libxfixes"
 EDEPENDS_GLX = "virtual/libgl"
diff --git a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
index f5c18c5828..fef82eaf92 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
+++ b/meta/recipes-graphics/clutter/clutter-1.0/run-installed-tests-with-tap-output.patch
@@ -1,4 +1,4 @@
-From 668e1d14af13249384ab324c7d79ec4147f07e48 Mon Sep 17 00:00:00 2001
+From d6ceb5a44b28e0e50ede22b84984d8516897de4b Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Mon, 27 Apr 2015 20:12:33 +0300
 Subject: [PATCH] Run installed tests with tap output
@@ -9,14 +9,15 @@ gnome-desktop-testing-runner properly interprets the results.
 Upstream-Status: Pending
 
 Signed-off-by: Tim Orling <TicoTimo@gmail.com>
+
 ---
- build/autotools/glib-tap.mk | 3 ++-
+ build-aux/autotools/glib-tap.mk | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/build/autotools/glib-tap.mk b/build/autotools/glib-tap.mk
-index 7c5f82b..844e17e 100644
---- a/build/autotools/glib-tap.mk
-+++ b/build/autotools/glib-tap.mk
+diff --git a/build-aux/autotools/glib-tap.mk b/build-aux/autotools/glib-tap.mk
+index a4f0dad..51cfa31 100644
+--- a/build-aux/autotools/glib-tap.mk
++++ b/build-aux/autotools/glib-tap.mk
 @@ -127,7 +127,8 @@ installed_test_meta_DATA = $(installed_testcases:=.test)
  %.test: %$(EXEEXT) Makefile
  	$(AM_V_GEN) (echo '[Test]' > $@.tmp; \
@@ -27,6 +28,3 @@ index 7c5f82b..844e17e 100644
  	mv $@.tmp $@)
  
  CLEANFILES += $(installed_test_meta_DATA)
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb b/meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
similarity index 67%
rename from meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb
rename to meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
index 48b050198a..ee549fbdd5 100644
--- a/meta/recipes-graphics/clutter/clutter-1.0_1.26.2.bb
+++ b/meta/recipes-graphics/clutter/clutter-1.0_1.26.4.bb
@@ -2,8 +2,8 @@ require clutter-1.0.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[archive.md5sum] = "a03482cbacf735eca8c996f210a21ee5"
-SRC_URI[archive.sha256sum] = "e7233314983055e9018f94f56882e29e7fc34d8d35de030789fdcd9b2d0e2e56"
+SRC_URI[archive.md5sum] = "624dd776a5159de0267587b1df6b97b2"
+SRC_URI[archive.sha256sum] = "8b48fac159843f556d0a6be3dbfc6b083fc6d9c58a20a49a6b4919ab4263c4e6"
 SRC_URI += "file://install-examples.patch \
             file://run-installed-tests-with-tap-output.patch \
             file://0001-Remove-clutter.types-as-it-is-build-configuration-sp.patch \
-- 
2.26.1

