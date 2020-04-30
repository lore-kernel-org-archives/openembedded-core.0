Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.256.1588285863794752739
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 15:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=V/IotUDX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d24so2895337pll.8
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 15:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Wtecnff2d4gEVHe3SJsvuWq472bRT3jS/LiLVFwh5O8=;
        b=V/IotUDXTWqtVRUSC7PAm7W43KyacT8LFUtlKwiYuDktxOFQ0EnD/L4bHmcv+2ePWa
         RoaaoE1JnS4S7LCP14E+/qvVW39bcoOQm11+sST+M/GgHHiwcqSImxzHjGFFdOS5ZwUz
         VPvSvZHZXXF0FIQUK57GOwrpNH7XDqv6R/dfYLA9NinCQ7y8OucpLZMvQzKdi3I1p3Vl
         5+lDyrUj4r88j59mIslINxXcJBUuQk9ycMe0PQ3dlH/UDRLfFkCmhK1HZ0KgqlLq6v0T
         RYABDA0ZcxO0pMlrwjGY4bNpYUJ4ioXK+stuWqsqN2K752RlpVMUyFC8Z+CVqOvnvoBX
         amyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Wtecnff2d4gEVHe3SJsvuWq472bRT3jS/LiLVFwh5O8=;
        b=SEHeC6BpCag5vbblVo+aSsay4LifpPzjlwotu26qxM/hm+vnXZKzKGow9fgA5eSxFT
         dU5Elg+notVBOEVhC6iKzy+Zq62GlPdTsnqdgTZS+WfWeVHnSARkj+XuPKBOguhCQYpv
         H2r+TsZF2F/afgzaQ2XoqQcAJZDkEz9dl4rhSF8rvhtfnr0Gv6e6Dgmx2xBd3AIHV2vI
         OCG+ZEJbW7Z/JJ/tXWtRAA007yCaD4nYN9oLRgXW659e5zS16lUQGa8ttDQHLMsJbyMI
         ORR1YMkoLyOcQEz4ZFHhPmDm0A2p8FbEzonoeIfcgn9t1E9DG5TJqp7Kf1KOFB6d8ThJ
         bEAQ==
X-Gm-Message-State: AGi0Puae7sxZrEpnGvJQzJVRiLMvMyg4lNWQ+8Ywl8RWxl2VTRYCQUmD
	6GFu5nDlbuHaYvINOQp1S4vTs7HoXcsiew==
X-Google-Smtp-Source: APiQypIIABprw2N13/SH85ch2u6Zlv1YUJ6YrvMC2cbA4Vl5h4SU3hl0wjrs37o6NCW7WI6nkPN90Q==
X-Received: by 2002:a17:902:9306:: with SMTP id bc6mr1254926plb.255.1588285862853;
        Thu, 30 Apr 2020 15:31:02 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d124sm646011pfa.98.2020.04.30.15.31.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 15:31:02 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 04/14] nativesdk-gcc-runtime: enable building libstdc++.a
Date: Thu, 30 Apr 2020 12:30:09 -1000
Message-Id: <217e8f587792b2fe25aead085ddc533d4100cd7a.1588285073.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588285073.git.steve@sakoman.com>
References: <cover.1588285073.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 771f344ac0..ace706dbf4 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -22,6 +22,8 @@ EXTRA_OECONF_append_libc-newlib = " --with-newlib"
 EXTRA_OECONF_append_arm = " libat_cv_have_ifunc=no "
 EXTRA_OECONF_append_armeb = " libat_cv_have_ifunc=no "
 
+DISABLE_STATIC_class-nativesdk ?= ""
+
 # Newlib does not support symbol versioning on libsdtcc++
 SYMVERS_CONF_libc-newlib = ""
 
-- 
2.17.1

