Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.15378.1631124105190861787
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 11:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SVc1sTFZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso2275925wmb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 11:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I6pwZKZGnCH/b6j2W3HSB4CphSY0SmP4IGk1afvi5VM=;
        b=SVc1sTFZIUVBByPfhkpFjO1efYIyrVneS/I+LWR2EODmtXN8Vbj2FnFynoZkPBuQHE
         bxlD7H4q7ERKMIXmJ4PUzGrRWgk8O2Do4IP9K0Bvc5iIUMVF/gnphLHSAn5wMlrjlat9
         mFOtrVT3NGHYm/T/c6u8HdfP7DEZA/ivXJffA3vEiPKW+EuyvN3u/1Ida/k4L9Mi/EaU
         Efcl1wgdl6E+G3hXAXw2dN/+hthB0lIFsBGUpLmDpJmNKYahXeDhr/qQ2cJONV29TLHO
         K05o/gMEdYZVEFIIZ+cwAKJV0wQh7b0yiOalrTGpqssz008xD3QVDpnasj82/7EjYimp
         EFyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6pwZKZGnCH/b6j2W3HSB4CphSY0SmP4IGk1afvi5VM=;
        b=yAI6GZRlilqIkR1lI5UQlf4Dn7hhQdvIQF6hZwkL4WAXI37eBbAP/5OAOZiIML8aQu
         rrm1KOuhpOQvhu7DLF2D6kcLvhG8xNMQFprreT+tdKo+j8hnyCMrFONxjvUsitMSiR7F
         xbGd7uc0lXexSdCiGdmiXw2pvhQ2kuNehVN6pyfjvEOrLic9kEzTnI0BdwQH8w6cJ7xn
         tdosNA0vxYemM+xx0gkmlQm6NDE/G7EYAtZQT7/VQ9vqZ7AYI8TMS4nVpRFj6wOUioVs
         IXju4FOzj+66GwIQcehbFN+jiH7zO4IvZPFwHWfd0VNK+9gKryClChweqaPjs8bazuzI
         ZZpQ==
X-Gm-Message-State: AOAM533uJni6N0vEorZtgBD471wcCXGjCwuI+fls15rIcm3kJjZ/jDuO
	P9kEaJ7xJV3szO5WHowkFbIbEXfLnFI=
X-Google-Smtp-Source: ABdhPJxACsYVXwJFrgpXYlkXYkK1BOLTz9j6ACyIsfIrkL1RQmSVyGKRfjfyBBto2iOFwRCQHoXFNg==
X-Received: by 2002:a7b:cf35:: with SMTP id m21mr4944281wmg.192.1631124103739;
        Wed, 08 Sep 2021 11:01:43 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:29b:3b00:d35d:e3cf:58b5:748b])
        by smtp.gmail.com with ESMTPSA id s14sm2539648wmc.25.2021.09.08.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Sep 2021 11:01:43 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 22/26] libpam: update 1.5.1 -> 1.5.2
Date: Wed,  8 Sep 2021 20:01:21 +0200
Message-Id: <20210908180125.103473-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210908180125.103473-1-alex.kanavin@gmail.com>
References: <20210908180125.103473-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex@linutronix.de>

Drop patches: issues fixed upstream.

Move .pc files to correct place as libpam is instructed to install them in /lib via
--libdir.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Makefile.am-support-usrmage.patch    | 28 -------------------
 ...space-Makefile.am-correctly-install-.patch | 28 -------------------
 .../pam/{libpam_1.5.1.bb => libpam_1.5.2.bb}  |  7 +++--
 3 files changed, 4 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
 rename meta/recipes-extended/pam/{libpam_1.5.1.bb => libpam_1.5.2.bb} (96%)

diff --git a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch b/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
deleted file mode 100644
index 5c6bc92705..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-Makefile.am-support-usrmage.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From c09e012590c1ec2d3b622b64f1bfc10a2286c9ea Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Wed, 6 Jan 2021 12:08:20 +0800
-Subject: [PATCH] Makefile.am: support usrmage
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- modules/pam_namespace/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
-index ddd5fc0..a1f1bec 100644
---- a/modules/pam_namespace/Makefile.am
-+++ b/modules/pam_namespace/Makefile.am
-@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
- securelibdir = $(SECUREDIR)
- secureconfdir = $(SCONFIGDIR)
- namespaceddir = $(SCONFIGDIR)/namespace.d
--servicedir = /lib/systemd/system
-+servicedir = $(systemd_system_unitdir)
- 
- AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
-         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
--- 
-2.17.1
-
diff --git a/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch b/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
deleted file mode 100644
index b41d1e5962..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-modules-pam_namespace-Makefile.am-correctly-install-.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e2db4082f6b988f1d5803028e9e47aee5f3519ac Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Sun, 27 Dec 2020 00:30:45 +0100
-Subject: [PATCH] modules/pam_namespace/Makefile.am: correctly install systemd
- unit file
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- modules/pam_namespace/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/modules/pam_namespace/Makefile.am b/modules/pam_namespace/Makefile.am
-index 21e1b33..ddd5fc0 100644
---- a/modules/pam_namespace/Makefile.am
-+++ b/modules/pam_namespace/Makefile.am
-@@ -18,7 +18,7 @@ TESTS = $(dist_check_SCRIPTS)
- securelibdir = $(SECUREDIR)
- secureconfdir = $(SCONFIGDIR)
- namespaceddir = $(SCONFIGDIR)/namespace.d
--servicedir = $(prefix)/lib/systemd/system
-+servicedir = /lib/systemd/system
- 
- AM_CFLAGS = -I$(top_srcdir)/libpam/include -I$(top_srcdir)/libpamc/include \
-         -DSECURECONF_DIR=\"$(SCONFIGDIR)/\" $(WARN_CFLAGS)
--- 
-2.24.0
-
diff --git a/meta/recipes-extended/pam/libpam_1.5.1.bb b/meta/recipes-extended/pam/libpam_1.5.2.bb
similarity index 96%
rename from meta/recipes-extended/pam/libpam_1.5.1.bb
rename to meta/recipes-extended/pam/libpam_1.5.2.bb
index efcd27137f..a3c4a50cb3 100644
--- a/meta/recipes-extended/pam/libpam_1.5.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.5.2.bb
@@ -21,18 +21,17 @@ SRC_URI = "https://github.com/linux-pam/linux-pam/releases/download/v${PV}/Linux
            file://pam.d/common-session-noninteractive \
            file://pam.d/other \
            file://libpam-xtests.patch \
-           file://0001-modules-pam_namespace-Makefile.am-correctly-install-.patch \
-           file://0001-Makefile.am-support-usrmage.patch \
            file://run-ptest \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "201d40730b1135b1b3cdea09f2c28ac634d73181ccd0172ceddee3649c5792fc"
+SRC_URI[sha256sum] = "e4ec7131a91da44512574268f493c6d8ca105c87091691b8e9b56ca685d4f94d"
 
 DEPENDS = "bison-native flex flex-native cracklib libxml2-native virtual/crypt"
 
 EXTRA_OECONF = "--includedir=${includedir}/security \
                 --libdir=${base_libdir} \
+                --with-systemdunitdir=${systemd_system_unitdir} \
                 --disable-nis \
                 --disable-regenerate-docu \
                 --disable-doc \
@@ -148,6 +147,8 @@ do_install() {
 	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		echo "session optional pam_systemd.so" >> ${D}${sysconfdir}/pam.d/common-session
 	fi
+        install -d ${D}/${libdir}/
+	mv ${D}/${base_libdir}/pkgconfig ${D}/${libdir}/
 }
 
 do_install_ptest() {
-- 
2.31.1

