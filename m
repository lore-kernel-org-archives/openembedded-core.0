Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.9592.1629636698813251405
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pIhJQoIW;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id v10so10551490wrd.4
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=neTvk2UG6ID8v7Q7rks35iICaXo36S2dQQ0vCAfCp2U=;
        b=pIhJQoIWHRysUIU1fjz8qA0F5ocGUokkPe8kHwvr7zZ0PcuzIUuS3ajTpKUxKC5oAY
         MhuwRKWk7DK2goqjByu7KZUpP28b5htnQMKuq8XfxJGSAvqDShPJ6gOT1Z+fFLoCH6tE
         oInSqY05qBQVyXB8CACu28ecI8OjJnPNJPlcea/Kk/fMO1seXACez+pFaHiZxxvC2azw
         nuAGn/a/jK6FWhh5TPGUJuuYFs8n/TlDkwKLVobdrsXcFubqAg6/dpavpMGzL2iw/ApE
         B6E6ZSHvTvEvOCALeDSf5nH+ntkbZuBwqZ3CUDgyslC1NCMTyQctcfEYMTvTQAeZ4LDc
         kp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=neTvk2UG6ID8v7Q7rks35iICaXo36S2dQQ0vCAfCp2U=;
        b=kRs+dQVmT8+LosbHnBMjGLhuAg1RLF1P9COzzOG10HHF58vQgXVrMCOcjBasFz4QkL
         n/7EWC4I/DSYomKhRQDSKEdpAsIZbwtd1xQ95A4tYKsiM3qEHj9Gf+jfku5dkbFXc/Zx
         6tW3RvYyvOHuCKPjphawmyAyO3FNCWUTHq/qswMXLc7gU1mPrFQxsUyXFL3ipXNTk8f1
         gvJNjAN5IGgNMLPG9jGvBCGImLu3BBfNtHjWZ+FnTYpQlGOknwqMzrQLRqmQhjPbUFki
         MUaAvZr5U3Mo4m36YmSpKSTBznyr4B3ddi/hki4MzH1yhLPRbSyls9yboiczt4//eSFZ
         3JHg==
X-Gm-Message-State: AOAM532BvRDGQG1tRO5oyaVxN6wOX5zvlhIzBKTIwxoBvqVZ0us/ucwE
	DUnkQ6jOX8ARJCXHGJWlpjghedWkGQPSLA==
X-Google-Smtp-Source: ABdhPJxsj1ATLf5YWh5tHVju04BTIfLYANtsLcfm53ZOlAPYAeewTaUbFk5Ca/X7/Gw+DQjiNWkdhg==
X-Received: by 2002:adf:f747:: with SMTP id z7mr8716426wrp.194.1629636697496;
        Sun, 22 Aug 2021 05:51:37 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 39/55] libepoxy: upgrade 1.5.8 -> 1.5.9
Date: Sun, 22 Aug 2021 14:50:47 +0200
Message-Id: <20210822125103.310416-39-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libepoxy/{libepoxy_1.5.8.bb => libepoxy_1.5.9.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libepoxy/{libepoxy_1.5.8.bb => libepoxy_1.5.9.bb} (93%)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
similarity index 93%
rename from meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
rename to meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
index dd621b1050..487fc00360 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.5.8.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.5.9.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://0001-dispatch_common.h-define-also-EGL_NO_X11.patch \
            "
-SRC_URI[sha256sum] = "cf05e4901778c434aef68bb7dc01bea2bce15440c0cecb777fb446f04db6fe0d"
+SRC_URI[sha256sum] = "d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
 
 inherit meson pkgconfig features_check
-- 
2.31.1

