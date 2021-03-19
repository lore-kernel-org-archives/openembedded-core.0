Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3519.1616143510165203646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 01:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hLdbMeRB;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id u9so8363287ejj.7
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Mar 2021 01:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YRxq733I2IqcWLaMcZ2kjOxbOuRs0ue6uOjNDiL+6mk=;
        b=hLdbMeRBBEpZkk4H4V9QzOZiNdo2+HxiwsUPAoSS3iP2dksSNIFALKSZroMMijcTKb
         AcLbJNszO520uB1kEunmarhi6AolT4eMsT/zbRCnfkYM778P5elRCWxcslUFLrtni7IV
         3PaMbjEZM9Ia7lLXK7ETknOEqpPvSIa6PlLRJBLCs/IDcnvP9y1wKBFyNDCxfwL+MYyi
         VAq/DkWC0tFU5CTLavlWivVTTPi1t3zSiqY6NGqbvSWpwzsFR1emDmzjEDAWiLfr7iCr
         NDuU3mI4a0RjePZ6Riwzn89dXrHBPyD84t35G7HLyE/1B4dAxRHh1ZjQxlp4fgLOlBtx
         EmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YRxq733I2IqcWLaMcZ2kjOxbOuRs0ue6uOjNDiL+6mk=;
        b=GLiyG+bbLxdp0Zl9KMSASe6R3Zx346eT01iZzPFg2yqTm9h0gAuVESfqNoK3ppi1Ek
         MW2XTUO9l/y4btNtYJCqbAD0Q5AMEiOxhljhGKtzHG+tJxP2VPwJXiKY/v6cneLS6Jwb
         BINP1gamFQRUGtXtz8WCkuPLAXkPiqeWSBuFeEn/AYX+lWtaC3EbrHFYNhE5xZ2Pbl68
         AqkaabzS2YcF8mbe967QcASisYDx6h1nw5+MJ5kNASMCBNlhhp1N28mfoexjpALvp4Qm
         L1/gaT0RK5GjiPAr6YA6abvzICGVmyZSP4dfrgNjVIwo9mjQ8yuXhrHMXcwLGbq3LAtU
         rUFw==
X-Gm-Message-State: AOAM5312yJRRqI5FfAonQr4wlxgpUYVqOPatM3kV4my9LUfpy3t8dayd
	CGzVfSoSER0zI8XmfFjx3VyGJidKdoggHg==
X-Google-Smtp-Source: ABdhPJxmMYHrjQ/G2p4/6vBm9HlNDnElfzPAU0ilq+F10s4Up1wW1rngM4aKNIQb8GQtky0RmQlxkQ==
X-Received: by 2002:a17:906:f896:: with SMTP id lg22mr3010580ejb.124.1616143508299;
        Fri, 19 Mar 2021 01:45:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id nd36sm3262248ejc.21.2021.03.19.01.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Mar 2021 01:45:07 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 01/16] xwayland: add a standalone recipe
Date: Fri, 19 Mar 2021 09:43:46 +0100
Message-Id: <20210319084401.576728-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
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
 .../xwayland/xwayland_21.1.0.bb               | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland_21.1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index ebaece9cb5..99aaa1e763 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -797,6 +797,7 @@ RECIPE_MAINTAINER_pn-xset = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xtrans = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xuser-account = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xvinfo = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER_pn-xwayland = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xwininfo = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-xz = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-zip = "Denys Dmytriyenko <denis@denix.org>"
diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.0.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.0.bb
new file mode 100644
index 0000000000..9aa0291e3e
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.0.bb
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
+SRC_URI[sha256sum] = "8a71c3e8b95c43bb91bc3d7a4ff9075456a0cfe297721dbc8d4a76cf241d82fb"
+
+inherit meson features_check
+REQUIRED_DISTRO_FEATURES = "x11"
+
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
+
+FILES_${PN} += "${libdir}/xorg/protocol.txt"
+
-- 
2.29.2

