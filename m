Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.966.1604388543068444925
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 23:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.77,447,1596470400"; 
   d="scan'208";a="100858882"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 03 Nov 2020 15:28:50 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id F037348990D3
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Nov 2020 15:28:46 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 3 Nov 2020 15:28:45 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] elfutils: upgrade 0.181 -> 0.182
Date: Tue, 3 Nov 2020 15:28:39 +0800
Message-ID: <1604388519-74335-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: F037348990D3.A0E6C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
 0002-musl-libs.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../{elfutils_0.181.bb => elfutils_0.182.bb}  |  2 +-
 .../elfutils/files/0002-musl-libs.patch       | 20 +++++++++----------
 2 files changed, 10 insertions(+), 12 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils_0.181.bb => elfutils_0.182.bb} (98%)

diff --git a/meta/recipes-devtools/elfutils/elfutils_0.181.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
similarity index 98%
rename from meta/recipes-devtools/elfutils/elfutils_0.181.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.182.bb
index 6c49a5fc26..f63208d72b 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.181.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
@@ -28,7 +28,7 @@ SRC_URI_append_libc-musl = " \
            file://0004-Fix-error-on-musl.patch \
            file://0015-config-eu.am-do-not-use-Werror.patch \
            "
-SRC_URI[sha256sum] = "29a6ad7421ec2acfee489bb4a699908281ead2cb63a20a027ce8804a165f0eb3"
+SRC_URI[sha256sum] = "ecc406914edf335f0b7fc084ebe6c460c4d6d5175bfdd6688c1c78d9146b8858"
 
 inherit autotools gettext ptest pkgconfig
 
diff --git a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
index 894e46c3c4..004a36c9a1 100644
--- a/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
+++ b/meta/recipes-devtools/elfutils/files/0002-musl-libs.patch
@@ -21,8 +21,8 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  lib/libeu.h                    |  1 +
  libdwfl/dwfl_error.c           |  9 +++++++++
  libdwfl/linux-kernel-modules.c |  1 +
- libelf/elf.h                   |  9 ++++++---
- 6 files changed, 44 insertions(+), 4 deletions(-)
+ libelf/elf.h                   |  7 +++++++
+ 6 files changed, 45 insertions(+), 1 deletions(-)
  create mode 100644 lib/error.h
 
 diff --git a/lib/error.h b/lib/error.h
@@ -119,23 +119,21 @@ diff --git a/libelf/elf.h b/libelf/elf.h
 index 197b557..8e5b94c 100644
 --- a/libelf/elf.h
 +++ b/libelf/elf.h
-@@ -21,7 +21,9 @@
- 
- #include <features.h>
- 
--__BEGIN_DECLS
+@@ -19,6 +19,10 @@
+ #ifndef _ELF_H
+ #define	_ELF_H 1
+
 +#ifdef __cplusplus
 +extern "C" {
 +#endif
- 
++
  /* Standard ELF types.  */
  
-@@ -4103,6 +4105,7 @@ enum
+ #include <stdint.h>
+@@ -4101,4 +4105,7 @@ enum
  #define R_ARC_TLS_LE_S9		0x4a
  #define R_ARC_TLS_LE_32		0x4b
  
--__END_DECLS
--
 +#ifdef __cplusplus
 +}
 +#endif
-- 
2.25.1



