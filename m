Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12380.1795499681974193347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 21:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HQz+X440;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4317; q=dns/txt;
  s=iport01; t=1795499682; x=1796709282;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XmLFx8e4GGBx47HWCPgjpll+wgzGziQXrb4uGoea0O4=;
  b=HQz+X4400ECEGEjLa6WX+xDnhGac5NKuAIKZVpXC+QsttJ6Q0vAPOgr1
   FxcaiSthZzxYH7SZ4Qj57t0fLtWNj7vxpI8gX/uarmB3Jpt8Vz0ccpl57
   G4hnTuK2RHBO03GD9LR0kW7UYh8Lrxnlm4FTSVCa//nSxhVZyoUK/WORd
   2D6g32gvv180iL+8Ct1p/SR8Ux9Oe120id4yg+YcaXie9f8fGXkC0c9ub
   if0tRPIXGZFjrZFREYrWGE0vPVGEdViLXC4O4eBrSXbllF2sJgN0crrep
   AIoZS8TzQdtToYT6QmF2wkDTfqoG7m/hwbEkvrUjPV/1iIvvWEv+1l1zU
   A==;
X-CSE-ConnectionGUID: TLh64lCDRqSUC+cC0uyYBQ==
X-CSE-MsgGUID: ucVkR5B1QuSI5JTofol95Q==
X-IPAS-Result: =?us-ascii?q?A0BGAgBEJQVr/8tK/pA+HIJZgld1YENJlCqBNWyLaZJDF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAS0LARgBWQMBAk8LIyGDAgGCOgM3AxFIuiGBeTOBAYMpA?=
 =?us-ascii?q?YFU2EwNgloBCxQBgTiFQoMAhSRdGAGEfScbG4FyhH+CH0IEGIEshmAEgiKBD?=
 =?us-ascii?q?IFUHox5AoFPiElIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CHxAGFiELG?=
 =?us-ascii?q?xgNSBEsNxUZBD5uB5QUgxMHexMBKyCCHZMdETyReoE1nmtxCiiDeYwkjz6Ff?=
 =?us-ascii?q?BozhASBV6UXmQiCWYoDgS6ECpJHhGqBaDyBWXAVgyIJCUEZD44vFYF4hnvJS?=
 =?us-ascii?q?CYyAgkyAQEHAgcOAwuBaJEeYAEB?=
IronPort-Data: A9a23:KwYPcaAp3pFfrBVW/3ziw5YqxClBgxIJ4kV8jS/XYbTApGsr0zJTm
 DNODTyDPPzZNjDzL49/Oom2pEtVv5TVyYVjOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE/9FuUh0yFqEi491KKiJF3
 qQFOQEnV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4l3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWEHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCNlFUrjumzarI5fPSXTvtWpBuy/
 1vbxEWkIC0dOtubmGe8pyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeJpFsYHtFXCeB/sFvLwavP6AHfDW8BJtJcVOEbWAYNbWRC/
 je0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:KWXzKKsLD+UfO7CGsrq/nXIu7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: =?us-ascii?q?9a23=3Acb0If2npoFiIhUFrsxXQmUFy5FPXOUH5zCmMJ2S?=
 =?us-ascii?q?UM39SdZbWQnTI5bJVufM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AlZYh/A8KeuXc+JVt5DynljmQf9pj3aeUVWpUqIg?=
 =?us-ascii?q?9mpSmCSt+PDPM0Q3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60126962"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 05:54:39 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 4BDA31800017B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:54:39 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id F16E0CC1611; Mon, 23 Nov 2026 21:54:37 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 1/2] attr: upgrade 2.5.2 -> 2.6.0
Date: Mon, 23 Nov 2026 21:54:36 -0800
Message-Id: <20261124055437.731537-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 05:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250943
Content-Type: text/plain; charset="utf-8"

From: Alexander Kanavin <alex@linutronix.de>

Drop patch (issue fixed upstream).

Adjust file names in ptest packaging.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cd63486443d4aeafc5d508ce874e4238c17813ad)
Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 ...ibgen.h-for-posix-version-of-basenam.patch | 35 -------------------
 meta/recipes-support/attr/attr/run-ptest      |  2 +-
 .../attr/{attr_2.5.2.bb => attr_2.6.0.bb}     |  7 ++--
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
 rename meta/recipes-support/attr/{attr_2.5.2.bb => attr_2.6.0.bb} (88%)

diff --git a/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch b/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
deleted file mode 100644
index 1e2bea5067e..00000000000
--- a/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6d9e827bcacf387bb3cfae64bd4fe520168ccad4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:29:27 -0800
-Subject: [PATCH] attr.c: Include libgen.h for posix version of basename API
-
-Musl has removed the definition from string.h [1] which results in
-compile failures with clang
-
-| ../attr-2.5.1/tools/attr.c:69:13: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|    69 |         progname = basename(argv[0]);
-|       |                    ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://savannah.nongnu.org/bugs/index.php?64972]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/attr.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/attr.c b/tools/attr.c
-index 312aef1..90dab83 100644
---- a/tools/attr.c
-+++ b/tools/attr.c
-@@ -26,6 +26,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <libgen.h>
- #include <string.h>
- #include <locale.h>
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index 028671a9bde..50970d5b659 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -3,7 +3,7 @@
 failed=0
 all=0
 
-for f in *.test; do
+for f in *.run; do
     ./run $f
     case "$?" in
         0)
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-support/attr/attr_2.6.0.bb
similarity index 88%
rename from meta/recipes-support/attr/attr_2.5.2.bb
rename to meta/recipes-support/attr/attr_2.6.0.bb
index 390445b959f..aa5e7eb98f0 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.6.0.bb
@@ -16,10 +16,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
            file://run-ptest \
-           file://0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch \
 "
 
-SRC_URI[sha256sum] = "39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87"
+SRC_URI[sha256sum] = "d42fa374513180bb48cb11a46696f488240e5124ff1e6ad88b0abff706985612"
 
 inherit ptest update-alternatives autotools gettext
 
@@ -35,7 +34,7 @@ ALTERNATIVE_TARGET[getfattr] = "${bindir}/getfattr"
 do_install_ptest() {
     install -m755 ${S}/test/run ${S}/test/sort-getfattr-output ${D}${PTEST_PATH}/
 
-    for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+    for t in $(makefile-getvar ${B}/Makefile TESTS); do
         install -m644 ${S}/$t ${D}${PTEST_PATH}/
     done
 }
@@ -44,7 +43,7 @@ do_install_ptest:append:libc-musl() {
     # With glibc strerror(ENOTSUP) is "Operation not supported" but
     # musl is "Not supported".
     # https://savannah.nongnu.org/bugs/?62370
-    sed -i -e 's|f: Operation not supported|f: Not supported|g' ${D}${PTEST_PATH}/attr.test
+    sed -i -e 's|f: Operation not supported|f: Not supported|g' ${D}${PTEST_PATH}/attr.run
 }
 
 RDEPENDS:${PN}-ptest = "attr \
-- 
2.35.6

