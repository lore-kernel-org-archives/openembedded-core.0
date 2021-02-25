Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.4865.1614213558643057448
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 16:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i39gc/on;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: dorindabassey@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id v15so3586359wrx.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 16:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EFO2qR/ttTcO81eZD1dMghND8XmoC/PCZ3kQRsKBUnw=;
        b=i39gc/onNWYBG6D8Bik9IrVHEWzr2kRg0YgHOIHG72Q6XW+7Pxs1xDK6h7xa5dkz8w
         VxsPVu3RPK13VbuLyKSapjjpTtX0I4xivMN95jgr/0RYklH1PpdZ0yIaWAURK12DQQqI
         YzZx7hbkwVEzvW1N7BB4w7N8GQcqHjq5W16gn44Lbb6vOzzMxRi4jTue1iPiXB0pdm+L
         M2QXvzaHZ6QysgOM6YG9KPyLbtp2his0HiGqNkmB6MF66xNrdjOrHuZzDo69vWBxsX5z
         nunXwl3MUsSvr2nNZuuxmhz9BsgsTDbD3dxsVxWkDxUI0SxZ8EUVev9G4UeSeAx0sf7k
         bXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EFO2qR/ttTcO81eZD1dMghND8XmoC/PCZ3kQRsKBUnw=;
        b=aUh1QrhgxrfDWrShleSj3SnTpOo4X0PHGreInpTbEtMidwecwga0pK2ZW9dj3JtYtc
         89DT5ZlOKyl8s0ww9VX81ItIKfkKqv2ys+Q86nSolAnpolF6L0WzrK49K7aI7g8AQidy
         8Dbv3/of8/FMCzYrjAzYjkQtJP9MbyHJW+RNpDS4lUjiUxD58MHZt7JBFPQVdCcBt9yn
         Qm4teFBHQMP0SWzxore9ycaOQncZs/LiN/zRbfP9qGmNdu0K8nwTjTl0Jz35TmuSR7gK
         g7A8Gqh1aRNP5g8lnsL8zcHyV/MuqLg1EDXVyVl4AaMlh+QchDbcOcNlpDuk+BTS0qc8
         Pdqg==
X-Gm-Message-State: AOAM532tIleGlXpRjSPL+QQnqIASqftwCchMZMo95tctKQR95w4zxgIK
	gZZUGSbtlIWVM0YPzJ1YdiAzYmmRM8A=
X-Google-Smtp-Source: ABdhPJxhY/hnAH/pcfrP33i4ZUlj7hkevKuEmrKvH8uaQAZxFNaxFSuNYqfuBcSPZlZ+TBVjWw5ntQ==
X-Received: by 2002:adf:fd85:: with SMTP id d5mr543233wrr.423.1614213556768;
        Wed, 24 Feb 2021 16:39:16 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.99.217])
        by smtp.gmail.com with ESMTPSA id a1sm5965962wrx.95.2021.02.24.16.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 16:39:16 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 3/4] meta/recipes-core: Add HOMEPAGE / DESCRIPTION
Date: Thu, 25 Feb 2021 01:39:00 +0100
Message-Id: <20210225003901.18196-3-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210225003901.18196-1-dorindabassey@gmail.com>
References: <20210225003901.18196-1-dorindabassey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 1 +
 meta/recipes-core/dbus-wait/dbus-wait_git.bb        | 1 +
 meta/recipes-core/dropbear/dropbear.inc             | 1 +
 meta/recipes-core/ell/ell_0.38.bb                   | 1 +
 meta/recipes-core/fts/fts_1.2.7.bb                  | 1 +
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb       | 1 +
 meta/recipes-core/kbd/kbd_2.4.0.bb                  | 1 +
 meta/recipes-core/udev/eudev_3.2.9.bb               | 1 +
 8 files changed, 8 insertions(+)

diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
index d01cd7e297..65b3cd778d 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Base system master password/group files"
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
+HOMEPAGE = "https://launchpad.net/base-passwd"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
diff --git a/meta/recipes-core/dbus-wait/dbus-wait_git.bb b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
index c24295b537..677768d35a 100644
--- a/meta/recipes-core/dbus-wait/dbus-wait_git.bb
+++ b/meta/recipes-core/dbus-wait/dbus-wait_git.bb
@@ -1,5 +1,6 @@
 SUMMARY = "A simple tool to wait for a specific signal over DBus"
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/dbus-wait"
+DESCRIPTION = "${SUMMARY}"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index a30f98faa4..ed3ef3384a 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -1,5 +1,6 @@
 SUMMARY = "A lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
 SECTION = "console/network"
 
 # some files are from other projects and have others license terms:
diff --git a/meta/recipes-core/ell/ell_0.38.bb b/meta/recipes-core/ell/ell_0.38.bb
index 11a80e16ed..7d3a339978 100644
--- a/meta/recipes-core/ell/ell_0.38.bb
+++ b/meta/recipes-core/ell/ell_0.38.bb
@@ -1,4 +1,5 @@
 SUMMARY  = "Embedded Linux Library"
+HOMEPAGE = "https://01.org/ell"
 DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
 low-level functionality for system daemons. It typically has no \
 dependencies other than the Linux kernel, C standard library, and \
diff --git a/meta/recipes-core/fts/fts_1.2.7.bb b/meta/recipes-core/fts/fts_1.2.7.bb
index 589ae0e916..ea820cb0c3 100644
--- a/meta/recipes-core/fts/fts_1.2.7.bb
+++ b/meta/recipes-core/fts/fts_1.2.7.bb
@@ -3,6 +3,7 @@
 
 SUMMARY = "Implementation of ftsfor musl libc packages"
 HOMEPAGE = "https://github.com/pullmoll/musl-fts"
+DESCRIPTION = "The musl-fts package implements the fts(3) functions fts_open, fts_read, fts_children, fts_set and fts_close, which are missing in musl libc."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5ffe358174aad383f1b69ce3b53da982"
 SECTION = "libs"
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
index 5b425da95c..c0a90a3972 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.36.bb
@@ -1,4 +1,5 @@
 SUMMARY = "ifupdown: basic ifup and ifdown used by initscripts"
+HOMEPAGE = "https://salsa.debian.org/debian/ifupdown"
 DESCRIPTION = "High level tools to configure network interfaces \
 This package provides the tools ifup and ifdown which may be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
diff --git a/meta/recipes-core/kbd/kbd_2.4.0.bb b/meta/recipes-core/kbd/kbd_2.4.0.bb
index 65ba70bf47..b557d691b5 100644
--- a/meta/recipes-core/kbd/kbd_2.4.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.4.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Keytable files and keyboard utilities"
 HOMEPAGE = "http://www.kbd-project.org/"
+DESCRIPTION = "The kbd project contains tools for managing Linux console (Linux console, virtual terminals, keyboard, etc.) – mainly, what they do is loading console fonts and keyboard maps."
 # everything minus console-fonts is GPLv2+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=892f569a555ba9c07a568a7c0c4fa63a"
diff --git a/meta/recipes-core/udev/eudev_3.2.9.bb b/meta/recipes-core/udev/eudev_3.2.9.bb
index f96f8cbe78..3ae91dee51 100644
--- a/meta/recipes-core/udev/eudev_3.2.9.bb
+++ b/meta/recipes-core/udev/eudev_3.2.9.bb
@@ -1,5 +1,6 @@
 SUMMARY = "eudev is a fork of systemd's udev"
 HOMEPAGE = "https://wiki.gentoo.org/wiki/Eudev"
+DESCRIPTION = "eudev is Gentoo's fork of udev, systemd's device file manager for the Linux kernel. It manages device nodes in /dev and handles all user space actions when adding or removing devices."
 LICENSE = "GPLv2.0+ & LGPL-2.1+"
 LICENSE_libudev = "LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-- 
2.17.1

