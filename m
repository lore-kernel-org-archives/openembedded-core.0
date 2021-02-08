Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.35328.1612792395973086447
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 05:53:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ox3z4QtB;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id g84so1843004oib.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 05:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=dHKcVutkAYwIH/+vjCXFCsCRsfAHESo5NjV52MAgzRg=;
        b=ox3z4QtBlKGiIRDKQNfvc7T6+FhiqYimv/jIbgPKxQeNbLPJdotuGggx5r3Ak/sVba
         UmmfLlum7CkEiTC61SGR2a+iMe/2WlNPn8H92Po/+bl72tAWpcc9s8hWBE1DtrWtZirD
         d+FQXs+lI5BjjeMAscdmkt9sloBTBfS3p70GP/IA7J4b/t7eFyykasDw+iwTLS0CjoL0
         9dt8l193OegOediVazW/msN0lxOLKS6jxB4NkpnzYXJHX7+o8mNOMW6NRrbQ8t5/YtID
         fT0zPdIqXwP1R/7VOlW4f9g72xAPm1Cohy6C28jX9+ACCDDooMtMFdCWCZUVgpmkCbly
         BPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dHKcVutkAYwIH/+vjCXFCsCRsfAHESo5NjV52MAgzRg=;
        b=pEybsJb8DafOq85Fq12tCnVCQIsZdoM6leW/5Gc/AbEqg84wcv4ZcZ63j5T6dbuhTu
         IA8/vc5ByYv5nL5kbU+sUUYSyM8o7ZtSweiQPREWejI7gM1rqAz8m3FSFd/qLPFaLUp5
         /MjH5RvCuEFzcwvjOhgHxyublk6KSeoq+EPh7dqba8Nuuh0wZ5Abh5i1bc9GZWgsINPu
         RK4e6nt6w+L4oyMkP82QVa2B2srptPICaX59QxFm5GDv23y8p1km4zdTxpj3OdfKic/h
         XCCFCBaTFfndDk3U1A7xT0u4LwBGGi+yfa3Uq8vr+WEPhaCUOAz77BKHn8hHQadr1GOk
         zXjQ==
X-Gm-Message-State: AOAM531SykHKFr2yTUBUAlFlAbjIGWNtUzqctvHNZ1WXncCxDYEsaNxk
	Aar1MpKT2FizruBBE8zwhlcVi0O3ydIiPZS7kC4=
X-Google-Smtp-Source: ABdhPJydkogsbQE8gEMx4pMgU8hwz8PeX5KegYdlne4oqLrqt5VMSvMad1Aft3NUEdLt8q9o0W9EZQ==
X-Received: by 2002:a05:6808:c:: with SMTP id u12mr10820257oic.163.1612792394824;
        Mon, 08 Feb 2021 05:53:14 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id g8sm2023833ooe.21.2021.02.08.05.53.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 05:53:14 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/28] ca-certificates: upgrade 20200601 -> 20210119
Date: Mon,  8 Feb 2021 03:51:57 -1000
Message-Id: <2a558ee61a2452a209d39cd1528a309c549c0f4e.1612792088.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1612792088.git.steve@sakoman.com>
References: <cover.1612792088.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

0001-certdata2pem.py-use-python3.patch
removed since it is included in 20210119

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit afd86357e07f69090eaff4c5db2c517867dd4ccf)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../0001-certdata2pem.py-use-python3.patch    | 37 -------------------
 ...0200601.bb => ca-certificates_20210119.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
 rename meta/recipes-support/ca-certificates/{ca-certificates_20200601.bb => ca-certificates_20210119.bb} (96%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch b/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
deleted file mode 100644
index aa2c85ff43..0000000000
--- a/meta/recipes-support/ca-certificates/ca-certificates/0001-certdata2pem.py-use-python3.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From b6d18ca77f131cdcaa10d0eaa9d303399767edf6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Aug 2019 19:18:14 +0200
-Subject: [PATCH] certdata2pem.py: use python3
-
-Comments in that file imply it is already py3 compatible.
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- mozilla/Makefile        | 2 +-
- mozilla/certdata2pem.py | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/mozilla/Makefile b/mozilla/Makefile
-index 6f46118..f98877c 100644
---- a/mozilla/Makefile
-+++ b/mozilla/Makefile
-@@ -3,7 +3,7 @@
- #
- 
- all:
--	python certdata2pem.py
-+	python3 certdata2pem.py
- 
- clean:
- 	-rm -f *.crt
-diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
-index 0b02b2a..7d796f1 100644
---- a/mozilla/certdata2pem.py
-+++ b/mozilla/certdata2pem.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- # vim:set et sw=4:
- #
- # certdata2pem.py - splits certdata.txt into multiple files
diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
similarity index 96%
rename from meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
index 6f39df7985..888a235c1a 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20200601.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
@@ -14,7 +14,7 @@ DEPENDS_class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRCREV = "b3a8980b781bc9a370e42714a605cd4191bb6c0b"
+SRCREV = "181be7ebd169b4a6fb5d90c3e6dc791e90534144"
 
 SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://0002-update-ca-certificates-use-SYSROOT.patch \
@@ -23,7 +23,6 @@ SRC_URI = "git://salsa.debian.org/debian/ca-certificates.git;protocol=https \
            file://default-sysroot.patch \
            file://sbindir.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \
-           file://0001-certdata2pem.py-use-python3.patch \
            "
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+)"
 
-- 
2.25.1

