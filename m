Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web12.1473.1588648815623936827
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0Ga1Su8z;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id s8so464834pgq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KxET0TU8yF2S8FPTq0H2u+wxcHEPsEARjH+MhcoYnpw=;
        b=0Ga1Su8zXEtCA8uaxwVJdYj9MjycotFDv8ZKXmUV9qbPvZTNxUxaWX+fu7MyMRZY9d
         9xVMp5mWQFncPOax5cuhyn9bKisBpJ/WB1CO2JskNYJxpjByyqMspCW+iRiWahlwy3RO
         w1uBxPGXo6itd50IPZhzONAFVl5zjnIDK1KCEogs6doYC1bdlD/Xigwf8QITZkdZHh0I
         AjbJc6hQWX/+3TNOeuUy97sazOUH9MRt/Msis0ypZ1Z8p3dYzYYMDOtj3Rosw36yGjvc
         q5V9wn93KiU4CJ4iZR7t4izrlA8loCoQPtk1ZhI6vbtlvUm2dxgM6pqi1P8DN1mbjWC3
         aBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KxET0TU8yF2S8FPTq0H2u+wxcHEPsEARjH+MhcoYnpw=;
        b=PEO2rbwc1dEXsdlZq2K8hkBEH/COljsuHJaEhUw9qTBWOJGR2BZFUdgiN2tGr+c4ri
         amn83r5staNFNTCZ6HcKD6/w9dVmAYcYyuri/Uyh6MQTu8RC8ISf39eKFjYA0ghpPTvh
         w9e1aUgqRBswyu/gxn/RzhqdWiMQDv2gGoSfMi7NH5HfkHMfln4f9QVeChr3Alp0IfbS
         wrPAi4oZr9h8VMmoSvJafvDN8GvY3oAou8lfm7gII8Tg486vNEPbvoVZNa5DnbeL7g8q
         KTWxVabbtbkExTdfAdziQDe1mpsLsv7vUNWztZ7wTa0aZlsZtqYe46mWZPRsLvzsbkTD
         gl4w==
X-Gm-Message-State: AGi0PuYqIVl+RwfoGPRAPvHVABOj/ecGyIA3JhPZV/Xh1ESksJqhYt2l
	B4qXzYNfsiYEYeFzikRT7xzoGdZ2w8qW/Q==
X-Google-Smtp-Source: APiQypKDMw+MNjvFf/2LNyWdz4b7McXAvsUbThbgsgsCeIv4VUIHIiTPgwzXb7veSxuerrjyOl8cmA==
X-Received: by 2002:a62:e80e:: with SMTP id c14mr1084056pfi.83.1588648814630;
        Mon, 04 May 2020 20:20:14 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:14 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/28] packagegroup-go-sdk-target: Add go to packagegroup
Date: Mon,  4 May 2020 17:19:01 -1000
Message-Id: <a2371216d693d93c68f6e8aed5c41fd726c423b0.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Khem Raj <raj.khem@gmail.com>

This ensures that we have go compiler installed into image along with
runtime

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
index 86c71900ec..9a52b0781c 100644
--- a/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-go-sdk-target.bb
@@ -3,6 +3,7 @@ SUMMARY = "Target packages for the Go SDK"
 inherit packagegroup goarch
 
 RDEPENDS_${PN} = " \
+    go \
     go-runtime \
     go-runtime-dev \
     go-runtime-staticdev \
-- 
2.17.1

