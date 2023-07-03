Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04C3EB64DD
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 08:52:20 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.23008.1688374332664152663
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jul 2023 01:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qveYBtjo;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ticotimo@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a37909a64eso2530374b6e.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 01:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688374332; x=1690966332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSGBYRIMfga52C9yjEuHpLH8EoHcHSfBB8t/mzRPYcY=;
        b=qveYBtjo95aQidiKy5RPuwxY9prBI73p21iaHEddzfKj4zUxX3YRFZ3lPPoUDU1iLl
         y4+ZV8gaeDHgOAIhUbS1wFecQ0MK/raaucpEuFbk9JR7qg9yVBdTzM3avyvc2dK6oFcO
         lcNXFTQAw/8wMsQyHD+5MS1Uwq9JEmpMzSh5sTI4D5e6NCWanxCmNCxbZ9Oug0UDK+Mk
         Ni9AAPdgu8hdPZO/klafXV1Qnp6qOrdQ403Bo9BzB4JajV3HmEHM2fQYt9EvuQWfj+HS
         TnD+4lHFtUuZZ5HTMv6gzBLLad4UHvDHlSemZq+LGT0vQYRIN+7vR3F2KXFwoBGP2dFx
         iASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688374332; x=1690966332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSGBYRIMfga52C9yjEuHpLH8EoHcHSfBB8t/mzRPYcY=;
        b=abMzCk/Bua9nTsQZBvq6kvuX/7wo+mVYCyE1a/xf3vukDSE/zdW/Ifc1GcnP3Qgdyd
         /SYeBfh6nYV77f4X5tIpZmJfM16rTx6yeTkVluVHX2RsjJ6Rkbdai7chjAwYFs8967hE
         oXwxK2Y74fZodWxPqb3geqtHD/bJ+CuiNMCTakHhgcteaXfzV9oFvoG5TeCEOk1WH/63
         YBXUMsAXvIKdb4uD/hZ0u/5AbWxujJEG/eS8b8Sui47+Jlgx+a78/PMVyHNKWTvFtKIF
         i+wfVB19nhfcBV5c02tYONxfgsHneo//QUEpLzCB2zj7DUimyYjtf7cxxQUNZFNcx/+F
         Tlug==
X-Gm-Message-State: AC+VfDwfuriwg5FKuOHRNsKI+JseykBLRfgVbJoMH+nj1Zbaezgb1XEo
	sHMtQn8NIMqdX1tDtOJUMKqQ2ziPPqenaH0m
X-Google-Smtp-Source: ACHHUZ6Oas5au8vMuR4STQFXgPfhcjvLoWqkENT+RYGg5v77Rg0wB6OtT631BifbjAuqV02EFFib0g==
X-Received: by 2002:a05:6808:1247:b0:3a2:a205:5d4f with SMTP id o7-20020a056808124700b003a2a2055d4fmr9260857oiv.7.1688374331473;
        Mon, 03 Jul 2023 01:52:11 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:48e3:fac:52d:29ab])
        by smtp.gmail.com with ESMTPSA id d29-20020a631d5d000000b0051b8172fa68sm14367214pgm.38.2023.07.03.01.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 01:52:11 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-urllib3: upgrade 2.0.2 -> 2.0.3
Date: Mon,  3 Jul 2023 01:52:05 -0700
Message-Id: <20230703085205.3129883-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jul 2023 08:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183798

https://github.com/urllib3/urllib3/blob/main/CHANGES.rst#203-2023-06-07

* Allowed alternative SSL libraries such as LibreSSL, while still issuing a
  warning as we cannot help users facing issues with implementations other
  than OpenSSL. (#3020)
* Deprecated URLs which don't have an explicit scheme (#2950)
* Fixed response decoding with Zstandard when compressed data is made of
  several frames. (#3008)
* Fixed assert_hostname=False to correctly skip hostname check. (#3051)

License-Update: Removed outdated reference to CONTRIBUTORS.txt

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../{python3-urllib3_2.0.2.bb => python3-urllib3_2.0.3.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-urllib3_2.0.2.bb => python3-urllib3_2.0.3.bb} (76%)

diff --git a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb b/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
similarity index 76%
rename from meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
rename to meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
index bc1cdb009f4..64b21db86d2 100644
--- a/meta/recipes-devtools/python/python3-urllib3_2.0.2.bb
+++ b/meta/recipes-devtools/python/python3-urllib3_2.0.3.bb
@@ -1,9 +1,9 @@
 SUMMARY = "Python HTTP library with thread-safe connection pooling, file post support, sanity friendly, and more"
 HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=52d273a3054ced561275d4d15260ecda"
 
-SRC_URI[sha256sum] = "61717a1095d7e155cdb737ac7bb2f4324a858a1e2e6466f6d03ff630ca68d3cc"
+SRC_URI[sha256sum] = "bee28b5e56addb8226c96f7f13ac28cb4c301dd5ea8a6ca179c0b9835e032825"
 
 inherit pypi python_hatchling
 
-- 
2.30.2


