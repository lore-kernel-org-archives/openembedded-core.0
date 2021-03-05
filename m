Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.12949.1614955768338175149
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Mar 2021 06:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SedivTkp;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id a24so1506648plm.11
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Mar 2021 06:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M1b5GRMLblJZwzOQ5JXGKVqqI/wkRfpECTp1Y4FGdZU=;
        b=SedivTkpIEQFLaiVIuQJyu9o4YqdcqMbLqw7OB9ATy0Av/1FAW4Ni7GYO/SI5Dhl1E
         8oR8McvMLZA4/IUVFxAZDjEwCN/GboaNbDy0Z0OtwfZtZ74HyvqJgYs/HSZJVY+Ma5fA
         LrDPadOK/ecI5FKkqZo/ara935a+KZGMmJnjGxyzkCgKSgAhTZrjY1/mSzv5SRX4FKOy
         xIzefXRS2Og9QcHF0X4J6YUa7sCm4vk0ayF2G0PKc6uWXrH3zYX7V5AW5ENQI6sjeN4N
         NpWPrrJjdhXMqMSEL2zel1trD3u+MPMVTYzEbjqgkTnRMKSpMqM50/oKLfP6HCdEN9dS
         yz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M1b5GRMLblJZwzOQ5JXGKVqqI/wkRfpECTp1Y4FGdZU=;
        b=JIzqBVZVzJYIn3aK2HwT+5TXXajXud5Tc8ub1/jl7eIVaZQUDqJTCyIp2ncQ7j+Cph
         NAPHrnH9SaP5HtWzeSYZBVuR5Aa5ihIeXJPlbEV+hoBtKbZZd7R2yV3j3Wsa8PYHzQ0H
         kojmyTrSBb6PviHptY4rfeEuoq9gz2vsJk8kF2ohISPlipS7khnQzEs76YgydBA7lkFD
         w6xw5CKdJ/pi/ECfA6Z03SWK8t/3zfXEcpzTb46oyBmRDfZdNhRZ6vBpiY9Zl73EtAlY
         ws5JAMtwZIfJs3T+I+LZMhFd3qKAbN/hFcKWjKVwx8/sVIMjv3KokW+QaTO2nyuRRaPh
         097A==
X-Gm-Message-State: AOAM533dblmhU6CmvDalLySPeAHi7a/IpZC6maErqeZWrBaJZYgDd5bj
	2/xA28vZiJJ2k1pvMLLrpyb4bpBIZyAX9uEX
X-Google-Smtp-Source: ABdhPJwAjG7eNxGsIWTqyaNa9XgnxSYKuMW0FxCPBl3oy9L6yC2pubXzOTUzNwPZkqRCbtM7eqaldg==
X-Received: by 2002:a17:902:344:b029:e4:a7ab:2e55 with SMTP id 62-20020a1709020344b02900e4a7ab2e55mr9327973pld.63.1614955767237;
        Fri, 05 Mar 2021 06:49:27 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id c72sm2659261pfb.165.2021.03.05.06.49.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:49:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 27/27] meta/recipes-core: Add HOMEPAGE / DESCRIPTION
Date: Fri,  5 Mar 2021 04:46:36 -1000
Message-Id: <cf22f3831488b346195e049ace92e153d18660db.1614955420.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614955420.git.steve@sakoman.com>
References: <cover.1614955420.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added HOMEPAGE and DESCRIPTION for recipes with missing decriptions or homepage

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be8d3d0fa6bbc2924ffbdbaa66e9ffaef2b96de6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb | 1 +
 meta/recipes-core/dbus-wait/dbus-wait_git.bb        | 1 +
 meta/recipes-core/dropbear/dropbear.inc             | 1 +
 meta/recipes-core/ell/ell_0.33.bb                   | 1 +
 meta/recipes-core/fts/fts_1.2.7.bb                  | 1 +
 meta/recipes-core/ifupdown/ifupdown_0.8.35.bb       | 1 +
 meta/recipes-core/kbd/kbd_2.2.0.bb                  | 1 +
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
index 7269888a4e..d41e8b36dc 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -1,5 +1,6 @@
 SUMMARY = "A lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
+DESCRIPTION = "Dropbear is a relatively small SSH server and client. It runs on a variety of POSIX-based platforms. Dropbear is open source software, distributed under a MIT-style license. Dropbear is particularly useful for "embedded"-type Linux (or other Unix) systems, such as wireless routers."
 SECTION = "console/network"
 
 # some files are from other projects and have others license terms:
diff --git a/meta/recipes-core/ell/ell_0.33.bb b/meta/recipes-core/ell/ell_0.33.bb
index 2fa05104fb..bef1e9a0b5 100644
--- a/meta/recipes-core/ell/ell_0.33.bb
+++ b/meta/recipes-core/ell/ell_0.33.bb
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
diff --git a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
index 53cb971d33..ae175848b7 100644
--- a/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
+++ b/meta/recipes-core/ifupdown/ifupdown_0.8.35.bb
@@ -1,4 +1,5 @@
 SUMMARY = "ifupdown: basic ifup and ifdown used by initscripts"
+HOMEPAGE = "https://salsa.debian.org/debian/ifupdown"
 DESCRIPTION = "High level tools to configure network interfaces \
 This package provides the tools ifup and ifdown which may be used to \
 configure (or, respectively, deconfigure) network interfaces, based on \
diff --git a/meta/recipes-core/kbd/kbd_2.2.0.bb b/meta/recipes-core/kbd/kbd_2.2.0.bb
index e5700ff57f..d10c93dfb7 100644
--- a/meta/recipes-core/kbd/kbd_2.2.0.bb
+++ b/meta/recipes-core/kbd/kbd_2.2.0.bb
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
2.25.1

