Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B74DECAAD8
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:25 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.939.1663362502497465346
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AtEeKafj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id k9so37995452wri.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=pKMa5UPlOV0i3q1xjTvqrnTjbWUh5kQVg8O0qjiBX+I=;
        b=AtEeKafjnfYOjmYXqMsvQsKe/oPhfMQh1udxkrSV35eUO4GizcWCKWkOOQaBV5m744
         +XClyoUO1h9HS2Irnn+bsnmjoEEIhc59CvgNrVhL+orHlrmKbOVEcxvIq1IgLhbEi3Jf
         mxqETwtVcyF+huQqcYuYXQqC9hFB1xwwbcukA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=pKMa5UPlOV0i3q1xjTvqrnTjbWUh5kQVg8O0qjiBX+I=;
        b=5GILOz3t570cahlwevg4p0wYPnTXK4HfB+vdgzNSP8MhQ23UZIHgBrw0kW05M9Ft0z
         P8phdq7Ng6bJXe1h1E7gGhIhN2u2qL+oUz/2MfWTgoFEKbgcjx4AJ3YUuBSQhFK4zIyM
         MA9TzE8woPBVKihLB4nv5JhTn9EiiW2V4d4PShqM6xtYB0AP9hPeFSmgdWzT0OnIS5WB
         HgemMnW3b6Yv0bNYyO3gienUUD7z4p2IY3B5gCR1og5N4SYovYm1dK6D5/MgtccxR150
         czLtEaUKZBvy3eFm0L5g6JiXVjxeLju/gfvTKpUSNS7vmwkEbCT5STejE9cSmn9eZRSZ
         L5Ow==
X-Gm-Message-State: ACrzQf1pmpYKIT5oUL4CckblCP0Tddr+F/Jwo8721CVm1fqvQtbI4euv
	asfNtdHdBeK78C4856G8mSmu/UgeVP8KtA==
X-Google-Smtp-Source: 
 AMsMyM6V2H3Ap6hVe4gwaJwStMXRnXkZvYFgku7Rb3VlTEPsxUbQ2az0uer6vnYikcvAAe+dDTnksg==
X-Received: by 2002:a05:6000:547:b0:218:5f6a:f5db with SMTP id
 b7-20020a056000054700b002185f6af5dbmr4012049wrf.480.1663362500014;
        Fri, 16 Sep 2022 14:08:20 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:19 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/24] autoconf-archive: upgrade 2022.02.11 -> 2022.09.03
Date: Fri, 16 Sep 2022 22:07:55 +0100
Message-Id: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170800

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...onf-archive_2022.02.11.bb => autoconf-archive_2022.09.03.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/autoconf-archive/{autoconf-archive_2022.02.11.bb => autoconf-archive_2022.09.03.bb} (85%)

diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb
similarity index 85%
rename from meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb
rename to meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb
index 47bf2380f09..6595ac98bae 100644
--- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb
+++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.09.03.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423 \
     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515"
 
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "78a61b611e2eeb55a89e0398e0ce387bcaf57fe2dd53c6fe427130f777ad1e8c"
+SRC_URI[sha256sum] = "e07454f00d8cae7907bed42d0747798927809947684d94c37207a4d63a32f423"
 
 inherit autotools allarch texinfo
 
-- 
2.34.1


