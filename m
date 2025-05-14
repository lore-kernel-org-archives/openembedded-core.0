Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4270AC3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 20:58:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.112782.1747256285811332455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 13:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcoKxQrJ;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so282575a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 13:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747256285; x=1747861085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JPLVurDv0CQ13yZOLnYINHC6V0lu95Xi3zAspnWQAG0=;
        b=gcoKxQrJkAty9ZNl24XI55rYw9fhpDG2TGTMFWvDfHMDxdUssP4hc5uuMGGB+nBQj3
         LE//tj1sEEOcS3/dyCgztFJ5h4U0Q6ZiY7Ru4BGPNv3fLMOL4uEQdRgIoz8yUcb3KQta
         aPOruU6djRVgSjvj4AFvJ6wjp0zomvVygKe7Vq9m5YsmjaJ+mq+2X3vFhB9iOSOkL0Ec
         L3JKjmaTmMfKhPCihADfxPp19Z+UYOfDsrgZUKd2e/lXj39kX4sQNtb8WyWwMHj5eDOS
         YSnhwNAURS082lNYVK4LQOGzCGyEZKRdDBrFIfMLoKH8RCcqoj06wEILsZl7yhjKSq5g
         859Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747256285; x=1747861085;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPLVurDv0CQ13yZOLnYINHC6V0lu95Xi3zAspnWQAG0=;
        b=lOdMLhVD0sQMcyBm6lZxgpaDmHW2YvH3U+uz53jREx5kAijUd3plMdi+u438RoRchh
         XDopvs17xAVjWLJYUv0Hv59CPGeFu50Q373ETNvi0b8DDRP71nfdq6FzqS0hv5qHHDT0
         j8ip4IWdWvqRFfXy6P6Ol2ZuYoI1w3HnuKVIblJVzDSQ4viH8ArsM8d/n3G1fyzFRBFm
         tU7H3v4z6B2BNpcgP4DmWmvHoRXyYMhs8zqntalmD8Ueat0QsF2NjmgGwxnOVnAp9tJy
         f0+ihnw4OqqBAU5muPSM8XvQx9rNnrvqz5NEXMnvQ60tdZlGUzDn0J4pwjPBTjJlMcL/
         dL2Q==
X-Gm-Message-State: AOJu0Yxop1j4rf1DTMCssYekJDKLwKAwTaJcTSU77dBxAkIrVjXOnxUw
	/7Cmdac4zYOVgAmZBW+OK83Ye0bpV8VtJj3PO5qgGC2D2zYKOz0fwhiw7wvX
X-Gm-Gg: ASbGncuYJv8QjTzW/tdOws5kPWeuqfKoSw3Rxt1KWEAtcomNH9WYpD7Qt1F02JU2Fwm
	Zvunjl2F4juNcTm+R37R/7hr3gjVsKVBJCZdQqtucv5gLNx0DDJ0ndL99UgGfiycHzqh9Xx/sTb
	YMLCNHIMUMoLy8awq/lDVcwbXqVj+qSqAvuTqWK9WvitFpFaLHDKwYtcRGeHMpWd2WEz/tKtvyU
	Fj6vL7cE0VzfBIJzxBDo0NTImbPWzCcWXMbjw5VPNUqfmhYC0QphQhc4SrGtkEKqsD3P6omuF7H
	Zov3NXIoN6H4ygz1gohKeLokhHWC1JMlUgQjf8AI/McbfemUYS0GDA==
X-Google-Smtp-Source: AGHT+IHE5YiNDZDJXhueZ+Inp4Jlh9jTK0T3OSEk9qkXCZ0v4ArBMiSxsgqMtkL6n+EUoTtYw3HSvA==
X-Received: by 2002:a17:90b:35c7:b0:30a:a38f:f78b with SMTP id 98e67ed59e1d1-30e2e5c24bbmr8242564a91.9.1747256284703;
        Wed, 14 May 2025 13:58:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e3340194asm2027312a91.5.2025.05.14.13.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 13:58:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] systemtap: Remove unneeded -Wno-dangling-pointer
Date: Wed, 14 May 2025 13:58:02 -0700
Message-ID: <20250514205802.566853-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 20:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216550

This was added by me in below commit [1] to overcome a RISCV build failure
with gcc 13, the issue is gone with gcc-15

[1] https://git.yoctoproject.org/poky/commit/?id=4f09a93611134351381415d69228317d8a779014

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 7c9cbe0da04..21d50ffb049 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -36,9 +36,6 @@ PACKAGECONFIG[debuginfod] = "--with-debuginfod, --without-debuginfod"
 inherit autotools gettext pkgconfig systemd
 inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python3-probes', 'setuptools3-base', '', d)}
 
-# | ../git/elaborate.cxx:2601:21: error: storing the address of local variable 'sym' in '*s.systemtap_session::symbol_resolver' [-Werror=dangling-pointer=]
-CXXFLAGS += "-Wno-dangling-pointer"
-
 # exporter comes with python3-probes
 PACKAGES =+ "${PN}-exporter"
 FILES:${PN}-exporter = "${sysconfdir}/stap-exporter/* \

