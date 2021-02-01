Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web08.36641.1612196800727680492
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Feb 2021 08:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CJHX+po1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.51, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f51.google.com with SMTP id t25so6730644otc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Feb 2021 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CtRmAfRUomO40zPOgQlGNMf2EForfXJAmeIbttiK/bA=;
        b=CJHX+po1m8tABQTW12f1bLGd3Pd8anPbQFmTYNGieOzGGYpic0YSW2Fnv/xs4d/0PC
         1qhZFbWuux09f66BsZ0Dij2nBVhbuYo8ZoPEua8u8+DpDqfIv9lZigZJymTHShIpcYw5
         DZTc7YNbGR00JV0qFeTVZr8YaV1yVW7wx4YJ5STW6acpBtRHDqsTQCnlTHbJYRU1K6tn
         XOYd1lD4b5Nw11sh8lTm892YLSF/r1oN1U6yzGACzJ65rQBUbmJ7IcsggDeJsmcDzMdO
         b5T2bxzXNPdfyADqtwVtOgRCq8HwUcoEcatxsCGcKjGptMx0zrEoNAZ/FPYMTGbDprXo
         y0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtRmAfRUomO40zPOgQlGNMf2EForfXJAmeIbttiK/bA=;
        b=PgJC91hxD2Qp4VlfXgHOvfsidkkZ21WyMnRaU3nocirAAsoDWkYuwK5i8lq25B/LCc
         xGqV0kBbFsmNO0WaeUdpAEUR0Av8XNhzj/XCX9Y6SsKxJuIb5hhz6mRwyWETLYunG3bs
         cwkX04zDY5dZ2/Yp2DZoUVS+PBDUROKnOecn3YXQIB9af/HC1fsZDLga8voHw1OODC6p
         4FVpnVway0rsBqmjXN54bOtc6IKAU288BxujNqrJBQjHk7/eEexAoV8pa64TRlOR++NN
         nynXeG9F6aryfpvmoVQHr/X/mnhNqrhrI55v4AAvLmXxVF7zy7LdBPjeTolWe97YQwMf
         8ZMQ==
X-Gm-Message-State: AOAM530kXa9fHvOZdDMxJmP8UpKzGukWOcpO8gA9KgW0jwkwKC41JwlE
	4yj3Gk43tOBb8RtmG1DPF5Vw6TZX5Hyr1NhgQyk=
X-Google-Smtp-Source: ABdhPJxeW3+wGp6oTAf1GJ8nVSqG6nyRTv0GCOqQaBixHMqD9vGq0wA17DIBOElU2B45yi6tgzkAyQ==
X-Received: by 2002:a9d:4587:: with SMTP id x7mr12551383ote.274.1612196799658;
        Mon, 01 Feb 2021 08:26:39 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id o16sm3980726ote.79.2021.02.01.08.26.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 08:26:39 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/21] core-image-sato-sdk-ptest: these images need ptest
Date: Mon,  1 Feb 2021 06:24:44 -1000
Message-Id: <cd9b46e7a609b8faa9b670ae0c14f106e4343c55.1612188857.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612188857.git.steve@sakoman.com>
References: <cover.1612188857.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross@burtonini.com>

As this image isn't buildable without ptest (the packages won't exist),
depend on the ptest DISTRO_FEATURE to ensure we don't try and build it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fe856d726c6d9c35533e32e70fbe05ef2b88b17)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-sato/images/core-image-sato-ptest-fast.bb | 3 +++
 meta/recipes-sato/images/core-image-sato-sdk-ptest.bb  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
index 3641217306..4f08d6eb64 100644
--- a/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
+++ b/meta/recipes-sato/images/core-image-sato-ptest-fast.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
 
diff --git a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
index bf749acd79..4d59c9536b 100644
--- a/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
+++ b/meta/recipes-sato/images/core-image-sato-sdk-ptest.bb
@@ -1,3 +1,6 @@
+inherit features_check
+REQUIRED_DISTRO_FEATURES = "ptest"
+
 require core-image-sato-sdk.bb
 require conf/distro/include/ptest-packagelists.inc
 
-- 
2.25.1

