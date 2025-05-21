Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EB9C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:24 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4717.1747808415671383287
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UvQwjgdu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c9563fd9so2912762b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808415; x=1748413215; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hsFvsE9IF/OjIGztiyCkV3vX+BneNOp4QJtQnyyePiU=;
        b=UvQwjgduVWXcwRoHmHtplMhnCfuaOXmv+6ToiPQdiczhKaWVspfSHjNZmIws2mgPAp
         ND6eunKW6k+R0otqx799iQgpSLZWSgzilR18Fq9EmrPhz38SPXi82hELy+1lvAEMmeCw
         px/tY2fIBeptPzXJnFYErPmXmBnSFPK3NkC6ZtACgUD3Qjvi0agvcyUnfVPM+qrDTNyT
         fKiLIbApvA684WDIxD7HDGbFADCubWBBJVDyFzW/8wPEtJYQZRwjrLhoSV4lw5uWbGGR
         wMlgpkf4SiTc9ZGCVgWTOVBPCje89UZUjeCxxuMUZteTkadaQTg33QG29HhykMlLjXUQ
         vpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808415; x=1748413215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsFvsE9IF/OjIGztiyCkV3vX+BneNOp4QJtQnyyePiU=;
        b=Y7LG1vwm8/17qrWM3qqWxb5mwqA5kJkJ7Hyo/Fh6Fig8V/n6RPXMRxyTUOZPsAWSk5
         6I5mIZpU6fDKLmf1sMRxjdcdOiMu4dD8sFu/um1K8MQsJNrRea8uifb5M5MirBbIHSf9
         3ue8jPBA0njgezTcEIabnwd5iPyJdB9k0SX4C0ahfFKbA3vaMEa4FhhqgJc/xarxlKeG
         vb+/mck4T4b25blEuOA41CH6iwSZUf4u1OdXFNApfamcjYzv+knbA8/as153eOMryu/6
         pQlIL/MABqqXzST1dxhbKM2+sZFTqbC+iH0Cwh3tIcIYHa9u1H2WMA3p3g23pMTvSRJK
         Y53A==
X-Gm-Message-State: AOJu0YwxFZyLtxQFf7UGm/HHnAfZMdDDyo8xKrvMhbI21xYgHVUOMm20
	uuH9W8PGmvl6AmLsn09hyDEcTE38ExKwVierFM/GCoV6RfJ167rIyYAUjYD07pKO
X-Gm-Gg: ASbGncsvvJAk93TkHSoZs9uL70e2VGA2InQzBoqu6uTtLVYYdpYDPdOpFP9g+dz0fwr
	wc1gE6ydqXg5r9vHCLpXtm/E2+OjvEzh8NCHYp4psg/7aYV1jgka0TKk9g3JTCzBoe7vYAq8T/z
	gQ1d3eealHNzQiLvI4DncHAIhy5z++SJI7fBF7yWS3mierTfW+DIv2Qk8Z0WVGscm63WL8zrSiJ
	0pKWdIwNzXbE5Ww7U3NUNC80/6mexHU0o1IsL6mV0f0P9L03mMx44qYUq1+zh45+OGyjF2Q1ijH
	qyvFA8KUAPCeHcvPFo3g59Drm4/tz45gs/EdHtAuJY9CkmMxs/QUnQ==
X-Google-Smtp-Source: AGHT+IF6AC2YfM33zyVBVcnwIdp1FZhaFtwAOJhDFHOWsfwhT2XefiJaKpWBOzXUjJ1J0c+JolEoKQ==
X-Received: by 2002:a05:6a00:2d0a:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-742acba74dbmr24798867b3a.0.1747808414826;
        Tue, 20 May 2025 23:20:14 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:20:04 -0700
Subject: [PATCH v2 28/28] perf: Do not treat maybe-uninitialized warnings
 as errors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-28-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216996

Clang finds more warnings in kernel code, make clang happy to not treat
these extra warnings as errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index d06dd2fa5a2bb9b2982572081ef57e2dbafbd5da..0d19e1bdc222da26a5ad0a1d4964acca437a6692 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -81,6 +81,16 @@ LDFLAGS = "-ldl -lutil"
 # avoiding the 'buildpaths' QA warning.
 TARGET_CC_ARCH += "${SELECTED_OPTIMIZATION} ${DEBUG_PREFIX_MAP}"
 
+#| libbpf.c: In function 'find_kernel_btf_id.constprop':
+#| libbpf.c:10009:33: error: 'mod_len' may be used uninitialized [-Werror=maybe-uninitialized]
+#| 10009 |                 if (mod_name && strncmp(mod->name, mod_name, mod_len) != 0)
+#|       |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#| libbpf.c:9979:21: note: 'mod_len' was declared here
+#|  9979 |         int ret, i, mod_len;
+#|       |                     ^~~~~~~
+#| cc1: all warnings being treated as errors
+TARGET_CC_ARCH:append:toolchain-clang:arm = " -fno-error=maybe-uninitialized"
+
 EXTRA_OEMAKE = '\
     V=1 \
     VF=1 \

-- 
2.49.0


