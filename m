Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7279.1589437754848450938
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 23:29:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: wangmy@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,390,1583164800"; 
   d="scan'208";a="92042824"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 14 May 2020 14:29:11 +0800
Received: from G08CNEXMBPEKD05.g08.fujitsu.local (unknown [10.167.33.204])
	by cn.fujitsu.com (Postfix) with ESMTP id 60D9D4BCC8A1
	for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:29:10 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 14 May 2020 14:29:10 +0800
From: "Wang Mingyu" <wangmy@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] gnu-efi: upgrade 3.0.11 -> 3.0.12
Date: Thu, 14 May 2020 23:29:19 +0800
Message-ID: <1589470159-4407-1-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD05.g08.fujitsu.local (10.167.33.204)
X-yoursite-MailScanner-ID: 60D9D4BCC8A1.A4CA9
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 .../gnu-efi/{gnu-efi_3.0.11.bb => gnu-efi_3.0.12.bb}        | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.11.bb => gnu-efi_3.0.12.bb} (92%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
similarity index 92%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
index 9954d7f57a..7888aba0fb 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.12.bb
@@ -12,14 +12,14 @@ LIC_FILES_CHKSUM = "file://gnuefi/crt0-efi-arm.S;beginline=4;endline=16;md5=e582
                     file://lib/aarch64/initplat.c;beginline=2;endline=15;md5=8ed772501da77b2b3345aa6df8744c9e \
                    "
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/files/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
            "
 
-SRC_URI[md5sum] = "21148bbcccec385a9bfdf5f678959577"
-SRC_URI[sha256sum] = "f28da792a2532e91e18e0101468811739a22cde9eee5eacfd0efb9bf3a61d6b9"
+SRC_URI[md5sum] = "926763ff37bc9db3a9035cec41eb2f45"
+SRC_URI[sha256sum] = "0196f2e1fd3c334b66e610a608a0e59233474c7a01bec7bc53989639aa327669"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.17.1



