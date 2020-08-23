Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.181500.1598214070960924843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2020 13:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gEcLxjNF;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id j25so106157ejk.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2020 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4H/QZIFJKFbvaXs8tAQYY14vy+nGxcmSx0T9jGL+eIs=;
        b=gEcLxjNFWb0yK9CgRF+yvsX/OXjWF908+jXcg1vuPCuytOqWYpr4jSFK+jZLFMMLfB
         yRlMVGLm4lsRNpChgE2z1uPhF6FVbn91VtuF2XGwXELy/VgmG5769Sw57fM/vbhXVNYG
         /8JFmErbZuxkfaMVnfyo0LnySBAfX6KiPZUlmqzzI6LtE6Df8kyCxYE+gZJJeVELsKfN
         oDbAtRCEV+xsuni6Ze5zRH1nBjbp5+lOCThQxdOl4AYmrdaG5ClTqzrkVZUu4pNpptEw
         QPiVfoHny0IxtWdXVpxSFTaDBlHE0H/kT+PecmmpawkErDsYFp1YJpPuu6cehpHwjmXC
         AMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4H/QZIFJKFbvaXs8tAQYY14vy+nGxcmSx0T9jGL+eIs=;
        b=CzsZSo0xI82uWaoXoqghCuFia8xTkhJmWb3AYoApJEq7bvCRmMVEYqjz71T6vZkSGi
         bSAERRcFxKQIFHreS+mqyW/7LC0LXzjeVyILyIgaSerYY3D00imfqdULvYr6Ge2IDIyT
         WCImHgkQXSg8EnOtz7MqQ0Y5gnBk3pvIMii0wC8M/aZxVTeNwrdTAeeQPvy5NwTip2za
         wCkK2brWOfVtJekT8OpASQbrS81xvKfwl6MA2OoX7aa77MVeiBGrJKVuCqbrZXt4IbGv
         pN6Ms7OP0Zf7NXSzepj5lmYl+lM7MudoNiNDsY0sEWeD5TlS6LYIT26kTrOcyX9oIY8k
         kd3g==
X-Gm-Message-State: AOAM533NIYL+Gm64z69bND+6dRv/unw0hZgaCbneABqVX3zmTlksz02G
	50llx+akuaC6m+gkFdw7CnywIBrL19o=
X-Google-Smtp-Source: ABdhPJxbpzLBv36IdKpr1AeutqS1voLwTXP2h7/+86+P9FIL+3mQ+kmhcY+n3tcPUArRGjLlfgQQCw==
X-Received: by 2002:a17:906:9589:: with SMTP id r9mr2608086ejx.320.1598214069226;
        Sun, 23 Aug 2020 13:21:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box (cable-95-168-130-13.cust.telecolumbus.net. [95.168.130.13])
        by smtp.gmail.com with ESMTPSA id sd17sm7342480ejb.93.2020.08.23.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2020 13:21:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 05/37] rsync: upgrade 3.2.2 -> 3.2.3
Date: Sun, 23 Aug 2020 22:19:59 +0200
Message-Id: <20200823202031.24686-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200823202031.24686-1-alex.kanavin@gmail.com>
References: <20200823202031.24686-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/rsync/{rsync_3.2.2.bb => rsync_3.2.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rsync/{rsync_3.2.2.bb => rsync_3.2.3.bb} (95%)

diff --git a/meta/recipes-devtools/rsync/rsync_3.2.2.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
similarity index 95%
rename from meta/recipes-devtools/rsync/rsync_3.2.2.bb
rename to meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 182628f4b4..375efa0dea 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.2.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -14,7 +14,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://makefile-no-rebuild.patch \
            "
 
-SRC_URI[sha256sum] = "644bd3841779507665211fd7db8359c8a10670c57e305b4aab61b4e40037afa8"
+SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
 
 # -16548 required for v3.1.3pre1. Already in v3.1.3.
 CVE_CHECK_WHITELIST += " CVE-2017-16548 "
-- 
2.28.0

