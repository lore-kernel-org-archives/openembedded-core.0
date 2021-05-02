Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.24888.1619985698723441546
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 May 2021 13:01:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eEAdeaWh;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so2322001wmh.4
        for <openembedded-core@lists.openembedded.org>; Sun, 02 May 2021 13:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AK98PbobFsWlS93pw7wZiZZ7hTI4o2yPrp+7JwDdIqw=;
        b=eEAdeaWhn1t9MOYILYrG7MJE54SVC5Yb+B9M1/Lymhvk9Bxan75YOqM1F4wSD2wQAT
         SaBLgtSkOuqg1XunxEME90T3MhTXVKT4VGXcYMPUb6RGG3LEkVxyToODRMPZRY6JVI1N
         4C3Bt0w1pvzuqcjE6XO0XYlm74QIT58O+I0+dEc+18Q5/NRqBsXqGXzACf+AnVZOppRS
         jP42uj+7uSVcTT6pc2TtH/kFEwDzTe4cl4cHlveXPMvf1pycmR6Wll41F9Zrnijd8BrP
         o7EiDJqBzNDn2HANjpL1NorAuBK5g4qOVU+HDag4UPf7+8YQzeQ3JYBKlWAWB5hO0pxW
         FCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AK98PbobFsWlS93pw7wZiZZ7hTI4o2yPrp+7JwDdIqw=;
        b=WHmConuZDWgnI4NeiETCz8poLF7QeDGHdRpkvGHQEAVR5DLenWnYjjySrDk2kLkZHo
         a/ycOFTPWm2e3YEjyN5PzWp1ZyDmb6NpmJIko/YQDvkDDuv1Z5tbtS7WZHVcwpUrDlX8
         51oFP62Nfd9IKYpaSCkIOqowfm5qT93fbgXsp18+4AVXOkrT7QFVMQr4GFRvDRXcNuZL
         LJ5O+jpffhFkrWxe62yqkxFL9ZhiHLVpQvXZcbZX37KH5b8y0iSeFMxXEPU2T5RA+MqP
         FVRlWAR6NJZcIS8GjX3i8cEvkviS9BrV2RzhFAiJnebs7HtX7O83ZmM8r/0c6PHuN+Sp
         pIyA==
X-Gm-Message-State: AOAM530cZyPAvJEU6YsF3W8xavPutgwlP+UhgWSNhnzmKDLaGxfOA9FR
	ZPnYVbe7vGJDXV1XuV5w5UrLo83FAiY=
X-Google-Smtp-Source: ABdhPJxGed4+SCeENMCJLJZZqEVaasOZuOyAId5WRWWLdEaP6QiX25uoE3F7tY8hvTN16O53RZx+rQ==
X-Received: by 2002:a05:600c:322a:: with SMTP id r42mr6867331wmp.98.1619985697055;
        Sun, 02 May 2021 13:01:37 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f3e2e361c96f36d2ea84abd.dip0.t-ipconnect.de. [2003:f0:7f3e:2e36:1c96:f36d:2ea8:4abd])
        by smtp.gmail.com with ESMTPSA id d22sm10237181wrc.50.2021.05.02.13.01.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 13:01:36 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] xwayland: remove protocol.txt - it clashes with xserver-xorg
Date: Sun,  2 May 2021 22:01:28 +0200
Message-Id: <20210502200128.1043667-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Images with wayland-compositors + xwayland + xserver fail to build
* Fedora - they introduced standalone xwayland - does same [1]

[1] https://src.fedoraproject.org/rpms/xorg-x11-server-Xwayland/blob/rawhide/f/xorg-x11-server-Xwayland.spec

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta/recipes-graphics/xwayland/xwayland_21.1.1.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
index b2ff25fbbc..8b1c96fc4a 100644
--- a/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
+++ b/meta/recipes-graphics/xwayland/xwayland_21.1.1.bb
@@ -17,5 +17,10 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 DEPENDS += "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wayland-protocols libdrm libepoxy"
 
+do_install_append() {
+    # remove files not needed and clashing with xserver-xorg
+    rm -rf ${D}/${libdir}/xorg/
+}
+
 FILES_${PN} += "${libdir}/xorg/protocol.txt"
 
-- 
2.30.2

