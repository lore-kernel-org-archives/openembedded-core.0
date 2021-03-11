Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.5062.1615464327602877083
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 04:05:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gVuZJONg;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id w18so2365050edc.0
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 04:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6ap0aTCwyNmUxJrVC5onX1BBNjHBZ8JZaA94KN+MPI=;
        b=gVuZJONg/etE3ZsMvn2FzDE35YYFxxW/1rvhx0IgodFiFuA+e+K8gsSFFJUdIuxZ1+
         M+LJkaa/DTst9E7P7gIATpBJd3SzZkruY5v67ERX2swNGFTqavKKVbX4pN2UHDSp7WRk
         h2oSjqPvrHdgMHSqRSUxeqLDtP4oQzD0KO7WtYYbH8V2Kn/3/O5+5flezL40SXFQv5vJ
         4ekzNtae9pW5BeYj2b3pycPj3VwGPp8uZ0OpJMT4KLQUWMO3CuBcVqoDM7bESJvCNOwT
         Lt4N0YCCg56DuazjSlCcTQrkNv2GAw+kcjQ5V47ZCO7UMp69yDla4Z8YT+Lyus+t3Mpk
         Jl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X6ap0aTCwyNmUxJrVC5onX1BBNjHBZ8JZaA94KN+MPI=;
        b=rh/V0zJUqFB5auEvhl8Z8acZ04syTWm03t2ywk5cUPKRZc8ZzYebFGzcu640k95has
         xI93/IA/HifQN7lGOcgOxDblcmTyHv0Foc+Cs9/8yAHzHeBbV8FnqqwEcFldelt85zlC
         GHG8gHuD8SaQ9VY/1pP95Ay4s91F3OPGuRI3Z6xF46p4b27puTFtyfB6/Xk8roADGbor
         3L48rH1bDz7F9VmlxzID79bQpjnNSAGwjaWVmgyTO1rookGdPqxHJbBaGUiZPQoGFsTw
         4ahcqVT245m5/w3tJxCtwkLeWSMz7mO96jNM/R+5p3vP+iaFtUq6wNLrPpb3vAswoz8I
         RlkA==
X-Gm-Message-State: AOAM531i0kKlmZA9O07zNaDvqs8y11D+cwF5tPwEha8cEZ+b2jb471z9
	qmqZGNf9EdOcLgyOqccG2KdTxBTvWUPGMA==
X-Google-Smtp-Source: ABdhPJzykskSU32iegztVKNMXd5guy1ZVfSZI8N3VJ96FAD4wmCtriMHisVNeVa8GAc7TCaT6uN5wA==
X-Received: by 2002:a05:6402:888:: with SMTP id e8mr7995264edy.51.1615464325934;
        Thu, 11 Mar 2021 04:05:25 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id y17sm1229370ejf.116.2021.03.11.04.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 04:05:25 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 1/2] xwayland: add a standalone recipe
Date: Thu, 11 Mar 2021 13:05:11 +0100
Message-Id: <20210311120512.287214-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please see here for the rationale for splitting XWayland out of
main xserver-xorg tree:
https://fedoraproject.org/wiki/Changes/XwaylandStandalone

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../xwayland/xwayland_21.0.99.902.bb          | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9093f2d7fd..d507c70091 100644
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
diff --git a/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb b/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb
new file mode 100644
index 0000000000..75daa71902
--- /dev/null
+++ b/meta/recipes-graphics/xwayland/xwayland_21.0.99.902.bb
@@ -0,0 +1,19 @@
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
+SRC_URI[sha256sum] = "799491dd99cb2c6dbdf05162441d0469a2a9b36e089755eb59729dd38f44adce"
+
+inherit meson
+
+DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
+
+FILES_${PN} += "${libdir}/xorg/protocol.txt"
-- 
2.29.2

