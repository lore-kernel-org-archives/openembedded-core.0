Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4563EC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 20:44:30 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.17356.1639082668797702767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dFTdORzl;
 spf=pass (domain: gmail.com, ip: 209.85.167.177,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id bj13so10423564oib.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 12:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1sUaG4NLcunfC0u5IeKHb/CNNm6KwI4Wfrf8FII9qI=;
        b=dFTdORzlSk+WO9s5CO4RyMxXBaKclq0zWBuEKmwR0SDItftsf4s5hiMDtisH9MKc6J
         ZhVp/8WYJgR/gTjBrZomWpRSgoAASdVmF6cRYDd4446LcADpoCU0nUlHE+WTrO1XnM6E
         eSEf765WHEk0aT9lSbTP/zrsHbx1ubRv1RgHLn+R6eUxI1dG7+pLlerKNO3OsWnKYcN5
         GGXTKPDY8TkMPM8waFCp/Im0Oj/WRO9YGk+vAyAOyaklNjvLlRCNnrPtCsz0GAX/Mc3J
         r0m5LWAO54mUrwTSxSG2Sk6epMT9X4b5Wc3UofZGa+WltgtzFiOF+cKmid1+otPzuvNo
         aSCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Z1sUaG4NLcunfC0u5IeKHb/CNNm6KwI4Wfrf8FII9qI=;
        b=E8TqOMinzYdIL4V94Y3O35nS6t5DulXrDqRfecWKNd9EYbta5ltaQmaOxbo7fXYlyE
         hEIXjUqLB9Cel7BYEmFdA066iYwFtkjGf8N34sFKGLu+Ma9C6JyZLTIt67RiTDN+G/Os
         1eMlr87weelvUPN3YNbIX+3WIG5x7GDU+NDH53l3BHr0cPHHdOSyQHxhvXVwNypAS8RD
         W4LFyhfW87iSk0jC75dSyuCC6sLlh+DaGHAS8xiwURv2ZAN9pMvfm82+8SrOG7naLWSm
         Gbt7hYP1NahrqeTtKV4bvxa4EQBack/r0cnY8pkJ5l/xJqHaGHWQjdnNhgl98+d8lADu
         EeZg==
X-Gm-Message-State: AOAM531VdP+p120sJdolbbkBiwvNJ/mOTS4gouRtWaE/UfEy5lx3Apbr
	y34pAfsSV7OqirlDNs5IUEOLRnLorv4=
X-Google-Smtp-Source: 
 ABdhPJw1Y/K8EExja6u54J8lYO/SEAFwZKyZem3pAne0M15M7jmvUTt7R1JSXB0DoyPZQa9jyQbQQg==
X-Received: by 2002:a05:6808:13c9:: with SMTP id
 d9mr8750849oiw.154.1639082667908;
        Thu, 09 Dec 2021 12:44:27 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 y192sm194080oie.21.2021.12.09.12.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 12:44:27 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] webkitgtk: Add packageconfig for libsoup2
Date: Thu,  9 Dec 2021 14:44:17 -0600
Message-Id: <20211209204417.3924102-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 20:44:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159477

Adds a PACKAGECONFIG option to use libsoup2 instead of libsoup3.
Including libsoup2 and libsoup3 in the same process can cause strange
runtime failures, and the latest release of each major version will
cause the process to exit if either if both are detected on process
startup.

The default is changed from libsoup3 back to libsoup2. Most GNOME
packages are still using libsoup2, and a large number of these pull in
webkitgtk either directly or indirectly. If webkitgtk uses libsoup3,
this causes all of these packages to fail at startup. It appears that
most GNOME packages will have to switch to libsoup3 when they transition
to GTK4.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.34.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
index 413e0cdf92..279e260441 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
@@ -38,12 +38,12 @@ DEPENDS = " \
           atk \
           libwebp \
           gtk+3 \
-          libsoup \
           libxslt \
           libtasn1 \
           libnotify \
           gstreamer1.0 \
           gstreamer1.0-plugins-base \
+          ${@bb.utils.contains("PACKAGECONFIG", "soup2", "libsoup-2.4", "libsoup", d)} \
           "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
@@ -52,6 +52,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11',
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl-or-es', '', d)} \
                    enchant \
                    libsecret \
+                   soup2 \
                   "
 
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND_TARGET=ON,-DENABLE_WAYLAND_TARGET=OFF,wayland libwpe wpebackend-fdo wayland-native"
@@ -70,6 +71,7 @@ PACKAGECONFIG[openjpeg] = "-DUSE_OPENJPEG=ON,-DUSE_OPENJPEG=OFF,openjpeg"
 PACKAGECONFIG[systemd] = "-DUSE_SYSTEMD=ON,-DUSE_SYSTEMD=off,systemd"
 PACKAGECONFIG[reduce-size] = "-DCMAKE_BUILD_TYPE=MinSizeRel,-DCMAKE_BUILD_TYPE=Release,,"
 PACKAGECONFIG[lcms] = "-DUSE_LCMS=ON,-DUSE_LCMS=OFF,lcms"
+PACKAGECONFIG[soup2] = "-DUSE_SOUP2=ON,-DUSE_SOUP2=OFF,,"
 
 # webkitgtk is full of /usr/bin/env python, particular for generating docs
 do_configure[postfuncs] += "setup_python_link"
@@ -124,7 +126,7 @@ EXTRA_OECMAKE:append:x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS:remove:aarch64 = "-fpie"
 SECURITY_CFLAGS:append:aarch64 = " -fPIE"
 
-FILES:${PN} += "${libdir}/webkit2gtk-4.1/injected-bundle/libwebkit2gtkinjectedbundle.so"
+FILES:${PN} += "${libdir}/webkit2gtk-4.*/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 RRECOMMENDS:${PN} += "ca-certificates shared-mime-info"
 
-- 
2.33.0


