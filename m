Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.33858.1613997402079906692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iYiW0R/7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id n10so14194042wmq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Cpz4LVUwymX88N6gPWPOTMM1dbdft2K1Z8/PtdfYsMQ=;
        b=iYiW0R/7odrBM3bU/5yrRrENZ88v5XCLTAYYEhbOQ+SPQvQy2Xf+S1FhEspXElrKRO
         VKe6gEuu5vVT7SmLGS8xiysctYiOJL4WT7O7AV2gAy+96SRy2w7kdNwVfh42bgi0iP/K
         hAezPqEoTEMFIRtHUJYUdHR+pTPANvHFV5SGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cpz4LVUwymX88N6gPWPOTMM1dbdft2K1Z8/PtdfYsMQ=;
        b=sw0lGeecLVWTEfCoBdzKowNBw8A6pbQ5gCX2+VVTcs5iBobnFRWQWntUL3WBOTjbLi
         cBrqXQByxxywZ15nCa606P/EWp18hXCWxe1tNgr25Yn6Ux9Yzwn9kPuJR4kK5+VuD442
         LYTqOoO8hP36rzbt93063XGzIyTYTaPW3qGqWO1ZkGAI/hzpY/zJXhfQOvpMTb3yZcoy
         1J+WIC2a2lDlDUeS00YrBqVCas9y8dOEISy8Z7ZKhiapHaU3AxZWQq+zEgF02psusceN
         t1QN/KCEnHv+1wDD9ruReeY5Cjymrmvfd3pr0h2EbVjqI1gAjcIvdUWw7wIWf/rG1VQh
         LBvQ==
X-Gm-Message-State: AOAM532HLeXxP544Mn61BsZTLJXsXF1VRKQ63USXfbKIn+KDDs76KDEp
	0jg6KPBVamMNw882pZa4/xiXlUnH567lXQ==
X-Google-Smtp-Source: ABdhPJxFP8WHYj+tt0AhJ3HIgyhPRS3BM9bMlNKtFj+pteAkF195sJ6D7Wn/nowSXH5O3gGIQUxX9Q==
X-Received: by 2002:a1c:e143:: with SMTP id y64mr19125683wmg.109.1613997400627;
        Mon, 22 Feb 2021 04:36:40 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:40 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] apt: Upgrade 1.8.2.1 -> 1.8.2.2
Date: Mon, 22 Feb 2021 12:36:37 +0000
Message-Id: <20210222123638.3754068-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
References: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/apt/{apt_1.8.2.1.bb => apt_1.8.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/apt/{apt_1.8.2.1.bb => apt_1.8.2.2.bb} (97%)

diff --git a/meta/recipes-devtools/apt/apt_1.8.2.1.bb b/meta/recipes-devtools/apt/apt_1.8.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/apt/apt_1.8.2.1.bb
rename to meta/recipes-devtools/apt/apt_1.8.2.2.bb
index 0e10f9ba1d7..6c5633c91fd 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.1.bb
+++ b/meta/recipes-devtools/apt/apt_1.8.2.2.bb
@@ -23,7 +23,7 @@ SRC_URI_append_class-nativesdk = " \
            file://0001-Do-not-configure-packages-on-installation.patch \
            "
 
-SRC_URI[sha256sum] = "6d447f2e9437ec24e78350b63bb0592bee1f050811d51990b0c783183b0983f8"
+SRC_URI[sha256sum] = "f5030de22a5cc80db6fe0d42373b5df25d7dc56e94d9155f2eaa80dbd65e82fa"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.27.0

