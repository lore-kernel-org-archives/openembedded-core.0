Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C16C3ABB6
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 02:22:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.67820.1746498156088785147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 19:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lbGAU9Ic;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73712952e1cso5049564b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 19:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746498155; x=1747102955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmpEypGKoHQ2yKNwcbjYn4mv3ghfB5ZA6Gpdvn9P1sE=;
        b=lbGAU9Ic20NPAIHsgGZYHuyYzL7luB7fc0iDA+bSZBrpMWjWn4UavZMDMhfTKhhwML
         P4y8WFZ2zIN3kghfgZqbehLlukVkPtIe5MUU/axu1zs0gdE/L1T6c/1R+e0J6jC/izIn
         ZKeHHlB32pDYxXcNU0VvgQXcmEUn0129Wm8QBktY10/FS37ATSXF5AyBJAP6cpizRHqh
         NU4a92v2ZZzxfglo4LuwX/IHFDGcsM+w6bZeGTxxykYFWpoLGkxeQlm01peqR3s3PTbO
         KZUlxzAE0eMDPRFi7LUiwDZNZ/T7zJBaTm53rAYK/i0C2gBqTSbIS53Bchg9WKnBztpV
         fS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746498155; x=1747102955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmpEypGKoHQ2yKNwcbjYn4mv3ghfB5ZA6Gpdvn9P1sE=;
        b=NQgBa6xNYEQfzyBXatwNErirGgNeQW1guMqlizq26G3/ZUd/dToOnq38aK5fyhN1PA
         nhYhECJHYA6atJhzEaBpNa0ZVcdpTu9achJKHEQKI7znJZBFbiUmMtl/h13+ueL9Q7hk
         O9Zk4OHaEGVO3i6xVZROD+4XK3qcbruVikj1qQy+ADAb3j4uLfqc4WwqPgGtCArVV7+l
         PjzKkns/Z1X9/SKefGSTAic2URmHq5TeUo6jjL2Rh75BbJm5AGidSVOVCKdnk6wXI5pq
         +ur3pX2PuQRNFaw8OpACPmzcz66XDVyqcleD+n54nhImJ38QUbEDH5iag/IEJ+0laf0B
         Xywg==
X-Gm-Message-State: AOJu0YzRQJ4vX/59mjI8B2kLZqsWEO/nAHOOGo7Q1QwVGwny6Q4slVIB
	wuRFmgBROVRHxAWkmCMpfHKB5AIVaJi8pKAkmeb2H5lyFpaOBc1BXMe1WQ3u
X-Gm-Gg: ASbGncvjZRrwL7mFyyRhxAfYuCFchF6IX6QfwHk6RtsSZVUv4sQW6nxGiavJqaRSWif
	QfSwxYOxh+3vXOagVOnZ19sXURBPQ0qQHrpRPpk+vRDuruXdNal7BfUPCM2NH04rWT2uHctuowj
	im7Pa/WDzV8NING4VB8ctejaeSKi50tA7oHAvLtS5p1kZM+Na5B+7f8bDDMCHcYR4sr/AENF5bp
	XEiSaeuA5baXXGB5u++rRn5enVC/mV6qm3zhUnMvojJO/dX1B9IdUemCmQQC9R8N7oKCHb4qkYF
	MLlArDy+bJlXOlmvzysrrHEBJz822TqK
X-Google-Smtp-Source: AGHT+IGGpjRtECMBE3otYPLiotr6a5uJADFPzGznm6VosLYKqmpvdzlK6py9CFmAW7eGMGr8yz6Wlw==
X-Received: by 2002:a05:6a00:331b:b0:736:5f75:4a44 with SMTP id d2e1a72fcca58-7406f1a38ffmr11761001b3a.22.1746498154959;
        Mon, 05 May 2025 19:22:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059068e8bsm7616086b3a.156.2025.05.05.19.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:22:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] mesa: Do not use envvar BINDGEN_EXTRA_CLANG_ARGS
Date: Mon,  5 May 2025 19:22:31 -0700
Message-ID: <20250506022231.1665007-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506022231.1665007-1-raj.khem@gmail.com>
References: <20250506022231.1665007-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 02:22:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216026

Its now set in meson bbclass for native, nativesdk and target recipes
correctly.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 66fb896676a..288027bbb99 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -267,10 +267,6 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              mesa-vdpau-drivers mesa-tools \
             "
 
-do_compile:prepend:class-target() {
-    export BINDGEN_EXTRA_CLANG_ARGS="${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} --target=${TARGET_SYS}"
-}
-
 do_install:append () {
     # libwayland-egl has been moved to wayland 1.15+
     rm -f ${D}${libdir}/libwayland-egl*

