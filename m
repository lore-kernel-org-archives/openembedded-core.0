Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9619.1629636697551040252
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fb6Fh8MO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d26so1443764wrc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mh8K0zG4NrWInfw8atmFvLJY01x7EXWEH0SPeLhTLrQ=;
        b=fb6Fh8MONggoRCyKpvuJZCapY6PE4EsuQHfqKUOH7/fMypTUZYrt3hfpIsuK83guWU
         If0K/bjQePFmpmXXVJNyInUFoY9zRF+t+r/ngm5NHHTM1A7AXyCVK3zvFoBytxmdTnAk
         ZrUmtZ/jsXpVmv9yqYQeWwVQxRMs5o0b0pXoYlBDSpb08+NWPwOQzKdsO29UcfgYQQay
         Y7RJ22oSjQk1wvsSZAf1GeAoyk2Q4ZQw0BRmHIGKGxOw5KG2WzZ8IIcM7hoaZykj+ol2
         TOLPN1THSe6vjAB/r8+CavAQw66yUbFjTkFuBSQns0yNDpjyp3GQ0mE+UUiz7OyQUtcc
         UDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mh8K0zG4NrWInfw8atmFvLJY01x7EXWEH0SPeLhTLrQ=;
        b=jTLh1tCcEarMmZwmfiIZXpOKVMdJyLv//TltAKkFt0vFYx+eZ0dlomRTSUW3ZFwMX+
         dXhh2G15nq1tJ4/wmX7b9yxV8nUai3TMueeVF+Njfl0z6nPNy5KhUBsaaG0tWlKcywa1
         6loEuGOYMfCwLThJ7HGqfEjWrjSt8DLU9jJbRTbpa+OBpJ8AOavmMG/8hY1d+Ipt6wPa
         Cy24yNzP5AkOcY6XwiDQGBYDhJEsrjy11elPuulGhsmcunH2IFWydUSdONW8TMob+QE9
         0PvntbhJHZR/fep/sfZ4RHxJk3fb7njApZG3ddtuy98uSeGOuOdWnS3iV4Vl7QfApp9k
         gxUw==
X-Gm-Message-State: AOAM533YTC2tJBNbEddqDJ6WIPLFNceP1c4eYrOzlI01kDzG6tzG6Chm
	aOcsHIxUW9OXYHahrrNvLlvHqvAAafIxOQ==
X-Google-Smtp-Source: ABdhPJz/e64qmnf6bkCWTqBzR4c5EVd1o5mhvJJgJXO7TSdJfkmgbDsAzjysxXPqV3WTKj7La2b0SQ==
X-Received: by 2002:a5d:694f:: with SMTP id r15mr8442495wrw.86.1629636696177;
        Sun, 22 Aug 2021 05:51:36 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:35 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 37/55] libgudev: upgrade 236 -> 237
Date: Sun, 22 Aug 2021 14:50:45 +0200
Message-Id: <20210822125103.310416-37-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...01-gudevenumtypes-make-deterministic.patch | 44 -------------------
 .../{libgudev_236.bb => libgudev_237.bb}      |  4 +-
 2 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
 rename meta/recipes-gnome/libgudev/{libgudev_236.bb => libgudev_237.bb} (85%)

diff --git a/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch b/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
deleted file mode 100644
index aaec9cd20d..0000000000
--- a/meta/recipes-gnome/libgudev/files/0001-gudevenumtypes-make-deterministic.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 078c0db2bc3adf7c665190ee7a9263d7fd1ec618 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 29 Apr 2021 13:06:12 +0200
-Subject: [PATCH] gudevenumtypes: make deterministic
-
-@filename@ writes the full path to the generated file,
-which can vary in CI systems and make outputs non-reproducible.
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libgudev/-/merge_requests/15]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gudev/gudevenumtypes.c.template | 2 +-
- gudev/gudevenumtypes.h.template | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/gudev/gudevenumtypes.c.template b/gudev/gudevenumtypes.c.template
-index fc30b39..4918f7e 100644
---- a/gudev/gudevenumtypes.c.template
-+++ b/gudev/gudevenumtypes.c.template
-@@ -4,7 +4,7 @@
- /*** END file-header ***/
- 
- /*** BEGIN file-production ***/
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
-diff --git a/gudev/gudevenumtypes.h.template b/gudev/gudevenumtypes.h.template
-index d0ab339..79bf7c4 100644
---- a/gudev/gudevenumtypes.h.template
-+++ b/gudev/gudevenumtypes.h.template
-@@ -9,7 +9,7 @@ G_BEGIN_DECLS
- 
- /*** BEGIN file-production ***/
- 
--/* enumerations from "@filename@" */
-+/* enumerations from "@basename@" */
- /*** END file-production ***/
- 
- /*** BEGIN value-header ***/
--- 
-2.30.2
-
diff --git a/meta/recipes-gnome/libgudev/libgudev_236.bb b/meta/recipes-gnome/libgudev/libgudev_237.bb
similarity index 85%
rename from meta/recipes-gnome/libgudev/libgudev_236.bb
rename to meta/recipes-gnome/libgudev/libgudev_237.bb
index 169b19e0a9..57417f4e7c 100644
--- a/meta/recipes-gnome/libgudev/libgudev_236.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_237.bb
@@ -5,9 +5,7 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524"
-
-SRC_URI:append = " file://0001-gudevenumtypes-make-deterministic.patch"
+SRC_URI[archive.sha256sum] = "0d06b21170d20c93e4f0534dbb9b0a8b4f1119ffb00b4031aaeb5b9148b686aa"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.31.1

