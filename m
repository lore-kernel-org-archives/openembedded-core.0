Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web10.25165.1591602514268077122
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2020 00:48:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ArwcBjl1;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id o26so12594190edq.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2020 00:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cModP4mrc2GxIrjpM76D82VXeelrXSl3+Pl8+vNarCM=;
        b=ArwcBjl16BYzhbe/PnQFBFZqMGblWIJuYgP7Lw8gvXwUKRrsfwdyBdDVlv0IaJlIlf
         gDMZ+OE6DFFtvL+NnrBtKvHjBfeP3qz+4ZzDgsbg5W885hsD/TuqTdJg7y8RWc+8zGmd
         l0Why0hbgartzEFKSyMxVKQppo90NtDQPojNSDGwRCsiWiqUbVD3IPDGAQT6S6HMCMlF
         RgbgnijNTg5R5iRNh5+s9s8FAdAZLdafYBj4/90tDvG8kEnZ4V7tuZbN5B5LR6DJGSns
         Y+IXtgKegFUzVWP1CRMRX44iVqk3LKBzygmFMLvfL8gKREVO0l+QWu++4MMc1LpKXWqW
         qB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cModP4mrc2GxIrjpM76D82VXeelrXSl3+Pl8+vNarCM=;
        b=cPxk2T3m3ZjrzWVA2Vjb7rarUMgzNlUASQYc+yuqI+YCw5VKRb36MPTuAE/91y0d9y
         c25FAGGw3YIGlNY9PJPOtnUwuptth702ynkktlu1PXjDL5PimHPiNps71n93zWzw7h7T
         FmlSBMllegulWFlfHnROhVwUmvHB+1qM+zJdr/1nA4BEnDZY24Oqw+lZ1qCbvvk5Kt26
         qO3Wdun8iJZ6cF87dC6VeeRrC0rAAQ+gzU3aptMqCCD2HoZ9fsqA18kQrcvRWLkF7P5W
         lDlrlFECV0JG2skCc75v2nrXbF/PXY6YVb3bhMaqrR6NwkdkyQ5FXAvNjfjEy9w8ago0
         u+ew==
X-Gm-Message-State: AOAM532hbnNSdXXRQvUwlv1xk0OsBml8NtcJmo7T375/onT9cKir2APk
	UJ5dUCXnnajcODXZemMP5mtoCCLLXVc=
X-Google-Smtp-Source: ABdhPJx6H/kOSJTjRy9mrevNP0d0k71JrIrtF7iCM+ZRKSho/yGxOfFhyFCWd59/uLHIACUDoiUDnw==
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr13543362edb.152.1591602512577;
        Mon, 08 Jun 2020 00:48:32 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.66.228])
        by smtp.gmail.com with ESMTPSA id g22sm12473466edj.63.2020.06.08.00.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2020 00:48:32 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/42] ffmpeg: upgrade 4.2.2 -> 4.2.3
Date: Mon,  8 Jun 2020 09:46:39 +0200
Message-Id: <20200608074659.7051-22-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608074659.7051-1-alex.kanavin@gmail.com>
References: <20200608074659.7051-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../ffmpeg/{ffmpeg_4.2.2.bb => ffmpeg_4.2.3.bb}                | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.2.2.bb => ffmpeg_4.2.3.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb
index d7b0641054..e837a05d47 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb
@@ -26,8 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "348956fc2faa57a2f79bbb84ded9fbc3"
-SRC_URI[sha256sum] = "cb754255ab0ee2ea5f66f8850e1bd6ad5cac1cd855d0a2f4990fb8c668b0d29c"
+SRC_URI[sha256sum] = "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.26.2

