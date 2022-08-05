Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75FD2C25B08
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 13:13:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web09.6782.1659705187235305448
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UEXeL0Tu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id n4so1462986wrp.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Aug 2022 06:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=pDS2Bk+N1B6tb+4lmXTGjMYx8OMJ516WEyrs30wFP/s=;
        b=UEXeL0TuMLvIiN5gEhn3YzxTXXPGXbEPfLKqBn3p6Df4Ko2OId5I68sJRkvrVuCAYq
         tj7Kf5hh7tJyWZu0H4ij4YYkZWKwdlbdpW82PD+uQUyOp4ZzvVA9hYJ2jS4Q2VZrqhB1
         s+z6t0G8pKc6s5+oHtV/cGlWZztE1wMC9Mb2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=pDS2Bk+N1B6tb+4lmXTGjMYx8OMJ516WEyrs30wFP/s=;
        b=tK60LQDyENIemEFm1WP22sBG21tgyVTmfmYnBx7k26k7e8MWNO2WadxxO2y8RPowVE
         tSMr3W4ecMzr71PLS6FUN+XlErFPea9ngKWDou9Lg4x0RQJuZgyB4pXfOoAjWqE06egC
         xWfpn8OlNbwqTkSveVms/Hu95ajfIMdrVLoVwrByDPDYagvbfTjTfEv6tKXSh/8/JXl+
         ijl3657l7vbLILNNZyNnxdVyS5fBE1uOsraqtqQ5h0kdHCELQ52IJpRwmLjivl4y1Otz
         l+btTrOJTdPsMpAZb7qKcJMo5otnj+MYiY16CGgMTj9Kbzs6hwdSViiyXbZyuQDzylyK
         3cNg==
X-Gm-Message-State: ACgBeo1/FF6GepzpUHSujUvNR7dGH/T3ZpFP5XFfT5/RPQtx/2YkbwJR
	NGs2Le/5ItSmO+UMjPQrzLyjt4yEgGshsw==
X-Google-Smtp-Source: 
 AA6agR6gSelEui3pUVP1NsitQvjzdmZVzf78Xuy0iZlMlvB7mrJeedAhhlR/nJvMFSnQe8TIjdoliA==
X-Received: by 2002:a5d:6190:0:b0:21f:cf9:68ec with SMTP id
 j16-20020a5d6190000000b0021f0cf968ecmr4459840wru.696.1659705185402;
        Fri, 05 Aug 2022 06:13:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f483:fcb0:1452:5a5a])
        by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c204c00b003a51a0d35e7sm1908901wmg.37.2022.08.05.06.13.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 06:13:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 13/29] rust/mesa: Drop obsolete YOCTO_ALTERNATE_MULTILIB_NAME
Date: Fri,  5 Aug 2022 14:12:36 +0100
Message-Id: <20220805131252.3706794-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
References: <20220805131252.3706794-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 13:13:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168947

This variable is no longer used by the llvm patches.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/rust/rust.inc | 2 --
 meta/recipes-graphics/mesa/mesa.inc | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust.inc b/meta/recipes-devtools/rust/rust.inc
index 47b76e725de..7d1f5347ea7 100644
--- a/meta/recipes-devtools/rust/rust.inc
+++ b/meta/recipes-devtools/rust/rust.inc
@@ -20,8 +20,6 @@ export FORCE_CRATE_HASH="${BB_TASKHASH}"
 RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
 RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
 
-export YOCTO_ALTERNATE_MULTILIB_NAME = "/${BASELIB}"
-
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
 CARGO_DISABLE_BITBAKE_VENDORING = "1"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f02ef2dc2bf..7e46fd9c15f 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -56,7 +56,6 @@ ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
 export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-config"
-export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
 export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
-- 
2.34.1


