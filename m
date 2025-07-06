Return-Path: <thakur.virendra1810@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0023DC83F03
	for <webhook@archiver.kernel.org>; Sun,  6 Jul 2025 05:03:38 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.31381.1751778218387059895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 22:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LVfXzukO;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: thakur.virendra1810@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-23633a6ac50so28486635ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 22:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751778217; x=1752383017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h4iv/jsebAvhuUq8Sw6/MQr321gy+dTAGuVW119mu+Q=;
        b=LVfXzukOdy1vVfhguYNHODwDzluC2GKK2kSeQf4xKPJ115PA+MNSUpP3kcPK74UCQe
         +UZLwXwp6Bmt+vHvPtL4S4zX63P/8uvAM9lzN3srFA2SuHAG0L5My0Tbr8q/b7CFQaZh
         prrNHiQzpeDCr8CcYzZdFJZscoVr6RXD9z2unsBsrECAjl/RBreOF1A4OHbd9JoxAigH
         w1jtz9pvy2rYm+yMkVqvdG/cUvxdvfqa+TIC6EcYRrgv16xk38eHritExHgLwN36ER6y
         b8DDKLmEwSKk3fAIDJj+uRxYCep/DnM5JWPff8bNjO+x7pTcoxFbjYjbcnxMZtZ3koZz
         suRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751778217; x=1752383017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h4iv/jsebAvhuUq8Sw6/MQr321gy+dTAGuVW119mu+Q=;
        b=FbE8QPFWg9BiHGZv/GZ9kVe5E3jZPrq2VFjWCordkENY8ZWAnOffKR97NHxpfGhEHx
         oOfikXNNqIdJk3I37hjAgBzSW6AuPaOmYlbLQl6iAsJXKYZA2HGTmOihXR86W6iQQpj5
         zZEdb73fxN0XJLkA1H+gw5JEWoQaOdr5yBsAPsHSpkxX1FmDZUaEOCbOurzVegxm2RYc
         VIbWjNQFxh2eX7NM9ARG5jYfuyEzKTwqprP+5Mw+qhHBoEODGpI9DjLXVMyymQ/I+bjs
         fqlclvPF4vawZKa+SGBWf6no+fYK/6EBEjTbKROgZ8osVSNXOXrxJr75JERmEznhLpRW
         l7qA==
X-Gm-Message-State: AOJu0YwmeJI81PP4JvRrM0WO3tU1j0SnDwae++LoxQCGljk1okleANnB
	wHPYpO1DNwPPcy2bXDJjvyV8X4jtZKPD6ZALp6F91AXJwgE/XFzXmaROW5endA==
X-Gm-Gg: ASbGncvMCcOaqzKX+kEZ1wEAEB/8AmRlGr56O6Psd0UTMb8yaJzFd5c/JVmn7U1HcfZ
	uNXa7kFV/uNFk2sX0YCE+d6GotgXZ7Wbiw/t5uXfRuE/69iPRo8LsUdIYLdfNjkoQs4NYyTMtuu
	SNUsMdScfQh/dpMLZTFH7oOf3bUpW9yC4qeVFL7f5gf4xaJ/JgAOPazmDBInYuPC26jsn+fT3DQ
	e3Hil4fdJ7hgfp2BvUH2F+iV69enY7kyimkndueXNT5Da91iy+Jhgik82zidlN5Ps8cVL5/9wpD
	xKDeJDnqIEqWs4GgizddntYsonPATbMA5legrnPB6d6opSu/YwOk5ejhCGBHCKWQQQLs9YGZScK
	ZEaH2ZKyyKw==
X-Google-Smtp-Source: AGHT+IEoJ1gw1ZT2742PQTRrWrorjzKEL5jgRXbJ/E4EBkIu7xqZovmB7S2rzH74dG+Qst9xKxzduQ==
X-Received: by 2002:a17:903:4b43:b0:234:eea2:9483 with SMTP id d9443c01a7336-23c90ff9631mr75201965ad.51.1751778217090;
        Sat, 05 Jul 2025 22:03:37 -0700 (PDT)
Received: from LL-3020L.kpit.com ([2401:4900:1c7e:bb80:c472:4f79:4eeb:feb0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845b741asm58884285ad.233.2025.07.05.22.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 22:03:36 -0700 (PDT)
From: Virendra Thakur <thakur.virendra1810@gmail.com>
To: openembedded-core@lists.openembedded.org,
	robert.joslyn@redrectangle.org
Cc: Virendra Thakur <virendra.thakur@kpit.com>
Subject: [OE-core][scarthgap][PATCH] curl: set conditional CVE_STATUS for CVE-2025-5025
Date: Sun,  6 Jul 2025 10:28:21 +0530
Message-Id: <20250706045821.44901-1-thakur.virendra1810@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 05:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219961

From: Virendra Thakur <virendra.thakur@kpit.com>

If openssl packageconfig is enabled, set CVE_STATUS as not-applicable.
This CVE is applicable only when curl built with wolfSSL support.

Reference: https://curl.se/docs/CVE-2025-5025.html

Signed-off-by: Virendra Thakur <virendra.thakur@kpit.com>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 2f5bf8c8fd..a21a086f40 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,6 +37,8 @@ CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl dan
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
 
 CVE_STATUS[CVE-2025-0725] = "not-applicable-config: gzip decompression of content-encoded HTTP responses with the `CURLOPT_ACCEPT_ENCODING` option, using zlib 1.2.0.3 or older"
+CVE_STATUS[CVE-2025-5025] = "${@bb.utils.contains('PACKAGECONFIG', 'openssl', 'not-applicable-config: build with openssl','unpatched',d)}"
+
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
-- 
2.34.1


