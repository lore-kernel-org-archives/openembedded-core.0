Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.57684.1595862642775318900
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=DvVZQZAU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id m22so9721717pgv.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=F/EZ6rFddnZxMMJiWpHpcCg7E8bi/TJSq2OekOTFRlw=;
        b=DvVZQZAUmNG7F+IpKPPCt/pfQ/059C22+P41GiKmj8TMZ0T+wkoed8k/Twl7RpWDPk
         UoQ99fsrfNAYLUTGsFwkaIPHtluogFnxe9Ux8L8R2aYTvtlAmhydbZ/z/sHnEQzQf6RX
         6jY1SE5kpBBLAPeEwx0HZkYkHhiGWxw8biA6z9OU83hu6MrqblTD2oA33D5mTcsPlrY2
         oMxY3A68LhD3JtCydZZ6HRAWubA8WQQHzYyF2ZJWD5xHDJEyqq4pUCMa8z8lVrOWSNGk
         TpUNlojExBObNBbldGLzyx3G88jCj5D3GhCb//t4HbBa3TzIO9TDD94RkIXZ40VeCjDC
         pfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=F/EZ6rFddnZxMMJiWpHpcCg7E8bi/TJSq2OekOTFRlw=;
        b=U5OS44xcuOOgcNEG9ei0MdK04D0Z/OBA4K9ly+8fdYD58FG++CkxELjxRBr+l38JRn
         wnIEPGXkPM8NgVdL9+z5plv/fMhRmdTYZta14W4hX5autHUvgFiNWkj53ShhuBunKR2q
         AhVdMpMCGhdjscsulhTHmEMtqsY7mrh+QFjS3StWwTOQXRgXoTmDxfGTyBJRTJ6GnRiz
         mS9xh7UGcO+H+XqwESREBwl/gUJrolystBabVHlnK+peBe+BFJn8lsptPwf3DGmF9eQd
         Hse+kQLDZV9cg+OicSBldVLBlOTmubJJULKO0WoPawpt9dn2myRbT70ADqEA16Z5xBjg
         rYMw==
X-Gm-Message-State: AOAM531SZYcsje8XU8q0BwVHXtKNE+EjStiEfP8SjrS1MM1yotNUel36
	cLQuQZTtR0lO2MfnTmnnuokcILmnbHs=
X-Google-Smtp-Source: ABdhPJzNDVU2MgfFYVzk+rne5msiJir64QLw8fRighbdiSsyCjALu+yAZUoZ4lLNGLxeIWSqoCFm5Q==
X-Received: by 2002:a63:7f5d:: with SMTP id p29mr20011074pgn.259.1595862641942;
        Mon, 27 Jul 2020 08:10:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/18] image.bbclass: improve wording when image size exceeds the specified limit
Date: Mon, 27 Jul 2020 05:09:51 -1000
Message-Id: <faf93355614c5e5d9aec8222a7df780324868c7a.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Daniel Ammann <daniel.ammann@bytesatwork.ch>

Signed-off-by: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fcaab9d686a4afe53a4693f3b30634215d682389)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 07aa1f1fa5..6620a9e9c3 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -551,14 +551,14 @@ def get_rootfs_size(d):
     if rootfs_maxsize:
         rootfs_maxsize_int = int(rootfs_maxsize)
         if base_size > rootfs_maxsize_int:
-            bb.fatal("The rootfs size %d(K) overrides IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
+            bb.fatal("The rootfs size %d(K) exceeds IMAGE_ROOTFS_MAXSIZE: %d(K)" % \
                 (base_size, rootfs_maxsize_int))
 
     # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
     if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
         initramfs_maxsize_int = int(initramfs_maxsize)
         if base_size > initramfs_maxsize_int:
-            bb.error("The initramfs size %d(K) overrides INITRAMFS_MAXSIZE: %d(K)" % \
+            bb.error("The initramfs size %d(K) exceeds INITRAMFS_MAXSIZE: %d(K)" % \
                 (base_size, initramfs_maxsize_int))
             bb.error("You can set INITRAMFS_MAXSIZE a larger value. Usually, it should")
             bb.fatal("be less than 1/2 of ram size, or you may fail to boot it.\n")
-- 
2.17.1

