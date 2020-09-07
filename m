Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.1774.1599498162770707892
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xqrXgxkD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id n14so947320pff.6
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=eRk7opIXFc9vWIZ+bGbQUfj0zHn3IhdRHdQXip0CuWQ=;
        b=xqrXgxkDVjislLZJ0Lv08oy7EKGjK7s7nS7KIiUh8ypf/ZqBjtAj3GjWTGGjR5y2Ki
         rEOy+GMHptUYa1Hlt5ufZIGQtCHrdmS4IPGJjbS8gJj4jfQtNz8EWVxIg4Zj1QNeUZge
         Tfm3eIBV94EE02gC/a8oIRGQaNLipG5tcti+m77urt59XV9Wx4/9/did2gqdxxJA1O92
         EZEUUQLmrCE43Rj09yNPet4YaBmici5hWUYGrb9ReGnQiS2R1fNb5cEKnUztT6+/AwQn
         Ffs0F53CGBr+wcuLvXyj7s1WhytQtHPurg4ai16LhWdrOlki9tHMZTJzv39Pf9iISLRG
         GXhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=eRk7opIXFc9vWIZ+bGbQUfj0zHn3IhdRHdQXip0CuWQ=;
        b=LqmWu/gdNjhSEt8f2FH/wJnrTtdbsi3PAIe1YXFJSavVEkZqBQfVVxaGL5xm1H5T6b
         sI6sKFcSGeYMGDoD7LVQiYQ9nH+SjaPbgV2MrCZxlFKg6cJviUPP2PJDkZ+7nbPbHcEW
         vb5eBXtY+7ArZW+m3RsQ2b9117gFhyk5lFOm/nSQ2bVnI2CnKvtjMDn2zBPE+k5VW+Jf
         FRt4a+PK+XkURplYSoCR9Qotp7B37YAxy2cB/o0G7SYUD/XAIMZb4/d7GEG/PhT6TVr/
         MtlaNOhm49s2fOsxreUkXGQw/N9pNlDHrQb18I237kc6zG7bt5mLKITjSpR0922w4DXH
         fAfg==
X-Gm-Message-State: AOAM531mDN5IGVxoH9uB9Epwp23rmwykPsgv7dlff3i06PLKNwN+UwaD
	sUTkzKVfUkEa5N3vzesYo2g4wu1z5Azdrg91
X-Google-Smtp-Source: ABdhPJw27QgLLDY3xFOP3uLGTwiVg+K/fwrIYuP48BnFEqpmQi0LpsQBw+cwCm1KxbTQRIaK6E6Z9g==
X-Received: by 2002:a63:fd01:: with SMTP id d1mr5385446pgh.350.1599498161838;
        Mon, 07 Sep 2020 10:02:41 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/18] sanity.conf: update BB_MIN_VERSION to 1.46.0
Date: Mon,  7 Sep 2020 07:02:05 -1000
Message-Id: <5d8b81fd0f1a25fab6de6e23223e46ec54a8cf66.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599495862.git.steve@sakoman.com>
References: <cover.1599495862.git.steve@sakoman.com>

npm changes were merged that require bitbake 1.46.0,
you can't do a recipetool newappend on dunfell otherwise

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/sanity.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
index 8b2f655394..e2a18a16fa 100644
--- a/meta/conf/sanity.conf
+++ b/meta/conf/sanity.conf
@@ -3,7 +3,7 @@
 # See sanity.bbclass
 #
 # Expert users can confirm their sanity with "touch conf/sanity.conf"
-BB_MIN_VERSION = "1.43.2"
+BB_MIN_VERSION = "1.46.0"
 
 SANITY_ABIFILE = "${TMPDIR}/abi_version"
 
-- 
2.17.1

