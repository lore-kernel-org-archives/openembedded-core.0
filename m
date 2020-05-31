Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.17529.1590940459406381039
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 08:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lC5AwmMx;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id f7so6868420ejq.6
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 08:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xmzvzmHggtNUfejOBnqZRjFqzFMADxP9FNVBIum+0YQ=;
        b=lC5AwmMxR5N5k0ZRjifg/q53KETGhr6s5zqdNedX5+gfpkArZJ85WxOHtcu7sYeKN5
         G/kKah7sOr4KY/xUCZM6Y0oXmGy+OT4q9UL0zylBDrwEvKDWGJHWyp8GA/m/a+p0bWTx
         TkNl1qXS1SMkhjofpRKY7WVDxhOzkAh2jE5k8n/V2hwcyTz4hSMqdzQ5Dn0XwHsWYD7V
         o6TeoLshDA5+dLRkNLp+MEtfhc80iA6D7ldghF6h2p/tm9F0O0l6jMla29QXCPTcX7tb
         dDhZwaG0e4HjKW6D/OVq9+gwqeZqLnPIe0caeOHcyXyzuxBcrXj8STPHFn89rZZfNUEZ
         J9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmzvzmHggtNUfejOBnqZRjFqzFMADxP9FNVBIum+0YQ=;
        b=qYLFQgW6/blOa9eczubUOmHiNPSjp+pfhT0o5tI1kp11/XTT2tIbRxqtuRfuLZ7PP1
         qdwJv8qWWW6X2qiJEjEMsIKCufmx5/bzTGIECxprul/2B/NzPkxiTHHBDnxg/bdfZph4
         8cWhqU5zBM4wzCbnzPMlVgPPt2lB5umZMmfFxTmkMxTIMJTvAvzuKw2Tp/OAiUog8VF5
         7jB3YfM/Ms6MjZ0s1vz77ggoPItoYUMQkOk7fOmuSQM+3e5f0lZUUKPKROh298H6q5Fi
         yEH++hrqLNC+CKhyDgLz8sxE24vXJJKbhHsFIR9EsXyPzds9SZENtl7pkoCUgedVhw+k
         7D9w==
X-Gm-Message-State: AOAM530PCGthILL8kX5pgArbZTpweMUiy6XldOTys/om64tM1hb2bswP
	ojkEXxwrc4zStxY5+mBaUcob6+7g
X-Google-Smtp-Source: ABdhPJzz/24DDG+hRsa7QyZoll0kHx0kayzY/bTz0xYPF7A0/jxXSzFsPzWGmR+7J8Hnl3VTACWMbw==
X-Received: by 2002:a17:906:e08a:: with SMTP id gh10mr16736866ejb.512.1590940457663;
        Sun, 31 May 2020 08:54:17 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
        by smtp.gmail.com with ESMTPSA id dn15sm13227042ejc.26.2020.05.31.08.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2020 08:54:17 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 57/70] json-c: update 0.13.1 - > 0.14
Date: Sun, 31 May 2020 17:52:41 +0200
Message-Id: <20200531155254.10283-57-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200531155254.10283-1-alex.kanavin@gmail.com>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...d-disable-werror-option-to-configure.patch | 45 -------------------
 .../{json-c_0.13.1.bb => json-c_0.14.bb}      | 11 ++---
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
 rename meta/recipes-devtools/json-c/{json-c_0.13.1.bb => json-c_0.14.bb} (67%)

diff --git a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch b/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
deleted file mode 100644
index 0c20c8458a..0000000000
--- a/meta/recipes-devtools/json-c/json-c/add-disable-werror-option-to-configure.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-json-c: Backport --disable-werror patch to allow compilation under icecc
-
-icecc preprocesses source files locally before shipping them off to be compiled
-on remote hosts. This preprocessing removes comments, including /* fallthough */
-comments in switch statements that normally prevent an implicit-fallthrough
-warning, see https://github.com/icecc/icecream/issues/419
-
-Rather than turning off -Werror, the upstream project has implemented a
-configure option, --disable-werror, in response to Ross's
-https://github.com/json-c/json-c/issues/489
-
-This patch from
-https://github.com/json-c/json-c/commit/21c886534f8927fdc0fb5f8647394f3e0e0874b8
-
-Upstream-Status: Backport [Not yet released]
-Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
-
-From 21c886534f8927fdc0fb5f8647394f3e0e0874b8 Mon Sep 17 00:00:00 2001
-From: Pierce Lopez <pierce.lopez@gmail.com>
-Date: Sun, 9 Jun 2019 10:52:08 -0400
-Subject: [PATCH] build: add --disable-werror option to configure
-
-to omit -Werror compiler option
----
- configure.ac | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 272ea6af9c..798fd5b747 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -165,7 +165,12 @@ AS_IF([test "x$enable_Bsymbolic" = "xcheck"],
- AS_IF([test "x$enable_Bsymbolic" = "xyes"], [JSON_BSYMBOLIC_LDFLAGS=-Wl[,]-Bsymbolic-functions])
- AC_SUBST(JSON_BSYMBOLIC_LDFLAGS)
- 
--AX_APPEND_COMPILE_FLAGS([-Wall -Werror -Wcast-qual -Wno-error=deprecated-declarations])
-+AC_ARG_ENABLE([werror],
-+    AS_HELP_STRING([--disable-werror], [avoid treating compiler warnings as fatal errors]))
-+
-+AS_IF([test "x$enable_werror" != "xno"], [AX_APPEND_COMPILE_FLAGS([-Werror])])
-+
-+AX_APPEND_COMPILE_FLAGS([-Wall -Wcast-qual -Wno-error=deprecated-declarations])
- AX_APPEND_COMPILE_FLAGS([-Wextra -Wwrite-string -Wno-unused-parameter])
- AX_APPEND_COMPILE_FLAGS([-D_GNU_SOURCE])
- 
diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.14.bb
similarity index 67%
rename from meta/recipes-devtools/json-c/json-c_0.13.1.bb
rename to meta/recipes-devtools/json-c/json-c_0.14.bb
index 522879f21f..99fde873b1 100644
--- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
+++ b/meta/recipes-devtools/json-c/json-c_0.14.bb
@@ -4,19 +4,14 @@ HOMEPAGE = "https://github.com/json-c/json-c/wiki"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
 
-SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
-           file://add-disable-werror-option-to-configure.patch \
-           "
-SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
-SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
+SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
+SRC_URI[sha256sum] = "b377de08c9b23ca3b37d9a9828107dff1de5ce208ff4ebb35005a794f30c6870"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+)-\d+"
 
 RPROVIDES_${PN} = "libjson"
 
-inherit autotools
-
-EXTRA_OECONF = "--disable-werror"
+inherit cmake
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.26.2

