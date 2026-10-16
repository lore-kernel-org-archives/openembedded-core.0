Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8270CCF2C3
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4274.1792184079526188973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aRtZ+7ru;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: oo.hehir@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6aa8d04fcddso632478a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184078; x=1792788878; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qPEK1rTdFEdZ5oPeJJw4naCruDv8Q0ZlJwyIzaArudE=;
        b=aRtZ+7ru0JDbWRNKsUxjbOZjpenYaLyTwRkhBwr3dlSVSk6ZPpwzHTTchmVZBixxli
         tAdWQ0t0MHrYS03uqWAH5/w5duEIa3iFJfe2VMAJvZTT59/WEqdOv03rsFNVgPL1sh4s
         dbozUerw9VP+EGXJ3QMzdw2Gwfdp9OZVXPzg7IN415WjuJ10rHYtuHcUThO5/K/On8Ag
         uHPqj/GoRzoWwPwskGCzTMhDslyv1JwcbY8r/MIlycrvxFH0Je3Xlx6JctkhzGmSRH73
         2USjBAcJur/E3b9luo5NIlVMrWzP7eFEsuTQ5ifiwXWW3c0gATdaTj11fWpuIrTj1lBo
         0eKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184078; x=1792788878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qPEK1rTdFEdZ5oPeJJw4naCruDv8Q0ZlJwyIzaArudE=;
        b=I9tYGoPZVKK5fmLjiUoa1dIIwdsR6z/P61LEhf39xOSR34927jCSaeDjc/Zryeriu1
         KwI67La+Vxh1/LBzH2aSKYQOOeaoCFW3I4MiW5ZF4WAkIZnBO4h2LAzWDTVMVDejBHVY
         vI3PcqvDwv4wD6inqAIb9RHimc7EVW5/XaQiThWolGXLZiVFiufCfHetoyEkGvPEk/4j
         1KNQK3bdd/jv+sv+1ki9y3mKyR2ObcK4hkFwQLExfjLKmhhSJws+Q3Dfop6hnkeVHZY3
         MWR+U8CcuLpM+qg50MqFrCDAT/06zYmPgq6p6dgalDTvP1bDBv5ftwi15S+MS29GC7tv
         LtTg==
X-Gm-Message-State: AFq9FYJK3/DzMtiadBNuKZZ6wmyi1WaEuQh/tU0ZQZOr3+5zAvUEcaKz
	K73sbf4Bv4RKW5G/UienQPYGdig8O3Qu0Z2TvgnOXdCxISMQBiSyKQU4aUCTag==
X-Gm-Gg: AYBFou17EuTtO/En0g8uoOIh3t6M2bla9B/mKGrcv0yPY4DjfHE08cPd/lWAY5eE5bE
	4+MaBf1g3dSWUJhP0mr2DHC8VxhYOjbqnSrO8uI7zkCxFTS2voMkNPggoTREwB2janMZI3nImNQ
	PlJIxsAFVCFiAVnVYBjnRO4jh5PlBf/796BOD1UO4kFtjYvGywERojmOHESmQG1THBjQumZratE
	1bqoEMz31TgbsNfGbURCE2V857wAFKKcTy2mhR6LkQY0E5/VrI+GytJ/zq1mvBVyh5DhmkuRi5e
	REa9kVFBRXJ4zLbGcZ0W/KJM060MbYqvHt5Y12n7nnI/Z353CVkeLywLNVMDdPv8198NeB0vROG
	RnwvMIpat0ca9EwMDUl/ehsnRb1YNgof3vS2dOldrv5xplty0sp9SFBbm8tkZa2RSw/fht3btzG
	BOs5qOcvLvFMPTOnWrSv9sqBUM+4A6WyQRxRQy4g9KBvjBVXAuOjfSOQ8Ix3W52KcHjqNJU8lir
	uo=
X-Received: by 2002:a05:600c:c090:b0:4a1:ac66:604b with SMTP id 5b1f17b1804b1-4a1d75a470emr15539305e9.1.1792183663811;
        Fri, 16 Oct 2026 13:47:43 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:42 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 7/7] python3-numpy: call libm for ceil/floor/trunc on riscv64
Date: Fri, 16 Oct 2026 21:45:36 +0100
Message-ID: <20261016204547.2328847-8-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248045

numpy builds with -std=c11, so GCC 15 onwards expands ceil/floor/trunc
inline on riscv64, & its first scheduling pass moves the fcvt above the
|x| < 2^52 check. ceil(+-inf) & ceil(1e300) then raise FE_INVALID, & the
72 cases of test_unary_spurious_fpexception fail. Confirmed as
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127908.

-fno-fp-int-builtin-inexact makes GCC call libm, which handles these
inputs correctly. python3-numpy-ptest on a VisionFive 2 (JH7110), with
2.5.3: 45770 pass, 0 fail. On qemuriscv64 with PTEST_RUNNER_TIMEOUT = "7200",
with 2.5.4: 45993 pass, 0 fail.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/python/python3-numpy_2.5.4.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
index 93aa356db1..192ae3fe75 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.4.bb
@@ -26,6 +26,13 @@ PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
 
+# GCC 15 onwards expands ceil/floor/trunc inline on riscv64 but runs the fcvt
+# before the range check, so +-inf raises FE_INVALID & numpy's
+# test_unary_spurious_fpexception fails. Make it call libm instead.
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127908
+CFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+CXXFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+
 # To ensure reproducibility, remove entries from __config__ which expose build
 # machine details, such as build paths, host paths, and hardware configuration.
 strip_build_info() {
-- 
2.43.0


