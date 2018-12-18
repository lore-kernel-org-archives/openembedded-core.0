Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id C1D076C138
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 05:11:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g189so7235791pgc.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 21:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=i10uomOMSOzLWl/nP+zR7ij/yV7RBpyD9CoASrCSYWs=;
	b=SJw9ux57zdBEXxDHypHzAs9dTvRylvUOK50Se33P+Ceoo3ESThUCe42FIK/xtog2vT
	SblmxwDv7Nonc2g3FDvHDwBD8mTMIyuqyBGRuUb1Subz9KUb7hIHMdCN+R0ujpmbUwmM
	9RrCF26L655ioGoCs+3ochP2yV2/R+MEYFPbWJ+UOD9t+YEMQ+sYjfzDx3mfZHo711JS
	n/JtZGXr8OhqE2xQieIPYtZA14WyUIqsRLaLarg19MI/Y3m5Sa4BTGIifky3HqR2h1fG
	sEj/WfJM13+xdCqQyii+GFVlmX5dGzGyrMXbLCkTbyn/dOTnXBAUYCW+91N2Yoq9DjZA
	/jRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=i10uomOMSOzLWl/nP+zR7ij/yV7RBpyD9CoASrCSYWs=;
	b=kLeqXtgG1Wg2gjoV+1Qub576aj3yuoJfGTuG9+DlKCj/dJMeqdLosyInsDCMOBVF+e
	JXQeDNVNuxKwgCaq92cmLiF1jYrFFCPxYy00+SY/ROZGf2n8ANVcdF9KhDNUH+M27C6T
	9JrH4cccPRtQZ2P1PMOV28eX4fo5pUAaWl0sGQtHfqSiqvSWuTMvFE7F4Gpf2tl86Ovo
	XABaosqNfOIOsrnqEufTMksRYw0OjCC4m8ENb/vrIBnMB1LcuVZFiGxhTo7vH/jcOyah
	4o8QZkpTa6HHmIg/BO/GoaRhJ5RCzMAd6CyU8flY6SqHt2bAsPf70/EcnKukWPDy5eGT
	52Hw==
X-Gm-Message-State: AA+aEWZduQXj2LxQq89YO//SDQY4uYnAC1E7jetUk4vzKz5T7wVhjt0M
	z4IkNHZUPRao5M6r9wB0ZVyHau97NjE=
X-Google-Smtp-Source: AFSGD/XBhpuRzGHuqrPEFS9GN/ZLfOOJsQkWPaMryUnde6+9k9sd3JSi3JkzyC3lbYd5iB18CIS5CQ==
X-Received: by 2002:a63:f047:: with SMTP id s7mr14509836pgj.441.1545109919459; 
	Mon, 17 Dec 2018 21:11:59 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	i193sm20421563pgc.22.2018.12.17.21.11.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Dec 2018 21:11:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Dec 2018 21:11:48 -0800
Message-Id: <20181218051149.33374-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181218051149.33374-1-raj.khem@gmail.com>
References: <20181218051149.33374-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH V2] libxcrypt: Upgrade to 4.4.1 release
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
X-List-Received-Date: Tue, 18 Dec 2018 05:11:58 -0000
Content-Transfer-Encoding: 8bit

License-Update: New files added to existing list

Add -Wno-error=missing-attributes to compiler flags, this helps in
compiling with gcc 9.0, eventually, the code should be fixed

Add a patch to fix x32 build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Add-x32-specific-inline-asm.patch    | 42 +++++++++++++++++++
 ...{libxcrypt_4.1.1.bb => libxcrypt_4.4.1.bb} |  8 ++--
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
 rename meta/recipes-core/libxcrypt/{libxcrypt_4.1.1.bb => libxcrypt_4.4.1.bb} (70%)

diff --git a/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch b/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
new file mode 100644
index 0000000000..9e31b03561
--- /dev/null
+++ b/meta/recipes-core/libxcrypt/files/0001-Add-x32-specific-inline-asm.patch
@@ -0,0 +1,42 @@
+From 7d01f2acf6fde6341a68a91f9b343841cc424af7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Dec 2018 11:33:35 -0800
+Subject: [PATCH] Add x32 specific inline asm
+
+Upstream-Status: Pending [https://github.com/besser82/libxcrypt/issues/74#issuecomment-447966455]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ alg-yescrypt-opt.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/alg-yescrypt-opt.c b/alg-yescrypt-opt.c
+index 5dbd822..060caf4 100644
+--- a/alg-yescrypt-opt.c
++++ b/alg-yescrypt-opt.c
+@@ -528,6 +528,11 @@ static volatile uint64_t Smask2var = Smask2;
+ #undef MAYBE_MEMORY_BARRIER
+ #define MAYBE_MEMORY_BARRIER \
+ 	__asm__("" : : : "memory");
++#ifdef __ILP32__ /* x32 */
++#define REGISTER_PREFIX "e"
++#else
++#define REGISTER_PREFIX "r"
++#endif
+ #define PWXFORM_SIMD(X) { \
+ 	__m128i H; \
+ 	__asm__( \
+@@ -537,8 +542,8 @@ static volatile uint64_t Smask2var = Smask2;
+ 	    "pmuludq %1, %0\n\t" \
+ 	    "movl %%eax, %%ecx\n\t" \
+ 	    "shrq $0x20, %%rax\n\t" \
+-	    "paddq (%3,%%rcx), %0\n\t" \
+-	    "pxor (%4,%%rax), %0\n\t" \
++	    "paddq (%3,%%" REGISTER_PREFIX "cx), %0\n\t" \
++	    "pxor (%4,%%" REGISTER_PREFIX "ax), %0\n\t" \
+ 	    : "+x" (X), "=x" (H) \
+ 	    : "d" (Smask2), "S" (S0), "D" (S1) \
+ 	    : "cc", "ax", "cx"); \
+-- 
+2.20.1
+
diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
similarity index 70%
rename from meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
index 465aa96523..5e5d7c077c 100644
--- a/meta/recipes-core/libxcrypt/libxcrypt_4.1.1.bb
+++ b/meta/recipes-core/libxcrypt/libxcrypt_4.4.1.bb
@@ -3,16 +3,18 @@ DESCRIPTION = "Forked code from glibc libary to extract only crypto part."
 HOMEPAGE = "https://github.com/besser82/libxcrypt"
 SECTION = "libs"
 LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM ?= "file://LICENSING;md5=cb3ca4cabd2447a37bf186fad6f79852 \
+LIC_FILES_CHKSUM ?= "file://LICENSING;md5=e28ba6195a4e39904919b78a92bcf27e \
       file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
 inherit autotools pkgconfig
 
-SRCREV ?= "21b455b68baad279e6a3936faced16c5e5634376"
+# v4.4.1
+SRCREV ?= "b8714d4e9e37cf0d511917bd5eea0e51e4a397d5"
 SRCBRANCH ?= "develop"
 
 SRC_URI = "git://github.com/besser82/libxcrypt.git;branch=${SRCBRANCH} \
+           file://0001-Add-x32-specific-inline-asm.patch \
            "
 
 PROVIDES = "virtual/crypt"
@@ -22,6 +24,6 @@ FILES_${PN} = "${libdir}/libcrypt*.so.* ${libdir}/libcrypt-*.so ${libdir}/libowc
 S = "${WORKDIR}/git"
 
 BUILD_CPPFLAGS = "-I${STAGING_INCDIR_NATIVE} -std=gnu99"
-TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir}"
+TARGET_CPPFLAGS = "-I${STAGING_DIR_TARGET}${includedir} -Wno-error=missing-attributes"
 
 BBCLASSEXTEND = "nativesdk"
-- 
2.20.1


