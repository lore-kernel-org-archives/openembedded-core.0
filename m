Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.37069.1622412544236393460
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 May 2021 15:09:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D7dnmE8f;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id f20-20020a05600c4e94b0290181f6edda88so7691658wmq.2
        for <openembedded-core@lists.openembedded.org>; Sun, 30 May 2021 15:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=bKTI65YkQdzrmVhkA4V87Sjk7go3XXuS5QgwErLOf9A=;
        b=D7dnmE8fqW8zrU8HJqO+Sd22IWe8KL+dGyj0ip9pQtcULC0Emm0OfsWLFckt4iINEw
         83IA3IJE5b6XlKrNRY8r9u//UohNuAOIF38634Bhm/WcMZf/qqmxA6BJqbBn4rsdWPxW
         GqmT0MFKfFA1Ji0wQd1/U8tPvCf5IEF120VMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKTI65YkQdzrmVhkA4V87Sjk7go3XXuS5QgwErLOf9A=;
        b=n2VaSv0KgIei1nsJVN9hQ86BftOD4juZp3igyYeE5xiaeWohz6HgY5yRb8rP0qe+r4
         R3kkcxMf9jt3i12felBntltcmxiUa6CkLVFBgduJT0RwTCiQClIsUH0lqNp/xrdMwyC8
         udLJz+m0j1yA6a4m1TiFDZ4AcVk5i50iffYRSH3lVxkdJ1l2iTm0t7gNxpF/8g+yT7RU
         Kvhbh1cw9TrzpYAcWMGaCbVkQHJqs3rYD5Igd9ZfEekNipXD9rKm8e6uLCPQ+EfPxQ9U
         Z8IHTXXJWba2c1DMIChUwVWAJrdkBhSlPJbjNVuJVK579ZEZb9zFbm+l59Syl0D3XJD3
         IWNA==
X-Gm-Message-State: AOAM530IFU4k72Ztx/82ZSreCTiKk8xvikUnt4ROFMAo4x0RAfrTmVZE
	doTRA/oWcDhDFMbpu258ztZiaN8V37sc6w==
X-Google-Smtp-Source: ABdhPJycuFwNcVmlswm0BpuFkiUDxhC7FPgdk7qHH7gTj1uQS/BAG5RLS/CbtFxY6KD/b0KAz3ONGA==
X-Received: by 2002:a1c:dc85:: with SMTP id t127mr16866720wmg.179.1622412542542;
        Sun, 30 May 2021 15:09:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id j10sm14721102wrt.32.2021.05.30.15.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 15:09:02 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 15/16] libepoxy: upgrade 1.5.5 -> 1.5.8
Date: Sun, 30 May 2021 23:08:55 +0100
Message-Id: <20210530220856.2830501-15-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
References: <20210530220856.2830501-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.5.bb => libepoxy_1.5.8.bb} (93%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
similarity index 93%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
index a404fe2852d..2cd096a5793 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.5.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "261663db21bcc1cc232b07ea683252ee6992982276536924271535875f5b0556"
+SRC_URI[sha256sum] = "cf05e4901778c434aef68bb7dc01bea2bce15440c0cecb777fb446f04db6fe0d"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.30.2

