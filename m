Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web12.5973.1592864168450416127
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:16:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eGJy6E5Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id e22so4207346edq.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 15:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=cf8b7awidPLKgfxHcH9fqfwqbqeZoYZABXnS3ogZ8UQ=;
        b=eGJy6E5Q/0+ntgHqP/iV+G2m3mPoNSN5vzHpX+HgKn6O2FeM5tUi0XFHNvDiWWO4iG
         UT4I7iZlSoqZE1Osqi5Ne+qxmHRmhhTWuxhw3ih3pN6ddT05KMxn34ug/ljOqzkA3AXT
         Wgrf4zq50xtaC03/CJGB/ytEI3VYbPePYQ/5Jzt7aoV+3uP0Ai2BY92Rr4f7cQeTxaE4
         nQT5m0yAXA6sHiyTUtIgpz2PI4IfYM1sLTh/ID9OpA7t5mv+87ARxPU4Y5GPNwwP8LVg
         +3ol/ZZQHzwamifK2m4yqXUWYwAmRRdfaTCGnRLSE+yIBUQNEzBcC93biBj4y4VEivnM
         bBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cf8b7awidPLKgfxHcH9fqfwqbqeZoYZABXnS3ogZ8UQ=;
        b=tWHkRW5k4sERdTQ1h0HLq9Vz+dvq4b1c3SGRxlXDrC/xUMM/L21LtzMKy/NUkvjtcf
         ezAjZr41J9X6uey+vYGWe740fpa5y8YCkRox11UimNN7xFxKmBSnG9dtLpSJ+eWuLeaw
         zDO4TGZY8FtvDsnHHYL661EiB7hQihA0LIKW5AgokIK13UEJdanup1m8qQ50MmKuEMks
         9oMqyReE1YMvbgbRG2MRlwcxNO33jWcpf/O/iEOTn50VqroJxoCBN0Ph+2u0UFIqqpgM
         j57tf7c/a35SGJzS/RmhA0VSI/MRs0/fSkBI/x+GNQoEc2qqoVZ8T6q2466hJ6n2tzGt
         oSEQ==
X-Gm-Message-State: AOAM532/R4b5FQBTDvJGHizwoCrR6ZpR4RsXxGzgfeRUh8MnVhBH6/dW
	7vSSGs1IGvyT1hhJRvXN1Rk+iBzS
X-Google-Smtp-Source: ABdhPJytNDonkaQhbHQrhmhAnMXPE6Rq0njVkSCgcIISOJ7Z4W0pAWV+UxnGb7czRwUdJy8YbiBvmg==
X-Received: by 2002:a05:6402:22ca:: with SMTP id dm10mr18764424edb.115.1592864166451;
        Mon, 22 Jun 2020 15:16:06 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f481d60137a2e45bfed0e33.dip0.t-ipconnect.de. [2003:f0:7f48:1d60:137a:2e45:bfed:e33])
        by smtp.gmail.com with ESMTPSA id n16sm3703803ejo.54.2020.06.22.15.16.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 15:16:05 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] ffmpeg: upgrade 4.2.3 -> 4.3
Date: Tue, 23 Jun 2020 00:15:51 +0200
Message-Id: <20200622221551.1530869-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622221551.1530869-1-schnitzeltony@gmail.com>
References: <20200622221551.1530869-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../ffmpeg/{ffmpeg_4.2.3.bb => ffmpeg_4.3.bb}                   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.2.3.bb => ffmpeg_4.3.bb} (98%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
similarity index 98%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
index e837a05d47..2b0c38d782 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.2.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.bb
@@ -26,7 +26,7 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[sha256sum] = "9df6c90aed1337634c1fb026fb01c154c29c82a64ea71291ff2da9aacb9aad31"
+SRC_URI[sha256sum] = "1d0ad06484f44bcb97eba5e93c40bcb893890f9f64aeb43e46cd9bb4cbd6795d"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.26.2

