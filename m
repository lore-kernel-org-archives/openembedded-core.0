Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.17657.1590940460192668616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K7XGwdyq;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id z5so6894323ejb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I6eO8WOkTqe06ZJ2hNM2PnVK2NFJoZ/8FyRcHLv39tY=;
        b=K7XGwdyq3tCmYcUqxzQs7mAuw4OpWJLcG6O3BJsgzhXGz/n+QTvLdTiwK2JTNyUWx8
         IEmursxw9M5PO4ZKaUsyTSLcbsBrz5ab0VF6wijiJ2JMI0WypnN6c2L/taSK+gBwJk2t
         mAPVreLmc4XqSWLE7uTpG8M+YFijZaCSdSf3zNeJlkFRT+DtO3e++3DeVTe477wLgmRP
         yNpttGma4Cmy7jgXpaKd8TBQxRWje0aly3IsXNWNBZU2a9KfUrvhoX48UvxV9LPYwQsw
         0DJOdkpM3ADkKFaMpPttTC6WbLNYkqrz2SDq+jufFvBw1lUH0fgYBZD6UDnN4GykUA4f
         YY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I6eO8WOkTqe06ZJ2hNM2PnVK2NFJoZ/8FyRcHLv39tY=;
        b=dqfK0Kg25xpH/0IKiR8FeNTnkxQRc8gZeaIrCdp4YgibbylS/2kXaqEqegTGX8+JzJ
         Mcp48FDTsmsqHSRMhHo/JMLc8YH8RkncYoo3oMRsfOhEBsr801aY6xcZtnHfMFjEFd3J
         gVsX5Vr0VFwj6VUOvTCwk7cARUrW6ifbW6hy+C5b0r0hV1GHVP0ha2Xqp1kGRjuEiPgc
         FEnfzxiD15k2k0BbB11WJZ30BkorCQGAMGlgLDA7FuvDQihLXbanTM3MoBIToSSo5ssx
         ufSXmHhIf6Sa8NfWtLeFAjIyOlzNDkTXNTzt+WImi4D5KJPeaWyACXn93JLDSkdUBbWt
         HTZw==
X-Gm-Message-State: AOAM531vPfclVUmgOkyOTaOfp2/C6c3q1kaDSQjsb0Lk/VJ+lHlq1rjW
	d/qi++FeBNu++xCUGgfpXtu2UZSm
X-Google-Smtp-Source: ABdhPJz5XbLo4iX+omL3ZSR1sqgXuDleJqc2ZRw0YPm9e7u2gr04xS9/hEMS0M956pU8Vz5LpxmP9A==
X-Received: by 2002:a17:906:22cc:: with SMTP id q12mr16534106eja.485.1590940458477;
        Sun, 31 May 2020 08:54:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:18 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 58/70] libmodulemd: update 2.9.2 -> 2.9.4
Date: Sun, 31 May 2020 17:52:42 +0200
Message-Id: <20200531155254.10283-58-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 0002-meson.build-do-not-install-python-gi-bindings.patch
with an explicitly set meson option.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ld-do-not-install-python-gi-bindings.patch | 23 -------------------
 .../libmodulemd/libmodulemd_git.bb            | 11 +++++----
 2 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch b/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch
deleted file mode 100644
index a97fb73907..0000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd/0002-meson.build-do-not-install-python-gi-bindings.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From d7eeac90fe02ccf5c5e4334e41ec75fc33803643 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 31 Mar 2020 16:12:28 +0200
-Subject: [PATCH] meson.build: do not install python gi bindings
-
-These are unnecessary for oe-core, and the install location
-is incorrectly determined using native python.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index a8b02b4..8ff737b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -171,4 +171,3 @@ configure_file(
- )
- 
- subdir('modulemd')
--subdir('bindings/python')
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
index d440e60ee6..fda01b8ad8 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd_git.bb
@@ -4,17 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https \
            file://0001-modulemd-generate-the-manpage-only-if-the-feature-is.patch \
-           file://0002-meson.build-do-not-install-python-gi-bindings.patch \
            "
 
-PV = "2.9.2"
-SRCREV = "780750eab8a0587b20d033f335301f16d00ab9c9"
+PV = "2.9.4"
+SRCREV = "c7254db07b21495fc9bd247c5b17ee20149c05e3"
 
 S = "${WORKDIR}/git"
 
-inherit meson gobject-introspection
+inherit meson gobject-introspection python3-dir
 
-EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false -Drpmio=disabled -Dlibmagic=disabled -Dwith_manpages=disabled -Dgobject_overrides_dir_py3=${PYTHON_SITEPACKAGES_DIR}/gi/overrides"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
 
@@ -23,3 +22,5 @@ BBCLASSEXTEND = "native nativesdk"
 GIR_MESON_OPTION = 'skip_introspection'
 GIR_MESON_ENABLE_FLAG = 'false'
 GIR_MESON_DISABLE_FLAG = 'true'
+
+FILES_${PN} += "${libdir}/${PYTHON_DIR}/*"
-- 
2.26.2

