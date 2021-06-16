Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web11.7953.1623852319750203809
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jun 2021 07:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ddpog1Oi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id 5-20020a9d01050000b02903c700c45721so2570655otu.6
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jun 2021 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3Nxr9PZT16x2idofjfXXJ9EXp8wPwlUHs2Iji2xDN/s=;
        b=ddpog1OiUILl6JBr4rsl0Nrr+bWgXb6eCLq0XI0uGLmO2Svqj2DKrveXuKjLlCY9zr
         yT6DmTJbchZExsvmoR3T9SehOIf8xpHIH5nwLRdqD2QMuzXbH6wX3HKAqJoMKTQ2clGb
         FqjVS1TxoZzJPFx9HgksYrOSp3HKGndiYoApYLJVUed/VCoMpDlYAeX3QDtHR2dBdbR0
         ArM+a3uW4tWQNIXdq4ooN047oqEKNh+9/yLMAPm2LwdXl4WUlnHMdsdpuRCe3nStrVrU
         v/GvBQaFxakOPPCqCA2VAxf6CDwz0LggCd18OTTIymo3LIQYlAcVotlGzyhq3ul4hNJG
         KrBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Nxr9PZT16x2idofjfXXJ9EXp8wPwlUHs2Iji2xDN/s=;
        b=HFGOnM22o76jX63kH31sDHpWJ7uglh9kGc5AN7r0QbjBsAFtS4KxLe9uuBl6jDXx1M
         +Lq6+DW1wfu65QnSmDaJiB6pwFkOjzUBUFt7bKlewmXnq7XGk0hDw7pR+Ni4uxAUhagz
         Lyrjp8zNPqEXrMSc0njq9uqAr1oXxEqQ/ZbHmY/itXzqYyKEC/SbJbybFnoM/5bKYfq4
         DVp5t4ruZ0XxgduS9j9s2YXorRu979MaPb/t1cmBFK6NZ1WGSdAm1KuL6/FtkGSHGB6L
         GukJClrcldHkiDImXdLgcvd6osRlfJ9GB4rVMBHvUOGUMjSIz890gUK1YOfBhswDyR79
         P1+Q==
X-Gm-Message-State: AOAM530AFXkHSzryNgN7D4cRFEFN63NpSrw6t/LfE1Lt5bARNpoO76zL
	7HL4PwZeJoJXQ0dffVQ9Zmx67l0oVIkUAxObj40=
X-Google-Smtp-Source: ABdhPJy+MOO7I5hZrYVlveXvhx4UCe4qClFy16yrPL2aNG8p4z/ojywsBQfIfZwPPRhS3xiaoiB/Rg==
X-Received: by 2002:a9d:7414:: with SMTP id n20mr63465otk.194.1623852318487;
        Wed, 16 Jun 2021 07:05:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm434637oif.44.2021.06.16.07.05.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:05:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/6] bind: 9.11.22 -> 9.11.32
Date: Wed, 16 Jun 2021 04:04:25 -1000
Message-Id: <d7e56f1910b7963d8b704107903ecf40e9472d3c.1623852080.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623852080.git.steve@sakoman.com>
References: <cover.1623852080.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fixes for
CVE-2021-25214
CVE-2021-25215
CVE-2021-25216

CVE-2020-8625 fixed in 9.11.28, so drop that patch

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>

tmp

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../bind/bind/CVE-2020-8625.patch               | 17 -----------------
 .../bind/{bind_9.11.22.bb => bind_9.11.32.bb}   |  5 ++---
 2 files changed, 2 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
 rename meta/recipes-connectivity/bind/{bind_9.11.22.bb => bind_9.11.32.bb} (96%)

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
deleted file mode 100644
index 9078f2448e..0000000000
--- a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Backporting [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
-CVE: CVE-2020-8625
-Signed-off-by: Minjae Kim <flowergom@gmail.com>
-
-diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
-index e61d1c600f2..753dc8049fa 100644
---- a/lib/dns/spnego.c
-+++ b/lib/dns/spnego.c
-@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
- 		return (ASN1_OVERRUN);
- 	}
- 
--	data->components = malloc(len * sizeof(*data->components));
-+	data->components = malloc((len + 1) * sizeof(*data->components));
- 	if (data->components == NULL) {
- 		return (ENOMEM);
- 	}
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.32.bb
similarity index 96%
rename from meta/recipes-connectivity/bind/bind_9.11.22.bb
rename to meta/recipes-connectivity/bind/bind_9.11.32.bb
index 5598ba976d..9feebe5ae2 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.32.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "BIND 9 provides a full-featured Domain Name Server system"
 SECTION = "console/network"
 
 LICENSE = "ISC & BSD"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bf39058a7f64b2a934ce14dc9ec1dd45"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=b88e7ca5f21908e1b2720169f6807cf6"
 
 DEPENDS = "openssl libcap zlib"
 
@@ -19,10 +19,9 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
-           file://CVE-2020-8625.patch \
            "
 
-SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
+SRC_URI[sha256sum] = "cbf8cb4b74dd1452d97c3a2a8c625ea346df8516b4b3508ef07443121a591342"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by 4
-- 
2.25.1

