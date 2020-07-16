Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.3362.1594933710149890599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2020 14:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JKY3rQI2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id q15so11692043wmj.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2020 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VpG9K3xFF8cTYU8T5slavBbXHFYOoGAtuR292/z2ibw=;
        b=JKY3rQI24Lxqu7ewmVDgD9XImxWQ3clMADa4Cz18FP8Kt9pqmc4j956iY8p/pK7qGj
         H5YOCpvH5vbVeT9ff2IxlrYbeWZW7SGw3fZTCzDdDzg8Gy2RddnoQrGpUuA4uFNgEdrb
         xo5Fmm4s5StYjCy59QlctS5EPWkUJqEEF0N6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpG9K3xFF8cTYU8T5slavBbXHFYOoGAtuR292/z2ibw=;
        b=AUXJnvMkGVwvEkfo8X+BWL+D3V41sdWjMvh7SAOVKPPpU0cBA5l67SSnbzpDHTz1ik
         PQQvcqZQf4OEt5Zbb3yzlj09Q7VwlFpFhVFEk8GFsxjv/25oXJ+xPXMqqD2efEogQIbJ
         7Z2/zaYPzJ1uuD/sRla02XPaxvWOGERee6PMDk0kOKtqcMh1NAICJXmiviqyTunc6vpT
         JmFb59SyBIiI/oT139wOpMpHhra+fmq8tcPG+O+Q0R/SRCDjWcEYFPd7bSMzroIbh7pS
         MeSvhcJcRn3HW2vUg0DqNPjF5awINvCDPKmwMrfvgyWJnpTEPcRyQbVvyZcHW3cWJDvD
         Vscw==
X-Gm-Message-State: AOAM531wmypc0CgbS75ysijAJV+LtH9Mdxv0ZQH4haxrNEaa0Ezpi84I
	dav/XZdRb4GqcfjAlu7a2kZ2o6hPMJcyIA==
X-Google-Smtp-Source: ABdhPJy4F8TYNcFsnV5WOfinGw26Xc85ybl/DGVIPZjNLJ1AgEIu8tpfSTBH7Y6Ec/DGmh/8y73b1g==
X-Received: by 2002:a1c:4183:: with SMTP id o125mr5940519wma.101.1594933708426;
        Thu, 16 Jul 2020 14:08:28 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.2.4.2.d.8.4.b.f.c.c.1.d.5.4.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b45d:1ccf:b48d:242f])
        by smtp.gmail.com with ESMTPSA id r10sm10952034wrm.17.2020.07.16.14.08.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 14:08:27 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 16/20] mpg123: upgrade 1.26.1 -> 1.26.2
Date: Thu, 16 Jul 2020 22:08:04 +0100
Message-Id: <20200716210808.7438-16-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
References: <20200716210808.7438-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../mpg123/{mpg123_1.26.1.bb => mpg123_1.26.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/mpg123/{mpg123_1.26.1.bb => mpg123_1.26.2.bb} (96%)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb b/meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb
similarity index 96%
rename from meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb
rename to meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb
index affbac49199..aaa66e17a69 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.26.1.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.26.2.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
 SRC_URI = "https://www.mpg123.de/download/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "74d6629ab7f3dd9a588b0931528ba7ecfa989a2cad6bf53ffeef9de31b0fe032"
+SRC_URI[sha256sum] = "00f7bf7ea64fcec2c9d07751d6ad8849343ee09c282ea3b0d5dd486e886e2ff3"
 
 UPSTREAM_CHECK_REGEX = "mpg123-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1

