Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web10.150.1620939402672195597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mMsjrqLS;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id a25so8310275edr.12
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5mNM+yH16F2I1tpn47/cHvMNPlbehZE7lpSWv2xDXPI=;
        b=mMsjrqLS1o3sN2a0XQfozjkQJkPIeJk1yDVfj8g5rqpUaS8s8G+I79GixlmqKs/hSA
         PZLmuP+YggJVWYZH4h0ZWAPLH1osPR9yXdnz35G5Giuv6ULlAsX/8HsEAp4nh/pTD1YC
         g9B+ZD1AnVrmlBAaXiR2PyrpX2rsY0sZ5lqL68TOYtn6Ggzee2Mx6tAfD4qyjWasfNdu
         O9g/almhpcUhDqPX/Zh1SFo4lug0k1P58okQr5462rK7chgtVleVraQ4ZpMgLDdkgENT
         egYFKNk55C0tLgS+0CrUjA72nLrj+IrZxBX85qITNjrLd+L/ZSq7wRj68mwxb/qlcSNv
         BUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5mNM+yH16F2I1tpn47/cHvMNPlbehZE7lpSWv2xDXPI=;
        b=Hq5+4quVpvTQxS81PMJe50j10sazhrX5cQpkEfYU37P5XTW8dBlgFWoqNaKUpUQu7Y
         5BCw9cjMTeJ6nNmSZLG1P/8oa7uUV5X4b2DoAYUCKHRz/2BF5C66Ue5+/zEiz+vBvCLn
         HBkJA+OuM3C2i9Ry8gkx9hf7WJVzncnd9n9971WcS8JNMW+Qul0F/q/Zr4dAdAIjeNm6
         mfiZCLfgIqLKekKHvILEEO6R4Hk+jt0IYox1RM5c89fHlatQ7qWzVA0hops0T/AEUaIA
         f2Oio1mYK3ZZnkS69j8zoVJd4T/9oMxISoHJORkUmn3HTcVOqZ1hqMI+goJ6mJkWBa7F
         ZzwA==
X-Gm-Message-State: AOAM53336vkpSGcccmVnV+gqkp1o1hEnQ6hL42QXogPEJ8VdTBW4az1Z
	UbeVECM/+J2Va4aTywhjN8qi42sj6+s=
X-Google-Smtp-Source: ABdhPJwadH6WYmumW1TGFkm7b8HXQOsxYOKo7XgUJ4skex3VcTc60OneQACiYKBqsyacOdefvAwrBQ==
X-Received: by 2002:aa7:d306:: with SMTP id p6mr51931574edq.168.1620939401316;
        Thu, 13 May 2021 13:56:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y11sm2934768edd.91.2021.05.13.13.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 13:56:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/8] gnome: drop upstream even condition from a few recipes
Date: Thu, 13 May 2021 22:56:16 +0200
Message-Id: <20210513205622.60879-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513205622.60879-1-alex.kanavin@gmail.com>
References: <20210513205622.60879-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

They have adopted the new gnome version scheme where the distinction
is no longer:
https://lwn.net/Articles/831746/

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_40.1.bb                    | 2 +-
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb           | 2 +-
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb           | 2 +-
 .../gsettings-desktop-schemas_3.38.0.bb                         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/epiphany/epiphany_40.1.bb b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
index e1e3ad7868..2242e9d010 100644
--- a/meta/recipes-gnome/epiphany/epiphany_40.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_40.1.bb
@@ -12,7 +12,7 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr gnutls \
 	   libarchive"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gsettings features_check upstream-version-is-even gettext mime-xdg
+inherit gnomebase gsettings features_check gettext mime-xdg
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
index 6cde6fffa3..61927c0dd1 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.34.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+inherit allarch autotools pkgconfig gettext gtk-icon-cache
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
index a36a2b113c..672fbd2b07 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.38.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+inherit allarch autotools pkgconfig gettext gtk-icon-cache
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
diff --git a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
index 34681197d8..cf06af57d6 100644
--- a/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
+++ b/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.38.0.bb
@@ -11,6 +11,6 @@ DEPENDS = "glib-2.0"
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gobject-introspection gettext upstream-version-is-even
+inherit gnomebase gsettings gobject-introspection gettext
 
 SRC_URI[archive.sha256sum] = "5704c8266004b296036671f223c705dc046aa694a1b1abb87c67e7d2747a8c67"
-- 
2.31.1

