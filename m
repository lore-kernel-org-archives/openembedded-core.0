Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.2397.1609185886699304500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AiZORSx/;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id g20so15622852ejb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z9vOA1AM2sWODHhkNyscDucvYTExK+8kk+kmh3Kp4Zc=;
        b=AiZORSx/5yo/7J0f/bGCC366mpUEVtOQUIfMomXQ/NZqyYHIFvwZfC78iZjN4B5tO6
         yfO+4OUPXA2JxIq1nwLxfJ/PW5pL0buibwouK49Xtomv7Q+cSqSaQW73F+Td2hLFhYUd
         KV+7SPuIOVGxfT+leUNvDu+2IIOZbtYnywt9QMK5rr6ASFX+NRF5ftzptUtTbX85x9jc
         DrXQsrdXeXfGLHacz3yRvXqc+gYKWN3LnJ9V32SLQUeLtf3niN+xCDXIPdwXv2HnbpiP
         y3lUdVKUFUdQPIG1XseNXFMx4Rt3UffKt5wESRk1a8fyVCEgH3VGsqeZxLdzXe6TZ0Gs
         QuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z9vOA1AM2sWODHhkNyscDucvYTExK+8kk+kmh3Kp4Zc=;
        b=aw6JZn1Zjm1B5fjylHmnX7u/dO8NFk9zqBDeb00IMBhfF3+MqQWEp4gl0t99L7YOg1
         C0F3S26vWUOb22lnqBBjpNtxEoyx7e+SG3+lK0WfvIuyUV8bd0ItEJON/zMEetMBEZJ/
         tKWd4rxU0IScSdcMIilKeOiq8E0ddMmvqRAZe07spq1o0bq1HJL2i5IB1GmqdW0RWRvQ
         NUmlT38iOn8kGiXxuQBQR7f/GAQi6tYWcuALACVgqYCbzwX+nMGhrPAKCptq5dKof64X
         iBp8K2bqJtE3MLsQioFUffO4Yr9g80sxDvgLOnk8t5edPymKFKWc8+xIa8fih8d6xYUe
         hHHQ==
X-Gm-Message-State: AOAM531+JUHp6LaQDli7HOOFI+dbIhocieMK5oxNHjqSZbQnZIaMvnFk
	xI7nZpuVhGIwD5cktFccriHyPXW4hew=
X-Google-Smtp-Source: ABdhPJw9wg5Iah/gWrePRODc/aNJIFP8q9Fgg4lQNOZgm+9SqGJI3ChXKygs0OQxMq7KghH7EnAyQQ==
X-Received: by 2002:a17:907:3fa3:: with SMTP id hr35mr43107644ejc.71.1609185885254;
        Mon, 28 Dec 2020 12:04:45 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:44 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/22] libjitterentropy: update 2.2.0 -> 3.0.0
Date: Mon, 28 Dec 2020 21:04:18 +0100
Message-Id: <20201228200436.78130-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Make-man-pages-reproducible.patch    | 30 ----------
 ...akefile-cleanup-install-for-rebuilds.patch | 56 -------------------
 ...opy_2.2.0.bb => libjitterentropy_3.0.0.bb} |  8 +--
 3 files changed, 3 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
 delete mode 100644 meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
 rename meta/recipes-support/libjitterentropy/{libjitterentropy_2.2.0.bb => libjitterentropy_3.0.0.bb} (79%)

diff --git a/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch b/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
deleted file mode 100644
index 57b336c0c0..0000000000
--- a/meta/recipes-support/libjitterentropy/files/0001-Make-man-pages-reproducible.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ce091718716400119d6be6bd637c0e3f4f6ca315 Mon Sep 17 00:00:00 2001
-From: Joshua Watt <JPEWhacker@gmail.com>
-Date: Thu, 21 Nov 2019 08:07:41 -0600
-Subject: [PATCH] Make man pages reproducible
-
-Instructs the man page to be gzip'ed without the file name or timestamp
-so that it builds reproducibly.
-
-Upstream-Status: Backport [https://github.com/smuellerDD/jitterentropy-library/pull/14]
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 2e78607..860b720 100644
---- a/Makefile
-+++ b/Makefile
-@@ -60,7 +60,7 @@ cppcheck:
- install:
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
- 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
--	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
-+	gzip -n -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
- 	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
--- 
-2.23.0
-
diff --git a/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch b/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
deleted file mode 100644
index 9af334ce2c..0000000000
--- a/meta/recipes-support/libjitterentropy/files/0001-Makefile-cleanup-install-for-rebuilds.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 060b9b4147f6e5ff386a8b017796118d783e59fa Mon Sep 17 00:00:00 2001
-From: Matt Weber <matthew.weber@rockwellcollins.com>
-Date: Tue, 22 Oct 2019 12:44:30 -0500
-Subject: [PATCH] Makefile: cleanup install for rebuilds
-
-Support the ability to rebuild and redeploy without a clean. This
-required some force linking and man archive creation.
-
-Provide the ability to override the stripping of the shared lib for
-cases where a embedded target build may want to control stripping
-or provide cross arch tools.
-
-Upstream-Status: Backport [060b9b4147f6e5ff386a8b017796118d783e59fa]
-Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
-Signed-off-by: Stephan Mueller <smueller@chronox.de>
-Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
----
- Makefile | 10 ++++++----
- 1 file changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4ff069b..2e78607 100644
---- a/Makefile
-+++ b/Makefile
-@@ -14,6 +14,8 @@ LIBDIR := lib
- # include target directory
- INCDIR := include
- 
-+INSTALL_STRIP ?= install -s
-+
- NAME := jitterentropy
- LIBMAJOR=$(shell cat jitterentropy-base.c | grep define | grep MAJVERSION | awk '{print $$3}')
- LIBMINOR=$(shell cat jitterentropy-base.c | grep define | grep MINVERSION | awk '{print $$3}')
-@@ -58,15 +60,15 @@ cppcheck:
- install:
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/share/man/man3
- 	install -m 644 doc/$(NAME).3 $(DESTDIR)$(PREFIX)/share/man/man3/
--	gzip -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
-+	gzip -f -9 $(DESTDIR)$(PREFIX)/share/man/man3/$(NAME).3
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(LIBDIR)
--	install -m 0755 -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
-+	$(INSTALL_STRIP) -m 0755 lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/
- 	install -d -m 0755 $(DESTDIR)$(PREFIX)/$(INCDIR)
- 	install -m 0644 jitterentropy.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	install -m 0644 jitterentropy-base-user.h $(DESTDIR)$(PREFIX)/$(INCDIR)/
- 	$(RM) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
--	ln -s lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
--	ln -s lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
-+	ln -sf lib$(NAME).so.$(LIBVERSION) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so.$(LIBMAJOR)
-+	ln -sf lib$(NAME).so.$(LIBMAJOR) $(DESTDIR)$(PREFIX)/$(LIBDIR)/lib$(NAME).so
- 
- clean:
- 	@- $(RM) $(NAME)
--- 
-2.23.0
-
diff --git a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb
similarity index 79%
rename from meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
rename to meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb
index 710ef0172d..953ecfd055 100644
--- a/meta/recipes-support/libjitterentropy/libjitterentropy_2.2.0.bb
+++ b/meta/recipes-support/libjitterentropy/libjitterentropy_3.0.0.bb
@@ -5,14 +5,12 @@ stamp. It is a small-scale, yet fast entropy source that is viable in almost \
 all environments and on a lot of CPU architectures."
 HOMEPAGE = "http://www.chronox.de/jent.html"
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a95aadbdfae7ed812bb2b7b86eb5981c \
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb16b29576d4c43a9dcd6a40fb3310c7 \
                     file://COPYING.gplv2;md5=eb723b61539feef013de476e68b5c50a \
                     file://COPYING.bsd;md5=66a5cedaf62c4b2637025f049f9b826f \
                     "
-SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git \
-           file://0001-Makefile-cleanup-install-for-rebuilds.patch \
-           file://0001-Make-man-pages-reproducible.patch"
-SRCREV = "933a44f33ed3d6612f7cfaa7ad1207c8da4886ba"
+SRC_URI = "git://github.com/smuellerDD/jitterentropy-library.git"
+SRCREV = "a37e57d9b939d1f93a1b92e1486edd44a3c1cb4c"
 S = "${WORKDIR}/git"
 
 do_configure[noexec] = "1"
-- 
2.29.2

