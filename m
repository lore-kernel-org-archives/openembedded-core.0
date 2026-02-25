Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508D1F4BB9C
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 19:08:55 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.53285.1772046531270971730
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Feb 2026 11:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e2XbD8U7;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad4d639db3so34038215ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 11:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772046530; x=1772651330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvomLWB/5sFxp2Llc7aV44w6LjSkrrMDmpDufqcF91U=;
        b=e2XbD8U7iIr6MiXMLDdsg1ZCD/uX8asEwlf27u369d35awVe/b0fi2Cz7LUQ2XdrcQ
         7wneSjNWacRAlsgDmERVRI6CUnJY+V4zJJC+WU1oWqlkHH6iu/IFm9u4/4hNIC2YCM86
         bSjYyaIPuHanz74vDk3PhqOoOcPcsHRxcPtOLB6mxa2LYLpmhuewXMw5famfPnZphZEU
         bZW5fioMqkfusWUjr1p1KSkIEAzHVU+x1+FTc2ir9L7SaZTxFgiwEKi39zcT8aJtDh3v
         gizCkoyZp1gUhYjBjrizfE1njbxYtpon9u7X2znMRB/uziFfIc697FCnKX1XdmrsmAZg
         lMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772046530; x=1772651330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvomLWB/5sFxp2Llc7aV44w6LjSkrrMDmpDufqcF91U=;
        b=exDf6UE3n5wQlezDJwQ9dmmF6lR9TSsa2UNOoFD29AItMZt0As8M7l9A2sxEDRcazY
         xR/6hI/o55eA1LhAf8sej5xIswrwZZlT5HVBNIqyPN4YR8gDgG7aVwAh5YrnjNL5apov
         ToC31p4PozihqabYPf4yqBrWS2TrchrYJmIQ/1P7aCe+tsKHXNpoaGMFMjRd/l0oEDwG
         /wzPANmkId9Tuipx1N8FlXw/qxctiMaGjjN1B2bXICAsOVLwFNIH/+rpIsh2CpMYgh1x
         KJ7ZxdibQgr7l/a53VQmOWOeWFQ+l6XnOvqx/jRRlpZ6gBt6oEre/unZ1NaUdW4u6mvB
         Yc5Q==
X-Gm-Message-State: AOJu0Yztzj3L7lkti0jXrN4tjNrN9NQYJLSRuh3gdCnV4dEApr1+DvOf
	tpBDfEgFpfp2UfE/wQzXv2nueaHfydVUSO2TFlm5/IxdTbvb6kXs1tgQGpALzhuE
X-Gm-Gg: ATEYQzyg+xtxUb8V5gmgGeXR1fFT2OTlFW2BGcDhxDxK6hYSXAb/1ws4aik6uV632ZK
	LyV9WfltzLFUgA7Jb0H/D8iHviQgOlxUMDzoGhNFZp2IrgGndxEPNbNY68Zwxyn45yOHZh3Z34H
	ORXnqdEoAc12a9kK6+gOsdxkLc/1ncVbbFoo8ZQ0FuUm/zjhUAQzjhImMLQDfTkDJbg1kAS8PRD
	F7UnSCIROb2u8QbLZlqVfyVekSQoFnq8qe1K6emsda3Jwncls3KVg8iyyPkXbStmgEZ5xx2+ji6
	pH7txw7kGn9Y2fCSwjgPueaTjD5mrYOmya2KoqBVWvKF2L/vNjaxAHZu71HDIf/U+tioZfEzclu
	+PKeLODK3BOqkGKsgPm18wkWx0+3hvaTD/Iy3lTsk1RIPGOuHWsNQdimmYu/uzdXHAmVJGdzo9W
	v/A8OR1kBP9yv7aSZNpLTtJHiiWlGBG7t1NX0OLBUcLMJgxg==
X-Received: by 2002:a17:902:f68c:b0:2aa:f2ce:5aba with SMTP id d9443c01a7336-2ade9a7cca2mr12761635ad.38.1772046530356;
        Wed, 25 Feb 2026 11:08:50 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35901883a0bsm4637817a91.6.2026.02.25.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 11:08:50 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH] wireless-regdb: upgrade 2025.10.07 -> 2026.02.04
Date: Thu, 26 Feb 2026 08:08:39 +1300
Message-ID: <20260225190839.2306113-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 19:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231975

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
 

