Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web08.20627.1621847659514034729
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 02:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DdJqhmkN;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id h16so31055715edr.6
        for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t2JgXxANGztNqG3YuTo6VuBTaX8G8TSdgeZ32YqScFE=;
        b=DdJqhmkN4QvjZzcHV8uVctelq18KC5tjN11w1e3TPZLIw0Os5L9gNSVojXm9Ev5XUI
         ZjfzxFHbTzneP7kvHo0/hPUrLLpaZP6nTKFqHcB8321vKfWXfJtXrJiESQ0BtAbEn/gI
         EGs15ig1yKemqrXRqJdDGL86+uUVT/EeBPb+QO2vSYYgeV/PawL2nvub70u12AP16FXk
         lNIRW7gGtj5QuwhItIhp+HtpofBdhzmlOBSR1B0X3JsgWa0OPpHhRrqe/oUyzZbl3YV6
         MUer2HajLPPwr7kZ5ape6VLjr8W0AIUo+sQs4DF/qD4IiGPNS5xrbqeb6T/v8RqSZADz
         1stQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t2JgXxANGztNqG3YuTo6VuBTaX8G8TSdgeZ32YqScFE=;
        b=chVYGawwKtDrYPdOOpYUM9IHHXLR3W/7wyHsPkKghRGj1xI5YCM7S6Rb3Uer5LwDTB
         cqbhZ10VMcDhtLLErTPQvEtmI8X72pE5Na3cxaYzKuy4QiBsDn7qFqWHd4FkQKhnV+1r
         Boqsq4eF56O0s+jC23TmjGIEsmVfFv+9Hw2LbC6jWgH6mfoqbQ0GqzSk6CB5CYV2QHM1
         ld0M09ibpkOWyi3+HFMfFelvXM5xC7f9h7qIPgTmnrM5w0iMZlGM9hsbiw7SWATz2qhO
         ysK7o/b3DfmcFMl9e+drkIPB0/SxbRwXP1TskBrrgdbhEwa2M2aGDFmY6wjR4jZ6Xr0q
         7fag==
X-Gm-Message-State: AOAM53358+5MunkqvpJ8MbkLYJJUGwzlcl/o2hxKtmcUxrMuK4kbUCGB
	ni05QC56PSuDVD8FGR8EFFivTVH2Inw=
X-Google-Smtp-Source: ABdhPJyAsAMi1WfaPDwdYS93kRvdxxr7fsCSURmAx0/XOGT0iXagxEPxp3MHWlrJR3gdH3AZL4vMJA==
X-Received: by 2002:aa7:db44:: with SMTP id n4mr24501802edt.374.1621847658148;
        Mon, 24 May 2021 02:14:18 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id h9sm8673490ede.93.2021.05.24.02.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 02:14:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 20/21] curl: update 7.76.0 -> 7.76.1
Date: Mon, 24 May 2021 11:13:46 +0200
Message-Id: <20210524091347.419253-20-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524091347.419253-1-alex.kanavin@gmail.com>
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/curl/{curl_7.76.0.bb => curl_7.76.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.76.0.bb => curl_7.76.1.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.76.0.bb b/meta/recipes-support/curl/curl_7.76.1.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.76.0.bb
rename to meta/recipes-support/curl/curl_7.76.1.bb
index db6318148f..4e2c277010 100644
--- a/meta/recipes-support/curl/curl_7.76.0.bb
+++ b/meta/recipes-support/curl/curl_7.76.1.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "e29bfe3633701590d75b0071bbb649ee5ca4ca73f00649268bd389639531c49a"
+SRC_URI[sha256sum] = "7a8e184d7d31312c4ebf6a8cb59cd757e61b2b2833a9ed4f9bf708066e7695e9"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.31.1

