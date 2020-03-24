Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.6697.1585058223337524907
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:57:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=R72fxnxN;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id h15so9343710wrx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+YJ+7hNjPGDz0QsPHdf4xe/9exfcaMIoE/P+2UVZ3ck=;
        b=R72fxnxNSDoK62eD8B+ZVqaYTEeEaEYdjCDUTs/vKmdKzTJQEsXE3yF0cnT9Es0h/f
         FfXEiJ6WIgVzem5bR7D9CHm+EujY7tShY/VpOnaaYnPTHdntuWUVozoGHSc+71hucW15
         qEYFoRCJ6sWKSFJnKUr/RJqm/0GWP5GXNbraeFowZTGmYCMZ1Dei5dUA/rLtI3VVr4W8
         qNn1j67D+/Z4slWChTNNXfHQs18UobIpjS0XukSapTn9+9cyFeP8EaPBB81mSJZ7/AoF
         BoNJVBHyIcWF6qhtjBImwP/dwKu6cSlWRyahSqYLWd0nHdG97Zqh7b1+SRL1aNn+iMq+
         e9Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YJ+7hNjPGDz0QsPHdf4xe/9exfcaMIoE/P+2UVZ3ck=;
        b=SFTFeT5uoOJiwnpoAbH2lRKwD9z5dDjWE58oT+bvz33wcDZhtTxHOawOcFE/qK9a2p
         hCLnf0mJqmNGoKRmFSQGWhGcYifL40bn2VX/EivUti437zPUacXDN5BQgMBPB5Qnf4G4
         pb+Z/45mC4Ef8n0tI4MYXOIVDtGChIOItI68ffV0vj8ShKcALaDa73lwc0K7eQFuGE3v
         hEtOlAGXQuKvmenldDNQMJKtJ7ZwnQILPiPWnUnX2H72WP2DYCIZu7jFk4VngbtEvqgh
         d5HZqJq2RT4qp1y3DpIgavJS4/3Y/Xwn9E2wt+HJ9oJ80BiPlkYdIu9LN1D/pbU7ax0I
         9YRw==
X-Gm-Message-State: ANhLgQ0k69sPcTibYMemtOuxosjayg0ID6s7HajJD5Smfn5ZcIKDl/P3
	EWBEnbQ57eRoWKDPwlbFWrAecY8kofKQYpDH
X-Google-Smtp-Source: ADFU+vtvLT5dXVBsE98ZpdJj9xJBA0/7AX7d1ovBUw+W4vGL/n0AWE3mpDB7ODGEKQolu47ADI0a8A==
X-Received: by 2002:a05:6000:48:: with SMTP id k8mr16321586wrx.91.1585058221782;
        Tue, 24 Mar 2020 06:57:01 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id o9sm13252506wrx.48.2020.03.24.06.57.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 06:57:01 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gtk+3: turn explicit disabling of colord to PACKAGECONFIG
Date: Tue, 24 Mar 2020 13:56:53 +0000
Message-Id: <20200324135653.1985586-2-ross@burtonini.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324135653.1985586-1-ross@burtonini.com>
References: <20200324135653.1985586-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index 12fa83550a0..5d1f59ea1ac 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -37,7 +37,6 @@ EXTRA_OECONF += " \
                  --disable-glibtest \
                  --disable-xinerama \
                  --enable-modules \
-                 --disable-colord \
                  ${@bb.utils.contains("DISTRO_FEATURES", "x11", "", "--disable-gtk-doc", d)} \
                  "
 
@@ -55,6 +54,7 @@ PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
 PACKAGECONFIG[cloudprint] = "--enable-cloudprint,--disable-cloudprint,rest json-glib"
+PACKAGECONFIG[colord] = "--enable-colord,--disable-colord,colord"
 
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
-- 
2.25.1

