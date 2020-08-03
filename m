Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.12546.1596464866550836834
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=SuNXJwcP;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id r11so10270912pfl.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=fG9u6nk5VaUNvW79ho/D5N5ByH1xmrLWBXpLnTDslcA=;
        b=SuNXJwcPsX03Jo2013Y4CO76YZDQFS2lvLURDW1RJIYsqu6COnIV5t10pM2INSTlcr
         2UZkdFkwaEsjzPyrrdhqO038p+y3K+dERI+hImsgEYTg0VVW/IC1cNY0UxsdE6EVCdV3
         8ebuVhe3WZVK6vdLI+NMsw9RhO3SYAD7u7xbYxzUWxrZLuVzOSVecl9IhyGyaiG5fN53
         lYukE/TeVpCGj/ElD6wm9R4sUVnUnNEfdNQXrHI14N8zmKKLZTt/+5YuSto81eYYHy7+
         vx8nCI974ZWpa5KAdc2oYVcFNiRO0ZRXcGfxk1XVddEdk44ahmtUeHMjn1/DBcONBFTY
         2X7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=fG9u6nk5VaUNvW79ho/D5N5ByH1xmrLWBXpLnTDslcA=;
        b=PIZB9btfj0M1Wo3+tb3RbQL4SZmRqe8DULsBV6iGleBabQG4oa7cLVEr+zNuujvaxo
         r23GhrAjeKSfZOUEtnH+g6XdTuP+64NJ/N8KhsGRDRgF1sKiCP5JH8LhOeWwFP5FQRG3
         QYl8boZqAYMhU96AqPqOtozSO7ajAxBehbpClL3XCb6U5UKrRust/CAIMaLm25lHriQV
         lA6wyFblsz8p58vGDKS3gFFfUq6O4xnJP8n7DBDwks1SxqgQJNgCAc1RtF1gtL+4SBaz
         OAv6kgK4/KvCu7ebEIQa/yHX/TBujP4ejlt1bCh9zA8Oa8Jof2d6TvmSr9ZiT3psZAms
         h5wQ==
X-Gm-Message-State: AOAM5331mJ7t1DhvBTFUt34LsHbNS1Hx77PHHvI3dqtzvQnnxIW9FrgU
	uLVXp3IDJyizNNQg9MaUshcmfuIAJtE=
X-Google-Smtp-Source: ABdhPJy2cUzHgjNjATUEbzWkHs5LLpydXQKCcCy2LTFRqUBhQG0GCA4cIynerhGvRa+ik+bcQQLzmw==
X-Received: by 2002:a65:6707:: with SMTP id u7mr14839494pgf.233.1596464865522;
        Mon, 03 Aug 2020 07:27:45 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:44 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/12] gnutls: Fix krb5 code license to GPLv2.1+ to match the LICENSE file.
Date: Mon,  3 Aug 2020 04:27:03 -1000
Message-Id: <9e42af25aaa37bf859e742611fd0ac134001597e.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

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

