Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29819.1793868239188537959
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 00:43:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=cg6mV8iU;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48fd2e38825so1067563f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 00:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793868237; x=1794473037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nbJWA50zTWD41uQ+vjmLGT1Aro79YMuaubkbTTaLqk0=;
        b=cg6mV8iUbJEsl5ggkSxO8+4uoOKunUlzc9uW/2LJiOSIKWBvUCMlCwjciGVdIFKGvR
         357l2Q008WMUKk/jy2GdplIK29xa/Ig3JrCg8jsmAIXisav0JuioepaUvdgVI+EF1Ieh
         nfY4B6LYgdi3UG/d5CSpLGtnVflEoIXe/7Bf8XXVECTnAwWGQ4/9nl5PH7emWKjiZYy4
         z44TziDhU1Q5LrStjyc78+/sZ5rZCWNvWjMkUqw5KSG1gt1KXa6qlah6frvyZf/RMFWp
         pphdW9hisVeZrYdHkBMTqs4hnXkyDeZlbShC1FS79Sd+/Cb2pn97ds7FdRfLKIlHS50l
         ocxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868237; x=1794473037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=nbJWA50zTWD41uQ+vjmLGT1Aro79YMuaubkbTTaLqk0=;
        b=qdY7uJyYUfdtrvchlw7LATLAoeiCPY2rnRL/hkMI5grTXSzijpgxvk4g3Jfd2OnBmY
         ApLcbrhixXR+7BGJzDPTGWbonZZDcOHJTF8wnYdYbFXiw1s9uNBNc6C2IYRiOqCki5mJ
         ZsdxAGQXJLa7RyG2LYUetCFQpuaZ4WqOfJsnwfG2GKHD6plpPx7rY2MTsfVVY4TEWpd2
         KEa8TB7fTptyN69x58CQO+sP3bcfDnRJRNN5EyZ6j0jhIHoJdl7JFbFlz44l7j3HxMz9
         FDn1ibsD8OL7V5XG2hofGWvhA4ZKHtsn8Z9i/8trT32J5GW8W1WdYwbnFVXkX5tp3TGX
         h0Qg==
X-Gm-Message-State: APuU4Z/oNjOwloay103M2BT8RjJqRdP+3tBVJmPCQVSE0w1ltu0Aw3gg
	TTREeStAF8I67zVwlF6ERCOXeOQJTYxduKd/lWAs9PTyEsca3RxxY4ZMUyeblcVsjwM3FaNXD7/
	x9gV0rFI=
X-Gm-Gg: AYBFou0snfNBIcHrR6Og8PkbagjArD1H3nUHc0bQfx3+5nFp9PNta5kPRvYome94sWZ
	RNsV42jRHuZl2Kf0tfh5zyF7zwEMwibdNr06fwctjINEAZi73IOxtHlFM/Qv4c9bLysMPK2/kXY
	v9uQ9gjS0TiELlRPP0pvH2kDHT7Gs5NqFVwDmIamputsYodSVOh6K9/4AUZgE9aXOOCOIEQJ+XQ
	hhXvJlCZXniMxa5+fSCVexmtQ3kCZ9XFLoAmwAw+XrunFvjeXuubWM1o7tcR4UI7Engxcrb6NHC
	Fw9hNGS2wPHf+sU4vIWabxvmCPwgROi7G5/ZorAYctg0+dMasPaVAwumq40rgu2/ynJKKMN/cZa
	q2BRAIXQikRpZ8GYjpPnGaCl6KLfWRGqG8F4Faqxvc+7cMidMFM2DqIq+3xJ1oz3Y+Fe7o6S8zY
	IHuXQge0DOqIM3MVcTtmKESQ24Hhpl1bDbLGdhCjIC/jk42JgCQTsB4wRvFUG2Q6mhDKhMtu+eW
	l4iwIocujWrcNVXYrfPhCnXOnJDc76B2hsdtwbpikbti4Rke+uSt8BCxsh09qR9Dm/pNVuDgyOO
	Vmjdmw9g0X2Y5NJdtJX9X92moJlYT4wM+jH0oPIzQzZFo4lafQ1+TpWz2gBQLe8wS4Rhypy+I5g
	pn5QXQ098UR6l7pko5eCo7gukbnyU
X-Received: by 2002:a05:6000:2210:b0:48d:ed0a:e064 with SMTP id ffacd0b85a97d-48e6e4f5636mr38631673f8f.24.1793868237437;
        Thu, 05 Nov 2026 00:43:57 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d8e29sm9200620f8f.19.2026.11.05.00.43.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:43:56 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail 34/60] python3-numpy: call libm for ceil/floor/trunc on riscv64
Date: Thu,  5 Nov 2026 09:42:53 +0100
Message-ID: <36c20b7f159cacaae09d748721194e0a11bb7a74.1793867929.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793867929.git.yoann.congal@smile.fr>
References: <cover.1793867929.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:44:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249493
Content-Type: text/plain; charset="utf-8"

From: Owen O'Hehir <oo.hehir@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 873468f620fdbb6d5a65bbfd842ece53b1f93748)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/python/python3-numpy_2.5.3.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
index 338bdd2bbd0..c95c00841a4 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.5.3.bb
@@ -26,6 +26,11 @@ PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
 # the overflow tests fail with compiler-rt on aarch64
 LDFLAGS:append:toolchain-clang:aarch64 = " -rtlib=libgcc -unwindlib=libgcc"
 
+# GCC 15+ inlines ceil/floor/trunc on riscv64 with the fcvt ahead of the range
+# check, so +-inf raises FE_INVALID; call libm instead. GCC PR 127908.
+CFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+CXXFLAGS:append:toolchain-gcc:riscv64 = " -fno-fp-int-builtin-inexact"
+
 # To ensure reproducibility, remove entries from __config__ which expose build
 # machine details, such as build paths, host paths, and hardware configuration.
 strip_build_info() {
