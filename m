Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.33906.1595787697514540253
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2020 11:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mFdcoEar;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id p1so6913217pls.4
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2020 11:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=w1tHiz7rbvyMBdN2wuoSDQpkJNKvu8hNtXJOeQ3Iw+o=;
        b=mFdcoEarEyfI1BTjRITPeOXE9blh0SeqyGgURRpISc7KZUFy47e64MqVhLSrHExNXJ
         5h3/O0Zsy5ghMqVnQPe1HD0+bvNwXn4JJa0R9UPZYHcQFslwUxsxRx2z+YoRipXx6wJG
         OGotubVQM7dmruDW/q3p+Aq6nYlSD5g7YUulkdAk6obvyeC4uGNezog/n0D7anM+0Zx9
         b4+zZK46IwyKdScBY8yPw5ZRHSrAXnzJy+gE8iyRheosljqPCeasxgMiCiyAl4WCLMLX
         FWECXzv+JxDg0xrpwh2EAmPiFI3ZcRmh8GTR0fPFqJhcThVmB6YQ1UnCCh+Vak6ONn5l
         ATbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=w1tHiz7rbvyMBdN2wuoSDQpkJNKvu8hNtXJOeQ3Iw+o=;
        b=aUKxYilGZr8YaKSmeOGGISAa+7j/F2+jP2bJgjx976xEshj5bVxQDZifcsfWR6u8vo
         insG9EcNoFfejX9x2d4ZQC3SAF9JLYpeaFEqSLfEmi9hzGb4qo+awD4m3ISL7FNcVp6J
         fCt5nhQM+A4zBh/lfQF5fbFVe30PAQoDTkNnhpsEjxq3IkIp0ecKtbfCJJHttI3CGHC0
         nNWNQCGlaECp32JwqbAqOe65ul2RGMc6muDnhucEi16tICn/EKrRopVTD0jkvvmrDG+4
         2soYA9CR0Ngs9ZOewZX0e63j/+qyMNcEnf2FNj3uQ/RLnoP4NsgL0dJcYDZ+bjNSe+cN
         PUkg==
X-Gm-Message-State: AOAM532ZmSkYkh2nbeO5GDxPyAshcQ6QPDApzI1Hw/kSqKdK04DXmce9
	VZAzwiRM9jkDI839wuigUrIc47XOK9w=
X-Google-Smtp-Source: ABdhPJxjopcGRZFTC0ggGtlSlAj4TjU9ELzDP1zT9lFMqcQGa0HWdleDZrKWL+enAcCmOmf6nYJFpQ==
X-Received: by 2002:a17:902:c405:: with SMTP id k5mr15559142plk.202.1595787696803;
        Sun, 26 Jul 2020 11:21:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:957c:826:e40f:5fde])
        by smtp.gmail.com with ESMTPSA id io3sm11856661pjb.22.2020.07.26.11.21.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 11:21:36 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] adwaita-icon-theme: has a dependancy to gtk3+ add check
Date: Sun, 26 Jul 2020 11:21:35 -0700
Message-Id: <20200726182135.477-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

fixes:

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'gtk+3' (but /.../poky/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb DEPENDS on or otherwise requires it)
gtk+3 was skipped: one of 'wayland x11' needs to be in DISTRO_FEATURES

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
index 2d78bea2c85..f185a3478b0 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.36.1.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c84cac88e46fc07647ea07e6c24eeb7c \
                     file://COPYING_CCBYSA3;md5=96143d33de3a79321b1006c4e8ed07e7 \
                     file://COPYING_LGPL;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even
+inherit allarch autotools pkgconfig gettext gtk-icon-cache upstream-version-is-even features_check
+
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
-- 
2.17.1

