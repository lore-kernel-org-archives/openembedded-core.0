Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.25439.1591983215372489074
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 10:33:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id l17so9732580qki.9
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 10:33:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=b0FafJL57KSVTHfixboaOpRZTBQEivfbzYINP6rngPk=;
        b=BRIVOzOVgsTnANsY1wFQz8Tra8fvDeWBg4advJfE7V6UfrfYBOZRbyKUf7jL1s8aLF
         SQpY5UFl+FTAouddDTX/q+FkBxmFSoQFqXTgUnJwSQuN51jDYyV57q5mOVsoodte1d2P
         R8si7hsNXXyK5vZPc9dDruYHJhOkknYwWslp5KUnHyG3bKq+rY+FRqYR9vN19ZO900Yy
         9qUlIeZdsrXsnE5A+YwwIqi3/p99XBvywEzWxlUPacHn6A9Zt/BokpiJ6sZBOC8GR83Q
         bKUuqTPDANulWuknj0FuoqDG+WJSQj54qbW/7pkpAy7Dgc+lpOMdUx2cTcP0RKeNTv4v
         VJzw==
X-Gm-Message-State: AOAM531WUDFVaspCf9gEs5jevMIbTI5FZD4otmVfjnNJKmiYiNb3hBh/
	lzvxS88CuL86PO5i4IsvvUWpjTuoj18=
X-Google-Smtp-Source: ABdhPJxBokcD2hxYuO1MGF9qXRQUHavuK+QsMoIljwj8HU1E1Il4FR03VLRynX0Z/G+CmpcndIzj6A==
X-Received: by 2002:a37:688c:: with SMTP id d134mr4304130qkc.492.1591983214267;
        Fri, 12 Jun 2020 10:33:34 -0700 (PDT)
Return-Path: <otavio.salvador@gmail.com>
Received: from localhost ([181.220.84.90])
        by smtp.gmail.com with ESMTPSA id d16sm5528870qte.49.2020.06.12.10.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 10:33:33 -0700 (PDT)
From: "Otavio Salvador" <otavio.salvador@gmail.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: [dunfell-backport PATCH 3/9] libtirpc: upgrade 1.2.5 -> 1.2.6
Date: Fri, 12 Jun 2020 14:33:12 -0300
Message-Id: <20200612173318.103232-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200612173318.103232-1-otavio@ossystems.com.br>
References: <20200612173318.103232-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>

0001-xdr_float-do-not-include-bits-endian.h.patch
removed since it is included in 1.2.6

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c940792e1492923036cae97010f9945e7ad43a32)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
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
index f8e34f58a2..10a324c3b6 100644
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
2.27.0

