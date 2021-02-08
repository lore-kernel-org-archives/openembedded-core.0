Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.33751.1612781980356356047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 02:59:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=trDaeGFl;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id lg21so23915947ejb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 02:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/ZPMdPZJm9InFFVpL/5oN/pYIotPv8GT++vZ4Ka19w=;
        b=trDaeGFlIyfNeaS+9SBaoBrRsgHa58TRbChLiqaxY7FuvUn4g3cGo3g6Q6p+nmY2yq
         LV0OxdHOKkVL6sv6XjJWj2fqiGYh87PJ8Oo3C6C+AyZ11xJvD/xPlhVRXsWVymwnlUgy
         yGAy6f+SbEffnXOvoMBdjGr7fyuulLTRtMdAwM8X1w7LqcdnfRS65TO8lDgvv6gHp+wJ
         AI8oHh9xnHYYVEcJkJwvfHBoF0d9TFbu22zsVmKbgd7DUUBDcZ51COugnHviH0I4qSID
         dBE2upzmZ4eEG5axforlvnl5nSPBtzW2EvMfh2qiTvQSYA57sby07wTYwL9fcAzvK3PV
         0wmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1/ZPMdPZJm9InFFVpL/5oN/pYIotPv8GT++vZ4Ka19w=;
        b=EICYQkIJerfNvMFtFXTDszKED98P/25UJx2q4EJUIAphm15RJ/md3pb8TjARuMT0QS
         EONKELcrVNKvJGoxb0eiaQtloKf8yUJ2bI+vdeolNz7MKytJQVEG0hMnMCJpvkK55AeU
         oM19+ywid2qGr+fguGKybfMLNscwesBfzaZ6R7XnvoGXABQyBAPji+qOgI+VSmOrcvmw
         +vKtwG0/Kh6hC62Z34+AthaGksHeB2bwDwLDzZzz+u1urNVnVv3S2+6uFPneiZMAzWjC
         DAZczl/Xdum2SoigT8tCo7E+8N9akxxVzUP7/OzoUlEnand5juLm6BoWSgGPre3Obl3Q
         QdDw==
X-Gm-Message-State: AOAM532JNkvE0gB2/cHLNhbUJq+bH+VJorfv9EOWUjuNIolccyTZ6lyx
	IUGTgSZM3DoGGE+s0AlwhMJVCMpCnfvU+Q==
X-Google-Smtp-Source: ABdhPJxUaeGrGzaXeRQuJQBtiXWFjnAy5LsnGKqSifm+DkhI5C/ynZmsNUkomaCs7CE9nphxjF1Rzg==
X-Received: by 2002:a17:906:5cf:: with SMTP id t15mr8165003ejt.128.1612781978618;
        Mon, 08 Feb 2021 02:59:38 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id t19sm8382226ejc.62.2021.02.08.02.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 02:59:38 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/12] distcc: update 3.3.3 -> 3.3.5
Date: Mon,  8 Feb 2021 11:59:21 +0100
Message-Id: <20210208105932.347925-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{distcc_3.3.3.bb => distcc_3.3.5.bb}      |   9 +-
 ...cc-10-which-defaults-to-fno-common-c.patch |  34 -----
 .../distcc/files/fix-gnome.patch              | 122 ------------------
 .../distcc/files/separatebuilddir.patch       |  33 -----
 4 files changed, 4 insertions(+), 194 deletions(-)
 rename meta/recipes-devtools/distcc/{distcc_3.3.3.bb => distcc_3.3.5.bb} (91%)
 delete mode 100644 meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch
 delete mode 100644 meta/recipes-devtools/distcc/files/fix-gnome.patch
 delete mode 100644 meta/recipes-devtools/distcc/files/separatebuilddir.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
similarity index 91%
rename from meta/recipes-devtools/distcc/distcc_3.3.3.bb
rename to meta/recipes-devtools/distcc/distcc_3.3.5.bb
index d92b9c3046..d2ea9c8a6a 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.5.bb
@@ -15,14 +15,13 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 RRECOMMENDS_${PN}-server = "avahi-daemon"
 
 SRC_URI = "git://github.com/distcc/distcc.git \
-           file://fix-gnome.patch \
-           file://separatebuilddir.patch \
-           file://0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch \
            file://default \
            file://distcc \
-           file://distcc.service"
-SRCREV = "4cde9bcfbda589abd842e3bbc652ce369085eaae"
+           file://distcc.service \
+           "
+SRCREV = "8572e2a1af39e69b2a2d74622fed6d2dd7dca9b7"
 S = "${WORKDIR}/git"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
diff --git a/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch b/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch
deleted file mode 100644
index 86c07c11f8..0000000000
--- a/meta/recipes-devtools/distcc/files/0001-Fix-build-with-gcc-10-which-defaults-to-fno-common-c.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 98530865795300008fe06bb647a6fc2dddfc7967 Mon Sep 17 00:00:00 2001
-From: Romain Geissler <romain.geissler@amadeus.com>
-Date: Mon, 27 Jan 2020 09:28:43 +0000
-Subject: [PATCH] Fix build with gcc 10 which defaults to -fno-common (cf
- https://gcc.gnu.org/gcc-10/porting_to.html)
-
-This fixes the following link error I see when I use the latest gcc 10
-git branch:
-/opt/1A/toolchain/x86_64-v20.0.7/lib/gcc/x86_64-1a-linux-gnu/10.0.1/../../../../x86_64-1a-linux-gnu/bin/ld: src/serve.o:(.bss+0x0): multiple definition of `stats_text'; src/prefork.o:(.bss+0x0): first defined here
-/opt/1A/toolchain/x86_64-v20.0.7/lib/gcc/x86_64-1a-linux-gnu/10.0.1/../../../../x86_64-1a-linux-gnu/bin/ld: src/stats.o:(.data+0x20): multiple definition of `stats_text'; src/prefork.o:(.bss+0x0): first defined here
-collect2: error: ld returned 1 exit status
-
-Upstream-Status: Backport [https://github.com/distcc/distcc/pull/373]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/stats.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/stats.h b/src/stats.h
-index 9bde285..74d4690 100644
---- a/src/stats.h
-+++ b/src/stats.h
-@@ -33,7 +33,7 @@ enum stats_e { STATS_TCP_ACCEPT, STATS_REJ_BAD_REQ, STATS_REJ_OVERLOAD,
-                 STATS_COMPILE_OK, STATS_COMPILE_ERROR, STATS_COMPILE_TIMEOUT,
-                 STATS_CLI_DISCONN, STATS_OTHER, STATS_ENUM_MAX };
- 
--const char *stats_text[20];
-+extern const char *stats_text[20];
- 
- int  dcc_stats_init(void);
- void dcc_stats_init_kid(void);
--- 
-2.28.0
-
diff --git a/meta/recipes-devtools/distcc/files/fix-gnome.patch b/meta/recipes-devtools/distcc/files/fix-gnome.patch
deleted file mode 100644
index f1f5ed1a9f..0000000000
--- a/meta/recipes-devtools/distcc/files/fix-gnome.patch
+++ /dev/null
@@ -1,122 +0,0 @@
-Upstream-Status: Backport [https://github.com/distcc/distcc/pull/319]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 2faacc2be8d7eeee0a3f66d88fedd1d3ab11070e Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
-Date: Sat, 8 Dec 2018 12:50:07 +0100
-Subject: [PATCH] Fix desktop spec compliance of distccmon-gnome install
-
-Update the .desktop file and install rules for distccmon-gnome to
-conform to the freedesktop.org specifications.  More specifically:
-
-- update to version 1.0 of the spec
-- remove obsolete 'Encoding' key
-- remove obsolete 'Application' category and add recommended 'GTK'
-- install icon file to the correct directory
-- strip suffix from desktop file (specifying it is deprecated)
-- while at it, remove redundant '-icon' from the filename
-- install desktop file to the correct directory
----
- Makefile.in                                   |  18 ++++++++++--------
- gnome/distccmon-gnome.desktop                 |   7 +++----
- ...mon-gnome-icon.png => distccmon-gnome.png} | Bin
- src/mon-gnome.c                               |   2 +-
- 4 files changed, 14 insertions(+), 13 deletions(-)
- rename gnome/{distccmon-gnome-icon.png => distccmon-gnome.png} (100%)
-
-diff --git a/Makefile.in b/Makefile.in
-index 6e1e467..1106559 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -52,13 +52,14 @@ mandir = @mandir@
- includedir = @includedir@
- oldincludedir = /usr/include
- docdir = @docdir@
--pkgdatadir = $(datadir)/@PACKAGE_NAME@
-+icondir = $(datarootdir)/pixmaps
-+desktopdir = $(datarootdir)/applications
- 
- include_server_builddir = $(builddir)/_include_server
- 
- # These must be done from here, not from autoconf, because they can 
- # contain variable expansions written in Make syntax.  Ew.
--DIR_DEFS = -DLIBDIR="\"${libdir}\"" -DSYSCONFDIR="\"${sysconfdir}\"" -DPKGDATADIR="\"${pkgdatadir}\""
-+DIR_DEFS = -DLIBDIR="\"${libdir}\"" -DSYSCONFDIR="\"${sysconfdir}\"" -DICONDIR="\"${icondir}\""
- 
- # arguments to pkgconfig
- GNOME_PACKAGES = @GNOME_PACKAGES@
-@@ -387,7 +388,7 @@ man_HTML = man/distcc_1.html man/distccd_1.html man/distccmon_text_1.html \
-            man/lsdistcc_1.html man/pump_1.html man/include_server_1.html
- MEN = $(man1_MEN)
- 
--gnome_data = gnome/distccmon-gnome-icon.png	\
-+gnome_data = gnome/distccmon-gnome.png	\
- 	gnome/distccmon-gnome.desktop
- 
- popt_OBJS=popt/findme.o  popt/popt.o  popt/poptconfig.o \
-@@ -1033,7 +1034,8 @@ showpaths:
- 	@echo "  programs             $(DESTDIR)$(bindir)"
- 	@echo "  sbin programs        $(DESTDIR)$(sbindir)"
- 	@echo "  system configuration $(DESTDIR)$(sysconfdir)"
--	@echo "  shared data files    $(DESTDIR)$(pkgdatadir)"
-+	@echo "  icon file            $(DESTDIR)$(icondir)"
-+	@echo "  application file     $(DESTDIR)$(desktopdir)"
- 
- 
- # install-sh can't handle multiple arguments, but we don't need any
-@@ -1129,10 +1131,10 @@ install-example: $(example_DOCS)
- 	done
- 
- install-gnome-data: $(gnome_data)
--	$(mkinstalldirs) "$(DESTDIR)$(pkgdatadir)"
--	for p in $(gnome_data); do \
--	  $(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
--	done
-+	$(mkinstalldirs) "$(DESTDIR)$(icondir)"
-+	$(mkinstalldirs) "$(DESTDIR)$(desktopdir)"
-+	$(INSTALL_DATA) gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
-+	$(INSTALL_DATA) gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
- 
- install-conf: $(conf_files) $(default_files)
- 	$(mkinstalldirs) "$(DESTDIR)$(sysconfdir)/distcc"
-diff --git a/gnome/distccmon-gnome.desktop b/gnome/distccmon-gnome.desktop
-index bd1fa26..7205f5e 100644
---- a/gnome/distccmon-gnome.desktop
-+++ b/gnome/distccmon-gnome.desktop
-@@ -1,6 +1,5 @@
- [Desktop Entry]
--Version=0.9.4
--Encoding=UTF-8
-+Version=1.0
- Exec=distccmon-gnome
- Name=distcc monitor
- Name[sv]=distcc övervakare
-@@ -8,9 +7,9 @@ GenericName=Distributed Compile Monitor
- GenericName[sv]=Distribuerad kompilerings-övervakare
- Comment=Graphical view of distributed compile tasks
- Comment[sv]=Grafisk vy av distribuerade kompileringsuppgifter
--Icon=distccmon-gnome-icon.png
-+Icon=distccmon-gnome
- TryExec=distccmon-gnome
- Terminal=false
- Type=Application
--Categories=GNOME;Application;Development;
-+Categories=GNOME;GTK;Development;
- StartupNotify=true
-diff --git a/gnome/distccmon-gnome-icon.png b/gnome/distccmon-gnome.png
-similarity index 100%
-rename from gnome/distccmon-gnome-icon.png
-rename to gnome/distccmon-gnome.png
-diff --git a/src/mon-gnome.c b/src/mon-gnome.c
-index 24681d0..bfc286d 100644
---- a/src/mon-gnome.c
-+++ b/src/mon-gnome.c
-@@ -599,7 +599,7 @@ static GtkWidget * dcc_gnome_make_mainwin (void)
- 
- #if GTK_CHECK_VERSION(2,2,0)
-   gtk_window_set_icon_from_file (GTK_WINDOW (mainwin),
--                                 PKGDATADIR "/distccmon-gnome-icon.png",
-+                                 ICONDIR "/distccmon-gnome.png",
-                                  NULL);
- #endif
- 
diff --git a/meta/recipes-devtools/distcc/files/separatebuilddir.patch b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
deleted file mode 100644
index c8da9d51c3..0000000000
--- a/meta/recipes-devtools/distcc/files/separatebuilddir.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport [https://github.com/distcc/distcc/pull/363]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 469628ee8dc90c7162d1a850c0b179b7349f9cf3 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 17 Sep 2019 13:04:22 +0100
-Subject: [PATCH] Makefile.in: fix out-of-tree builds when the GNOME UI is
- enabled
-
-The install command doesn't use $(srcdir) so out-of-tree builds fail.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 123054f..b9ce974 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1130,8 +1130,8 @@ install-example: $(example_DOCS)
- install-gnome-data: $(gnome_data)
- 	$(mkinstalldirs) "$(DESTDIR)$(icondir)"
- 	$(mkinstalldirs) "$(DESTDIR)$(desktopdir)"
--	$(INSTALL_DATA) gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
--	$(INSTALL_DATA) gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
-+	$(INSTALL_DATA) $(srcdir)/gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
-+	$(INSTALL_DATA) $(srcdir)/gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
- 
- install-conf: $(conf_files) $(default_files)
- 	$(mkinstalldirs) "$(DESTDIR)$(sysconfdir)/distcc"
--- 
-2.20.1
-- 
2.29.2

