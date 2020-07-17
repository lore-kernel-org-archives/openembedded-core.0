Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web11.12682.1594996734552603555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:38:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=hnJzrR2Y;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.67, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f67.google.com with SMTP id k71so6621071pje.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+0MnGjsLyj4YNNCaTb/7oQjihgfz4Xbw24r4h012cxA=;
        b=hnJzrR2YCbQkwzWsiK0n2LUTucYY7vOj1WQbtJNtsK3NJ9rFTnjDBSCVNnfhYl4Fu0
         hRjGp5gKrOZw0qqJhbgnkJ7jdd3FykTuUcp4SHc5MclMoLoM6FrAuxNz67PQMrRV35KY
         fr/b/okl62QKfN4VWZ4ITAgdNZunxLR142kK3hZjK9ai6HYJGNITUMne1EwJ1Lh0Q8PZ
         uEwMJ51aB8NaVgtIY8CHOkdMxYlE1Ci1MC/eMPjw7s6taE+iqeRiGSfh5B1Ws3Bv7XtY
         OkvRPUSdDpnYn2rJGirr+sBWeEMPYrb7d8zB2NCrwMNFNUULKpMjx6VE+5ne5PHlpyou
         Ti6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+0MnGjsLyj4YNNCaTb/7oQjihgfz4Xbw24r4h012cxA=;
        b=sez2TokNEUmfXvqC1u3wfXbwT6IR6Zl8kV4LG91Zwj7BOxvqEPemUKD1tK930/4uib
         kQucecyeVX6PcRNh6b95DC5ZbZtY4Mzg7zz/hm2Z7F/J21PA/Fu+oOlN7gh9bJtEdnsQ
         WoanbsYie9mdHWE8nusChU0YJt60kCMYzuXSC8MQ2tNDlqWMqX0CeL7xn5HjAx9w5Hzp
         QEG52s1w59HIs2UZveCIjArhHC59z+GlVxissFZ7QVdHEgzxQ+pNOSwKkAesYmuJgHRc
         H5v3kOBQkPwkUeZgNSbmwcNCn/Qc2Cs/s9wNoo6BVpnrnTyfmZjhhVPonLYJFjXjcCFd
         tdbg==
X-Gm-Message-State: AOAM530cu1+1riOnRpt69y8INU+Gt6mSVRxfFfC6H/I424Vn5/1mN6fA
	mWC1TLEuRjkQ64yXXqTqnSYI6kTaIU8=
X-Google-Smtp-Source: ABdhPJw7gbO1I4zO/QVtMeUGb9URMiNdPPKmlf3n9ziwHUjc/hGZnAhTr2IIL2UGyBNtG/svYID4PQ==
X-Received: by 2002:a17:90a:ce02:: with SMTP id f2mr10945836pju.159.1594996733703;
        Fri, 17 Jul 2020 07:38:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id mw5sm3448727pjb.27.2020.07.17.07.38.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 07:38:53 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/20] nativesdk: Set the CXXFLAGS to the BUILDSDK_CXXFLAGS
Date: Fri, 17 Jul 2020 04:37:19 -1000
Message-Id: <260a348bab64b7da33e2ade77593059287a4e308.1594996441.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594996440.git.steve@sakoman.com>
References: <cover.1594996440.git.steve@sakoman.com>

From: Douglas <douglas.royds@taitradio.com>

... which default to the BUILDSDK_CFLAGS in any case.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b4bf667bac49131cee382f2f346fc054d5f28b9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/nativesdk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbclass
index cd389c9c77..7f2692c51a 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -58,7 +58,7 @@ EXTRA_OECONF_GCC_FLOAT = ""
 
 CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
 CFLAGS = "${BUILDSDK_CFLAGS}"
-CXXFLAGS = "${BUILDSDK_CFLAGS}"
+CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
 LDFLAGS = "${BUILDSDK_LDFLAGS}"
 
 # Change to place files in SDKPATH
-- 
2.17.1

