Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.58285.1622557154589954492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yyTakFMw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id m8-20020a17090a4148b029015fc5d36343so2029418pjg.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yUxbbgvdyJsP4ILJfUGCf9MLHGq5wwKztXag+8koJy8=;
        b=yyTakFMwbCI9Muv5JjihrWCrOrnlsES2bsQ8ZT27TjGKW9wFH7J3Pmw6cABooNZFly
         kVYhxCg32uJd0Gpd0+Ka9W1En73BUaDE3L1y6Oo+yDynU8CsulhQOaxkxUdgcBhSCMGq
         olYAgCFzT2npyBUfUcWMXWb2Ok+YHMXx5pSrvjv6F30s6HITiaEIn2zhhRER3TeRT2Ky
         5u5urP07oQlriPxsP3oMqz8KIGXfhazg0Pb29VplIzi4pLvZsGRdCSLVcJqW/eIVOTHM
         cCBuR0DQ5Dvf/YkpEKpDFZfVf4sYD3xjuXSJ/6E5m3K8cNMhiBEVUbhGvjBPbJjWT2MI
         kY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yUxbbgvdyJsP4ILJfUGCf9MLHGq5wwKztXag+8koJy8=;
        b=UFBrhkTfnBC0oBLfmv7Fcga8WYqPMtw/Ed4stJiGBh1ACYLQsZHtIfknZ/t7Pj+Atw
         TCKT2Ho9/X9xJsSOwF+UPHMPkxDzNUPP8bYEVRUg7KimY9kANCE+rq56whsXbysy15Yf
         pKhP6MHfvEUcNH0KE3btaNUPhBBvMrQaYU8tXmVFwXRjWcRSdOapf6KZonBCOCKdjdJR
         bhqmAhzVrdobQSDBpN38V3+Oht+/5LyudZoDi9mFHIpaw2CMA6hwd4IIG6W7ZgSq89rt
         sjnDYcJMjgsWNvCDfcbObONQk+JtbTaQYcpZoVm0SUG/OWkXEyhi8X8IIF0bn6AVDO/u
         ZdsQ==
X-Gm-Message-State: AOAM531ThzeQk6YL4e2+qcJZe+W/XXT7TfnjMeoVhxPKMsahovmsgCLB
	ZI7XEUnc2CC10+kTR5bCs1uezu+yOF0TH30Aaig=
X-Google-Smtp-Source: ABdhPJwddepLG905yNsO9yMtZEWt9FjogkmrapXSSGP6SK6PwTpJHQ1Iu3N1x1/fIJ/S2eutwhX0nA==
X-Received: by 2002:a17:90a:4a89:: with SMTP id f9mr156434pjh.50.1622557153687;
        Tue, 01 Jun 2021 07:19:13 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:13 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 20/26] initramfs-framework:rootfs: fix wrong indentions
Date: Tue,  1 Jun 2021 04:18:08 -1000
Message-Id: <70df5169758c8264b48ee3884b66c41a82b28fe9.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ming Liu <liu.ming50@gmail.com>

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd4d76f43c6ead9f32dece1faa9c9c5da895d9cd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/initrdscripts/initramfs-framework/rootfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
index 748c9391c0..1d8a0ae66d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/rootfs
@@ -67,8 +67,8 @@ rootfs_run() {
 					# It is unlikely to change, but keep trying anyway.
 					# Perhaps we pick a different device next time.
 					umount $ROOTFS_DIR
-					fi
 				fi
+			fi
 		fi
 		debug "Sleeping for $delay second(s) to wait root to settle..."
 		sleep $delay
-- 
2.25.1

