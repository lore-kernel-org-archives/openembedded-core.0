Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EADE2ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 21:08:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.896.1663362508609705737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=clVCNHrg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id n10so7349576wrw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 14:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=NgB9517lj8BDWq/Wy7wCuaRvhMcZDewQTmjXUty/1g8=;
        b=clVCNHrg3kI6AQFaeLxkRVzDoKfs71q9MlvAS39S6xzuv96vQc2V4BXLsO7jMHGK+f
         lHpoDEd5OVwIlzgdzpZzUsHfbv2dCpqFgldVdwH03WykQi5DriGYNUEhvZkF2HG+GnLU
         4hrUmVPY4MpHYEf4HqzOE/cX1gtGIJrtOlCDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=NgB9517lj8BDWq/Wy7wCuaRvhMcZDewQTmjXUty/1g8=;
        b=OcCUlnjkrGTx0R/RRfScHwNqd3BVFyNP4i4mORZdlgpMtP8dBajLnG346kdJNq6ht6
         fj92zgWwLSAvimYFSgYUme2lYcOZ1pZoaTVrY0IANSbOxhwyU0zvcFnIrFxFOGT3rvMS
         yDVQI2+oEcvY3WnuwvlCDzCj5C60wT63+LIQKPVE5egoaB7SgWPfzCnnaatBHTjn1Oc1
         xDXzAQulEEe+fzcp+2oFVF6irmEcX0Bcun5b3jwS2xhTak6fR/i4pqS3o/xNHPJpj+gi
         auz8rMiqSb0nsGi//BRTjz6obzyL6D1fx0e6MvOgK/2fErCirNm9vlB6ejtqAO/JmD8H
         QOfg==
X-Gm-Message-State: ACrzQf0szNtQCMk2QTsHv5h0AhIvLGrNNwOy+7R8bWgZdFk9XgmKoFnP
	FPoCheRWHDmXbk3ZuFgcdM+wihr2+sf31g==
X-Google-Smtp-Source: 
 AMsMyM6IRO7FBzH/h1YsJ1GqDU86SH4dV7i6zxAUz0ZXf2xFD3h1lx3jIzJlpDyVTod9yBXyrBwsRA==
X-Received: by 2002:adf:e199:0:b0:228:60f6:f775 with SMTP id
 az25-20020adfe199000000b0022860f6f775mr3938607wrb.478.1663362521522;
        Fri, 16 Sep 2022 14:08:41 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:2f11:4b9d:cda7:29e6])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b003a8434530bbsm3411533wmq.13.2022.09.16.14.08.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 14:08:41 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/24] python3-psutil: upgrade 5.9.1 -> 5.9.2
Date: Fri, 16 Sep 2022 22:08:12 +0100
Message-Id: <20220916210818.1228761-18-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
References: <20220916210818.1228761-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 21:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170816

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-psutil_5.9.1.bb => python3-psutil_5.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-psutil_5.9.1.bb => python3-psutil_5.9.2.bb} (87%)

diff --git a/meta/recipes-devtools/python/python3-psutil_5.9.1.bb b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
similarity index 87%
rename from meta/recipes-devtools/python/python3-psutil_5.9.1.bb
rename to meta/recipes-devtools/python/python3-psutil_5.9.2.bb
index 04b6fb02de8..5b31014657e 100644
--- a/meta/recipes-devtools/python/python3-psutil_5.9.1.bb
+++ b/meta/recipes-devtools/python/python3-psutil_5.9.2.bb
@@ -3,7 +3,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e35fd9f271d19d5f742f20a9d1f8bb8b"
 HOMEPAGE = "https://pypi.org/project/psutil/"
 
-SRC_URI[sha256sum] = "57f1819b5d9e95cdfb0c881a8a5b7d542ed0b7c522d575706a80bedc848c8954"
+SRC_URI[sha256sum] = "feb861a10b6c3bb00701063b37e4afc754f8217f0f09c42280586bd6ac712b5c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


