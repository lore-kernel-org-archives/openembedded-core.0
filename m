Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00544CCF9E3
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 13:13:50 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.10441.1761311621899416523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Oct 2025 06:13:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q5mojjOa;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4e89de04d62so15634811cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761311621; x=1761916421; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wXTXa7VZl5jePq2UOUXmV1H0XcWxDFFwQKVVzRSxYr4=;
        b=Q5mojjOaLXq6hejBK8o5TvOV+rla5ShiUBV5lfQnp2E/7WFN5zokFV0foh2DYvSoe3
         V3WwSZ5cVUzluul19fKyKErqNda7gySB6zU+etdfm8WEfNij1PVjIH2y+GFtaWi1xvQD
         uPrk0lvR5d4B7nSOjzDONs/wcEyqUifZEAYgeZO2+Cilnkq7DyUR9OyPj3QITf6hVDyu
         JVs2HSXlXODHe1l12EHZXXIeIhEIiyQXfJM4VjoYHg7A3/RH5fVKxD3fbMXqFvrq2H2p
         XsVzPgkkEzTw5IBFD0Ced8xXmFSAUwBpipmiqgDMOLbh/QpaAInPDHyHQ28O9Htlyhuy
         +DYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761311621; x=1761916421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wXTXa7VZl5jePq2UOUXmV1H0XcWxDFFwQKVVzRSxYr4=;
        b=mD5q6iZJoDqGRRxH8Ace4qkMIhkaNwrKzQ9UOnlDDNECFIIuuUtY6cYoBqRHQ2g3A0
         tODAQtz0kj9xNdKPkBo965u3+nqg37I4L+FgH8ULYy8E6aW5bdQFF3S8CudaAolHv5GV
         TC1QM/hkScY6fluuj4p6ElhUYCIWIdjzSzpA3Y5WSAxnRBZyaOqD1i6+u8POLsxwzNss
         SBRYVw8sZ9gIugePM1GCFLV9GKuTgVgVQu5fz0ZsXbxNyutZnHEGVC/2wwTOt1/4W3Or
         FowlWCuF4IfVe4FatBwO+X+/k+p7KmUcJNgv+NOvXw1KCdRsmcC/l88qR+Ka9wFfvHtx
         wxug==
X-Gm-Message-State: AOJu0Yw6C4Q427aAbjTC9/73F2AeFkXFW4/j2NiznJQpbrHBVRj+BWdB
	5eihL5MAC9ABXVYb+UFV3Fzb8pBQ78F3qaNHFU6K3z2BRTE2zjfvgN5+yHzCcE5ANCA=
X-Gm-Gg: ASbGncuqrKKuEf0C1N8M5JDVSvx9GdUsxdykN21CT+ZQF/GMgA+ntwwy7rX+SlFWVCd
	iI0YkJdOvVcr7Vc5ByEhrLCCMyoBrO5qE2lUyf2ezjvTM28QpMNSiSpHckobhkP74Tg7aPvMNJR
	5dL0MSpMLMyiMHv0/2VL9Nzio27lDFNV+DBBdYf7dkrCKMk3fiYm018ydsDvfp2czrFF2ctmseA
	vYM9huIN6ohggfaY3x7djUUUl1pm2EGPNqkBEPSnlAt+EkoCQ6rMVTSF3Ltv0GRys3Rx7ZDUFOG
	7Mg+5rbbBG7ibujk7e9RCNvtG8jPGGd+X+oJy5aAMk6irPa7lK6YSvtcLMrraJXGfb/0K075fAH
	oMsYp8E3aNtCGLhTvs5B4p6uNt9Ut5Ikt6i8YFD6GivK9t7sz8wQ4/v6P7sH7C6cmhHxVVq9iqf
	vP/bdgIuuvF+GHn+MlF3yF3pj7A/Ra6YKI19LdAalCCzwsO9jSFX54IbrDnyduAZ21cH2liRVXq
	/zjNpFb1E+F6FE=
X-Google-Smtp-Source: AGHT+IHNWw0OHwhkdaH//pLO3ymRuzr5VHaDQM95poSnLHVDkQv15rdu0U0CxE3eNeIESOgbX8eoOw==
X-Received: by 2002:a05:622a:412:b0:4e8:b636:fc6 with SMTP id d75a77b69052e-4e8b63611ccmr219735241cf.55.1761311620755;
        Fri, 24 Oct 2025 06:13:40 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eb9b8d5adfsm4876281cf.17.2025.10.24.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 06:13:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][v2] lttng-modules: update to v2.14.2
Date: Fri, 24 Oct 2025 09:13:38 -0400
Message-Id: <20251024131338.3633129-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 13:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225294

From: Bruce Ashfield <bruce.ashfield@gmail.com>

This fixed the build against kernels 6.17+

Bumping lttng-modules to version v2.14.2, which comprises the following commits:

    6826c7f8 Version 2.14.2
    d0230a56 Fix: Add wrapper for `get_pfnblock_migatetype`
    65ea32fb Fix: Protect syscall probes with preemption disable

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

v2:

Fixed commit log type on the kernel version!

 .../lttng/{lttng-modules_2.14.1.bb => lttng-modules_2.14.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.14.1.bb => lttng-modules_2.14.2.bb} (94%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
similarity index 94%
rename from meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
index 3af6db5a83..c9c0b17291 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.14.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.14.2.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
                 "
-SRC_URI[sha256sum] = "a87684b8a58f426e9574c4aa7591d6e49d54469872f9641652df2b4a938f9a40"
+SRC_URI[sha256sum] = "a581dd44ea61af869a935e71498d4273be59944d56f906135c6451d6548742a5"
 
 export INSTALL_MOD_DIR = "kernel/lttng-modules"
 
-- 
2.39.2


