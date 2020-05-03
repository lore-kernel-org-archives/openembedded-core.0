Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.25494.1588523202663228280
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LILLOgTp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id v8so13727097wma.0
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rcKvUeCOOct+AmrorxEi18he+N1lVkfAUDZDhoDkWyw=;
        b=LILLOgTpuQDyF0vB576Huk+PIE6tjMFdaMxUfmSMB3PEWWDj3iSK9c6IUe6UYOjVTe
         bJpV7uayrRJCNzqjEBxqqszEkiuXGKxqlzPzrL/Jd1tlzPtRDg+sg02NNzQ7dVfVhfYm
         j8S5qLaVvPf0Cv6SLUhJAdcep89ZD4FX/g9AYffw3zQqtUE8c4jIP1h9GwVBqRdjUZlh
         /D4Ecb9L8bD3ydRw64K35R6ZTYAbwDl9RyaBz2tnyJs+Mbf8a2EN7rWCPCnsP2RHQQWa
         qcUDz87P3b9y8pMc0kwdMbD5eQQvqpPNdpVLWe32K1UwT2p13S5qMyiXAD0Jns/J20Ft
         WbBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rcKvUeCOOct+AmrorxEi18he+N1lVkfAUDZDhoDkWyw=;
        b=QPH3d5oR0qWRmk6ichKr8G26tOQPkmq4CYy2hRGaVdu36XN+U3BxBmEyewYGQY8jyZ
         ZFxz6n3ld4R64XRr5oGJGnARlc2B73zKSeMaCtxKZsWUZpd9ZYT5bvt+RAIJzLhNZ2Ob
         12/KCCPUi3JfZldU5gk4nq0/A/i5iKLIBp4wCDsd5trNvxHunvVGdvUCrpXgoX3HtZKd
         YG4E2AzsTJmOhO8CAk+wgw/fjD0nDDdtdFgsNaZwsOLfAVWlzim5mjsoXe8UB1RkYB3Q
         r8WKy4+16E7K63tX4Iv3DbscA6hXtWaVk4QHfS62Ms+Ag46lWgtl4rqOQ0tpzAhsBSY5
         anyw==
X-Gm-Message-State: AGi0PuZb5f9GIch+AOzL3pJJSUqRiaRTlnlAfm+Ied1JskU8PwE1sszo
	zHjv1y1+PUnQUwWRYadT8e6xr5jo
X-Google-Smtp-Source: APiQypKA2TdozSIv9f00sHnYeaP9qGT9URvOmSXfvTkMAn5hKjCmxTLv9Vc60mQT1R0KZI7kPWtjLA==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr9714677wmj.169.1588523201040;
        Sun, 03 May 2020 09:26:41 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:40 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/17] libnotify: update to 0.7.9
Date: Sun,  3 May 2020 18:25:55 +0200
Message-Id: <20200503162559.946-13-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert to meson build, disable manpages as I couldn't figure
out what is needed exactly to build them.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{libnotify_0.7.8.bb => libnotify_0.7.9.bb}         | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/libnotify/{libnotify_0.7.8.bb => libnotify_0.7.9.bb} (68%)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
similarity index 68%
rename from meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
rename to meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
index 0306b04f4e..29a28272e1 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.7.8.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.7.9.bb
@@ -7,12 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34"
 
 DEPENDS = "dbus gtk+3 glib-2.0"
 
+GNOMEBASEBUILDCLASS = "meson"
+GTKDOC_MESON_OPTION = "gtk_doc"
+GIR_MESON_ENABLE_FLAG = "enabled"
+GIR_MESON_DISABLE_FLAG = "disabled"
 inherit gnomebase gtk-doc features_check gobject-introspection
 # depends on gtk+3
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.md5sum] = "babb4b07b5f21bef42a386d3d7019599"
-SRC_URI[archive.sha256sum] = "69209e0b663776a00c7b6c0e560302a8dbf66b2551d55616304f240bba66e18c"
+SRC_URI[archive.md5sum] = "ccd9c53364174cc8d13e18a1988faa76"
+SRC_URI[archive.sha256sum] = "66c0517ed16df7af258e83208faaf5069727dfd66995c4bbc51c16954d674761"
+
+EXTRA_OEMESON = "-Dman=false"
 
 # there were times, we had two versions of libnotify (oe-core libnotify:0.6.x /
 # meta-gnome libnotify3: 0.7.x)
-- 
2.26.1

