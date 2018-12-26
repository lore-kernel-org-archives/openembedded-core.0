Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 65D1E6C182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 20:10:26 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w7so7889602pgp.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Dec 2018 12:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=bhX78Fm5v4jKahiCEgxmMAgkimBRFjPraSdCmauN5xc=;
	b=MYkgAk9R9QexrNwMazLnHRhPV8zYfRUIV8kZtiCZi5RzU/0M3GCXIorcaY4W+FL0vl
	BypxxO4R0dvvkHwu2U4jHT/99oHKSmX5rEHkDXoFX5zlNFD0n99+7SPizBqgf5EllBQx
	Nz6Pb480RCNb3R+GSZ60oJuWLmpZHZoWXTSLKqZAmdKSKPrUG5IN/DtXPod9rJwbNNMW
	tLzmwQROQZjy6nnmX/OwiZEvWAimsd9Nqa6QbMtbVSaZzKZqVbWZWUp0XqvzdbMz/pQW
	/1xaJ72ESLuLnJAJBelPRmUICQnaQBiHyvzxzYHq3GyCI2hT6BI7GOpA5V8Fb3vzxbEI
	MkkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=bhX78Fm5v4jKahiCEgxmMAgkimBRFjPraSdCmauN5xc=;
	b=nvrz3bn+CkC8IRYBJdbjJrtcYy9h/8nxdAph7fSSt0UaqAugS+CFqlIyrxjUxnezMp
	jmLbz5mdV/HDkb6jYHkvLG20heXznc1D0Wb0FTTLbdqPlSdYlKApdxUseMtKhp8SN8vj
	py+/1IHZbA+6BujLwfskpOEJkhK3n6LfLq5otDc5LNutvhMjItF+CDYPlUjV8ZkQZsCs
	r+GnRi0m+wDWG8m8QkPPYP2SDA+ZCJQthiGaTHD92ADeF7g5QTxuyJzZVXjUReTyPWN2
	DTZf93TaUa54LincvRJVZZZeGlaFOPUeCJYu2kzSLVkUslnPYTO75g0MchA0mH9q7RX3
	E6rg==
X-Gm-Message-State: AJcUukeyZ+6DSFWMAX3ta/Xpkuhuu6gmkYcBCYbfeOFxDC1rF8wwPM/p
	GBypU6xXCF+WvPcQxELNxv3w5QHML7U=
X-Google-Smtp-Source: ALg8bN79bZ43tu2s6CnfOCgBD9ocwz7Uo6a+WMYFcLxn4/nEPH6hji8TqtX0K/EfaGBM1cgx2O6mhQ==
X-Received: by 2002:a63:cc12:: with SMTP id x18mr19951587pgf.33.1545855027033; 
	Wed, 26 Dec 2018 12:10:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:877f:9499::6e98])
	by smtp.gmail.com with ESMTPSA id
	l3sm60029493pga.92.2018.12.26.12.10.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Dec 2018 12:10:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2018 12:09:50 -0800
Message-Id: <20181226200954.5267-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181226200954.5267-1-raj.khem@gmail.com>
References: <20181226200954.5267-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] libxcrypt: Upgrade to 4.4.2
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
X-List-Received-Date: Wed, 26 Dec 2018 20:10:26 -0000
Content-Transfer-Encoding: 8bit

Licence-Update: Copyright Alexander Peslyak; 0-clause BSD added
see https://github.com/besser82/libxcrypt/commit/e07290ec7c3de301ce2b813ee2b42131bef2b119

Rename recipe to ve versionless and add PV in recipe itself, makes it
easy to traverse git history

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-x32-specific-inline-asm.patch    | 42 -------------------
 .../{libxcrypt_4.4.1.bb => libxcrypt.bb}      |  8 ++--
 2 files changed, 4 insertions(+), 46 deletions(-)
 delete mode 100644 meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.1.bb => libxcrypt.bb} (80%)

diff --git a/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch b/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
deleted file mode 100644
index 9e31b03561..0000000000
--- a/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 7d01f2acf6fde6341a68a91f9b343841cc424af7 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 17 Dec 2018 11:33:35 -0800
-Subject: [PATCH] Add x32 specific inline asm
-
-Upstream-Status: Pending [https://github.com/besser82/libxcrypt/issues/74#issuecomment-447966455]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- alg-yescrypt-opt.c | 9 +++++++--
- 1 file changed, 7 insertions(+), 2 deletions(-)
-
-diff --git a/alg-yescrypt-opt.c b/alg-yescrypt-opt.c
-index 5dbd822..060caf4 100644
---- a/alg-yescrypt-opt.c
-+++ b/alg-yescrypt-opt.c
-@@ -528,6 +528,11 @@ static volatile uint64_t Smask2var = Smask2;
- #undef MAYBE_MEMORY_BARRIER
- #define MAYBE_MEMORY_BARRIER \
- 	__asm__("" : : : "memory");
-+#ifdef __ILP32__ /* x32 */
-+#define REGISTER_PREFIX "e"
-+#else
-+#define REGISTER_PREFIX "r"
-+#endif
- #define PWXFORM_SIMD(X) { \
- 	__m128i H; \
- 	__asm__( \
-@@ -537,8 +542,8 @@ static volatile uint64_t Smask2var = Smask2;
- 	    "pmuludq %1, %0\n\t" \
- 	    "movl %%eax, %%ecx\n\t" \
- 	    "shrq $0x20, %%rax\n\t" \
--	    "paddq (%3,%%rcx), %0\n\t" \
--	    "pxor (%4,%%rax), %0\n\t" \
-+	    "paddq (%3,%%" REGISTER_PREFIX "cx), %0\n\t" \
-+	    "pxor (%4,%%" REGISTER_PREFIX "ax), %0\n\t" \
- 	    : "+x" (X), "=x" (H) \
- 	    : "d" (Smask2), "S" (S0), "D" (S1) \
- 	    : "cc", "ax", "cx"); \
--- 
-2.20.1
-
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb b/meta/recipes-core/libxcrypt/libxcrypt.bb
similarity index 80%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
rename to meta/recipes-core/libxcrypt/libxcrypt.bb
index 594203a59c..3b9af6d739 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt.bb
@@ -3,18 +3,18 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=e28ba6195a4e39904919b78a92bcf27e \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=be275bc7f91642efe7709a8ae7a1433b \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-# v4.4.1
-SRCREV ?= "b8714d4e9e37cf0d511917bd5eea0e51e4a397d5"
+PV = "4.4.2"
+# v4.4.2
+SRCREV ?= "cf6abf18083566ec1612af27982a5160c9e0f137"
 SRCBRANCH ?= "develop"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
-           file://0001-Add-x32-specific-inline-asm.patch \
            "
 
 PROVIDES = "virtual/crypt"
-- 
2.20.1


