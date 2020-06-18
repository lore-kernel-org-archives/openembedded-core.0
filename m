Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web12.10529.1592494894747646615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 08:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xNfgwtQ6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.47, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f47.google.com with SMTP id v13so4880522otp.4
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6l1RT6rzJkDPACMsZ9GPOfLry+wY34FigruOUocH+pw=;
        b=xNfgwtQ6QHXQEC8xXfX6tceLzpwm8NAc/ob45jEEjIzW/LvGWeR+ZsLkkWv0StkJx9
         e7ILw3tlZb8JvEy/pr1HQHapWX+p15CH/j7UWgd6T+R2GPUZFqZAVVzrTKnvB59w95CI
         uMJXw/BIdIFdv/SGr//FcNbG4k93bhYeUydVOyNEWJEnRdfWvASvSHXkzAc9oI29Aqj/
         cUPgew0rHEmQyiCmUgVDrslaX2QO9PRPKSWu81fFQGmygSzCi15ojE5FwG64NJvvPjRt
         lv+1cm+fjCEuLRYjqOI2Cf+hEADdvK9ymwqiogXLd/94yHbtoalKCzYZO3wZeFo/erG1
         INjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6l1RT6rzJkDPACMsZ9GPOfLry+wY34FigruOUocH+pw=;
        b=d7ZxpIgtBpxrNsg3GJCE4Qkc0NhblWwoOD1RBY2ZgF6v5o/s1q1x3A44HUVfS1CPj6
         /WhOSAGLgHImGdECPxUFAu28NCvJ34GcTorjVVFQ01AkRzO2yRzv+b61eFVBQizhy+/9
         q20llDrhgqY3HisNpXcKpz9rfWiLiq82Q2OqOx1j60KWgAmiHH5oUXPVtTgFmdaKpIvg
         spKORNdU4amKrRrTbCyOJZ1KntcjF1nxdPUJlaSo3lQR3+iUsAErX8XwjnhDML/CykK8
         vUJ3VffNd/Lxl64iPdA0NYHRdZNo2BJhVAY5WjGxBIar5XhVXswCJVYGCqpnV1/VJE9N
         MD8g==
X-Gm-Message-State: AOAM531WUBXmMlJl06t2bX+UE/9QgAJ/+zRU8de5l1C2Yu3aKnjcfNOh
	djMljNsi53ozH3HvhW++mQtQbuqZ3z32VQ==
X-Google-Smtp-Source: ABdhPJylTqE1CQb44EnXpNka7En9odCBvE/8eNj4RvCf1qkDGDyk60ycULpT97KbGenvKxE//48dSA==
X-Received: by 2002:a05:6830:1ad7:: with SMTP id r23mr3805569otc.96.1592494893419;
        Thu, 18 Jun 2020 08:41:33 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id r7sm768843oor.9.2020.06.18.08.41.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2020 08:41:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/21] libtirpc: upgrade 1.2.5 -> 1.2.6
Date: Thu, 18 Jun 2020 05:40:31 -1000
Message-Id: <1497ec4e8e0a2244154486feea8292b0b37d5249.1592492076.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592492076.git.steve@sakoman.com>
References: <cover.1592492076.git.steve@sakoman.com>

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

0001-xdr_float-do-not-include-bits-endian.h.patch
removed since it is included in 1.2.6

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c940792e1492923036cae97010f9945e7ad43a32)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...r_float-do-not-include-bits-endian.h.patch | 34 -------------------
 .../{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb}  |  8 ++---
 2 files changed, 3 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.2.5.bb => libtirpc_1.2.6.bb} (74%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch b/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
deleted file mode 100644
index 3797cdf521..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/0001-xdr_float-do-not-include-bits-endian.h.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From d04f4d6f0e682f16b0ce96839ab4eadade591eb1 Mon Sep 17 00:00:00 2001
-From: Rosen Penev <rosenp@gmail.com>
-Date: Tue, 21 Jan 2020 11:51:16 -0500
-Subject: [PATCH] xdr_float: do not include bits/endian.h
-
-bits/endian.h is an internal header. endian.h should be included.
-
-Fixes compilation with recent musl.
-
-Signed-off-by: Rosen Penev <rosenp@gmail.com>
-Signed-off-by: Steve Dickson <steved@redhat.com>
-
-Upstream-Status: Backport [http://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=d04f4d6f0e682f16b0ce96839ab4eadade591eb1]
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/xdr_float.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/xdr_float.c b/src/xdr_float.c
-index 26bc865..349d48f 100644
---- a/src/xdr_float.c
-+++ b/src/xdr_float.c
-@@ -83,7 +83,7 @@ static struct sgl_limits {
- };
- #else
- 
--#include <bits/endian.h>
-+#include <endian.h>
- #define IEEEFP
- 
- #endif /* vax */
--- 
-2.21.1
-
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
similarity index 74%
rename from meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
index fc66821ecc..6100d157e5 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.2.5.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.2.6.bb
@@ -9,13 +9,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-           file://0001-xdr_float-do-not-include-bits-endian.h.patch \
-           "
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[md5sum] = "688787ddff7c6a92ef15ae3f5dc4dfa1"
-SRC_URI[sha256sum] = "f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca"
+SRC_URI[md5sum] = "b25f9cc18bfad50f7c446c77f4ae00bb"
+SRC_URI[sha256sum] = "4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc"
 
 inherit autotools pkgconfig
 
-- 
2.17.1

