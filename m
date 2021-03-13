Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.2554.1615661479726197976
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:51:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bIuc6yH3;
 spf=softfail (domain: sakoman.com, ip: 209.85.161.49, mailfrom: steve@sakoman.com)
Received: by mail-oo1-f49.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so2381080ooe.9
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Mar 2021 10:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=geJJO3pcOzvhWvlFQbnkRGJCK5f+/2siaV2JRtABFm8=;
        b=bIuc6yH30mkUa7F9YVzeBe2Q0Fk9wsbPRKBlzAachzseLDiJDb47O9EzicK66YlGfy
         OmHCJn1muUWOgYSbKIzcTHEu2Ve/5+3MLGhw7aSaTjRCsJkGuBHc/ixQ4o6qe/4sSO/N
         C+rwoSynOabh4HTlwpk+y5TQV81uPIiLxeLD8psN1pheINwjQaO9x8FlgezIvfRZfsJ/
         bO4yrUIBAlTmbXZW17ugWe+nKNOr02LhY/x6MU3hgGaSUxfUIuxznnO65bgQ0HC6g5eU
         pov0dMO9uptjHltR1FpTuIMepAZrZTWvzX58LhzitXleuH/Jz0KKwX+qDNoT2HnZ+spT
         fFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=geJJO3pcOzvhWvlFQbnkRGJCK5f+/2siaV2JRtABFm8=;
        b=VzghUcF4kUpEuCzx5dTNc4AbkbbpBalU2mCVWLaRR5NRoMVNrMMamaPzc6aP1gBcpn
         pL7JKktx9QlF0EOohz82FCZvTgMjOy+onceOvz8WlzxzrPEuZhxcv7qZhJSjbqM8ddMn
         vPQIl5tYVMXDv2414bAqvvI+q9W+oWx66bVn2Bx/BOHSjcL7hUa03raGpiDFGhSU/7rY
         kSMotvfvrhk6V/0f7ZOQTua6PU4fDA8nyG3WgEJVuGH1/jwUNl7N+A8bC5dHLynmMY1f
         C03M7EEnYNohGBryU6P5E+/TmxeuL6AAuEyj4lJAJKMEIV0j2cDdFiRxNc1BD8RpOTV1
         Zocg==
X-Gm-Message-State: AOAM530rZCm4Ob8RT+SZCiPS57Y/AvZ6GyJOY0dBm4IBndJOfyBtupft
	+ARSiJc3M51/b2YsT3d0LgY8Vf/pUek0y+RC
X-Google-Smtp-Source: ABdhPJyzwozSoRLM6UnlmwDaRYqrsMLSmSEFmzkqjSnhct3dfK8g7FuLcHQjes6r6QOP8e8RMuI2RQ==
X-Received: by 2002:a4a:e4c4:: with SMTP id w4mr905491oov.68.1615661478554;
        Sat, 13 Mar 2021 10:51:18 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id d1sm3765385oth.13.2021.03.13.10.51.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:51:18 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/38] meta/recipes-support: Add HOMEPAGE / DESCRIPTION
Date: Sat, 13 Mar 2021 08:49:06 -1000
Message-Id: <41b106617387a642338ab2ef3565ea5d48ce5685.1615661221.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1615661221.git.steve@sakoman.com>
References: <cover.1615661221.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dorinda <dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 325db7fea11315e8dd53274853f33b716247d1bf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/lz4/lz4_1.9.2.bb   | 1 +
 meta/recipes-support/lzop/lzop_1.04.bb  | 1 +
 meta/recipes-support/serf/serf_1.3.9.bb | 1 +
 3 files changed, 3 insertions(+)

diff --git a/meta/recipes-support/lz4/lz4_1.9.2.bb b/meta/recipes-support/lz4/lz4_1.9.2.bb
index 455d2a5141..20719fcc58 100644
--- a/meta/recipes-support/lz4/lz4_1.9.2.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.2.bb
@@ -1,5 +1,6 @@
 SUMMARY = "Extremely Fast Compression algorithm"
 DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing compression speed at 400 MB/s per core, scalable with multi-cores CPU. It also features an extremely fast decoder, with speed in multiple GB/s per core, typically reaching RAM speed limits on multi-core systems."
+HOMEPAGE = "https://github.com/lz4/lz4"
 
 LICENSE = "BSD | BSD-2-Clause | GPL-2.0"
 LIC_FILES_CHKSUM = "file://lib/LICENSE;md5=ebc2ea4814a64de7708f1571904b32cc \
diff --git a/meta/recipes-support/lzop/lzop_1.04.bb b/meta/recipes-support/lzop/lzop_1.04.bb
index b50c230437..59c2003b74 100644
--- a/meta/recipes-support/lzop/lzop_1.04.bb
+++ b/meta/recipes-support/lzop/lzop_1.04.bb
@@ -5,6 +5,7 @@ gzip are much higher compression and decompression speed at the cost of some \n\
 compression ratio. The lzop compression utility was designed with the goals \n\
 of reliability, speed, portability and with reasonable drop-in compatibility \n\
 to gzip."
+HOMEPAGE = "http://www.lzop.org/"
 DEPENDS += "lzo"
 
 LICENSE = "GPLv2+"
diff --git a/meta/recipes-support/serf/serf_1.3.9.bb b/meta/recipes-support/serf/serf_1.3.9.bb
index dc917fa166..3276d40df6 100644
--- a/meta/recipes-support/serf/serf_1.3.9.bb
+++ b/meta/recipes-support/serf/serf_1.3.9.bb
@@ -3,6 +3,7 @@ DESCRIPTION = "The Apache Serf library is a C-based HTTP client library built up
 Portable Runtime (APR) library. It multiplexes connections, running the \
 read/write communication asynchronously. Memory copies and transformations are \
 kept to a minimum to provide high performance operation."
+HOMEPAGE = "http://serf.apache.org/"
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://norpath.patch \
            file://env.patch \
-- 
2.25.1

