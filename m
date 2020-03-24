Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.6694.1585058221635482636
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=RdhiAlVc;
 spf=pass (domain: burtonini.com, ip: 209.85.221.45, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f45.google.com with SMTP id d5so9215943wrn.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7GVXE4GLCjQ2VWjGQ8NPmL0TewMng6hxp1ahixhBeE=;
        b=RdhiAlVcQrqYzEJcVCcgkKqn6aulEWvO68djZ7z58qATkg4r6+fB14dOtzk83ow7UB
         6sd9P54vzGjfZxwQSh6HFET6DOoxGTI36KxjCJ9chX2F2lRz5QDnZIx/qQi5XBzgoNWL
         HjHu/Y7h+uZuo1xKfaERZG3DRdrsUYfEG5v4zYB91V+soKmoLbUTXArVfTeGykFQ9D+h
         u38aTWDiVPoSLBFzogsiMZrIHBVrC84WDYNBTavrClgOyYQz3/k9xuTNGRDvPw8tFggi
         kNmOszOZ46JcHhhotTVXtBAZktVGxZvnwnrTwCpAp1Dhxok0W3mHJD8gBHCjH7mIA19l
         hYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o7GVXE4GLCjQ2VWjGQ8NPmL0TewMng6hxp1ahixhBeE=;
        b=d8xAcp+7YRwF199alrcj3tqIkoE71ZGS8BTnJ0pCi5Zs+VFPrar/4XBJ4K1UoyE9XZ
         fcpu2zsozmirvInTfkhdeJsGohlZKYTHy6YnzsrY/L6ejugmMCXOw9y+s9A1KfSk33jC
         79A8RjXmHZS7mDJN/XyCBu0ufdJGdRv2WqI6dOifenSw89xv2hjmz3e5t2maDURSqgBP
         tdgR9/heRJK2VgfbLGcX/eiEg+upyqpwSQNjN09Ube+HzBv5QEIt/8UTTrNZVOOBi44r
         nFD2SX2u33TKeCwgYL1GgCoLUlA+FKOhMlwvquMB1bZTk+oFzmVYjKmdMIJotsIi5a32
         Od8g==
X-Gm-Message-State: ANhLgQ1AKr3D7+E5VDmidXxhZA82iXZqym2czuphgTMT23JXRELBjoQb
	hnA29tv/jRjX30+7Y/wbF9ruwdgoW7NLGOkE
X-Google-Smtp-Source: ADFU+vvcNPVGyyFzf35muSU5goYHjHFCJwCSeYVBIxI97eaimPxpK70II53tYM1Cn2w8vJsNv0hfsQ==
X-Received: by 2002:a05:6000:11c2:: with SMTP id i2mr14806294wrx.210.1585058219735;
        Tue, 24 Mar 2020 06:56:59 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
        by smtp.gmail.com with ESMTPSA id o9sm13252506wrx.48.2020.03.24.06.56.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 06:56:59 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] gtk+3: add cloudprint PACKAGECONFIG
Date: Tue, 24 Mar 2020 13:56:52 +0000
Message-Id: <20200324135653.1985586-1-ross@burtonini.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@intel.com>

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
index e1f1e0db314..12fa83550a0 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -54,6 +54,7 @@ PACKAGECONFIG[opengl] = "--enable-opengl,--disable-opengl,libepoxy"
 PACKAGECONFIG[glx] = "--enable-glx,--disable-glx,,libgl"
 PACKAGECONFIG[wayland] = "--enable-wayland-backend,--disable-wayland-backend,wayland wayland-protocols libxkbcommon virtual/egl virtual/libgles2 wayland-native"
 PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,cups"
+PACKAGECONFIG[cloudprint] = "--enable-cloudprint,--disable-cloudprint,rest json-glib"
 
 prepare_gtk_scripts() {
     mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
-- 
2.25.1

