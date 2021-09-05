Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.12333.1630864461263908420
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Sep 2021 10:54:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=btIRasJe;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id g14so3796480pfm.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Sep 2021 10:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTRmG4SIYFU4aYSAAzpkcMjEagj7u3GvHt+RS0Yzo48=;
        b=btIRasJedyMnlM4QqhpTArv9Nac4ouu83gBUKaXXZ9aayoUc4DWA7cWr+MoUKCcqrl
         ee4rHM1adJnjUP2kTceAz5E1S01DCccllYrMNrjRJcqOk4Bx1mPOge7NsExyFo8CsmsC
         hu4M7mVm5ilh5heoKTHIOweR/UhU3I6dy8bGYmL0RDL37L4o7iYnQh37uw2TPHXYpt2F
         WiHsgsTiDrurj2amFIw60wox9fyInmFaGHPVc/0IETsre6QqqdfWWECslr3+OSt5CM5W
         6EDESnt1wz024HaAYsv7aZHyw20Ld5sWRNrBuVAtXrEqdIwiaQoLO/lIJi7si8DnH14y
         DLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TTRmG4SIYFU4aYSAAzpkcMjEagj7u3GvHt+RS0Yzo48=;
        b=ckuGruoxbcu/x9jYufPQofYjfo0LPgvoI2YwdkNZRVZ9A8KGwErWO36NuAOv8ltu14
         LP2fn6S9suEyOePk291HvveD5IuSt1uNWa9i6zUhoo4kdB2iMgV42tx8qP+PYbQBdrsk
         lbz47YBttpsOTOvZ4hoPwsaPu6aeSw1NjYQw2b5mbOhUgA+smntSfzcI81x8R2oiiZJp
         2ggGfA1n4dB25QjkijstOKfygXJV7ACxNsHGpLWqwLfAtfvG4olsQYQyXagfLCVV3vVv
         jMfTcL3PkGugqc9Cv3TS+z/VMOkVR1GMaGpRPMN6eFw0QuGh0mqTGgcvfjyB45tTm/gD
         Rfvg==
X-Gm-Message-State: AOAM533t0uriVMLjB8BuBc5IP7VrLUcR+KWic/sJhPxZG8zscl3/Yk+F
	sHoyXxKfW1uE8ghEYgQIUWbvWn8r/FQ=
X-Google-Smtp-Source: ABdhPJzVEY5LNg1xRgQNmLBzKluGXiGUlPSYwz/S5oHJojFjP/eXt+zoYj1Z+YXkSU2tokSk5trpYA==
X-Received: by 2002:a62:1450:0:b0:411:26a5:ba7e with SMTP id 77-20020a621450000000b0041126a5ba7emr8345291pfu.77.1630864460536;
        Sun, 05 Sep 2021 10:54:20 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:741f:21b:dc9f:801])
        by smtp.gmail.com with ESMTPSA id 186sm5300506pfg.11.2021.09.05.10.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Sep 2021 10:54:20 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changqing Li <changqing.li@windriver.com>,
	Anuj Mittal <anuj.mittal@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Armin Kuster <akuster@mvista.com>
Subject: [dunfell][PATCH] gdk-pixbuf: fix CVE-2021-20240
Date: Sun,  5 Sep 2021 10:54:18 -0700
Message-Id: <20210905175418.2041599-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changqing Li <changqing.li@windriver.com>

Source: https://git.openembedded.org/openembedded-core
MR: 111543
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/openembedded-core/commit/meta/recipes-gnome/gdk-pixbuf?h=hardknott&id=bd08e4d179979937604c196b4047f59c5499a960
ChangeID: bd08e4d179979937604c196b4047f59c5499a960
Description:

(From OE-Core rev: bd08e4d179979937604c196b4047f59c5499a960)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit de631334ccd2d6af74ed795228394ee2b7218403)
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../gdk-pixbuf/CVE-2021-20240.patch           | 40 +++++++++++++++++++
 .../gdk-pixbuf/gdk-pixbuf_2.40.0.bb           |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
new file mode 100644
index 0000000000..fe594b24bb
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/CVE-2021-20240.patch
@@ -0,0 +1,40 @@
+From 086e8adf4cc352cd11572f96066b001b545f354e Mon Sep 17 00:00:00 2001
+From: Emmanuele Bassi <ebassi@gnome.org>
+Date: Wed, 1 Apr 2020 18:11:55 +0100
+Subject: [PATCH] Check the memset length argument
+
+Avoid overflows by using the checked multiplication macro for gsize.
+
+Fixes: #132
+
+Upstream-Status: Backported [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/086e8adf4cc352cd11572f96066b001b545f354e]
+CVE: CVE-2021-20240
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gdk-pixbuf/io-gif-animation.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/gdk-pixbuf/io-gif-animation.c b/gdk-pixbuf/io-gif-animation.c
+index c9db3c66e..49674fd2e 100644
+--- a/gdk-pixbuf/io-gif-animation.c
++++ b/gdk-pixbuf/io-gif-animation.c
+@@ -412,11 +412,15 @@ gdk_pixbuf_gif_anim_iter_get_pixbuf (GdkPixbufAnimationIter *anim_iter)
+ 
+         /* If no rendered frame, render the first frame */
+         if (anim->last_frame == NULL) {
++                gsize len = 0;
+                 if (anim->last_frame_data == NULL)
+                         anim->last_frame_data = gdk_pixbuf_new (GDK_COLORSPACE_RGB, TRUE, 8, anim->width, anim->height);
+                 if (anim->last_frame_data == NULL)
+                         return NULL;
+-                memset (gdk_pixbuf_get_pixels (anim->last_frame_data), 0, gdk_pixbuf_get_rowstride (anim->last_frame_data) * anim->height);
++                if (g_size_checked_mul (&len, gdk_pixbuf_get_rowstride (anim->last_frame_data), anim->height))
++                        memset (gdk_pixbuf_get_pixels (anim->last_frame_data), 0, len);
++                else
++                        return NULL;
+                 composite_frame (anim, g_list_nth_data (anim->frames, 0));
+         }
+ 
+-- 
+GitLab
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
index 54861e83c6..60a04c3581 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
@@ -25,6 +25,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0006-Build-thumbnailer-and-tests-also-in-cross-builds.patch \
            file://missing-test-data.patch \
            file://CVE-2020-29385.patch \
+           file://CVE-2021-20240.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.25.1

