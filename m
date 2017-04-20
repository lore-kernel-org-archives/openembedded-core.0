Return-Path: <raj.khem@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0987B719AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 02:31:58 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id g11so5125767oib.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 19:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2FEy/+SA/bvVfq2RZxFAcspzqU/39ZwwzSTQfShuAA4=;
	b=X1YX2jpmTtgGsGKfOWjjPi89AA67qWzXrua8rzfuOLTHGE7Fu8IycTNxfhNESxv6hf
	JbmiXvEeBJxqw1sa4oFmRBb5JzILio85hBbmEeMAdwgq+p/BP8ZN0eBwZHuB3U2lB+3h
	hpv7D6CRs5xPl5NOwKk1pqy3KtQiKJ5Sw7vvPa2HQDwJBKx+e4lTVn91f8Nrc6NLy2Ut
	7kUSJFf00/qwwwMhWIwbHwEadjLSVJb4NKOj9a+QPkx5H3EEUtoDVtUaHt2bgoeRN74x
	wCKGU611+zaZDIbvRqWJh8poNv2py+MM69AYQOxpd25Ez4eAGo0CjafEwoFsff1sbz2I
	U/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2FEy/+SA/bvVfq2RZxFAcspzqU/39ZwwzSTQfShuAA4=;
	b=PbNGCcRvbewuGkT8eeEJA1HZDa2GlaQntJ28Q/O64kLcdjT6juk5MV9ticY5G7ilbY
	ytDtTm+/daEMegnc+x/IYcvq3jQ1+Dm8Bmd/y26asuaDo0FTXAEC2jgDovFnsk7ZTcBq
	J2AmHzDrJ2Ld12bh67qOWDJla0B2jHCjY6hUV58Hq9s75Xjeaar2SQ+HhL+gUbC1ftLq
	xziZdRQttOqZtDuCQdFiBB75XUzCHuwSQ+ilxus9MpEupwEuqTSHmkqFllhJxXfeP/zk
	1HyWKepq4W3ngXJHTee8cr70QS8T8baC60OxWiARavNGjH9/vUwfGqDgOQuGtmphdNFF
	monQ==
X-Gm-Message-State: AN3rC/7pNZo2/JuPtpPMqXLfH30ceYOpIIr3es0Vktbmqd/qm8CxXZZr
	A58fNj/WHOJmrA==
X-Received: by 10.84.217.202 with SMTP id d10mr7449663plj.135.1492655519767;
	Wed, 19 Apr 2017 19:31:59 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	r73sm6790312pfa.65.2017.04.19.19.31.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Apr 2017 19:31:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 19:31:43 -0700
Message-Id: <20170420023147.1868-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
Subject: [PATCH 1/5] nss: Update to 3.29.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Apr 2017 02:31:59 -0000

Also fix build with gcc7 along

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../nss/0001-Fix-warnings-found-with-gcc7.patch    | 41 ++++++++++++++++++++++
 .../nss/{nss_3.28.1.bb => nss_3.29.1.bb}           | 28 +++++++--------
 2 files changed, 55 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-support/nss/nss/0001-Fix-warnings-found-with-gcc7.patch
 rename meta/recipes-support/nss/{nss_3.28.1.bb => nss_3.29.1.bb} (90%)

diff --git a/meta/recipes-support/nss/nss/0001-Fix-warnings-found-with-gcc7.patch b/meta/recipes-support/nss/nss/0001-Fix-warnings-found-with-gcc7.patch
new file mode 100644
index 00000000000..b16fb020c1c
--- /dev/null
+++ b/meta/recipes-support/nss/nss/0001-Fix-warnings-found-with-gcc7.patch
@@ -0,0 +1,41 @@
+From a1d2ef6a8e1bc721e44640bdb85747deaf8edcca Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 19 Apr 2017 10:50:37 -0700
+Subject: [PATCH] Fix warnings found with gcc7
+
+GCC7 finds more type conversion issues
+
+| pkix_pl_ocsprequest.c: In function 'pkix_pl_OcspRequest_Hashcode':
+| pkix_pl_ocsprequest.c:92:60: error: '<<' in boolean context, did you mean '<' ? [-Werror=int-in-bool-context]
+|          *pHashcode = (((((extensionHash << 8) || certHash) << 8) ||
+|                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
+| pkix_pl_ocsprequest.c:93:27: error: '<<' in boolean context, did you mean '<' ? [-Werror=int-in-bool-context]
+|          *pHashcode = (((((extensionHash << 8) || certHash) << 8) ||
+|                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+|                  dateHash) << 8) || signerHash;
+|                  ~~~~~~~~~~^~~~~
+| cc1: all warnings being treated as errors
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ nss/lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.c b/nss/lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.c
+index 171a3d2..d5eef88 100644
+--- a/nss/lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.c
++++ b/nss/lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.c
+@@ -89,7 +89,7 @@ pkix_pl_OcspRequest_Hashcode(
+         PKIX_HASHCODE(ocspRq->signerCert, &signerHash, plContext,
+                 PKIX_CERTHASHCODEFAILED);
+ 
+-        *pHashcode = (((((extensionHash << 8) || certHash) << 8) ||
++        *pHashcode = ((PKIX_UInt32)(((PKIX_UInt32)((extensionHash << 8) || certHash) << 8) ||
+                 dateHash) << 8) || signerHash;
+ 
+ cleanup:
+-- 
+2.12.2
+
diff --git a/meta/recipes-support/nss/nss_3.28.1.bb b/meta/recipes-support/nss/nss_3.29.1.bb
similarity index 90%
rename from meta/recipes-support/nss/nss_3.28.1.bb
rename to meta/recipes-support/nss/nss_3.29.1.bb
index fed86fc8e92..48db0312b10 100644
--- a/meta/recipes-support/nss/nss_3.28.1.bb
+++ b/meta/recipes-support/nss/nss_3.29.1.bb
@@ -14,20 +14,20 @@ LIC_FILES_CHKSUM = "file://nss/COPYING;md5=3b1e88e1b9c0b5a4b2881d46cce06a18 \
                     file://nss/lib/freebl/mpi/doc/LICENSE;md5=491f158d09d948466afce85d6f1fe18f \
                     file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=5d425c8f3157dbf212db2ec53d9e5132"
 
-SRC_URI = "\
-    http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_28_1_RTM/src/${BP}.tar.gz \
-    file://0001-nss-fix-support-cross-compiling.patch \
-    file://nss-no-rpath-for-cross-compiling.patch \
-    file://nss-fix-incorrect-shebang-of-perl.patch \
-    file://nss-fix-nsinstall-build.patch \
-    file://disable-Wvarargs-with-clang.patch \
-    file://pqg.c-ULL_addend.patch \
-    file://Fix-compilation-for-X32.patch \
-    file://nss.pc.in \
-    file://signlibs.sh \
-"
-SRC_URI[md5sum] = "e98d48435cee5792f97ef7fc35a602c3"
-SRC_URI[sha256sum] = "58cc0c05c0ed9523e6d820bea74f513538f48c87aac931876e3d3775de1a82ad"
+SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_29_1_RTM/src/${BP}.tar.gz \
+           file://nss.pc.in \
+           file://signlibs.sh \
+           file://0001-nss-fix-support-cross-compiling.patch \
+           file://nss-no-rpath-for-cross-compiling.patch \
+           file://nss-fix-incorrect-shebang-of-perl.patch \
+           file://nss-fix-nsinstall-build.patch \
+           file://disable-Wvarargs-with-clang.patch \
+           file://pqg.c-ULL_addend.patch \
+           file://Fix-compilation-for-X32.patch \
+           file://0001-Fix-warnings-found-with-gcc7.patch \
+           "
+SRC_URI[md5sum] = "0525d1a45931892daa0f368d379d4aa4"
+SRC_URI[sha256sum] = "47259bc5c4439d8228d7c577ea652ed140588f27eae8ebb39cc91057aea37366"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.12.2


