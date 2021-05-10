Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web08.32540.1620657048174232658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 May 2021 07:30:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=x85xedao;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.169, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f169.google.com with SMTP id n184so15912446oia.12
        for <openembedded-core@lists.openembedded.org>; Mon, 10 May 2021 07:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BD90iJ3/8sLGUW9oRLJn7XAwlcuQvi0fGH4Jsjj3f5A=;
        b=x85xedao6fFictqTwBAnEHKBdp9JiTEMVl9kLjdveawAGVXySAJIgBsR16JDj2cj3i
         6x1P4ipKLm8M0AApSi2TgGSs9OihNqMmLs2fMlG4jtGS6TBPeHoZYG0Kml17L+OGn2p+
         NnVYyJKR7pAMXhA05taAxPn0JHT4eapyHz0oUPeDY8raKQo1BI7ZgwHIqmCyVAm0xEgg
         UOElasI3pKZA19J/nE5ABQyrSufnWLK7QHUxJnVEBlLwq+25r/DBkGFnxfTC/W9HMA6W
         YVgLwdSsIJUBf3TNAPDWzybyKZn88o2dtzU4rOcCBTJuleUgOcU2BU3cvb44w7eqabds
         3lRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BD90iJ3/8sLGUW9oRLJn7XAwlcuQvi0fGH4Jsjj3f5A=;
        b=ng77eDAeMjNjKLcASMj/opiRAO9wp3E0Qh1pGsCvtIwxK7v9hXldpG7bqFH9AhQziY
         +bIKx+UZymFJy5ZmI/f0Y209YiR9CM1S2I2xr+lvBP1afMi2gqYOjGWaHOLL9FRD45fg
         uQqTPZeFAeiGBOVhBr1wi33QHCH8g7EqPsODdB5VZy4hIAo70rjianhtPw0IsdNj80rc
         yQLuqkPSHVMr1+1Sw7pQOEBKw+ISV3HJO+a+c93xVXiH49SdvSb/dcCn/EuAlth3tPmZ
         t+ZakoKdLU/JN7JO0W4V+x2g6JXFI2w8Qlky3xs458MydlKBgcttvyroTw7Br5bib0q7
         DRvg==
X-Gm-Message-State: AOAM530cnrQQ5x0PYJGwQ5Cj7RtSi0Sgc/Pvn8LL1gjw6T+h5i7qu069
	yq7GJaqqNBfS1IkfQxm30oPvfBpo3a5/ocRu/pU=
X-Google-Smtp-Source: ABdhPJxZYxbjpCzNBYyCqPhUKyM3rXJxdT1wfl/wXD/YYHqeR3vgHd4cgC1as6hJnupq0Q1yicc1JA==
X-Received: by 2002:a05:6808:d:: with SMTP id u13mr2561900oic.103.1620657047003;
        Mon, 10 May 2021 07:30:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id g16sm2661309oof.43.2021.05.10.07.30.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:30:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/25] cml1.bbclass: Return sorted list of cfg files
Date: Mon, 10 May 2021 04:28:54 -1000
Message-Id: <1eaa291f6a29eff76b717d90eae2d4896c9430ff.1620656333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620656333.git.steve@sakoman.com>
References: <cover.1620656333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Since these files are passed to merge_config.sh its better to use a
sorted list, so we can be sure that this list is always fed in same
order irrespective of python versions on host

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3d949f286c29bcaaf4dfc0aaffd15f129d1bab2d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cml1.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 8ab240589a..e91452081c 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -6,7 +6,7 @@ def find_cfgs(d):
         if s.endswith('.cfg'):
             sources_list.append(s)
 
-    return sources_list
+    return sorted(sources_list)
 
 cml1_do_configure() {
 	set -e
-- 
2.25.1

