Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C187E10706E0
	for <webhook@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:25 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10490.1773498016735626281
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Mar 2026 07:20:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fNsqULS+;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852e09e23dso26506555e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773498015; x=1774102815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mWLw371lgtJiwJ4s5uGRGYfIhXtk/PZNC3nxtb20rN4=;
        b=fNsqULS+wnR8cytS/+HZt8b+h4ytKecoB4rYWEv0Jfk6nRKeZ3VmOsJw/Z0Z5/Bvme
         wTc7Hxu2IpX6cJ2thACQaK1BaJarTOMN2n5BlyUMWU/mSnhPyF0cHutKs/6KRuTnZZ2L
         KOxRehZnOzIurzhWl5Y88HKk9EVhcOoh6WmG+w1HSyXlu33B5yj2PG96i/BEOwGDi9FG
         Ub5NBDgo7PEDedP6JkKdnv2xqo5A2rp4f3no3mVQjE4/Dx9lN/KhPLLyCPbe/J874uv7
         XB5rXFrBEDoErhAAh19lqQs0WrN7bxmRPSm8j2bnhIhkxQDLX0TyICNqu1G/vnjyMbjb
         ewgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773498015; x=1774102815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWLw371lgtJiwJ4s5uGRGYfIhXtk/PZNC3nxtb20rN4=;
        b=XAQvMIQnZ8rdkovF0i0gF9mYXRMTw4VY5GxA0GmF/c9wg3XuFxZle/8cYy9szGeija
         EjeZ6Pk5Fr+KRMHxBY8mpGnJ3rWf18dW9djElqcs3KHKa6zyLxRyWedimUSIv+jviTSv
         J9blyvlx2LxhC9GyGJRVNlPmHdno7MyEvH/NHbSRgNGynSsZO8D3etlvb7Xl0i5VUDrO
         jrEBdWTwLrnmt8gqS0FJr0ttQnZ1eYQCoE3BsT9dQq98NnSnoFmX4cubit72YWJ94wmN
         4KsVbxTVtWdbqfmog96T7STkC8xI0GOqXVdxA95iEB30cBkv8gv6KYw4wZVGijEHWM22
         dh/Q==
X-Gm-Message-State: AOJu0YwRdw+OFJO7iqmmG8ZiZfQ6OUgqKyXeEj9iCfWFkXm2e2dKd2fV
	fa35ovhd3Daxwc5t3mTbAf5gjSgbZX5D+/jHut5foOt/xUJa37SedOtiQkbxNA==
X-Gm-Gg: ATEYQzwkZXyyXr9hlFOO6JAbFS6rlcqIF+am1/lrjqbHiG+hE95ktR7FqFEu7yeB6T2
	vI+O4UuvxbijVf5Pl6rWrctjHeH0u6PNn3ubqRhx2oMAW81d7fj5UjzXJLtHk8RnAjWypryPf23
	pMHD6fArN2nV5QR4RMgOwv00y/UW9w/7bsQ8z5iBBvGnVQtNDDqG3dy34cWBlSxxNPp5T4B01wj
	9oXt639YyVDwts4toU/0YdIqUeCy3l1PSa2HUw16G1LQbb5AdsF0Kkj3jZzLq84+KsTwPlQXKpR
	DX1AB21LCHJIfGbjdQrdPdnfcx7RNs3/TdC230CnZunfiMVIvKcH8uklfPwsBLfKcH/iVdkYyJx
	WqSkMiOkZLMjQ5ToFYNTcsqWe2S5f5YyUZfWyjSUYw+xt2tcvfAqBRqA69jxoND+mOG2h2sEHqH
	GpR2qt3yEAwxYEOk00C8rlLWxSuTn70wHkQCXgPMOxSDImphjaRPuYj7CdGBtP
X-Received: by 2002:a05:600c:1388:b0:483:badb:618f with SMTP id 5b1f17b1804b1-485567050dcmr111306815e9.25.1773498014578;
        Sat, 14 Mar 2026 07:20:14 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48556424322sm45900205e9.8.2026.03.14.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:20:14 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 1/2] libc-package, default-distrovars: Remove unsupported LOCALE_UTF8_ONLY
Date: Sat, 14 Mar 2026 15:20:01 +0100
Message-ID: <20260314142002.925941-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 14 Mar 2026 14:20:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233085

ptest subpackages for various recipes added RDEPENDS for
locales that do not exist when LOCALE_UTF8_ONLY is set to 1.

This makes it clear that LOCALE_UTF8_ONLY=1 is untested in Yocto
and became unsupported. Remove this distro variable.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/libc-package.bbclass        | 3 ---
 meta/conf/distro/include/default-distrovars.inc | 1 -
 2 files changed, 4 deletions(-)

diff --git a/meta/classes-recipe/libc-package.bbclass b/meta/classes-recipe/libc-package.bbclass
index c06a2ce90a..73b7f5a708 100644
--- a/meta/classes-recipe/libc-package.bbclass
+++ b/meta/classes-recipe/libc-package.bbclass
@@ -321,14 +321,11 @@ python package_do_split_gconvs () {
         bb.note("preparing tree for binary locale generation")
         bb.build.exec_func("do_prep_locale_tree", d)
 
-    utf8_only = int(d.getVar('LOCALE_UTF8_ONLY') or 0)
     utf8_is_default = int(d.getVar('LOCALE_UTF8_IS_DEFAULT') or 0)
 
     encodings = {}
     for locale in to_generate:
         charset = supported[locale]
-        if utf8_only and charset != 'UTF-8':
-            continue
 
         m = dot_re.match(locale)
         if m:
diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
index bbd936efa6..7adcdfad4f 100644
--- a/meta/conf/distro/include/default-distrovars.inc
+++ b/meta/conf/distro/include/default-distrovars.inc
@@ -10,7 +10,6 @@ DEFAULT_IMAGE_LINGUAS:libc-glibc = "c en-us en-gb"
 IMAGE_LINGUAS ?= "${DEFAULT_IMAGE_LINGUAS}"
 
 ENABLE_BINARY_LOCALE_GENERATION ?= "1"
-LOCALE_UTF8_ONLY ?= "0"
 LOCALE_UTF8_IS_DEFAULT ?= "1"
 LOCALE_UTF8_IS_DEFAULT:class-nativesdk = "0"
 
-- 
2.53.0


