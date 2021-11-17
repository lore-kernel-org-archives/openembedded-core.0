Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A2FC4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web12.8707.1637163342358852704
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vfid4d5n;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id o29so2625829wms.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1dnQMg+m+z3I4TnyE38DT95NmVP306RJxmiBSGI+BDE=;
        b=Vfid4d5n0g09odHH5okmoBVWw27k6tURk30tFO02zusjEQvZrxxQqC2ThjoWEaQIxT
         uJxfCyXnnPOkbY3foWkttWIW3SRZfeXbe2QkzX2diEsxsyrCeaZvYFgYW8c4A/MzjFSm
         dEBdjF3I/nFLySVV4vwOhj17/YLq8nvX79YgF1BajYLYnOA4QsRaMkW+I0MfSYyi7zdC
         DN8/vB9Wu+sp6+bltSU1uxrVUpsRO0UNHijJcDk4nxycANH+YdCrhIpvaagIuiAtct0c
         5ygv5fV4tcQ3Zns7nNbHsYfJBf50hBbopEGsv46aUzFKWes36vRsJfQRd7xi2m2768Zx
         mp3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1dnQMg+m+z3I4TnyE38DT95NmVP306RJxmiBSGI+BDE=;
        b=2qFQe9FKGRt1d23TcMKhBS23fMOuooa3nmW7uLyIOS6cfnHkgU5FGnF+8ohLXu+Bi9
         a9KZM0Jqp8KE3n8h8Hmf4slwKALDYySQ9gLigQZsShvWqSyFyVw7UDgesMRFY4ors2lM
         ySkMy40iF/oLwcrujmlLD4usaznBcY3sM4qHkGll072MR5vu9w5i95Nvm0mrM4TK2wvH
         ndmS5lB5AygJISEArzu2diWGakrygV5GiFb7bIfMh2HLH07Y4zIyFdHLUT+0qdqV3b8w
         guUvcq53s2v9EqAN4SPZ0rRzluwmAS97413M0qJKC7DzAD2vr5Iuq3rAEkCYlsK/DIPQ
         digA==
X-Gm-Message-State: AOAM5300evoPU5RYePo7bAsYQui9QR5aq9FeHUY+PMnyfyvKlxfHlBSb
	QL+6Kbktlld3RVDZ7YZ9JPjAB+gLIZk=
X-Google-Smtp-Source: 
 ABdhPJz8TpGuWhQUgKIYo9KS74c+utrduHc9N3x5W8x7UBxv1xL8aXv/XBILneYrsg1m1jTwVgv4WA==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr623643wmg.67.1637163340931;
        Wed, 17 Nov 2021 07:35:40 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:40 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/36] librstd-rs: submit patches upstream
Date: Wed, 17 Nov 2021 16:35:10 +0100
Message-Id: <20211117153525.257146-21-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158415

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0005-Add-base-definitions-for-riscv64-musl-libc.patch        | 1 +
 .../0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch    | 1 +
 .../libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl.patch | 1 +
 .../0008-Update-checksums-for-modified-files-for-rust.patch      | 1 +
 .../0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch | 1 +
 ...06-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch | 1 +
 ...007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch | 1 +
 7 files changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc.patch b/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc.patch
index 180e2b59ab..dedf9af415 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0005-Add-base-definitions-for-riscv64-musl-libc.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 5/8] Add base definitions for riscv64 + musl
 
 https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d53752e60edbd330a9d718d
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
diff --git a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch b/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch
index 047c4f2aab..a037d407e6 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set
 
 https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba38cdc1d72ac694d65a3
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
diff --git a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl.patch b/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl.patch
index 211d2e270b..aca6290fe7 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0007-FIXUP-Correct-definitions-to-match-musl.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 7/8] FIXUP Correct definitions to match musl
 
 https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c708515ab116786554a3
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
diff --git a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust.patch b/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust.patch
index 29131a0e1d..d513e9063a 100644
--- a/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust.patch
+++ b/meta/recipes-devtools/rust/libstd-rs/0008-Update-checksums-for-modified-files-for-rust.patch
@@ -3,6 +3,7 @@ From: Ralf Anton Beier <ralf_beier@me.com>
 Date: Sun, 8 Aug 2021 11:19:24 +0200
 Subject: [PATCH 8/8] Update checksums for modified files for rust
 
+Upstream-Status: Inappropriate [previous patches need to be upstreamed]
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
  vendor/libc-0.2.93/.cargo-checksum.json | 2 +-
diff --git a/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
index c141e7a539..f47ebd586b 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0005-Add-base-definitions-for-riscv64-musl-libc-0.2.93.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 5/8] Add base definitions for riscv64 + musl - libc-0.2.93
 
 https://github.com/rust-lang/libc/pull/1994/commits/030a07761f61f3293d53752e60edbd330a9d718d
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
diff --git a/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch b/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
index e993c45dea..ee995286e3 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0006-FIXUP-linux-musl-mod.rs-add-riscv64-to-b64-set-libc-.patch
@@ -6,6 +6,7 @@ Subject: [PATCH 6/8] FIXUP: linux/musl/mod.rs: add riscv64 to b64 set -
 
 https://github.com/rust-lang/libc/pull/1994/commits/30070c822be2ef399b2ba38cdc1d72ac694d65a3
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
diff --git a/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch b/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
index 77e6b0ae1b..e23aaa790e 100644
--- a/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
+++ b/meta/recipes-gnome/librsvg/librsvg/0007-FIXUP-Correct-definitions-to-match-musl-libc-0.2.93.patch
@@ -5,6 +5,7 @@ Subject: [PATCH 7/8] FIXUP Correct definitions to match musl - libc-0.2.93
 
 https://github.com/rust-lang/libc/pull/1994/commits/5f6a4d9745c79c81be63c708515ab116786554a3
 
+Upstream-Status: Submitted [https://github.com/rust-lang/libc/pull/2537]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Ralf Anton Beier <ralf_beier@me.com>
 ---
-- 
2.20.1


