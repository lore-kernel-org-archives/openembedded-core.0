Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web09.2556.1615661433787844628
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:50:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WRgkhuFe;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.53, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f53.google.com with SMTP id i25-20020a4aa1190000b02901bbd9429832so2021150ool.0
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hiRfLI8o6sIO2Bbxhur5yMXr+SHshsVzOTSFLIOguaI=;
        b=WRgkhuFef0MEsrApj1FQPzsYvvq+GqOaj6pDtZcYnRy3+RUZXytSTdNa6B1rslojX8
         1ltHgBpfKNfbsZ2oG/X/jhKttL93rktVmLAhXd/3QUcK39MQOFOhTzUWVJ9FDE6s7JwR
         WNBTfawLHHwLdYO3sE6JKBUp/Em8ZScpeEg5VZxQ/5wXFi1evS624gA7uYG4JfSZSvn6
         EzJU16Ey6SYmODRIGsBMU1dXAlsHqEdBlnqttZ14ZsLarZ7xCPU2K/8iomlEiP8NVA4A
         N0YTiRMPrAEascMCC7NR5dvgM7qbrpu/2gHX11kZu0FbPVqZ7JWHIkzK6JjwD42/+C5W
         F/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hiRfLI8o6sIO2Bbxhur5yMXr+SHshsVzOTSFLIOguaI=;
        b=VRGsbE0RBk28lyjHUq9hhZmLVoi2nV9SZFG+4yoA+GL8PrIyhs8RrcdwXBDQ0OrRia
         Datacz5BHtfPsyGbZqFQ9yXSLy68bRo8uokpu7fPRI6yOoHlE+X9HFDRr6I32Huzqu2H
         0nyVEocpT7NForJEGRlENo7vlxcih/fvX+65eoHz5lNPADlNM40u3CQ8eiLVeTvmxvSC
         JvmeunncjbeEAchQ0ik55GOPZamtnqQFS3ByxQGKU5REdlMCnYFG5vWbeyBGlu3e8CWM
         bvXVOCDSDJyvtbSKFw/FmFgIKysz2ptdFm5Vjz1d1FF8Z0iACH8xdzzqJuhV3IxUIObc
         HcTQ==
X-Gm-Message-State: AOAM532c0JTqtdgJGZLb7RWHjvtt7jya5wRdCeVTSiEcBET88JhlVj/J
	Z9+TE8wxztjYbQvtkNBifl48H+AVrzsVNnTj
X-Google-Smtp-Source: ABdhPJxFBUNGcOCmquTt7mGYtlDJCPoTGok/uK0NaD1zElPO6Vcap9KQiOor7AOeoYDkNYQbbxOVyQ==
X-Received: by 2002:a4a:88a2:: with SMTP id j31mr7777587ooa.71.1615661432484;
        Sat, 13 Mar 2021 10:50:32 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.50.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:50:32 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/38] recipes-gnome: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Sat, 13 Mar 2021 08:48:57 -1000
Message-Id: <a9153b1993b7a441a0f396aff71c7930e9f59751.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Meh Mbeh Ida Delphine <idadelm@gmail.com>

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e501e87b847d915e97b11d966b5781059daaf362)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.34.4.bb        | 3 +++
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb | 2 ++
 meta/recipes-gnome/libnotify/libnotify_0.7.8.bb       | 4 ++++
 meta/recipes-gnome/libsecret/libsecret_0.20.1.bb      | 1 +
 4 files changed, 10 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
index ddb4c2794f..e2afb29c12 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.34.4.bb
@@ -1,4 +1,7 @@
 SUMMARY = "WebKit based web browser for GNOME"
+DESCRIPTION = "Epiphany is an open source web browser for the Linux desktop environment. \
+It provides a simple and easy-to-use internet browsing experience."
+HOMEPAGE = "https://wiki.gnome.org/Apps/Web"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
index 3a2727b701..5503f225bb 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "GTK+ icon theme"
+DESCRIPTION = "The Adwaita icon theme is the default icon theme of the GNOME desktop \
+This package package contains an icon theme for Gtk+ 3 applications."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
index 0306b04f4e..0f2c3aa131 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Library for sending desktop notifications to a notification daemon"
+DESCRIPTION = "It sends desktop notifications to a notification daemon, as defined \
+in the Desktop Notifications spec. These notifications can be used to inform \
+the user about an event or display some form of information without getting \
+in the user's way."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libnotify"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libnotify/issues"
 SECTION = "libs"
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
index 72511af02d..8b5d301515 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
@@ -4,6 +4,7 @@ the freedesktop.org project, a cross-desktop effort to access passwords, \
 tokens and other types of secrets. libsecret provides a convenient wrapper \
 for these methods so consumers do not have to call the low-level DBus methods."
 LICENSE = "LGPLv2.1"
+HOMEPAGE = "https://github.com/GNOME/libsecret"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-- 
2.25.1

