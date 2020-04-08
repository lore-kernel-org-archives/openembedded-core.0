Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.8878.1586341839342725941
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 03:30:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 038AUCpZ016021
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Apr 2020 03:30:28 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Wed, 8 Apr 2020 03:30:17 -0700
From: "hongxu" <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] buildtools-tarball: add nativesdk-mtools for `wic ls'
Date: Wed, 8 Apr 2020 18:30:15 +0800
Message-ID: <1586341815-26097-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

On ubuntu 18.04.1, it does not provides `mdir' by default
which caused `wic ls **.wic' failed on fat partition

...
$ wic ls build/tmp-glibc/deploy/images/xilinx-zynqmp/wrlinux-image-std-xilinx-zynqmp.wic

ERROR: Can't find executable 'mdir'
...

Add nativesdk-mtools to buildtools-tarball and use buildtools
to provide mdir

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index aa55cde..977b6a5 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -26,6 +26,7 @@ TOOLCHAIN_HOST_TASK ?= "\
     nativesdk-libnss-nis \
     nativesdk-rpcsvc-proto \
     nativesdk-patch \
+    nativesdk-mtools \
     "
 
 MULTIMACH_TARGET_SYS = "${SDK_ARCH}-nativesdk${SDK_VENDOR}-${SDK_OS}"
-- 
2.7.4

