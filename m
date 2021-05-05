Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web11.9839.1620227950966737227
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 08:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f3l+N9WH;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id b25so3458494eju.5
        for <openembedded-core@lists.openembedded.org>; Wed, 05 May 2021 08:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DOIcnr1iPwS8DyiYn6abAIPWn6E7df2bRAwG/NRuuc4=;
        b=f3l+N9WHhn8Ueu+6Y5S8s/yOXYmYRsMPYrIhP0qXhkRaUdmOvQMLt2Dn8SAmiccjDv
         CJGrbx+gNhBd8U7amfqT1mn2Kuc4qBcLTFm+6HtX8ACX/cVpU6s34jhGhsu6w8P1J8YS
         l0SFC3yD+vw53opRf1uqkF87RJeVAzqraSNJ/AMycs/mWOTQiD7j7BhGdpQpMLvix1PI
         987weHy7r0sfLh+2r/4WNnvy6shLrnFZH9YWCm8x0srQqN74d9gCrIvCMNs2PDp5/KMK
         L+TTRslHfR8nyfo/be+2nRuSO870H4xagFzZyqH594hnLFb+rpMwR6HsioL6+tD26Gcy
         qPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOIcnr1iPwS8DyiYn6abAIPWn6E7df2bRAwG/NRuuc4=;
        b=uHPqMV5Cun+eF+1Asmm5br1mz7Nf7Q/0wsQsP4qDRdv3JF/FnohcKfQkhYBQFBBg9G
         EqFe4Pz/IC/LBi1RtyJEp/6Sq+6unBD4q3DjL8QjaoMOJNMt958yNiQg2EbK6yQajkC2
         +SDV7TFAhlOMvsVo9ykhrB3YzqpiEfc5gdlsH/PvhMVzcqek/rjPd/Cf3mECQCSlyini
         kyMwoU0EUWrJfdBZejHHNy7yt6ZHOe5K97RxIsy4Ns4hmyAy2gRCHWl7IUO4Zf5fc9oe
         h8MJplBOXXBjlh8sxFwIkgk/MTYU+mK/p9ep09a/rqGjBkuLPFm3jPwjZ058hjTz/SXy
         Jd7w==
X-Gm-Message-State: AOAM531bd93oR2WtJHeLBosrtJ6EDDD3WVW5ElWlthqMNvA2TjZHYXVy
	IEh9Ey/5cyGMA3SAG4UcC0NFnyQMuX4a5g==
X-Google-Smtp-Source: ABdhPJxe1rUWu/oEZ8zOfU2yoEkxq+ItUf06ZbluuhcZtxMhp7sP+4FiKWUQmeRpyZ4yD8iQEyAEOg==
X-Received: by 2002:a17:906:90cf:: with SMTP id v15mr28136729ejw.432.1620227949577;
        Wed, 05 May 2021 08:19:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm3018479ejj.55.2021.05.05.08.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 08:19:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 17/61] libgudev: update 234 -> 236
Date: Wed,  5 May 2021 17:18:06 +0200
Message-Id: <20210505151850.660512-17-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210505151850.660512-1-alex.kanavin@gmail.com>
References: <20210505151850.660512-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to meson.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-gudevenumtypes-make-deterministic.patch | 44 +++++++++++++++++++
 .../{libgudev_234.bb => libgudev_236.bb}      | 12 +++--
 2 files changed, 53 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
 rename meta/recipes-gnome/libgudev/{libgudev_234.bb => libgudev_236.bb} (70%)

diff --git a/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch b/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
new file mode 100644
index 0000000000..aaec9cd20d
--- /dev/null
+++ b/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
@@ -0,0 +1,44 @@
+From 078c0db2bc3adf7c665190ee7a9263d7fd1ec618 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 29 Apr 2021 13:06:12 +0200
+Subject: [PATCH] gudevenumtypes: make deterministic
+
+@filename@ writes the full path to the generated file,
+which can vary in CI systems and make outputs non-reproducible.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgudev/-/merge_requests/15]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gudev/gudevenumtypes.c.template | 2 +-
+ gudev/gudevenumtypes.h.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gudev/gudevenumtypes.c.template b/gudev/gudevenumtypes.c.template
+index fc30b39..4918f7e 100644
+--- a/gudev/gudevenumtypes.c.template
++++ b/gudev/gudevenumtypes.c.template
+@@ -4,7 +4,7 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+diff --git a/gudev/gudevenumtypes.h.template b/gudev/gudevenumtypes.h.template
+index d0ab339..79bf7c4 100644
+--- a/gudev/gudevenumtypes.h.template
++++ b/gudev/gudevenumtypes.h.template
+@@ -9,7 +9,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+-- 
+2.30.2
+
diff --git a/meta/recipes-gnome/libgudev/libgudev_234.bb b/meta/recipes-gnome/libgudev/libgudev_236.bb
similarity index 70%
rename from meta/recipes-gnome/libgudev/libgudev_234.bb
rename to meta/recipes-gnome/libgudev/libgudev_236.bb
index 9cea36df5b..daa578ddb1 100644
--- a/meta/recipes-gnome/libgudev/libgudev_234.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_236.bb
@@ -5,18 +5,24 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "1baeacacf0db42fa073ad5183d1decce9317857416a2b0f82ce3370d711a2e37"
+SRC_URI[archive.sha256sum] = "e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524"
 
-DEPENDS = "glib-2.0 udev"
+SRC_URI_append = " file://0001-gudevenumtypes-make-deterministic.patch"
 
-EXTRA_OECONF = "--disable-umockdev"
+DEPENDS = "glib-2.0 udev"
 
 RCONFLICTS_${PN} = "systemd (<= 220)"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gobject-introspection gtk-doc
 
+GIR_MESON_ENABLE_FLAG = 'enabled'
+GIR_MESON_DISABLE_FLAG = 'disabled'
+
+GTKDOC_MESON_OPTION = "gtk_doc"
+
 UPSTREAM_CHECK_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgudev/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>(\d+))"
-- 
2.31.1

