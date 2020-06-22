Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
 by mx.groups.io with SMTP id smtpd.web12.392.1592848795305034220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 10:59:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ikHZ2tFQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.68, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f68.google.com with SMTP id k15so13804169otp.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 10:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=FeW6lf7agT2HJtd5tw0sJgqjZAkZZ9l581QtLGpOxJs=;
        b=ikHZ2tFQ3jdeOp8x+CZGZrggGyXvxWaWZ8LXU6GiWan6Nj9tW/5PN+4hDCFDu0CrtO
         JHV3sSR9MlSzqYtTldUXKz8GR9OgMP0qo9Rzhj68LnRE7RKrDzSQikscQ+ThqHYe+KrP
         AFt8SjlEFunPm7kCbGPEkk84JQ+TqnQ1yDTnB5BQmMy3URZ7nAH1PNiWUjRfiuiwDRO4
         UtncbqX9tBppYy7l+KZbP/wU/1qPIoEyavcVO4oJ9y7rrPfnB458flJDI8xaYrPa3Li+
         QDyTCr47i9E6qGsn9CgWDkwOg6MXp7+I7GTbl7r5m+p+H8Ff2xSv8NcEtn+TPGiZ8fSr
         /zpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=FeW6lf7agT2HJtd5tw0sJgqjZAkZZ9l581QtLGpOxJs=;
        b=V/d6Z4KsqXyLRST9RhX/v1zNA+RavnXavuj4qW+0/y9NV739Q+MW9kh5NfwbU9WZaj
         bqwVVpxthA60RtWDD90GTDpWQY7dS3FBFQhPFraCKSzO7vAHJ0mmClgadDu8pa1GefVz
         ebQNXG+kUb29Tx5l1ragY+hidzUNIFLxt2EN9USizXlce/Q7e/QcVR42zurLMTpY6WHc
         mF9PPk6jsVkg9FsTughS/h6uHRezEBoSAJFBn+g9yofOeqQ/xFhA3d8xUXrhSdM4Ybq1
         CIsasGiPt9YAsnXUv9U4q96a+xkEAJnfdHAHcZX51ua37yB7HW8WRN17piGCoUxuKDSP
         ap6A==
X-Gm-Message-State: AOAM532/hRl0Ig3oXTJaDj3H+tVFFp4P7QsanKeCry3B5BzlbXVZDpwr
	qKzCKjAbvEui6/hX0v0yY7cEzS51UXNYtg==
X-Google-Smtp-Source: ABdhPJx4onc40U2rft9AMRV/nEatqna3pCvnbSWjeswHf7MBLs1/MJnPw6LZdaecwuWcW09vcVUI/Q==
X-Received: by 2002:a05:6830:1059:: with SMTP id b25mr15886809otp.128.1592848794223;
        Mon, 22 Jun 2020 10:59:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.10.59.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 10:59:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/33] encodings: clear postinst script
Date: Mon, 22 Jun 2020 07:58:01 -1000
Message-Id: <ba94c908b99713ce115e9240df525c6442a60c7a.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Kai Kang <kai.kang@windriver.com>

Postinst script from xorg-font-common.inc doesn't apply to this recipe.
So clear the postinst script of encodings.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 99ae6dbb7278dfd264453af852c108fa56a0d4e3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index a39609b5da..74014ff91b 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -19,3 +19,7 @@ SRC_URI[sha256sum] = "bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41
 inherit allarch
 
 EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
+
+# postinst from .inc doesn't apply to this recipe
+pkg_postinst_${PN} () {
+}
-- 
2.17.1

