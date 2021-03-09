Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.7372.1615289788244210418
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 03:36:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TbvZ+7+0;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: dorindabassey@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so5725331wml.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 03:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=npBF4XMolx7zyLi3bYXSqLbnZbFDCVVGtfXrfGoXE9s=;
        b=TbvZ+7+0wW0BOOK+9VcMUeGeWBBzW+1F2EXX2xKK/gWdMSnv90UDFjwVw81TqwNZbu
         uEEAJP44LhLcW12iGeP76R9S5QeqMibH0uz1/0f5ahfvE3zi26pSdzA52zuVc1Zo+kY2
         YKeuUMSfJScE+4HrBLMaCT202XyPEzvNbofo6fAesD95OfZfp9dRD7rCIW2usQDqvIC7
         r6YNZSUkJJYOg88HUh4IdjVE+M/Xfsoh7tALgk1LcGODaDeqQdv/1m+KjjRnNjNmh2an
         iXNJI8KdAlJLhJC6cxNEPSBtiWDDfBP7ZRkOyJ+D3eCFjZu45031kqmr80py5+GZ+s/f
         CqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=npBF4XMolx7zyLi3bYXSqLbnZbFDCVVGtfXrfGoXE9s=;
        b=bSYrl0QYnr9M/G4RrsuZ1XoATBcZT2IHQnKoGZ8sEwt2qnCbcpkJEGN4Cdxu0Jh7MQ
         GvTryV1LryM3DMYhxC8FZ03DMJCOdEG89xB+RYkdQr7FkXijDnr8yzcD8FhM1PfdTAjS
         UbyCzPqiwcG+Vfnfj500OMhIPTvBYEIbnhep9YO8fuk/Y+twSaHie4dEtmaGgBIN8/4h
         tcGqEiUnOZrEPW/gqnhrnh1n2bAL0VcGc8mwYovf5AIn1GTa/kxL3QBV/5vc/EUI2ChY
         WO1bihgxdh3srnvFiq3l5bsAYG0KPyKn4oj62WRs4tJfns2q9H41WiulHUEAdM9Sx5X8
         LZuA==
X-Gm-Message-State: AOAM5329XptCAj1ihNk21+e6oYJicWU1fmJqSL/LzQPYMXbHTQ6S5Oyk
	IiuM8VYDdnMmVMyKwGTa4AagSs9C7nlCIw==
X-Google-Smtp-Source: ABdhPJxts1VxjhWGLnmtiUblj18E95zMuH30CRutyJzHdNHM3khwx9gz9nf7Hg7V3HJgwep8cEwQ1w==
X-Received: by 2002:a1c:21c3:: with SMTP id h186mr3454591wmh.32.1615289786509;
        Tue, 09 Mar 2021 03:36:26 -0800 (PST)
Return-Path: <dorindabassey@gmail.com>
Received: from smtp.gmail.com. ([105.112.33.166])
        by smtp.gmail.com with ESMTPSA id x11sm3804289wme.9.2021.03.09.03.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 03:36:26 -0800 (PST)
From: "Dorinda" <dorindabassey@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: dorindabassey <dorindabassey@gmail.com>
Subject: [PATCH 2/5] meta/recipes-support: Add HOMEPAGE / DESCRIPTION
Date: Tue,  9 Mar 2021 12:35:48 +0100
Message-Id: <20210309113551.13691-2-dorindabassey@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210309113551.13691-1-dorindabassey@gmail.com>
References: <20210309113551.13691-1-dorindabassey@gmail.com>

Added missing HOMEPAGE and DESCRIPTION found using the test command
`oe-selftest -r distrodata.Distrodata.test_missing_homepg`

[YOCTO #13471]

Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
---
 meta/recipes-support/boost/boost-build-native_4.3.0.bb | 2 ++
 meta/recipes-support/lz4/lz4_1.9.3.bb                  | 1 +
 meta/recipes-support/lzop/lzop_1.04.bb                 | 1 +
 meta/recipes-support/serf/serf_1.3.9.bb                | 1 +
 4 files changed, 5 insertions(+)

diff --git a/meta/recipes-support/boost/boost-build-native_4.3.0.bb b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
index 258f8c9cdf..19e991e65f 100644
--- a/meta/recipes-support/boost/boost-build-native_4.3.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_4.3.0.bb
@@ -1,4 +1,6 @@
 SUMMARY = "Boost.Build"
+DESCRIPTION = "B2 makes it easy to build C++ projects, everywhere."
+HOMEPAGE = "https://github.com/boostorg/build"
 SECTION = "devel"
 
 LICENSE = "BSL-1.0"
diff --git a/meta/recipes-support/lz4/lz4_1.9.3.bb b/meta/recipes-support/lz4/lz4_1.9.3.bb
index 00f2dd32fe..effc530b94 100644
--- a/meta/recipes-support/lz4/lz4_1.9.3.bb
+++ b/meta/recipes-support/lz4/lz4_1.9.3.bb
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
2.17.1

