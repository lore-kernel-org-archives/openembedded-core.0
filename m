Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D99ECA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 05:53:38 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.48225.1755410016138266285
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Aug 2025 22:53:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IKfdpBZu;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-76e2e5c0d4fso2384944b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 16 Aug 2025 22:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755410015; x=1756014815; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjteT9FLYkdQ6z5RVYHECT9H/G/0IPqhHJRa4E98p94=;
        b=IKfdpBZuIY4p8kgo1g9WGazm1c1DTw26Ys+64yK6tWn8JxGMOLLwmXDG+NCnlf/25G
         3nw+Vn426bSxZLYw6lC7E2U7iMHtZzFAGVT9COjE6o2vdEuO6S7Z6TCsxt/apYcc6iR/
         vTw4extf+1chF19/J8wqyKtxklYx/thndkdFWznt2GZPv90dcGKsRnIK7oJ8WHfMZUMm
         J5wmUskNtKnZwvGZmTHnixw3IGcA/ynq3wBNpzZWMvlPx36pcSGwsuT15F2ZmWgCsYst
         rnqyRozg+GhTSrLzLkUKzymG1XMUsHHNbXrXk/Y5xmNQEIZprWIIdpHUyDdWrAvbc0Vf
         AYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755410015; x=1756014815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjteT9FLYkdQ6z5RVYHECT9H/G/0IPqhHJRa4E98p94=;
        b=eX5nZSUpjQ3ItbhqgDyZ+0ulRI4TLvaRbLP72DP6WeqoNYzlOE/ItkSLSsXTvgSDwl
         bgChPlWsa2nNgbU6pfqpSeVhtYi9tkbrky/O8Lmw79ZcQCgXXMSjfTziUPoTDVL/oLON
         ie1nN20EstzNK5vN5l0gr9fWScAwoV+SjQI8prhFqM69N51RBhlIli7SvkeuqOZ5oRpA
         +/uFBEtZ0cS88tc07wQDdR77OdB1H1po5/Xn8PX84J0jiQle0tGO+2b10ezjmuwUGdey
         oEv9JwWn+4B0jZM99v8tZYjFj/eHvWbeY6eUVb8cOnDJBMlK28zDOW3Evir1moQOwdc3
         6EOw==
X-Gm-Message-State: AOJu0YzstkfIu/ci+1mcNTBwyT2KILOpDCR/9u/aS6bN1u99FSdBzhvh
	Mqb62O8oAxfmPwMpoaR8l1OI0tn+MOWu5IlF9KJY//RvjXn3S93N8hq0dDwPCPSv
X-Gm-Gg: ASbGncsdTySvQaf7lwU/fJdoxB7ah2V4ogtcVVJ/7CpYSYrxegdV6HSiLTHiBYHF6zG
	pnPimq0OOOFDughzasByyjj60+tobo3SqI8LTJgJGbNps4wHO9phK7m5LTqg1D33dp44dBn26mV
	VDPErdaFpglcX/DbjCNAwybRIEUcewnWIIZiqG0R5K35gbG5zBHkmdDyKjmWn1RavZhs/T69tHH
	k9gqY716kBNBpcma2BfMW0snxAHVuaSnYPJr27vRPb7N8an7sBCTTTcAurLjiJA1lkAHyK8/lpX
	Ypg+l2tlneEvTt4ipxhYMbqHGqaUSQl6S1QLpeeeEM4vgh3SadFW9/YTaHxN9r47vkcjp+QH2y+
	u51hty078ftBC7YDblBc7LA==
X-Google-Smtp-Source: AGHT+IEp16Wxb0uRo6u4MdC5Gd+2BkkCGwmtksmeQ3bWYCllW2ScXdeJjBEMvRZQvTNIit4cMn60tA==
X-Received: by 2002:a17:902:e88d:b0:240:5bde:532d with SMTP id d9443c01a7336-24478f9da45mr89456095ad.38.1755410014797;
        Sat, 16 Aug 2025 22:53:34 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d38b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53ee6bsm47845715ad.119.2025.08.16.22.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 22:53:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] perl: Disable builtin memcpy & string inlines with gcc/x86-64-v3
Date: Sat, 16 Aug 2025 22:53:31 -0700
Message-ID: <20250817055331.3475136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 05:53:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222000

PERL built with GCC 15 and -march=x86-64-v3 fails several
op/pack.t cases due to aggressive lowering of __builtin_memcpy
and inlined/fortified string ops. In pp_pack, some in-place copies
can overlap, treating memcpy as non-overlapping yields corrupted
bytes (zeros or wrong prefixes).

The issue does not reproduce with -march=core2.

When using x86-64-v3 memcpy gets emitted very aggressively
(vectorized / reordered) and assumes no overlap.

The flags force calls through libc (overlap-safe behavior),
restoring deterministic pack/unpack and fixing the test failures.

Inline functions could be faster in execution but correctness is
more important

Fixes [YOCTO #15950]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.40.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.40.2.bb b/meta/recipes-devtools/perl/perl_5.40.2.bb
index 1df1467d424..a78d2ed0be9 100644
--- a/meta/recipes-devtools/perl/perl_5.40.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.40.2.bb
@@ -54,6 +54,9 @@ CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 # https://github.com/llvm/llvm-project/issues/152241
 CFLAGS:append:toolchain-clang = " -fno-strict-aliasing"
 
+# Needed with -march=x86-64-v3
+CFLAGS:append:toolchain-gcc:class-target:x86-64 = " -fno-builtin-memcpy -D__NO_STRING_INLINES -U_FORTIFY_SOURCE"
+
 do_configure:prepend() {
     rm -rf ${B}
     cp -rfp ${S} ${B}

