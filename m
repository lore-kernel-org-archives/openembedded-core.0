Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.895.1620172169479636381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 May 2021 16:49:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mzs7Nsn2;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id c17so658196pfn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 04 May 2021 16:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQVJssc2f1nl8wagFlmwzcmOgM2tDgzeiW3ai816p3k=;
        b=mzs7Nsn2YIn4YTAxLU3JQNuXNnna9SpWcndUQTXN8z7slAnr2kvzaOrulEQ7iSzEwP
         64NzDEPJW/kxbGfT7fcbXsVfoNECw/VE8jAj4CKN+S3m8XRTC9YJe3RqYXcb2XFIHAZd
         mHhM4U6XjsEp/yOwipKzB8E8OODgNdk7p2LwWB4oOz+BxJhYGA/6Y2JeSyeMst5UVkSG
         NC9RnANxpglBfCWwMnEl64XfHbDSRIIsYpO9WSFN2zkHgMPK6Hgo2z7sBGjf0+5KZZ6h
         JXHy1nS3TFwp3A5XXudXAZozJnDI77Kv5rOVkbLKf73sP+YPX3Hq+ficCvDM3h/mgdq0
         o/MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mQVJssc2f1nl8wagFlmwzcmOgM2tDgzeiW3ai816p3k=;
        b=kgFaMNWX/S1/kXFFGNUZSdsKtFifZ0nhqFuSm/s48OhAcCFLHEII/lbOE1esODv3Ml
         lGnHWcSqD5YMLzBoosbD2/vomUyJhIsCHgb8AnabCJuI/NEBloYKzk/FgHgx6Sy4nesi
         mUg+nff1Ro4U4I4vaWIr0UT359KJsrujWzqg4d2ZXmxCUOjJ+3pXQD8HhcUlHEeXi7ra
         3AP89+9hZeTNjFpDIsFaXxwwL2UxH3e60x79lwM7lasasrJdlp+wfZ3ASYU3v3LO9Zle
         cSs7V4x0Trn4EL3LtFO8gKa4w8LDDtKcvqTRyfnzyyhkCQbA0o0gRFRgJfnJT5IoLgHS
         8qRA==
X-Gm-Message-State: AOAM5323+N1ExnX+MqzR1nG83nJFOPl/Qd3d64KUFmkIP2YpTd1KTDcr
	uyOYeMRSX0H4lo1kVYpbRgEm00+l3fIt5g==
X-Google-Smtp-Source: ABdhPJzTDa2R/kBCx7gEQYN1ANMW01nt8k1VCJ3wVpFMYtBDebw4sNuWKP4v5KMHBHptGpEhTNRJow==
X-Received: by 2002:a63:1a48:: with SMTP id a8mr25468344pgm.81.1620172168684;
        Tue, 04 May 2021 16:49:28 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id a18sm4802336pgg.51.2021.05.04.16.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 16:49:28 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] strace: Upgrade to 5.12
Date: Tue,  4 May 2021 16:49:22 -0700
Message-Id: <20210504234922.3142058-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes are here [1]

[1] https://github.com/strace/strace/releases/tag/v5.12

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/strace/{strace_5.11.bb => strace_5.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/strace/{strace_5.11.bb => strace_5.12.bb} (96%)

diff --git a/meta/recipes-devtools/strace/strace_5.11.bb b/meta/recipes-devtools/strace/strace_5.12.bb
similarity index 96%
rename from meta/recipes-devtools/strace/strace_5.11.bb
rename to meta/recipes-devtools/strace/strace_5.12.bb
index f6a91df1d2..6a8996535b 100644
--- a/meta/recipes-devtools/strace/strace_5.11.bb
+++ b/meta/recipes-devtools/strace/strace_5.12.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
            file://uintptr_t.patch \
            file://0001-strace-fix-reproducibilty-issues.patch \
            "
-SRC_URI[sha256sum] = "ffe340b10c145a0f85734271e9cce56457d23f21a7ea5931ab32f8cf4e793879"
+SRC_URI[sha256sum] = "29171edf9d252f89c988a4c340dfdec662f458cb8c63d85431d64bab5911e7c4"
 
 inherit autotools ptest
 
-- 
2.31.1

