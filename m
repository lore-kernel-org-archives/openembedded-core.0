Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
	[209.85.216.67])
	by mail.openembedded.org (Postfix) with ESMTP id 828057FDB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 20:00:40 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d15so1690940pjw.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=fUOLgn9JRQ/NfOmXlXldqHRK5tzCOQsbbLmOAK015CHbMfeCOzOc1bEq6+LHqBiJjV
	bUjFVZfx6+Pj9fNQm1UFiDjZwSN+nVq+Mr8zmAtZsMaemKNaO/gENFa+nBUSoFiLU/og
	Uvk5WIkvARWkMUJHpVBmOwQT0xC3EzmEVAQDf50PVS9ONm8NEM/YGvT0ocnD0y+SjcyV
	HKAbTkLeYjUSjdX2xY/nzuuiA0V2PfGZiZ+WVOOj4DAoTB9bcfIsRo7Lc9VtFkMRAYR+
	RlaXzsHDVo6Y1uALAseD0UZF7xecSXFasbfrbWt3DsKgQs7/hMPDUZQyOVuI1xEyqSdW
	g+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fHTcbkclEXpssi5v5BOrwqZa8yInGQgNTgkkX5wrq5w=;
	b=uamAUhljy6i8j9O32Q7O/04hcCskgNLXVOgPM19yEB0yhd3onlDCPwAPVdChsScsqE
	jDLvP1twaQZewHZB6FgJwGmEDFxVJk07k/+h5+rNfLJoExIUElsFueVE4q/5SDoRzJZ+
	zCJasY3xuLDNuDJgQ0ftoBEB/FEqZhvxOEBxIQANAcax3I9tpZW8XTdX71VTILvSeJoT
	7ZaBdruzMWy4cIposTRblr/B1nwbN88mAGp52d8LFsvvOSi4g9KkyAopMadQccmkaJpR
	B+UaeoByCFZh/cqjLXkudL/eMKvOuZ/InMyQH8STxitBk0ldSgqul+iXHunCTqKl4rzV
	by5A==
X-Gm-Message-State: APjAAAVdI8n9Y9TjV/447UvnspKjYVmRWn9ltNzR2sX7EKTNJZkr8tMI
	hlOOs+6HtVTH9PN0XuAh44aQ3RmrA0I=
X-Google-Smtp-Source: APXvYqwl7O5LyqWjR1nrmSCuklrPbP4j+K+kIGV9F6dVnAx2wjT66aeh68lecwDXXPnCUtMlYKhJew==
X-Received: by 2002:a17:902:864c:: with SMTP id
	y12mr17750037plt.8.1579809641236; 
	Thu, 23 Jan 2020 12:00:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net
	(c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
	by smtp.gmail.com with ESMTPSA id
	y38sm3806967pgk.33.2020.01.23.12.00.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 12:00:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 12:00:40 -0800
Message-Id: <1fe572e7afe84276d14a22eb46b35ceadcdd91aa.1579809439.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <cover.1579809439.git.raj.khem@gmail.com>
References: <cover.1579809439.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] nss: Pass NSS_USE_ARM_HW_CRYPTO as define in CFLAGS
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
X-List-Received-Date: Thu, 23 Jan 2020 20:00:40 -0000
Content-Transfer-Encoding: 8bit

Use NSS_USE_ARM_HW_CRYPTO to detect USE_ARM_GCM, since there are
dependent, without this we control the crypto code function inclusion in
build but do not control the call sites, which can result in undefined
symbols e.g.

Linux_SINGLE_SHLIB/gcm.o: in function `gcmHash_InitContext':
/usr/src/debug/nss/3.49.1-r0/nss-3.49.1/nss/lib/freebl/gcm.c:112: undefined reference to `gcm_HashInit_hw'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...figure-option-to-disable-ARM-HW-cryp.patch | 25 ++++++++++++++++---
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
index fe29d19882..803c06b218 100644
--- a/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
+++ b/meta/recipes-support/nss/nss/0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch
@@ -12,20 +12,19 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  nss/lib/freebl/Makefile | 3 +++
  1 file changed, 3 insertions(+)
 
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 06506f0..a8b015d 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
-@@ -125,6 +125,8 @@ else
+@@ -125,6 +125,9 @@ else
          DEFINES += -DNSS_X86
  endif
  endif
 +
 +ifdef NSS_USE_ARM_HW_CRYPTO
++    DEFINES += -DNSS_USE_ARM_HW_CRYPTO
  ifeq ($(CPU_ARCH),aarch64)
      DEFINES += -DUSE_HW_AES
      EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
-@@ -145,6 +147,7 @@ ifeq ($(CPU_ARCH),arm)
+@@ -146,6 +149,7 @@ ifeq ($(CPU_ARCH),arm)
          endif
      endif
  endif
@@ -33,3 +32,21 @@ index 06506f0..a8b015d 100644
  
  ifeq ($(OS_TARGET),OSF1)
      DEFINES += -DMP_ASSEMBLY_MULTIPLY -DMP_NO_MP_WORD
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -17,6 +17,7 @@
+ 
+ #include <limits.h>
+ 
++#ifdef NSS_USE_ARM_HW_CRYPTO
+ /* old gcc doesn't support some poly64x2_t intrinsic */
+ #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
+     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+@@ -28,6 +29,7 @@
+  * that compiler uses -mfpu=neon only. */
+ #define USE_ARM_GCM
+ #endif
++#endif
+ 
+ /* Forward declarations */
+ SECStatus gcm_HashInit_hw(gcmHashContext *ghash);
-- 
2.25.0


