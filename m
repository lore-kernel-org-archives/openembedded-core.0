Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web09.6304.1618822954178475892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 02:02:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BDZkiuu4;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id x12so30942477ejc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 02:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jyx5mH2U93oP3ElrjX+Inm5Ys09l409CEFOZ59Ufkgo=;
        b=BDZkiuu4eeUCHsrmQNRAmAbfIaUW4NMmTVyavX9w1Xo2QYok+cJNrDm7Zj7n5V5x5B
         BjBNOdTuF6Ho8L5r280eoyOsxO6fFaWvj2jOROkbmZJhrKyCr0YHJtVu5azenFnrbLKl
         U8mRtCDCWw0Qk/Z4GAbMUlT/FdlDZg/I455iGAX5BNXAXiwym6OcSukNmNB7aZAzFsod
         dVrsE2Ki3Cv0uJ/D6z7lNv9nYBhXgPBye+ToZijFTIAkuyAc3i9a9FpBf4A2O53a4JTd
         qQDQFkZygii29C6mQKYH2HayHOVsh0InbocT/BtFWosKTFFiB0/+X6U0kmcT2kkHBdyj
         dK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jyx5mH2U93oP3ElrjX+Inm5Ys09l409CEFOZ59Ufkgo=;
        b=eY+NAXZJD5/21+xiysfdjgk0GAvTb/D/KtHg29wZhujOQV4/7Gga1sAE4noMwA2+oZ
         A6nK58yhAAAUo3ZQmU6BXvRTo8RCwA7QOu6l7AJDKsuwYrz4FsCSK0QWz1oP7GKD1n8l
         ccHI4zd22FkpdMd7TrXTLoE1OG3soNz9kIcyO7qVweREf6c6eVC1wmiFl7TDfCzM+XQi
         XDfxXxK/t1nPP9ATStdNOPVcbGmUFNbSBUdTSQEBXV1HB5vReRTy/3DAbGBTWl/dUU4j
         79O4t81usfSkZkk3cY4hck+qLfsiQItQqQavk2TV4f7WWlyE9kzJ6J+xspIM5aI7EXDm
         mLBA==
X-Gm-Message-State: AOAM533DadPbsL7fqBfIr7tiVPdV5B43Y8T5JkY+V+4dE8N33XcY9/85
	veRvY7JQvNxI1ZGlG8yn61nlQcgIE9gEdA==
X-Google-Smtp-Source: ABdhPJwjDVAtW7i8JfYAUlZ7DrvZY9kStuDPa+a4RChWs9gpPaWrYujYbP4USw/0ejstBBqK6gy1Sg==
X-Received: by 2002:a17:906:4b01:: with SMTP id y1mr20727232eju.218.1618822952848;
        Mon, 19 Apr 2021 02:02:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm11955252edd.16.2021.04.19.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 02:02:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] xwayland: add a standalone recipe
Date: Mon, 19 Apr 2021 11:02:23 +0200
Message-Id: <20210419090224.582794-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please see here for the rationale for splitting XWayland out of
main xserver-xorg tree:
https://fedoraproject.org/wiki/Changes/XwaylandStandalone

Release announcement:
https://lists.x.org/archives/xorg-announce/2021-March/003076.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../xwayland/xwayland_21.1.1.bb               | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland_21.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e1b1afcd7e..db0b2b4df0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -797,6 +797,7 @@ RECIPE_MAINTAINER_pn-xset = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER_pn-xwayland = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xxhash = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
new file mode 100644
index 0000000000..82765cdaf9
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "XWayland is an X Server that runs under Wayland."
+DESCRIPTION = "XWayland is an X Server running as a Wayland client, \
+and thus is capable of displaying native X11 client applications in a \
+Wayland compositor environment. The goal of XWayland is to facilitate \
+the transition from X Window System to Wayland environments, providing \
+a way to run unported applications in the meantime."
+HOMEPAGE = "https://fedoraproject.org/wiki/Changes/XwaylandStandalone"
+
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5df87950af51ac2c5822094553ea1880"
+
+SRC_URI = "https://www.x.org/archive/individual/xserver/xwayland-${PV}.tar.xz"
+SRC_URI[sha256sum] = "31f261ce51bbee76a6ca3ec02aa367ffa2b5efa2b98412df57ccefd7a19003ce"
+
+inherit meson features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
+
+FILES_${PN} += "${libdir}/xorg/protocol.txt"
+
-- 
2.30.2

