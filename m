Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web11.35806.1607956649065103133
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 06:37:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=onrDOooU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id n7so12595564pgg.2
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 06:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=qQ/C7P1Y2u3q7E90qQGMk7CgroqXQYi9wkKG8jtLVeI=;
        b=onrDOooUF/U+a6xpvwM7pAEekmOFIn9DpppeZRTAdJFcbXAclBeMR/wOIJlQtnBANm
         rZN+OMYY00yXfTixM6wAU8cFdLuLXrtp9UTFKeOSuRVpnXpJY0pdP/cIhi1vKvbMisix
         6S+zXdKDV3bfrqiik3jPsm+4jBdpsuB2dz/XWdhTlOu5MXqHr0mskzHw9VUG0DMGTBEZ
         HqVzjF6Ux44bHk/Bh+msNsf1ulVPmfd5k+bigwRgL8mUECi+U9aF9uBHL7xQB/GOtwSJ
         YsnxNhxFd1uNnZhRU5bgqKSSmaEVeOpAPTADr3iAlErxxP4u5KbsRupP0XYLeBBuiMM/
         ErUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=qQ/C7P1Y2u3q7E90qQGMk7CgroqXQYi9wkKG8jtLVeI=;
        b=slROB88Ap5qXkJPyTk69Moh8r7R7aoXTeJE8kdbzDAXb+CpB7pKG4XTurVXUGkskcG
         z+lAwOxR/FMrTtzhSZIqMK+YT3TYitJbo3sRS/dw0HK6KLId9FbccOLeClqOs83HMdlb
         3HjZZpL6dsJ101PL+pXNAU0ovkfjSk3w6k3ulkegOy2Xes6c4+QLu1vspnwh40RX11/U
         ab1HjP79CCCVa4wiZ4qP7S6mJTccys+Hrl5BuOv4rAoDZjRNpC9nKOzmSS1vConUqud6
         hBU/9DqYQbETjBOgtOaJtzU13LCrtH8ZmscC5/dpMNXywQdt2VBUocdzu/M2TNIR5RTa
         vl+Q==
X-Gm-Message-State: AOAM530XJ4w62MDMGtrSAAXrx3Gw+MMNuaOcD+w7Gux5ro30QJen029i
	hWOHOYDygnlTU1JLL7WRn0aIXgULwQE6Kiu3
X-Google-Smtp-Source: ABdhPJyva1rFaUlUA+r5zCaU2P2LXg0XGl4iIhUy6HWcR3b84yHE4Qy5wOBWDfGIWHTTvxyrbtS68Q==
X-Received: by 2002:a63:1805:: with SMTP id y5mr24419557pgl.27.1607956648167;
        Mon, 14 Dec 2020 06:37:28 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y2sm18859439pfe.10.2020.12.14.06.37.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 06:37:26 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/25] image_types: sort tarball file listings
Date: Mon, 14 Dec 2020 04:36:36 -1000
Message-Id: <568afcef83ece5f8cb988dd0ad642feeec5c9656.1607956164.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1607956164.git.steve@sakoman.com>
References: <cover.1607956164.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

Help rootfs tarballs be reproducible by sorting the file listing.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4fa68626bbcfd9795577e1426c27d00f4d9d1c17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f82f1d8862..d81747527b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -126,7 +126,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 # required when extracting, but it seems prudent to use it in both cases.
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
-- 
2.17.1

