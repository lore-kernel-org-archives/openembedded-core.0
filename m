Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web11.14082.1589985877087159141
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2020 07:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LQ/RCbnc;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id n15so1679753pfd.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2020 07:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icPf/ktqqH0GGSZyY3BGuufPM4U7gDDA3CVSylKxPxQ=;
        b=LQ/RCbncEInwDM0yei8tDpMvITPXk+2ZMa+e2KYV6KzvdH6SZMoVze1aMi72S5yMa1
         gX+L1WVYBiZPk6/1nl1LHl4vYsAvp3iG6a1iRrI5PFLhVRy5CD/uylsji1SulD1s3hdU
         NvLsGPMwoHaBDmCGGZ6vHZdYrrJieljfT6ahUOH4btPFWwA+zRZplMZUROWlKirTlNB9
         fTl+Q59G8ERLGWyb9SC4jEdMPquWgDTPpYPpfK+q/9/bykulthAoUM8XKUO9ao7NDob5
         /DddrZeP9csGwKxBgvOecXV84ZDzQrY293+pmBuCXh28DuuLAzYx/p81GsYi3tc+qVqN
         tBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=icPf/ktqqH0GGSZyY3BGuufPM4U7gDDA3CVSylKxPxQ=;
        b=RnK/hHdYdxbSdLto4G/G+v1IYxZ2xl6lEvfU0OUcpid/OgkxpcQ/TBnnszelQoZTM5
         67rNBZwkifpMhRpO1qXY7YsqhBmd5pfTlbiUePyav/tl+PAcMKGdUFHz8JyZWzDm6FtW
         idbfFqNp+3fiFvko1zaCKo8rnX7WfNVI2BdIhtv9gREpvLrdo/RujZRZHnCpjYhbglzX
         M5L5/i17d2GpB8ZogC788aUUHpDG2D51h6gBPzKDobWqDNFqnK4En2qjkI59hodQS13Z
         MMDJEKRRAi58JC1mbBsn4od8sMINazTAtr5Tk2rGnwEm6WQAM8TxVHSjfJr0zN/Rn+Qu
         oEFQ==
X-Gm-Message-State: AOAM531MdLT37HydcXFdbNb6k22hmRfb41oAvrR9kerbmaXHg3Np2R07
	hslSmUXouDXMp8tVXMY2bJI286IqJZs=
X-Google-Smtp-Source: ABdhPJxZSM0yIPvqWAyl3PU372f2DIZcd7kuqnfeYinuNMgamb1z6lSijzS/Ix7Hx9OytAIHgwdM0Q==
X-Received: by 2002:aa7:83c8:: with SMTP id j8mr4673891pfn.272.1589985876140;
        Wed, 20 May 2020 07:44:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e62a])
        by smtp.gmail.com with ESMTPSA id v27sm2416465pfi.61.2020.05.20.07.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2020 07:44:35 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Update to tip of master
Date: Wed, 20 May 2020 07:44:33 -0700
Message-Id: <20200520144433.3587832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Detailed changes [1]

[1] https://git.musl-libc.org/cgit/musl/log/?qt=range&q=040c1d16b468c50c04fc94edff521f1637708328..1b4e84c56df0f8ca30f6bc05962a860f869e71df

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 82379fd1c5..6aa69985d7 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -4,7 +4,7 @@
 require musl.inc
 inherit linuxloader
 
-SRCREV = "040c1d16b468c50c04fc94edff521f1637708328"
+SRCREV = "1b4e84c56df0f8ca30f6bc05962a860f869e71df"
 
 BASEVER = "1.2.0"
 
-- 
2.26.2

