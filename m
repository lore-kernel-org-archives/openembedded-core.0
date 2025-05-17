Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0AD0C3ABDD
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 15:02:18 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.13303.1747494137473073286
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 May 2025 08:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e5eOTEJf;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-73712952e1cso3020841b3a.1
        for <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 08:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747494137; x=1748098937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRctvHMc6X8ecK4BSacArih0mQiTi/EQ8wKXlI9oQgQ=;
        b=e5eOTEJfQrReCPquFgnLRn/qtgl/K/pDgXmOmRPy4R71wE4/LNpcvbfFf3QqSImh7Q
         1e408o08oSQENHLti7N2SihJyVXwAl43AoaWZ9D6zO4FqmFONoYCt0PfVhm8uW03HTR1
         K41z0q9RgAphIyjKxegDXNNG9rJ/vA3a6hcP9a6SOUQ4DdtTFO7XmHh5v3D0PSkrm8wx
         4d4fg3CH7zcsxi9OeqnyKwIFH5TW2E/WO3ESVqsJA13uUytcDwena+sCPqjUKyZFumhq
         1dgeycuWiqgsI0gOM/ZadcjnUqcKS15PmIY/LzHcLxMuxYc+NhUkPZcTvrN/28cUv9de
         abaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747494137; x=1748098937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRctvHMc6X8ecK4BSacArih0mQiTi/EQ8wKXlI9oQgQ=;
        b=Yx3Y/7SMzH1jhUml1WfCUc/bFPlyzVHxjLCqbAxNcEElc4pNAOXpX1rq6FQy+O6S7V
         Q4GOu/DoEK/OrDPXPcoqUvOd/oa7s4yerLPplibSLm1Xx+JwO49nssn8QsjTGXOxq7la
         2aOAxngxrc/IhPbmoFHhBt3wJ592Ei0PMy/41/CTcmnJG7gh9PtwskwCaUHrKavCrIGX
         vNsElHEv50MpPKavcAJ/pKsuFox4QumIROG+n5OWys8icuswqYUjuuPZ0TyXYVa5NYtH
         qD5blWQh/Lgy5ugvolfwZ+Ozl4FUPA5wtXU/QgE/FyxTOPKjSab+1J2QHGFQMfR0XuIP
         sWAQ==
X-Gm-Message-State: AOJu0YzFs96PLCT7Jk/N9n/NV1pne1WplocbO9zE9IbqEasTjElOxJ1G
	NkSmj8JbXw0c7zex/mLA1h0Vvlee/AQGU7Af3BWy44g7AMru/D1iDlahxB7gRmYT
X-Gm-Gg: ASbGncucY1gRvU8Si4sa95knmEOmc1wCRJYIRddjjudlNWMNFKjEFn7Ws7JnwHfEEWt
	OfScDw5OlB5ciXwYfwxU3UuGWlfCM9/l5imsardyA/ryAdpgUQ+ImCGwEuSkNCyyUpl8I+IcZEh
	yn2UOE6XWaZscaljMErLmVEv8uTcp7m7KWIgDwGW1bsDORHYDPU6nVpoivlXKeqHI+w1uH43+i2
	zo7Wpor4ky/MYKZ9PvL68af3CW3hl90P9qF8z11K9+QkyoGiWlHVAPUcFphtDbsMdZ8Ijr6p2/J
	S3byUzm5dEgygH/VHzvb1xE+D17ph+2Ezfw/6R0/FIOyNcpTfRE5MA==
X-Google-Smtp-Source: AGHT+IFVVdltLHZ3UOamEqr16P9A91hVt2ehfmaCTYH2kZhzkrxOF/pb0iCECspbY9J8vji6u2o4/A==
X-Received: by 2002:a05:6a00:3492:b0:740:596e:1489 with SMTP id d2e1a72fcca58-742acd736e4mr8282231b3a.23.1747494136486;
        Sat, 17 May 2025 08:02:16 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970bb2fsm3379201b3a.53.2025.05.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 08:02:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] kexec-tools: Fix ppc build
Date: Sat, 17 May 2025 08:02:13 -0700
Message-ID: <20250517150213.2489547-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517150213.2489547-1-raj.khem@gmail.com>
References: <20250517150213.2489547-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 May 2025 15:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216771

Compiler can analyse function pointer parameters now a days and
it reports the mismatches, hence fixed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-ppc-fs2dt-Match-function-signatures.patch | 31 +++++++++++++++++++
 .../kexec/kexec-tools_2.0.31.bb               |  4 +++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch

diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
new file mode 100644
index 00000000000..483e5195a9d
--- /dev/null
+++ b/meta/recipes-kernel/kexec/kexec-tools/0001-ppc-fs2dt-Match-function-signatures.patch
@@ -0,0 +1,31 @@
+From 4a07e8f22b4f224dca79767e5cb86a0de91498dc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 17 May 2025 07:48:50 -0700
+Subject: [PATCH] ppc/fs2dt: Match function signatures
+
+The prototypes of function pointers is analysed and
+compiler finds the signature mismatches and complain about it.
+
+../kexec-tools-2.0.31/kexec/arch/ppc/fs2dt.c:338:44: error: incompatible function pointer types passing 'int (const void *, const void *)' to parameter of type 'int (*)(const struct dirent **, const struct dirent **)' [-Wincompatible-function-pointer-types]
+  338 |         numlist = scandir(pathname, &namelist, 0, comparefunc);
+      |                                                   ^~~~~~~~~~~
+
+Upstream-Status: Submitted [https://lore.kernel.org/kexec/20250517145852.2488183-1-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kexec/arch/ppc/fs2dt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/arch/ppc/fs2dt.c b/kexec/arch/ppc/fs2dt.c
+index fed499b..4952bfc 100644
+--- a/kexec/arch/ppc/fs2dt.c
++++ b/kexec/arch/ppc/fs2dt.c
+@@ -292,7 +292,7 @@ static void putprops(char *fn, struct dirent **nlist, int numlist)
+  * Compare function used to sort the device-tree directories
+  * This function will be passed to scandir.
+  */
+-static int comparefunc(const void *dentry1, const void *dentry2)
++static int comparefunc(const struct dirent ** dentry1, const struct dirent **dentry2)
+ {
+ 	char *str1 = (*(struct dirent **)dentry1)->d_name;
+ 	char *str2 = (*(struct dirent **)dentry2)->d_name;
diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
index d824859686b..7333aa73c17 100644
--- a/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
+++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.31.bb
@@ -18,6 +18,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
            file://0005-Disable-PIE-during-link.patch \
            file://0001-arm64-kexec-disabled-check-if-kaslr-seed-dtb-propert.patch \
            file://0001-kexec.c-add-MFD_NOEXEC_SEAL-flag-explicitly.patch \
+           file://0001-ppc-fs2dt-Match-function-signatures.patch \
            "
 
 SRC_URI[sha256sum] = "ddaaa65b02b4f8aa9222586b1f26565b93a4baeffd35bcbd523f15fae7aa4897"
@@ -27,6 +28,9 @@ inherit autotools update-rc.d systemd
 export LDFLAGS = "-L${STAGING_LIBDIR}"
 EXTRA_OECONF = " --with-zlib=yes"
 
+# purgatory uses -msoft-float for ppc32/ppc64, it does not go with -maltivec
+TUNE_CCARGS:remove:powerpc = "-maltivec"
+
 do_compile:prepend() {
     # Remove the prepackaged config.h from the source tree as it overrides
     # the same file generated by configure and placed in the build tree

