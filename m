Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C2BC433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.8743.1637163340752389501
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=An61ogGy;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso5132670wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rNBV2cOOLEIc3BqzAlHPcErN3EwU/vSrGi2yr3V5Pf0=;
        b=An61ogGyaZ1ZStXIW0SrAx65vVtnWu8EejLqCDD1AhELYRx/txlkeY53u3TJo8hGbI
         ir41rD/y31HaeS5mmSPSmsI81G0EacBsFtijCZfss30so7j1WcT+pRxpbQYiftuNkWxd
         lDTfPBHJs7IR2tf2RfK0CDlg9V/x4tFGKhfqOWi5QYjseIr3BACLiNxFOEZmDpukoRui
         gZ1968hW9TuYGU2BmipxqFhswLbPqMoXmtUohLwxBHtyMSj+ifU24pD3z5pVp+558E06
         zsfs8A7By8prBtvdGcfHQgDr1GrL3JyKZ5aGvSbdG323AvYQdcMS7n4X9vkyZVoK6Ih4
         rKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rNBV2cOOLEIc3BqzAlHPcErN3EwU/vSrGi2yr3V5Pf0=;
        b=Oub80ya2Gg+K4VCBj4fGHm6R2QogX2MJbTEmjknin8s7K0Rsf6Q7Vhxjgo7pWmQATZ
         NXqp3C+rnUv2bZMLP7mMMzG/O14Emb//Swcax6WsYsvmPUpNHrI+FX10OwE2dddgISMb
         0IdiLRZ/cnVDS8HeTrTfeopNhG7ahD5jr5KMLiHHU3tIOmaB/0BUBdx9UmhT1NYlxtPX
         SoqhhL3zlw5w5i64SZwocAIJCaGYrU8GhGOlx7wIF+9JNlLmg6nvFBxDUPYL7CMyMUy+
         PgaskE5/4UlCyp6V4KcDCqdYWGRRUp3F/Cp9IF9Sqic02vdRtqnQ6d79IxI13TqdQkGJ
         yJFw==
X-Gm-Message-State: AOAM532hKJvai049ysWVaj6h9dPcq0NY2F5PKCaF5ezVhVdg/7F/NvmA
	tLRCxnbQkUHaqAlDTfKcDP/hAd6jWNs=
X-Google-Smtp-Source: 
 ABdhPJwuWbMpOsUCyYF4ACKJv+WCSqRNbaCViDQ/duD53hjzxdw8C+vy0kfd5K5xdsuTEbEV5nOuXQ==
X-Received: by 2002:a1c:4681:: with SMTP id t123mr604194wma.83.1637163339270;
        Wed, 17 Nov 2021 07:35:39 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:38 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
	Roy Li <rongqing.li@windriver.com>
Subject: [PATCH 19/36] curl: update 7.79.1 -> 7.80.0
Date: Wed, 17 Nov 2021 16:35:08 +0100
Message-Id: <20211117153525.257146-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158414

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-replace-krb5-config-with-pkg-config.patch | 44 -------------------
 .../curl/{curl_7.79.1.bb => curl_7.80.0.bb}   |  6 +--
 2 files changed, 2 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
 rename meta/recipes-support/curl/{curl_7.79.1.bb => curl_7.80.0.bb} (94%)

diff --git a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch b/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
deleted file mode 100644
index 330c6b67c3..0000000000
--- a/meta/recipes-support/curl/curl/0001-replace-krb5-config-with-pkg-config.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From ed70f0623708b8a6c1f58a5d243d87c5ff45b24d Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Tue, 26 Apr 2016 13:13:01 +0800
-Subject: [PATCH] replace krb5-config with pkg-config
-
-Upstream-Status: Accepted [https://github.com/curl/curl/pull/7916]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
-
----
- configure.ac | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 5569a26..56b0380 100755
---- a/configure.ac
-+++ b/configure.ac
-@@ -1290,7 +1290,7 @@ AC_ARG_WITH(gssapi,
-   fi
- ])
- 
--: ${KRB5CONFIG:="$GSSAPI_ROOT/bin/krb5-config"}
-+KRB5CONFIG=`which pkg-config`
- 
- save_CPPFLAGS="$CPPFLAGS"
- AC_MSG_CHECKING([if GSS-API support is requested])
-@@ -1301,7 +1301,7 @@ if test x"$want_gss" = xyes; then
-      if test -n "$host_alias" -a -f "$GSSAPI_ROOT/bin/$host_alias-krb5-config"; then
-         GSSAPI_INCS=`$GSSAPI_ROOT/bin/$host_alias-krb5-config --cflags gssapi`
-      elif test -f "$KRB5CONFIG"; then
--        GSSAPI_INCS=`$KRB5CONFIG --cflags gssapi`
-+        GSSAPI_INCS=`$KRB5CONFIG --cflags mit-krb5-gssapi`
-      elif test "$GSSAPI_ROOT" != "yes"; then
-         GSSAPI_INCS="-I$GSSAPI_ROOT/include"
-      fi
-@@ -1394,7 +1394,7 @@ if test x"$want_gss" = xyes; then
-         elif test -f "$KRB5CONFIG"; then
-            dnl krb5-config doesn't have --libs-only-L or similar, put everything
-            dnl into LIBS
--           gss_libs=`$KRB5CONFIG --libs gssapi`
-+           gss_libs=`$KRB5CONFIG --libs mit-krb5-gssapi`
-            LIBS="$gss_libs $LIBS"
-         else
-            case $host in
diff --git a/meta/recipes-support/curl/curl_7.79.1.bb b/meta/recipes-support/curl/curl_7.80.0.bb
similarity index 94%
rename from meta/recipes-support/curl/curl_7.79.1.bb
rename to meta/recipes-support/curl/curl_7.80.0.bb
index 919777ce36..7b47091933 100644
--- a/meta/recipes-support/curl/curl_7.79.1.bb
+++ b/meta/recipes-support/curl/curl_7.80.0.bb
@@ -9,11 +9,9 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=425f6fdc767cc067518eef9bbdf4ab7b"
 
-SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
-           file://0001-replace-krb5-config-with-pkg-config.patch \
-           "
+SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "de62c4ab9a9316393962e8b94777a570bb9f71feb580fb4475e412f2f9387851"
+SRC_URI[sha256sum] = "dd0d150e49cd950aff35e16b628edf04927f0289df42883750cf952bb858189c"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.20.1


