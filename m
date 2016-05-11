Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9C59671E63
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:01 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id i5so4047274pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=hBXxJBqCO2WSkUj2iAfnjk0d/Kv/fWHFIDWEjUuTAcA=;
	b=jUci+mL6xdtlx1KricV7jFRAjp5kA9wmGgMQlksmcg10LbLjDvP2nCtk02aTvtm43U
	W9jBNsUoYkkHwdMrNdHUtHIV+1VhoKUQCZNcAvS9NZUR9l5fMwEmrXfztOzkmB5aqzFx
	Uq8x47GNK0MeTjmyRB2JHn/UfeE43P9vTtiJNQ/PQ9LD8qjlZYcUpfhS2/4al1nc+jG6
	h+xNvKs3iqmJ/hFhoH4wYR1kzahyMsogIpb0Ls4vxkRaGTWZpy/uwhV8cd376wQQBEOk
	lZM9NAFLRAhezJLfc8bSRZCKzu5C2myyps82Iki9v6kzjdcx3MpAjnEjM3z1Cgr7vyu+
	GKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=hBXxJBqCO2WSkUj2iAfnjk0d/Kv/fWHFIDWEjUuTAcA=;
	b=fP+fjrYjBR0T56rQTGEBELVJ82L7s6cDUsq1fuKGQTqe/xDy1epLvkmwZ7zos11XrP
	oYLwcztlJn+LFmkShDow2VSHatjqToFahnDs/vg60yd1vz4jcTFJy1zhRZcdLJhzzzvs
	DWzP3QIUBIeJZOsSZX4s9Be76kZhe7dPnOH7XQQiLAe5U8z6GL1q9sm4t8QDRhNrv1d3
	9dgvq3ARyvtiJUKZjTmRQo4ATrqLF3mx7mBPtw0obYgq46SawRjopllsex9vuMzGgNiD
	egeyMJYnxk7Cf9CXDUPGaws1JYYZ89uwMHMq8nK4riBEevw+VymGhpvxd9KX0Zzgqy+/
	UK9w==
X-Gm-Message-State: AOPr4FUoWqLg4qP7XeBD+rzLMmmYrHGuSsFw7Pg7k7PFIcpmtKLaBjbE63ef9PDdWyuDKw==
X-Received: by 10.66.78.73 with SMTP id z9mr6783275paw.4.1462988162008;
	Wed, 11 May 2016 10:36:02 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:10 -0700
Message-Id: <51800bde9c6db891db693cc03d3ba304da3f63fc.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 07/42] lzop: Fix build with gcc-6
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
X-List-Received-Date: Wed, 11 May 2016 17:36:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/lzop/lzop/lzop-1.03-gcc6.patch | 37 ++++++++++++++++++++++
 meta/recipes-support/lzop/lzop_1.03.bb             |  6 ++--
 2 files changed, 40 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch

diff --git a/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch b/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
new file mode 100644
index 0000000..72b3397
--- /dev/null
+++ b/meta/recipes-support/lzop/lzop/lzop-1.03-gcc6.patch
@@ -0,0 +1,37 @@
+gcc-6 has additional errors e.g.
+
+./test.c:1:12: error: variably modified '__acc_cta' at file scope
+ extern int __acc_cta[1-2*!((1l << (8*8 -1)) < 0)];
+            ^~~~~~~~~
+
+This is rightly pointed out since that index is undefined
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+--- a/src/miniacc.h.orig	2016-02-10 16:09:23.247315866 +0100
++++ a/src/miniacc.h	2016-02-10 16:12:14.973297054 +0100
+@@ -4469,12 +4469,12 @@
+ #if defined(__MSDOS__) && defined(__TURBOC__) && (__TURBOC__ < 0x0150)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1   << (8*SIZEOF_INT-1)) < 0)
++    ACCCHK_ASSERT((int)(1u   << (8*SIZEOF_INT-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1u  << (8*SIZEOF_INT-1)) > 0)
+ #if 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #else
+-    ACCCHK_ASSERT((1l  << (8*SIZEOF_LONG-1)) < 0)
++    ACCCHK_ASSERT((long)(1ul  << (8*SIZEOF_LONG-1)) < 0)
+ #endif
+     ACCCHK_ASSERT((1ul << (8*SIZEOF_LONG-1)) > 0)
+ #if defined(acc_int16e_t)
+@@ -4703,7 +4703,7 @@
+ #elif 1 && (ACC_CC_LCC || ACC_CC_LCCWIN32) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif 1 && (ACC_CC_SUNPROC) && !defined(ACCCHK_CFG_PEDANTIC)
+ #elif !(ACC_BROKEN_INTEGRAL_PROMOTION) && (SIZEOF_INT > 1)
+-    ACCCHK_ASSERT( (((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
++    ACCCHK_ASSERT( (int)((unsigned int)((unsigned char)128) << (int)(8*sizeof(int)-8)) < 0)
+ #endif
+ #if (ACC_CC_BORLANDC && (__BORLANDC__ >= 0x0530) && (__BORLANDC__ < 0x0560))
+ #  pragma option pop
diff --git a/meta/recipes-support/lzop/lzop_1.03.bb b/meta/recipes-support/lzop/lzop_1.03.bb
index 07d6289..649e724 100644
--- a/meta/recipes-support/lzop/lzop_1.03.bb
+++ b/meta/recipes-support/lzop/lzop_1.03.bb
@@ -15,15 +15,15 @@ SRC_URI = "http://www.lzop.org/download/${BP}.tar.gz \
            file://acinclude.m4 \
            file://x32_abi_miniacc_h.patch \
            file://0001-use-static-inlines-as-the-external-inline-definition.patch \
+           file://lzop-1.03-gcc6.patch \
           "
 SRC_URI[md5sum] = "006c5e27fb78cdd14a628fdfa5aa1905"
 SRC_URI[sha256sum] = "c1425b8c77d49f5a679d5a126c90ea6ad99585a55e335a613cae59e909dbb2c9"
 
 inherit autotools
 
-do_configure () {
-    ln -sf  ../acinclude.m4 ${S}/acinclude.m4
-    autotools_do_configure
+do_configure_prepend () {
+    install -Dm 0644 ${WORKDIR}/acinclude.m4 ${S}/acinclude.m4
 }
 
 BBCLASSEXTEND += "native nativesdk"
-- 
2.8.2


