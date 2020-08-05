Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.8881.1596639025584494447
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 07:50:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=e+boCh9N;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id s15so13010963pgc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2020 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fG9u6nk5VaUNvW79ho/D5N5ByH1xmrLWBXpLnTDslcA=;
        b=e+boCh9Nn1ROoUcQ5bLBbAKk5kZXmtqnJVgRu199GATjG5t0aDoZuuHP8dQdCNZq8V
         mxs9uFDVKXZywlafFHfQEsQ0uBPXDeuUMBoMwWHzTDS2uqzFXOwGXHTjG+4JkfVJONQq
         awa8UYA3bT+HCE4C8A25zJ3VxfgXcFBpCGn9TlDxbg4Scrw/Gbk3N7mmI5Nlue915P5e
         9cYN+oFXVbElF77F7eubRcZ7/w69+et2yQLRGw3vdjnmrtyHsh5twu3ptdiDSeHc/8Cg
         y86V7QdnKgAg4qxUAIFkhqJ46kJfMFSL7+3OQc8wF3lgFEEAzfrYajttOo+Bu+oTphDx
         hTAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fG9u6nk5VaUNvW79ho/D5N5ByH1xmrLWBXpLnTDslcA=;
        b=JAN9Yi08BwGOYw55dErU3Xk4IDGt6TREKSy8bLhZ9bqdYO9xucR4QgN3008MmV12pE
         Rptw8HnE40YwD8IK/H5k/XBkPgLmQNpZsTlsawnPvBafj9U0XdY6bBPJC3rcwUugAxBc
         K4izDRhbQVY5bodNc3ZGSoEPDQleTiWSxtHYMWi0GlxamljrlnPIurvpMmygXteLuqOk
         DTVshkVVJ7imZ7yWrWbEb5yuanzY2Fifilbe+dOvx6SVPLSv15kfIjdvFtL50hnNwN6h
         FN/uka9ZTZLhfMnXGPVvhdWpwqDuVdgpUMc7Baf49+GH3HRAbiKOLriPz5j55CqT9ucw
         lZ4Q==
X-Gm-Message-State: AOAM530Bf39aCP4VVAX/hwyg3cFfwBPnRueA9RkUtuXcejD+DvMO8zHA
	CBTHF0IbmyGQLNCPrpJHg/+d5SMr2mM=
X-Google-Smtp-Source: ABdhPJxeg4O6o0HT1KrepCQVk6OZkK/ngJK6fTS4M/1D2nFBwcw86O8I3GHU4vLUlRzrZXY2wSzakw==
X-Received: by 2002:a63:1901:: with SMTP id z1mr1628267pgl.97.1596639024497;
        Wed, 05 Aug 2020 07:50:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id d81sm3879721pfd.174.2020.08.05.07.50.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 07:50:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell v2 09/11] gnutls: Fix krb5 code license to GPLv2.1+ to match the LICENSE file.
Date: Wed,  5 Aug 2020 04:49:32 -1000
Message-Id: <284a8cb6c51517d07f5f21b224ffb57333f1fc27.1596638643.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596638643.git.steve@sakoman.com>
References: <cover.1596638643.git.steve@sakoman.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

This was discussed and accepted upstream by the project so their license is consistent.
Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018
and https://gitlab.com/gnutls/gnutls/-/merge_requests/1285.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 267d07301c79c24969c169add05284f612c41d77)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...se-to-GPLv2.1-to-keep-with-LICENSE-f.patch | 90 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.6.14.bb  |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
new file mode 100644
index 0000000000..a610abf9b5
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch
@@ -0,0 +1,90 @@
+From c0ae3f659c6c130d151378ba4d7d861e3b7b970f Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Wed, 8 Jul 2020 14:50:27 +0900
+Subject: [PATCH] Modied the license to GPLv2.1+ to keep with LICENSE file.
+
+Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
+Please reference to https://gitlab.com/gnutls/gnutls/-/issues/1018.
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/merge_requests/1285].
+---
+ lib/x509/krb5.c | 20 +++++++++++---------
+ lib/x509/krb5.h | 20 +++++++++++---------
+ 2 files changed, 22 insertions(+), 18 deletions(-)
+
+diff --git a/lib/x509/krb5.c b/lib/x509/krb5.c
+index 7fe84e6..d68c737 100644
+--- a/lib/x509/krb5.c
++++ b/lib/x509/krb5.c
+@@ -1,21 +1,23 @@
+ /*
+  * Copyright (C) 2015 Red Hat, Inc.
+  *
++ * Author: Nikos Mavrogiannopoulos
++ *
+  * This file is part of GnuTLS.
+  *
+- * GnuTLS is free software: you can redistribute it and/or modify it
+- * under the terms of the GNU General Public License as published by
+- * the Free Software Foundation, either version 3 of the License, or
+- * (at your option) any later version.
++ * The GnuTLS is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public License
++ * as published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
+  *
+- * GnuTLS is distributed in the hope that it will be useful, but
++ * This library is distributed in the hope that it will be useful, but
+  * WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * General Public License for more details.
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
+  *
+- * You should have received a copy of the GNU General Public License
+- * along with this program.  If not, see
+- * <https://www.gnu.org/licenses/>.
+  */
+ 
+ #include <config.h>
+diff --git a/lib/x509/krb5.h b/lib/x509/krb5.h
+index d8926af..815bb28 100644
+--- a/lib/x509/krb5.h
++++ b/lib/x509/krb5.h
+@@ -1,21 +1,23 @@
+ /*
+  * Copyright (C) 2015 Red Hat, Inc.
+  *
++ * Author: Nikos Mavrogiannopoulos
++ *
+  * This file is part of GnuTLS.
+  *
+- * GnuTLS is free software: you can redistribute it and/or modify it
+- * under the terms of the GNU General Public License as published by
+- * the Free Software Foundation, either version 3 of the License, or
+- * (at your option) any later version.
++ * The GnuTLS is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public License
++ * as published by the Free Software Foundation; either version 2.1 of
++ * the License, or (at your option) any later version.
+  *
+- * GnuTLS is distributed in the hope that it will be useful, but
++ * This library is distributed in the hope that it will be useful, but
+  * WITHOUT ANY WARRANTY; without even the implied warranty of
+  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+- * General Public License for more details.
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public License
++ * along with this program.  If not, see <https://www.gnu.org/licenses/>
+  *
+- * You should have received a copy of the GNU General Public License
+- * along with this program.  If not, see
+- * <https://www.gnu.org/licenses/>.
+  */
+ 
+ #ifndef GNUTLS_LIB_X509_KRB5_H
+-- 
+2.17.1
+
diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
index a285e5a1f1..cc0454a561 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
@@ -19,6 +19,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch \
 "
 
 SRC_URI[sha256sum] = "5630751adec7025b8ef955af4d141d00d252a985769f51b4059e5affa3d39d63"
-- 
2.17.1

