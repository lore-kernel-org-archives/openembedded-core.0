Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC19DC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 19:37:05 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.64009.1656877022127742980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=MMDLXA2U;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id r6so2864193pfq.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 12:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vSErLjevhbGZhNCyUuyYeil715qryD24qT1TjLUjQjE=;
        b=MMDLXA2UP6C9iZLKbEanfOFZl8bVC6o/hITFJVBTAS+85x4pG7t4X9uYpWRsU0Kat/
         luc4+8DCBY6V5SI+Cc1MGsecz/c5hh/3HMK5gUH7VcNavaYvpnkfSzj0ZpBcYHAeyy0o
         k4XBrRzrHvHaYOwDPcQbcESWEXx8bQuQVY4Y5o1wd2RWMXnuF/aaZlbNUG4rD7mf/c15
         5e5DzNEasfERbHurxZA6SCQvO2+cTz4jVN/5+bTbyrDcTwHLY6LacWwTf49/SuoruW3m
         z72QSV+LtHNDa/Pqkh2Q6A7NsUmwetC0K37kCycds9DR1qVyTjZ5uz57dU1tNKUjGgOT
         HGyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vSErLjevhbGZhNCyUuyYeil715qryD24qT1TjLUjQjE=;
        b=VIqAdl4xaxUZqnIpIHsUPORXfm2Ejl9h4pPYPArpoYRA7nABwkVW+GYARR9/0qbCmL
         0ezrOybhR3l79Qs4vG53D6SR72y8/dvDClSdoidb1onk6HzJRqL5NDoIWLYW6zz+k4gq
         0oq5IdFIh8QKK+uXcfPUa1xNpz+h/tKcNnYeZURP7wjT5skAX3uv95Dwn0fcuyu5d2Gj
         Fyl/c6SCpTrKWg2XLA381/GUtebh/apIcJhbBjKw04i2jDg7QW8aEPiwQ8bpNW7IdtPU
         tkg0m30BnCsIiA8IPAv9mcuIdWxXsEjW/Y5HtWPPG4giK95V922b5Qf0d0XCyM/R9c0I
         BO+Q==
X-Gm-Message-State: AJIora8zQCBJAQW0QHYAwsRSa5v5Z3mzm28xM+rY6YddZ3tZd1ROvHLQ
	XEnP0hJk+D1aoCsOoRTcPJgC6A4//oVCfqEV
X-Google-Smtp-Source: 
 AGRyM1v9heyRLGsZhHKKjaW9aNoBgcg6ezgJV+99iwpoCFgxmb6spkEyxuD2gLL0R28hOJNyaxvH0A==
X-Received: by 2002:a63:33ce:0:b0:40c:5487:6e6d with SMTP id
 z197-20020a6333ce000000b0040c54876e6dmr22492824pgz.135.1656877020909;
        Sun, 03 Jul 2022 12:37:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 d4-20020a170902654400b00168aed83c63sm19441739pln.237.2022.07.03.12.36.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 12:36:58 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/30] openssl: Upgrade 3.0.3 -> 3.0.4
Date: Sun,  3 Jul 2022 09:35:45 -1000
Message-Id: 
 <e5b48730a9916eeda37c34d6d2b41c903a3dcdeb.1656876825.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656876825.git.steve@sakoman.com>
References: <cover.1656876825.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 19:37:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167570

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Includes a fix for CVE-2022-2068.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f034faebd45e63385849078e6ee4b51257763e99)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...1-Configure-do-not-tweak-mips-cflags.patch | 10 ++--
 ...sysroot-and-debug-prefix-map-from-co.patch | 20 +++----
 ...ea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch | 55 -------------------
 .../openssl/openssl/afalg.patch               | 10 ++--
 .../{openssl_3.0.3.bb => openssl_3.0.4.bb}    |  3 +-
 5 files changed, 21 insertions(+), 77 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.3.bb => openssl_3.0.4.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index 5effa6c6f6..0b7abc3a11 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  Configure | 10 ----------
  1 file changed, 10 deletions(-)
 
-diff --git a/Configure b/Configure
-index 821e680..0387a74 100755
---- a/Configure
-+++ b/Configure
-@@ -1422,16 +1422,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+Index: openssl-3.0.4/Configure
+===================================================================
+--- openssl-3.0.4.orig/Configure
++++ openssl-3.0.4/Configure
+@@ -1423,16 +1423,6 @@ if ($target =~ /^mingw/ && `$config{CC}
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
index 60890c666d..bafdbaa46f 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch
@@ -34,11 +34,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  crypto/build.info                 |  2 +-
  2 files changed, 12 insertions(+), 2 deletions(-)
 
-diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-Makefile.tmpl
-index f88a70f..528cdef 100644
---- a/Configurations/unix-Makefile.tmpl
-+++ b/Configurations/unix-Makefile.tmpl
-@@ -471,13 +471,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lflags} || (),
+Index: openssl-3.0.4/Configurations/unix-Makefile.tmpl
+===================================================================
+--- openssl-3.0.4.orig/Configurations/unix-Makefile.tmpl
++++ openssl-3.0.4/Configurations/unix-Makefile.tmpl
+@@ -472,13 +472,23 @@ BIN_LDFLAGS={- join(' ', $target{bin_lfl
                           '$(CNF_LDFLAGS)', '$(LDFLAGS)') -}
  BIN_EX_LIBS=$(CNF_EX_LIBS) $(EX_LIBS)
  
@@ -63,10 +63,10 @@ index f88a70f..528cdef 100644
  PERLASM_SCHEME= {- $target{perlasm_scheme} -}
  
  # For x86 assembler: Set PROCESSOR to 386 if you want to support
-diff --git a/crypto/build.info b/crypto/build.info
-index efca6cc..eda433e 100644
---- a/crypto/build.info
-+++ b/crypto/build.info
+Index: openssl-3.0.4/crypto/build.info
+===================================================================
+--- openssl-3.0.4.orig/crypto/build.info
++++ openssl-3.0.4/crypto/build.info
 @@ -109,7 +109,7 @@ DEFINE[../libcrypto]=$UPLINKDEF
  
  DEPEND[info.o]=buildinf.h
@@ -74,5 +74,5 @@ index efca6cc..eda433e 100644
 -GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC) $(LIB_CFLAGS) $(CPPFLAGS_Q)" "$(PLATFORM)"
 +GENERATE[buildinf.h]=../util/mkbuildinf.pl "$(CC_Q) $(CFLAGS_Q) $(CPPFLAGS_Q)" "$(PLATFORM)"
  
- GENERATE[uplink-x86.s]=../ms/uplink-x86.pl
+ GENERATE[uplink-x86.S]=../ms/uplink-x86.pl
  GENERATE[uplink-x86_64.s]=../ms/uplink-x86_64.pl
diff --git a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch b/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
deleted file mode 100644
index 0249d4181b..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 770aea88c3888cc5cb3ebc94ffcef706c68bc1d2 Mon Sep 17 00:00:00 2001
-From: Tomas Mraz <tomas@openssl.org>
-Date: Wed, 1 Jun 2022 12:06:33 +0200
-Subject: [PATCH] Update expired SCT issuer certificate
-
-Fixes #15179
-
-Reviewed-by: Matt Caswell <matt@openssl.org>
-Reviewed-by: Dmitry Belyavskiy <beldmit@gmail.com>
-(Merged from https://github.com/openssl/openssl/pull/18444)
-
-Upstream-Status: Backport
-[Fixes ptest failures in OE-Core]
----
- test/certs/embeddedSCTs1_issuer.pem | 30 ++++++++++++++---------------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/test/certs/embeddedSCTs1_issuer.pem b/test/certs/embeddedSCTs1_issuer.pem
-index 1fa449d5a098..6aa9455f09ed 100644
---- a/test/certs/embeddedSCTs1_issuer.pem
-+++ b/test/certs/embeddedSCTs1_issuer.pem
-@@ -1,18 +1,18 @@
- -----BEGIN CERTIFICATE-----
--MIIC0DCCAjmgAwIBAgIBADANBgkqhkiG9w0BAQUFADBVMQswCQYDVQQGEwJHQjEk
-+MIIC0jCCAjugAwIBAgIBADANBgkqhkiG9w0BAQsFADBVMQswCQYDVQQGEwJHQjEk
- MCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENBMQ4wDAYDVQQIEwVX
--YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAeFw0xMjA2MDEwMDAwMDBaFw0yMjA2MDEw
--MDAwMDBaMFUxCzAJBgNVBAYTAkdCMSQwIgYDVQQKExtDZXJ0aWZpY2F0ZSBUcmFu
--c3BhcmVuY3kgQ0ExDjAMBgNVBAgTBVdhbGVzMRAwDgYDVQQHEwdFcncgV2VuMIGf
--MA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDVimhTYhCicRmTbneDIRgcKkATxtB7
--jHbrkVfT0PtLO1FuzsvRyY2RxS90P6tjXVUJnNE6uvMa5UFEJFGnTHgW8iQ8+EjP
--KDHM5nugSlojgZ88ujfmJNnDvbKZuDnd/iYx0ss6hPx7srXFL8/BT/9Ab1zURmnL
--svfP34b7arnRsQIDAQABo4GvMIGsMB0GA1UdDgQWBBRfnYgNyHPmVNT4DdjmsMEk
--tEfDVTB9BgNVHSMEdjB0gBRfnYgNyHPmVNT4DdjmsMEktEfDVaFZpFcwVTELMAkG
--A1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRyYW5zcGFyZW5jeSBDQTEO
--MAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW6CAQAwDAYDVR0TBAUwAwEB
--/zANBgkqhkiG9w0BAQUFAAOBgQAGCMxKbWTyIF4UbASydvkrDvqUpdryOvw4BmBt
--OZDQoeojPUApV2lGOwRmYef6HReZFSCa6i4Kd1F2QRIn18ADB8dHDmFYT9czQiRy
--f1HWkLxHqd81TbD26yWVXeGJPE3VICskovPkQNJ0tU4b03YmnKliibduyqQQkOFP
--OwqULg==
-+YWxlczEQMA4GA1UEBxMHRXJ3IFdlbjAgFw0yMjA2MDExMDM4MDJaGA8yMTIyMDUw
-+ODEwMzgwMlowVTELMAkGA1UEBhMCR0IxJDAiBgNVBAoTG0NlcnRpZmljYXRlIFRy
-+YW5zcGFyZW5jeSBDQTEOMAwGA1UECBMFV2FsZXMxEDAOBgNVBAcTB0VydyBXZW4w
-+gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBANWKaFNiEKJxGZNud4MhGBwqQBPG
-+0HuMduuRV9PQ+0s7UW7Oy9HJjZHFL3Q/q2NdVQmc0Tq68xrlQUQkUadMeBbyJDz4
-+SM8oMczme6BKWiOBnzy6N+Yk2cO9spm4Od3+JjHSyzqE/HuytcUvz8FP/0BvXNRG
-+acuy98/fhvtqudGxAgMBAAGjga8wgawwHQYDVR0OBBYEFF+diA3Ic+ZU1PgN2Oaw
-+wSS0R8NVMH0GA1UdIwR2MHSAFF+diA3Ic+ZU1PgN2OawwSS0R8NVoVmkVzBVMQsw
-+CQYDVQQGEwJHQjEkMCIGA1UEChMbQ2VydGlmaWNhdGUgVHJhbnNwYXJlbmN5IENB
-+MQ4wDAYDVQQIEwVXYWxlczEQMA4GA1UEBxMHRXJ3IFdlboIBADAMBgNVHRMEBTAD
-+AQH/MA0GCSqGSIb3DQEBCwUAA4GBAD0aYh9OkFYfXV7kBfhrtD0PJG2U47OV/1qq
-++uFpqB0S1WO06eJT0pzYf1ebUcxjBkajbJZm/FHT85VthZ1lFHsky87aFD8XlJCo
-+2IOhKOkvvWKPUdFLoO/ZVXqEVKkcsS1eXK1glFvb07eJZya3JVG0KdMhV2YoDg6c
-+Doud4XrO
- -----END CERTIFICATE-----
diff --git a/meta/recipes-connectivity/openssl/openssl/afalg.patch b/meta/recipes-connectivity/openssl/openssl/afalg.patch
index b7c0e9697f..cf77e873a2 100644
--- a/meta/recipes-connectivity/openssl/openssl/afalg.patch
+++ b/meta/recipes-connectivity/openssl/openssl/afalg.patch
@@ -3,11 +3,11 @@ Don't refuse to build afalgeng if cross-compiling or the host kernel is too old.
 Upstream-Status: Submitted [hhttps://github.com/openssl/openssl/pull/7688]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-diff --git a/Configure b/Configure
-index 3baa8ce..9ef52ed 100755
---- a/Configure
-+++ b/Configure
-@@ -1550,20 +1550,7 @@ unless ($disabled{"crypto-mdebug-backtrace"})
+Index: openssl-3.0.4/Configure
+===================================================================
+--- openssl-3.0.4.orig/Configure
++++ openssl-3.0.4/Configure
+@@ -1681,20 +1681,7 @@ $config{CFLAGS} = [ map { $_ eq '--ossl-
  unless ($disabled{afalgeng}) {
      $config{afalgeng}="";
      if (grep { $_ eq 'afalgeng' } @{$target{enable}}) {
diff --git a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb b/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.0.3.bb
rename to meta/recipes-connectivity/openssl/openssl_3.0.4.bb
index 35a62755ad..d9d17378d4 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.0.3.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.0.4.bb
@@ -12,14 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://afalg.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
-           file://770aea88c3888cc5cb3ebc94ffcef706c68bc1d2.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "ee0078adcef1de5f003c62c80cc96527721609c6f3bb42b7795df31f8b558c0b"
+SRC_URI[sha256sum] = "2831843e9a668a0ab478e7020ad63d2d65e51f72977472dc73efcefbafc0c00f"
 
 inherit lib_package multilib_header multilib_script ptest perlnative
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
-- 
2.25.1


