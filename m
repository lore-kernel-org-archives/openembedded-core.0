Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEF3C54EE9
	for <webhook@archiver.kernel.org>; Sat, 17 Sep 2022 13:49:30 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.5991.1663422560058256500
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TfVhS3eS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id e16so40228030wrx.7
        for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Sep 2022 06:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=vOKJi7NbaETIVIDi7r6HKnFaaOOlLaIz6DPH/STRiLQ=;
        b=TfVhS3eS1JW+IWTKHWsny2DB800EzOVfCw40JniTVRQ9zbNC+/ZqkyOH23PoxeMMw6
         Um5i/rguf4UYx7qcoLsmqRKUw6b7Hxdv/7qEtgxwERVlgAeZcVy40/N3RWqz7qgWQYkk
         6ZenmktddCXZCnHxnfxXam+kKRPavo4JJqqC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vOKJi7NbaETIVIDi7r6HKnFaaOOlLaIz6DPH/STRiLQ=;
        b=0/ZFvLkUnH4zYTIf1i4204yXIEvmqw3NIQ1iVwHIHEETAtQr+CLquYScdTZpqhLOCa
         hKTVQd7xXHVU20NC0pZsiWuhQBtrqS0cQFC2AHerrajD1+ubR5E0/JSDVF3OXPFToybV
         EGvoGvQiPmHQsK9N3xQu7coT1YxvrODeyW76BZTqBHGaFzT1i6EREw9Pq1LgmeWCYtsc
         esOLxbLG1JsAMWQredEWdKrrwtvBia9WakROXIm5kcHrxCSq2QVADYipmUekjotYGs34
         lDHx+GvPQcgQHWnISdP55xsLDx5vhUvcUsEe0BqalixrdwLUXWvfFlMZElHzZKD+88Wb
         zRpQ==
X-Gm-Message-State: ACrzQf36tMKZtYmxCqpAcEuk9v3dCv/l6RKmvRzVkOeskq+gHosoM7gz
	CzJ2bediNFabSgSGPR1fjXq5RMi0P80+7w==
X-Google-Smtp-Source: 
 AMsMyM58YqBEhU7pAuwjoK2vVOlOVM4MC0gFde2Gra2UF1As8N0slA51zOfBaBfqN0HVsyo+AWDdOQ==
X-Received: by 2002:a5d:44cf:0:b0:228:dc26:eb3c with SMTP id
 z15-20020a5d44cf000000b00228dc26eb3cmr5724182wrr.389.1663422557885;
        Sat, 17 Sep 2022 06:49:17 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 k24-20020adfd238000000b0022ad393ba3csm7426679wrh.107.2022.09.17.06.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Sep 2022 06:49:17 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] libpng: upgrade 1.6.37 -> 1.6.38
Date: Sat, 17 Sep 2022 14:49:12 +0100
Message-Id: <20220917134914.1299532-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
References: <20220917134914.1299532-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Sep 2022 13:49:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170831

License checksum changed to to copyright year changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb}            | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb} (83%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
similarity index 83%
rename from meta/recipes-multimedia/libpng/libpng_1.6.37.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.38.bb
index 61e3d92e95d..dc627203ef2 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.38.bb
@@ -5,14 +5,13 @@ library for use in applications that read, create, and manipulate PNG \
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b0085051bf265bac2bfc38bc89f50000"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5c900cc124ba35a274073b5de7639b13"
 DEPENDS = "zlib"
 
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[md5sum] = "015e8e15db1eecde5f2eb9eb5b6e59e9"
-SRC_URI[sha256sum] = "505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca"
+SRC_URI[sha256sum] = "b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.34.1


