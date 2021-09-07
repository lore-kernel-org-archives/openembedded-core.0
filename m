Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web09.242.1631025879976858587
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 07:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=IcwD02ko;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.173, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f173.google.com with SMTP id 6so13050349oiy.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Sep 2021 07:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=1ubqyPGFmUio8w7gzF7OHVaN38lRajdUZWoBg6M+Nbg=;
        b=IcwD02ko0fPVz7ZSOekjSIY+cl7yX/3bV6VSpISMgtJ3Y0aOE6ovD+VIGR9dj3F8SK
         DKkaxNpuOlVFMSxctVYAZEDfBUgbS6V9MvoBHuoq/Ct4YIHoZekhi+APsaTdfkv3PAFT
         6+aabZf/iqUzFyRDWJlAcDITy517OI8WA/OCBjf9NwxG3xa/Lwpbvpx/n7V2oHJuXjiA
         IUqDWTr9jHpBcZS02/+qTlWlJdAu2s0g9QKYHBd6E1N0uKKVrE45/kiF60hIedtDAYGD
         e+hvj8f2zIBZHwLoEx3CBV4Mb1Y/cRv1LmS2byxpPFHfoZqRUb/Quj4LKHlzwnZ0GFHt
         YYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ubqyPGFmUio8w7gzF7OHVaN38lRajdUZWoBg6M+Nbg=;
        b=G8xrPdi6N1mIuSVNtyN/eAQlVesPzNS02EoRdIywLvxdimTqfCycIH9rS82FdJV9Cf
         exI2fs71SLOHqaKHV9eV1zLOibAyR9lyeypVJXgkJSgcnwBKrnxELjNO7EMfLpnpBMWD
         lQ0mMp6oZ6vPGKieiNxH3DZh3iHY9yoLBRAEipSRtUtFrMuZe7z0Z82g9EDhdqrMLfiM
         qmTkwHnlqLokomJaJiimLhMBVQIbUGfAL2LT6dLdPXVJjL6+x35fCtEIncQ6umc7HEsL
         YyjISzcNsXsoO3LrHv0J2nH8Wh31fGEyImAyA3ZhXNOhvg/F7OH2Qt0ueBtC7MkJtRYM
         OckQ==
X-Gm-Message-State: AOAM533FFEqZ/drcrvz2pUdnbrrhb1cqetzF06h7iosUkanp/QiT+HbI
	RyVMWGodLjOrGkMANbiwuax4PWAhZWwBKVcd
X-Google-Smtp-Source: ABdhPJwX+2F4mSw2K49r3oDM7Zu3p1hegFHqKCBxnAy6MyhmTYEankdefHZxn1qEjMu2GqpI2N5i7w==
X-Received: by 2002:a05:6808:189b:: with SMTP id bi27mr3165660oib.59.1631025878677;
        Tue, 07 Sep 2021 07:44:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id q22sm1313761oof.14.2021.09.07.07.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Sep 2021 07:44:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/5] gdk-pixbuf: fix CVE-2021-20240
Date: Tue,  7 Sep 2021 04:44:04 -1000
Message-Id: <c7b6a3fef6aa04bb1d264326e483e8a3d3350ca2.1631025627.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631025627.git.steve@sakoman.com>
References: <cover.1631025627.git.steve@sakoman.com>
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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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

