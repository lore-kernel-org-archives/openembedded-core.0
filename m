Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A19CAC54E90
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.37994.1747603861914641622
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cQlMjNvp;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30dfd9e7fa8so4671064a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603861; x=1748208661; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6tUw9L9zU1dmfJwUHXah4Y36T40Z/oth/D+/IA69IbI=;
        b=cQlMjNvpmE1BzdqDNkJfNb3PbrNj5NYvzdOXO6NLGzgDqwXFwKVJWy53WQ9vYIwQal
         MVU09LDjuhHXbLg40QeYgQeUcm/appQ3+dKX1TOMVUyH3EI193vXnvSu2TIyJqWHv3yD
         H9gbOTsO53wHJyN8g++GrGT0vZtDdfVTcwMN9CWjzxLQu6GjYTwK+ni7TIHGXdOwPgUF
         yPwxybSB9gRUhmQUQETchK5TtBdA1uPUFwf7LTJztnPdnSL11JiG225KshjBr1mOXX5w
         SR3lpKddwWSMMPFV9jja0iN33er+cOqaG925HilHf5hvZfrNx8T7MukwSdHPpkeuM18l
         MbWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603861; x=1748208661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6tUw9L9zU1dmfJwUHXah4Y36T40Z/oth/D+/IA69IbI=;
        b=k0JMLFa1tydTsxLFCm+K12kQS1Iy9cVM28AdRENjAXsS/ZmXlEMQAUiasFMQwA3Ief
         //XkkId+Rl7PSDb/hXovfoW3n3i84LV6qm/BEHWIPvGF3SbSqWWvf87iDHKJ0dgfyVku
         MFig6EwjXgO5mkItF3HgoGY0kjestpQXuLa73G8FDSVdy/bg0SKepjqdbQ2aaRy+dmI6
         g46m0ugTGv2rq3ejJ6/nSiiY3MdFtDV4Rlmz7OmMUdaf8ifSw6XN3SJdnOx/I4fUyqMe
         FtPoNYw3ryDQ85siqBFtaohJ3/5qGJU35FbpHFE9fRVFnJbGaN7JRiCFvBZ7Nq/i3ie6
         zoHw==
X-Gm-Message-State: AOJu0YxSYg4StTBAYWNqhqpHirMVkSCzbGTbIbIXrqWE2juaSRGt8OLi
	FEAhe7BiR64eitHFizwFtKZj5Eqd+hWdfNYYCVPBXJJgtjC8gMbz4xSl+MisPq4N
X-Gm-Gg: ASbGncvTk58FGgSu/xog5cAyBGgUC8NPaUskYgS+ki6GhymDDKvpO0PMeiE6MRsUDTA
	HUmOWDZ+wroWTlWypzsQUz1fyb4atkGhvzxDRNViSP6BppEvj25+vXYQJzHazBdlvVqYeYH0XiQ
	j1Tj/VqKSPIev8WxF0V10SdZFBfzEzXP/fg/8c/ArzG5ALH+rkLqUq3i4krfdSCWjWa924wBXPO
	8qI2+YeFPbakZUkhHcFFhcOJpNyXCbdt40Y+7/MSFefkzbpMc4n7Dt8YlMFz6BnvRghEksJWP6e
	9AGrcR2r3+KhKsEROOTE3Tvye5tmQo6ra8PHxFYAb6M=
X-Google-Smtp-Source: AGHT+IG7FU+YCazIquM6NwJFvKYKajrGcZPW5hl2BOY4soO9iliYZQxaj9BnTRlbRQCClTg9jo/oDA==
X-Received: by 2002:a17:90b:4acf:b0:2ff:5ed8:83d1 with SMTP id 98e67ed59e1d1-30e8314fe53mr13828516a91.19.1747603861123;
        Sun, 18 May 2025 14:31:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:49 -0700
Subject: [PATCH 14/21] valgrind: Use gcc to compile on riscv64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-14-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216798

clang does not yet support __builtin_longjmp on riscv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 738a9696342b1d94caeb742b92f74565a5816651..c3b602b8ae8ed7c57cc8c524e3b8398519079b1b 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -33,5 +33,13 @@ TOOLCHAIN:pn-rpm = "gcc"
 # They must be looked into before disabling
 TOOLCHAIN:pn-systemtap = "gcc"
 
+# Valgrind needs intrinsics which are not provided by clang
+# m_signals.c:2213:7: error: __builtin_longjmp is not supported for the current target
+# 2213 |       VG_MINIMAL_LONGJMP(tst->sched_jmpbuf);
+#      |       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#
+# It needs something like - https://bugs.kde.org/show_bug.cgi?id=369723
+TOOLCHAIN:pn-valgrind:riscv64 = "gcc"
+
 # Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
 TOOLCHAIN:pn-webkitgtk:arm = "gcc"

-- 
2.49.0


