Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.27242.1610325970433544909
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=RpE/wq1H;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id j13so9471734pjz.3
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=1YULNgp/zN1YcpsMqWmgs6B8JrjmLVxJD20XaD0wOKc=;
        b=RpE/wq1HY1TZsEiKo/RYurtNPeKlHsKl9idaH2xvCt3TPnT58Xi2I4I/yCFftjnNv3
         JFBxv1EdIyZxCRhdO7FsSNe6YuzBrk1cijBJSFlbu0RQSBF02JIy2LMKyPDUbr1aOYRb
         hokNyLtZPYR5/luRMvBtqJfOfpo9UDutrQFLILoreRhMTplLQRICj0mtq4PUsUFVymOd
         hom50zIO1NWYErdDltBlm5y81Z1Vk/zLAPOu1pIKwWPDVG/ZLdIIURX19CjTT92C55PE
         APl+5lVIJnZGp3tFQbkCHlaDyr+DggdRTE4EHQJurwL8c9TfIyiAm3XV1z4QkDINpKSB
         0pMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=1YULNgp/zN1YcpsMqWmgs6B8JrjmLVxJD20XaD0wOKc=;
        b=LWAr+WPE4NRGp6x+Ev2BOPVoBtJUBeVqMoOfxMG6MZT0hZnXtVgSZL4IeJqE1z2Y37
         90TprndJtD/DcpajpP8m0mCS0BJvblNSd/H8ZoPPD4Elv2si0Fv0L59PCvVsVSgtEpff
         368tEgwbXQ6lWeHkv0Wa7OX6pYjHY+vsurfIyjrLbaMjWWOsK/gO0m5mv5BauT/bIv0r
         U5BB+fEjsREhy56ilnrJJD9cuxCJH5N3fZG3DgFCFS9UhKkl+AId/xzKZqP3EXR1Sogv
         drhy5qscK/ODLaIGNpaavUDXD8UL5Mr1+Q6PQW5xGxp/jDw1Xu2KkYzECIllcAEfyOj7
         T9Mg==
X-Gm-Message-State: AOAM530+cWBbxGruNIxUyHzvlinREqJNWVnyY6U5gSV98fOEBKDnSgwq
	qIcL9+WLnC+oQTDXk54eYP9kQPHslUkj38bfQwY=
X-Google-Smtp-Source: ABdhPJzcaeRlfoZdIaZzy/kXL4KHgOhnhCfvuiio1JSOiF4Rul6Nq/RWjQQgFlYHHP001O4WdwS5dQ==
X-Received: by 2002:a17:90a:f687:: with SMTP id cl7mr15405901pjb.38.1610325969477;
        Sun, 10 Jan 2021 16:46:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:08 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/12] wic: fix typo
Date: Sun, 10 Jan 2021 14:45:42 -1000
Message-Id: <42f2312ec723c8e6559cd344e4afee4bbdaf9f41.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Daniel Ammann <daniel.ammann@bytesatwork.ch>

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ab4c4571d899d2eefcd2fc53af0851863f29008)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/wic/plugins/source/bootimg-partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg-partition.py
index 138986a71e..5dbe2558d2 100644
--- a/scripts/lib/wic/plugins/source/bootimg-partition.py
+++ b/scripts/lib/wic/plugins/source/bootimg-partition.py
@@ -141,7 +141,7 @@ class BootimgPartitionPlugin(SourcePlugin):
                     break
 
             if not kernel_name:
-                raise WicError('No kernel file founded')
+                raise WicError('No kernel file found')
 
             # Compose the extlinux.conf
             extlinux_conf = "default Yocto\n"
-- 
2.17.1

