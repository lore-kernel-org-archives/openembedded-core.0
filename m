Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.977.1618943323171296264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 11:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p/qh+ShU;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id s22so6124420pgk.6
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Apr 2021 11:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bFkcih3l45wb9IBvtiiColvamDop3/oM4L58bI2G20=;
        b=p/qh+ShU0UfYn9paujOz395qFmFbBw3zWl96fMP9TvM09eXLQx2VV9OTZpLWGGs/Xz
         xOPwRXsbwBPBEVXnUXrusCh2X0sDSrYPZJaM9hlxbX3mklAU49QnsFAN3DdIRvsck3mI
         /ZyHLkTzOXbMlAUwhEKB2H3Z9ghVJMZfPmNwrIJly3Y9YyLMqxXdXp35cz5G4vbg1UPw
         eSpgA/5S3f8bAM0UdT4oUPSFfdSih+N+e2Gif3rpIQG3q/ZR+v1OKFAcxEJOPkDH6HhV
         WUjC4vwNgRjH3m0e0b2xc6D5Fo5gaahu+6t/EhDENRcNKbCFfqDjm0YpPA4AKX99fZ6t
         NhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bFkcih3l45wb9IBvtiiColvamDop3/oM4L58bI2G20=;
        b=OwQjz7yWjlDZvVgN3O6YzWsr3SMJWrfoRTveXpSQv8kZD7KgAZZOVz4XBhmLW+kCx8
         cZUJ/SpI85BeD16HAWEHwaXA0Be2QUMw5Y49xnwWFWbAriVpSC93k4O9ABcRPMN5lepd
         HaMAh7eNyeQ8Pnc/JUiJmfRk50oRfv5KAKsP1/0Iky5CM10iWXBZwliUeAJe6OgvH9IB
         hXmttjSFbiKae2kbYRNH9yEWpGiuf1filLVjEaMTJqv8LNcHtfM7dh61Lo9nCjm2Or51
         JFmuQeg1I6VjGNEa4Yz0tGicjlTt9jNPpf1R7rQrHhqV5sp+Og9qrWv2m97WOXeU413s
         0MBw==
X-Gm-Message-State: AOAM531BMfhQchiZzC1Zz1rQL4XNU5I4cBDkdSf5VnMTPyIW9ILRHf0/
	BM0DX1fcNqyRESwust7Ic4VpSP0XkA4rMQ==
X-Google-Smtp-Source: ABdhPJwXJ+7+EuzbPRM/oOZcYIKyXMeR4feFm86Ld1WWMx1egHnrNv0fisEMYL0hJMHBDa0OmjhRvg==
X-Received: by 2002:a63:3812:: with SMTP id f18mr18332663pga.380.1618943322561;
        Tue, 20 Apr 2021 11:28:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id z12sm6950954pfn.195.2021.04.20.11.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 11:28:42 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] go: Use dl.google.com for SRC_URI
Date: Tue, 20 Apr 2021 11:28:38 -0700
Message-Id: <20210420182838.958151-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210420182838.958151-1-raj.khem@gmail.com>
References: <20210420182838.958151-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

golang.org/dl is resolving to this anyway

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-common.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index 39a681a712..c368b95b69 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "https://golang.org/dl/go${PV}.src.tar.gz;name=main"
+SRC_URI = "https://dl.google.com/go/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.src\.tar"
-- 
2.31.1

