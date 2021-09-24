Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web08.8939.1632492983504120316
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 07:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=i2wTY27+;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id t20so7053854pju.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 07:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KpE8EFRewwdas1I8194WSUXn+nGcz/svBAyncpoOBPQ=;
        b=i2wTY27+YdD7+ShSsRAVlrvUny5CzEFqpmh7RWqh6CGxT407H29gmLoQblZ0VYqr50
         Kg2UDNbh6Us40G4ea/Cc6RSAQPbzw3z8W+vHYDrJ4Ekvmm6WHeAdAYiY4WnO/g+qdkUB
         iasfXjkGnfbfUCM53Qp/0qbaZ8bDjhsUj1xDCF9Oh9kPd3jgipqZ/kiuaAeVLG2JUw1M
         dmgkHNtYqtvwUxMbfMFiKaD6fFwZXYIU6+VIJ2VQyP7Uk89rXcRfps3x2omyXplc+Uxl
         nCwgOaL8rx83nNQ3OeOOJvOnlChFJH5syUX+5KAwKYy7N+WSRxpQQOuorQhv4yD5xX2X
         b1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KpE8EFRewwdas1I8194WSUXn+nGcz/svBAyncpoOBPQ=;
        b=UTKetYLpsjTcIdqgJtJvX2oJTd31+HNi3YRC5Jt1DLOZRao4uBGX6/mkDhMXhEWvux
         V42671CS+oZoT6na1Y8LSTcwOebio8bABFZX8T5A3HkshgEaI0crWDLvrF2KU1ItlEiC
         eP+vy+/TfsCNdyA5fbJ/mIN8ghQMTvxRNFZ2U+EVSO+9PIN+tUy/SrGmjfHdm2rRtcH4
         rnAVicJvmoXfHgiaPwQe/EerTI8E5pytITM5o3898wuGYpkOV13LCWe1a7nhkH5UvjfU
         AVA9nLzzTFXbqvOR/B/dRqrRBfkdhLJW1BekkUibv3IcxLRi53pYK/Odu57E8ujh7FRX
         KQyQ==
X-Gm-Message-State: AOAM5308cvZG1GRXtwLlAKtfZqQZaQly/UPojxn3lenpBr8xH0rpCc5u
	9Zf9K7XJlphBrKMTysQoaB3oeJl+qBvSdNt2Q8g=
X-Google-Smtp-Source: ABdhPJzR8LgJ5/bIsmhivb2+arFX2YVwG2O/VW56DVuz9A6wV0Csf1+KLHK5nE0nMq3OopIHERtZ+A==
X-Received: by 2002:a17:90a:e386:: with SMTP id b6mr2443477pjz.97.1632492982499;
        Fri, 24 Sep 2021 07:16:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id f144sm9200284pfa.24.2021.09.24.07.16.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:16:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/25] tar: ignore node-tar CVEs
Date: Fri, 24 Sep 2021 04:15:16 -1000
Message-Id: <68257125de393f85d29163e36c7e63e369d0c1e4.1632492565.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1632492565.git.steve@sakoman.com>
References: <cover.1632492565.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster808@gmail.com>

These three CVEs are specific to the Node package node-tar.

exclude: CVE-2021-37701 CVE-2021-37712 CVE-2021-37713

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f9317a02d73c1e5aea026683a037e52c996c7bb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/tar/tar_1.32.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-extended/tar/tar_1.32.bb b/meta/recipes-extended/tar/tar_1.32.bb
index 0fe0b801c2..87eb8b4188 100644
--- a/meta/recipes-extended/tar/tar_1.32.bb
+++ b/meta/recipes-extended/tar/tar_1.32.bb
@@ -68,3 +68,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 # These are both specific to the NPM package node-tar
 CVE_CHECK_WHITELIST += "CVE-2021-32803 CVE-2021-32804"
+CVE_CHECK_WHITELIST += "CVE-2021-37701 CVE-2021-37712 CVE-2021-37713"
-- 
2.25.1

