Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8F0C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 04:09:19 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.13146.1752811752278699527
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 21:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjOANeZL;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-315f6b20cf9so1755766a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 21:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752811751; x=1753416551; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGR/XgjEKvgyGFlnRKTl2QJYC7BaaPVbUo1r7O5u4sU=;
        b=TjOANeZLpmwQ0roFeuvF0xjsgm2qseJn5oVuICHv5SXWIoI5Ppj4S1f+ZJbX8ygIRi
         8PKcJ61iJYNZm3s4LbDwAsacHv/JOii1xkPq5edAxXIXdiF2fXNdXhZYbhaFL2/FcNQm
         72kTwz/rMAUuTPnPKEXt2PtNDRzFlLCQ9MtRfLWYtxJkFVFQO4tZeVBP2UydAd0Cr8Vv
         5g81EjAAlKT/qY3OBlxQQwo5nFNWpOzllwWb5kXR9VC8dztP4Y2XNCpt+W4Od3L2degW
         0/6iAQ165xyruSP+gLEBP5mEst2fwsbnFXAwEWLAJ2omjeFrs9GkDoKBnMeNKIYXXo/5
         WfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811751; x=1753416551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGR/XgjEKvgyGFlnRKTl2QJYC7BaaPVbUo1r7O5u4sU=;
        b=C1KpbnBWbTwo0DEQrkQtexxAcaO42lyB74FcTjngF531M5Tdm6BxOAidjoqkbpYOyi
         NxYRCfq/Eq/nv18YOXhCSRVsTxbhFWxtxRGLwWfg+7PlMITrE2s1Oc717TJRE2ZNdwTH
         hYCAO/GAQqLJWtevomm7+TPrqTRcKI5ZvaTM54C3vO30QiYUnl1bgko3n5pHCrFDjf68
         A1lBJVAQqNocfgy2yoQkAaaHAO8ShgMtfeNEzFImm9G5574rDq71BRPq5kmZE7LpUazh
         PvYRJTU3zL+cnsZ0EZ2L//aYLJB28zMtSi7nrERnHiIVFv+8CYkmoyOtWx4Pi8V3vhmg
         CbYg==
X-Gm-Message-State: AOJu0YyfaN+B319QGFD8vik6/F0gvZrJialIlN/5GmIZz305kmf+6fc/
	VDdn3y8ybCI817LWDjld4LWGCDi4CTjz+OfXrkBUZUkS4qResV0GnuAHJmS4AmzYOEU=
X-Gm-Gg: ASbGnctZ+HKrWl28/nLFWoxif58utmHH4LXph4DY7+ai0Y890fhAi0Y6Ey7f+zAXRL6
	d3g9sLJMsyMwu4NRjeWmJQ3AFy1XUx0JIP9yXE9LXI1E0Y04F60jJ4t/mpu7zvF7RS437JBGoug
	pWmCU11bcUwdhZkr3cim3ExJRxHZk8BECGuE+YfEkT0km432Ik1hI6e4+jU085csZY7HsS4LoOK
	x4EOEgKziEWSeBiKYc4ZSGcaXyTIEa0PqXblNg2wme48BYmbJrUlAsh8pclz53LOKCcwYzsVup6
	ta/fvdBVJ/wn+eEFzGamqu+NOBvslLf09+7HSQo2e5q59Vx0Bhfhi0nLwuS6XcG6eBaDsHS57ae
	raWffpXL3BXM1eSnXrjb8/jsB
X-Google-Smtp-Source: AGHT+IHPfAwe5M6yTgE0qNxQ9g+B2wIlFC5LSjOkZ5gduMh2sabmunVbF9xyihReUE9n5E+452UZjg==
X-Received: by 2002:a17:90b:582e:b0:313:23ed:6ff with SMTP id 98e67ed59e1d1-31c9f398d46mr11278304a91.1.1752811751222;
        Thu, 17 Jul 2025 21:09:11 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2fe8d14fsm417157a12.26.2025.07.17.21.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 21:09:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] clang: Default to use lld if ld-is-lld is in DISTRO_FEATURES
Date: Thu, 17 Jul 2025 21:09:05 -0700
Message-ID: <20250718040906.3591603-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718040906.3591603-1-raj.khem@gmail.com>
References: <20250718040906.3591603-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 04:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220568

This ensures that default system linker is used correctly based upon
distro features, current default remain same i.e. uses BFD linker

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index ed6e2d7da7f..1210ca92de1 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -54,6 +54,7 @@ def get_clang_target_arch(bb, d):
     return get_clang_arch(bb, d, 'TARGET_ARCH')
 
 PACKAGECONFIG_CLANG_COMMON = "build-id eh libedit rtti shared-libs libclang-python \
+                              ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', 'lld', '', d)} \
                               ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcplusplus libomp unwindlib', '', d)} \
                               "
 

