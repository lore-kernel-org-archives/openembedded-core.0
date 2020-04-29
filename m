Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.4538.1588176701025099137
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=akUsfC1F;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id s8so1239452pgq.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=Jke2eAVl4bVo8Bo1iaACvD80slVBmNiRfN/mmSZzfCY=;
        b=akUsfC1F998006izyzRT0lP3Z51cjrpfhwEbm1tOpz21kigIWEnz77q6D0aqN/G8EE
         O5zqEVdJDu0Et1cr7O58L8UOk92GdwdUNOz8y6FMpmxr+jjnPGPlHKO/FSoo8kTqqst3
         LvTXZAvcaNdN4aGmtE9Z5THjBqf6wiLLV+Kqw3vSiMZMlYTvCu4jhRKCxDtOwH10ox0S
         fbiEJ/+i+we2tR5yIEHd9CoN0aFxrOPZGQhFD2dttMr7W7Qcn3Rj4V+QP2YAAUsPrN6r
         65aNedxSjRV4NML7uHn5YGJVbJ9meas/ZIqOC/ZX12KcJY8x9ccdZ1ApyFLKthdr4PJO
         5Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=Jke2eAVl4bVo8Bo1iaACvD80slVBmNiRfN/mmSZzfCY=;
        b=h39KffNBDQ9mk7nVJFSrZHJjWPJRTwerkF8FtWtNKwptz9j1T3UNeGQSzA0rHgyPzM
         2dxYpVym1CbPQccoFg1m554Z3HBkPGnF9OXOxrRgJblF7zCadI+/Kh57Xhmya5yXbQRg
         w6+H0FgNzsG/X5F3J+/23MJDWUGTli7okttdG48BuMfu4x8u8lDTvmNX12JbjC0lyU6G
         Dv209SsIx0IOFWx12PMCJflDBS2+a2uItMzYDWVboUW/Ez60h4Qw2MM9/rCr7QYVr0SE
         aCr8qwH+Vm+WS8nKOTGTlxkyIJcNQevjFrB+zyx3oX3NrRByxQ9copUKddLftP04JEDC
         PM8w==
X-Gm-Message-State: AGi0PuaqMyQuW8KABxAZlxJabT6aBh8LiLDHUhEnKI14BdWzQ8HD1lPw
	KPv0f2AA+WNSuCPk8PGQXnTgbswKACPvJA==
X-Google-Smtp-Source: APiQypJbMEHSTtfNXKIILMM7q1b0wHtitO25/HEmAwueHlPE1zvSdnm/mNyKlO6oWNg6YXJll9pIAg==
X-Received: by 2002:aa7:8118:: with SMTP id b24mr35804138pfi.321.1588176699951;
        Wed, 29 Apr 2020 09:11:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/16] bzip2/pbzip2: Correct license information
Date: Wed, 29 Apr 2020 06:10:47 -1000
Message-Id: <f03ee1a2a697394f3c4168350089526ef6b87de6.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license of pbzip2 looks slightly BSD like but is in fact the bzip2
license. The SPDX identifier for this is "bzip-1.0.6" since there is
another version of the bzip license out there.

To clear up all the confusion, use the SPDX license name and update
both recipes to refer to it. The copyright information is slightly
different between the codebases but the license looks the same.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/files/common-licenses/{bzip2 => bzip2-1.0.6} | 0
 meta/recipes-extended/bzip2/bzip2_1.0.8.bb        | 2 +-
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb     | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/files/common-licenses/{bzip2 => bzip2-1.0.6} (100%)

diff --git a/meta/files/common-licenses/bzip2 b/meta/files/common-licenses/bzip2-1.0.6
similarity index 100%
rename from meta/files/common-licenses/bzip2
rename to meta/files/common-licenses/bzip2-1.0.6
diff --git a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
index 8e9b779e67..d58f553a49 100644
--- a/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
+++ b/meta/recipes-extended/bzip2/bzip2_1.0.8.bb
@@ -4,7 +4,7 @@ Huffman coding. Compression is generally considerably better than that achieved
 LZ77/LZ78-based compressors, and approaches the performance of the PPM family of statistical compressors."
 HOMEPAGE = "https://sourceware.org/bzip2/"
 SECTION = "console/utils"
-LICENSE = "bzip2"
+LICENSE = "bzip2-1.0.6"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;endline=37;md5=600af43c50f1fcb82e32f19b32df4664"
 
 SRC_URI = "https://sourceware.org/pub/${BPN}/${BPN}-${PV}.tar.gz \
diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 1275cc0097..d7450c73c1 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -5,7 +5,7 @@ machines. The output of this version is fully compatible with bzip2 v1.0.2 or \
 newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
-LICENSE = "BSD-4-Clause"
+LICENSE = "bzip-1.0.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
-- 
2.17.1

