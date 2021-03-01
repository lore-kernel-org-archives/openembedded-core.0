Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.12568.1614607072639806711
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 05:57:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QPCnZQyz;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: idadelm@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id u125so14560612wmg.4
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Mar 2021 05:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eclLNpkF4byq8S+YNX1AfmYfH71I1YJN3UoKiPexmZ4=;
        b=QPCnZQyzblDSISEUBODIA4yMKoAL9EUVuDQbo5b3TGw6lxG8GPVqJiSfWKRZ3UhbJc
         AyzEBf2cEVhDKmnvRTyW5ut/iC7cYa95cbdLaSFTfvoVzKSy9CFBIUV0yd5kGJ184XnY
         4U3sJdTUlbO0NUlmRALrusDhmwRmsalkL1AJO7aSgioZMQLY1Kf0yKQj7quDwa0KbTAY
         Up3QCPanupdm3vpXnzZnCw73mPdUBS8AZIOc5rV2H73wENjDTpMdQoA/F1tsb94Mt2/m
         i5iaHgUcvjjxhqOCTTV3npT2VraZD8OVQW7WN48gtJLz1o2tJMY/W6PkIhayal3MmUw+
         6eMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eclLNpkF4byq8S+YNX1AfmYfH71I1YJN3UoKiPexmZ4=;
        b=CYe2LbhIXG53BRWn4iPEa1+Eb9DrQgLD7WFj4kcuUHkZ+gMQ9U0tMocGHmNGPG+cdz
         ALO1vFQmBdKH2/E46jVnu1nyqg3OUWwwcN5wDwoObUvLsaZhmZ6P8n4KRzm/1GTjG+kv
         Kxl4p2dIULsmEoOEejfkGEy1+lwUGgYKYy2269Y0KNflS7juE5T+kjL8JUYfXuRPf9ga
         uYmVxzDcZBlxn/ERGpVWz5q79iACb6I66zi6NE1jNygvafo6KVeCWHxEJbHVj9ACrIfc
         2CcjPXk1C455DatlveSzk5PRuy/hJPM6Fk1p8bBJfZ10G8OnGTmWwG7im7CbGLBYk8e5
         qmRg==
X-Gm-Message-State: AOAM530y3LmFsNccJXVAV3UuoSgbRYn3lMHZ0dPMqZAreSjbcyAYZI5v
	LnTYfw6uITC9oGmCcdxb5/mwEX4E7prJeg==
X-Google-Smtp-Source: ABdhPJz2S84lsuuyyStn3j+D3ijAtxk0sk7UbdU/6IDxPHjFoKgC+TGpH3fazv1cZm0+kRfMBZ3yxQ==
X-Received: by 2002:a1c:2c05:: with SMTP id s5mr15887928wms.70.1614607070656;
        Mon, 01 Mar 2021 05:57:50 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from localhost.localdomain ([154.72.153.131])
        by smtp.gmail.com with ESMTPSA id d13sm17611472wro.23.2021.03.01.05.57.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 05:57:50 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] recipes-gnome: Add missing HOMEPAGE and DESCRIPTION for recipes
Date: Mon,  1 Mar 2021 14:57:33 +0100
Message-Id: <20210301135738.12541-1-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: [YOCTO #13471]

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.38.1.bb        | 3 +++
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb | 2 ++
 meta/recipes-gnome/libhandy/libhandy_1.0.1.bb         | 8 ++++++++
 meta/recipes-gnome/libnotify/libnotify_0.7.9.bb       | 4 ++++
 meta/recipes-gnome/libportal/libportal_0.3.bb         | 4 ++++
 meta/recipes-gnome/libsecret/libsecret_0.20.4.bb      | 1 +
 6 files changed, 22 insertions(+)

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
index f9daa8bfe2..19447a514d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.38.1.bb
@@ -1,4 +1,7 @@
 SUMMARY = "WebKit based web browser for GNOME"
+DESCRIPTION = "Epiphany is an open source web browser for the Linux desktop environment. \
+It provides a simple and easy-to-use internet browsing experience."
+HOMEPAGE = "https://wiki.gnome.org/Apps/Web"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/epiphany"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
index ff557978dc..a36a2b113c 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "GTK+ icon theme"
+DESCRIPTION = "The Adwaita icon theme is the default icon theme of the GNOME desktop \
+This package package contains an icon theme for Gtk+ 3 applications."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/adwaita-icon-theme/issues"
 SECTION = "x11/gnome"
diff --git a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb b/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
index 146ef62f41..dec5e2ff42 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.0.1.bb
@@ -1,4 +1,12 @@
 SUMMARY = "A library full of GTK+ widgets for mobile phones"
+DESCRIPTION = "Library with GTK widgets for mobile phones.
+Libhandy provides \
+GTK widgets and GObjects to ease developing applications for mobile phones. \
+It was developed by Purism (and used by several official GNOME projects) \
+to extend Gtk by providing mobile-friendly widgets and make the creation of \
+responsive apps easier."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/libhandy"
+BUGTRACKER = "https://gitlab.gnome.org/GNOME/libhandy/-/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 29a28272e1..1ff4b2e15f 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -1,4 +1,8 @@
 SUMMARY = "Library for sending desktop notifications to a notification daemon"
+DESCRIPTION = "It sends desktop notifications to a notification daemon, as defined \
+in the Desktop Notifications spec. These notifications can be used to inform \
+the user about an event or display some form of information without getting \
+in the user's way."
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/libnotify"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libnotify/issues"
 SECTION = "libs"
diff --git a/meta/recipes-gnome/libportal/libportal_0.3.bb b/meta/recipes-gnome/libportal/libportal_0.3.bb
index 022628b1ac..bc4ff3784c 100644
--- a/meta/recipes-gnome/libportal/libportal_0.3.bb
+++ b/meta/recipes-gnome/libportal/libportal_0.3.bb
@@ -1,4 +1,8 @@
 SUMMARY = "libportal provides GIO-style async APIs for most Flatpak portals."
+DESCRIPTION = "It provides simple asynchronous wrappers for most Flatpak portals \
+with a familiar GObject API along side the D-Bus API"
+HOMEPAGE = "https://github.com/flatpak/libportal"
+BUGTRACKER = "https://github.com/flatpak/libportal/issues"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
index 96f6460181..060d16f39f 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.4.bb
@@ -4,6 +4,7 @@ the freedesktop.org project, a cross-desktop effort to access passwords, \
 tokens and other types of secrets. libsecret provides a convenient wrapper \
 for these methods so consumers do not have to call the low-level DBus methods."
 LICENSE = "LGPLv2.1"
+HOMEPAGE = "https://github.com/GNOME/libsecret"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
-- 
2.25.1

