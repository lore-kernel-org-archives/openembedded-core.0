Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56332F55432
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:10:05 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53031.1772046599226402522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K8HdK2HE;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82735a41920so44337b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046598; x=1772651398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvomLWB/5sFxp2Llc7aV44w6LjSkrrMDmpDufqcF91U=;
        b=K8HdK2HEpA3tJsfJ5ZCjOgNsbqX8pBN2pEmrkYfCOV45MA4ipgEDTtu9AfdUSnx/zb
         hWVFxMI5PgSfJK3iWjnrYiPytYHJKDkQPsaJ43g7ftl6DpXT05eXauES4O9Z+oNI29ds
         QIqczfzCP8Le/iC/Bub4BeosuVFFGIH0aP/G01Dgj3OU4m2rjoXo5ZbCJ8h7Kg/yX+jz
         XnZ1iR8kSnk5pTcoLtDzg7dzadZ8GwybpDg61YnMFHXUaXrTuBBJFQY653d9czfITo+h
         7FarGpdyrvMf/Yrmv15BJ51IAO1sl7KckOmE+465qMbdttTSjlaILp25zrFaicKnu8oM
         modw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046598; x=1772651398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvomLWB/5sFxp2Llc7aV44w6LjSkrrMDmpDufqcF91U=;
        b=e+5o3rAQ2ZNv1TKIJGzss8TefCb4ACHXOMXKZZ1zETPPZLzhFA7uBX5Vtdc3HOCFhy
         2gPrfgruIOwgyztdBkbkviS1AeuscfjjN069Z6HPoULcVtJNPWDK9+e5S9PZN6F7ZtD+
         sk1Eh3+eBbZ5x3ioDtNMkOgX1n0HxSKpY5SiiqvxvKpmZKkf1R6+37PXcQG9YQf2j2rs
         6oS6J85MhW8+JXGoFCnJpZkmfmHkj3hrbJcR9waZYa3SsRYaS1SjGro8uwnEMyJk8oym
         0aX9Fg/cmLVj12Mc9Ncrs88N+oe16qjgkQT78/0SO2+I5jXC0Ud/QR1Nvkio1zD1FU57
         hVhA==
X-Gm-Message-State: AOJu0Yzc5XDnsUbRo1I37ng5vAIMnbILVu09n/KCwnd8r1TfN2hEdtPy
	w6W6Sr6N+wxqUfGWk1wRmsR1rDf73wk5cU1aG7ZIAV0OVikr29+6GDUVir/ppqn3
X-Gm-Gg: ATEYQzxbVoqSmv+mtZVfoPswr0S/TsEfwb6XwyyOCSB32qgJn0O08z3JRhHNF25HX/z
	+XXnQ380SGwiWvuwR5OO37WZF8YswZiF8jN7vlI96VzsWAxPkQDUoMB5B6mQprN+EVyDd6Zux7O
	5Sp637uWduhTgT5q4TCDW5EDuTqJUaMwcHzjwukFh8Lru2WzplZ565imZp+vbqzKoKOZTuxg+4d
	+3yp1CVyCsoXjWMHEEWSFCwq1Up51ubkd6zMGOlYhVbKSyMba1dUk9Uqn8cXmV21B/raXmhpYcS
	PugQWgeA9OQutsbJlKpwnyMT/l2Lg9Xf9bQSAoJ84yJovsgePNxmvuSGmPSg57gLwCF0by4eyjv
	td/FAChJzEQNFeUG+dmNBV2unS6egoIu6+2CI7feJkCUgS3y+JEVH5Uw4+iOEgiobyfP51sjHLU
	or1mFgDPjN/asnNVzZPvQIUMwEfw/wY4XTXWw=
X-Received: by 2002:a05:6300:2206:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-39545f8b277mr14797214637.47.1772046598299;
        Wed, 25 Feb 2026 11:09:58 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b7183c06sm14062839a12.2.2026.02.25.11.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:09:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Thu, 26 Feb 2026 08:09:47 +1300
Message-ID: <20260225190947.2306814-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:10:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231976

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2025.10.07.bb => wireless-regdb_2026.02.04.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
index 68ae3b0464..2f7c816043 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2025.10.07.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2026.02.04.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "d4c872a44154604c869f5851f7d21d818d492835d370af7f58de8847973801c3"
+SRC_URI[sha256sum] = "0ff48a5cd9e9cfe8e815a24e023734919e9a3b7ad2f039243ad121cf5aabf6c6"
 
 inherit bin_package allarch
 

