Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.181958.1598214086315874747
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=umpe7gWA;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id b17so984586ejq.8
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ciJBXMXbFNcIrt8mwKFzEXAaUjZkOhZ5EqAXai/P/bo=;
        b=umpe7gWArbWM/h62DxglvguUA7Jvn3jGoQgDAN6UnZeS6JmjlLVzEdi2/7cp+q0+X+
         Xoo/1Fkh9BQT6R7NlirLJEu21Z8MJRmjDDEC2M13+hArID+UZBh+uwO3uRjyKQZ8oq18
         VLIa9dAxJFHFCq7pWS6uAirNwTN6atNZ85HtbvCP0sO9Ds28KI2yCQWyQhiItu/4bv0m
         islJD/L/ea7ZmgVW1k6flZBqsuHjcMo6Iu2WeOJVG3kJdfL/0yvhFBf314znIZtK4fGP
         wvrJIkmoVbCCF4PaAQyY9DwjvazQ+7UniQ1AtGsDHOdlVsAdU64fDaAgnVyK628Irb/S
         +vsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ciJBXMXbFNcIrt8mwKFzEXAaUjZkOhZ5EqAXai/P/bo=;
        b=Con2lALuiNmeYDp1+nvOovADaM8Nv8UqHbrXotxLmbRRztQW1seIr9p3UaRQ8Y9ESP
         fF2Zi5gwQv8uo0ogdQLeU9ao6+WPycwdaZQA/gO264PRL/rn3UGgUm17glPqMCzyzJke
         El3Fx8UrROwOHnLoHmgSrErO2vd5jxQ0gtO5keqMNHSMfbmEU+M/A+pd+yRz5HQu48Pf
         rlI7Rs5gk78KPwV6xl7wEVkh0HrudYg4uwxOS2WXr46XpJi//AcXkQ/r5f54r7fm4XG3
         dHhb+jiD9/gqzVvPiB/vWP5OK5+1ZrKCFg5sj6IHv2697A9NmewrjdjQH3G2F/8fiLT1
         OVIQ==
X-Gm-Message-State: AOAM530zgA2rY612CtuzfBnF6fcmB0gq8YXlbL2BZNpLVKfC4rxhqK+9
	s6pzat2oHAhpZDtigjKOtyDAbZvmaG0=
X-Google-Smtp-Source: ABdhPJyLNvr78BJkZbqG6aJJ7YvxUD0d1Gp0yvaeAXB82ikfkfGULtmoZpLqfLGELG+yF7bZc2DP5Q==
X-Received: by 2002:a17:906:311a:: with SMTP id 26mr2641187ejx.43.1598214084335;
        Sun, 23 Aug 2020 13:21:24 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:23 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/37] mc: upgrade 4.8.24 -> 4.8.25
Date: Sun, 23 Aug 2020 22:20:14 +0200
Message-Id: <20200823202031.24686-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Makefile.am-install-mc.lib-only-onc.patch | 59 -------------------
 .../mc/{mc_4.8.24.bb => mc_4.8.25.bb}         |  4 +-
 2 files changed, 1 insertion(+), 62 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
 rename meta/recipes-extended/mc/{mc_4.8.24.bb => mc_4.8.25.bb} (91%)

diff --git a/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch b/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
deleted file mode 100644
index 824c12f8d2..0000000000
--- a/meta/recipes-extended/mc/files/0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 58dd59637ac5c6340ddfe96ad8b76883e4da20ef Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Tue, 3 Mar 2020 09:26:12 +0000
-Subject: [PATCH] Ticket #4070: misc/Makefile.am: install mc.lib only once.
-
-Before the change mc.lib was installed twice due to being
-in two _DATA variables:
-
-dist_pkgdata_DATA = \
-        mc.lib
-
-pkgdata_DATA = \
-        $(dist_pkgdata_DATA) \
-        $(PKGDATA_OUT)
-
-This causes occasional install failures when two parallel
-`/usr/bin/install` calls race in installing the file:
-
-$ make -j20 DESTDIR=/var/tmp/portage/app-misc/mc-4.8.24/image install
-...
- /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
-    -c -m 644 mc.lib '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
- /usr/lib/portage/python3.6/ebuild-helpers/xattr/install \
-    -c -m 644 mc.lib mc.charsets '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc'
-...
- /usr/bin/install: cannot create regular file
-   '/var/tmp/portage/app-misc/mc-4.8.24/image/usr/share/mc/mc.lib': File exists
-
-After the change mc.lib is present only in dist_pkgdata_DATA.
-
-Upstream-Status: Backport [https://github.com/MidnightCommander/mc/commit/afb09f7cd7024484845ade25e15b8b93d6cf2d2c]
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-Signed-off-by: Andrew Borodin <aborodin@vmail.ru>
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- misc/Makefile.am | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/misc/Makefile.am b/misc/Makefile.am
-index 8ed1826..24f4a0e 100644
---- a/misc/Makefile.am
-+++ b/misc/Makefile.am
-@@ -17,7 +17,6 @@ dist_pkgdata_DATA = \
- 	mc.lib
- 
- pkgdata_DATA = \
--	$(dist_pkgdata_DATA) \
- 	$(PKGDATA_OUT)
- 
- SCRIPTS_IN = \
-@@ -54,7 +53,6 @@ EXTRA_DIST = \
- 	$(LIBFILES_SCRIPT) \
- 	$(SCRIPTS_IN) \
- 	$(noinst_DATA) \
--	$(dist_pkgdata_DATA) \
- 	$(PKGDATA_IN)
- 
- install-data-hook:
diff --git a/meta/recipes-extended/mc/mc_4.8.24.bb b/meta/recipes-extended/mc/mc_4.8.25.bb
similarity index 91%
rename from meta/recipes-extended/mc/mc_4.8.24.bb
rename to meta/recipes-extended/mc/mc_4.8.25.bb
index 034df2a422..83c8a6ecf6 100644
--- a/meta/recipes-extended/mc/mc_4.8.24.bb
+++ b/meta/recipes-extended/mc/mc_4.8.25.bb
@@ -10,10 +10,8 @@ RRECOMMENDS_${PN} = "ncurses-terminfo"
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://0001-mc-replace-perl-w-with-use-warnings.patch \
            file://nomandate.patch \
-           file://0001-Ticket-4070-misc-Makefile.am-install-mc.lib-only-onc.patch \
            "
-SRC_URI[md5sum] = "2621de1fa9058a9c41a4248becc969f9"
-SRC_URI[sha256sum] = "cfcc4d0546d0c3a88645a8bf71612ed36647ea3264d973b1f28183a0c84bae34"
+SRC_URI[sha256sum] = "407dc20f70082f26c7f5716406cb755cbb6cba3f2f13b841b79a991282d310c2"
 
 inherit autotools gettext pkgconfig
 
-- 
2.28.0

