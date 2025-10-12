Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE3BCCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 17:14:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.22756.1760289262939393946
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Oct 2025 10:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MfzVeWx8;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7810289cd4bso3442737b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 10:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760289262; x=1760894062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPHXifR7YjatEjZSkmeOU67UdBsgDcCN+rjgnRQyxMs=;
        b=MfzVeWx8ovxsO96QdqjgHDWkHRLBIzWL5cwBJ6GpPgS5IowWSUYd334rfcP/ohaMHh
         w+8SyWTJiFy+/2GOjWVuLLMI4fAzj0akrlzodFDMKtn4Q7GigWkJcYDUdTr38M7UrRbG
         44TPlYfKPQQRhKAV8BOuxD02XNIiFC/p1Zp/+xU2c0JVeCYCC+VHfz56Z80RYYGpwBts
         yVc1F/SqR/SmfrsM1vn2g84J3x/VZJ0p/k7fkDaVq8LiSgpTV7I5Mvjws3U/YloeYEp+
         IJBnolCLIPPT5OqV+maXTwY+8/Qtq5XwQZE3azzJu4e8cn3qP+kzAOQYJd63DuLpQD+0
         ugQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760289262; x=1760894062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPHXifR7YjatEjZSkmeOU67UdBsgDcCN+rjgnRQyxMs=;
        b=F7X2Qg03l82AhObgD1fjFsJm7QF3qJN7arG7flddQQP9dWF7+77xOIlgDAbTeiQ1wJ
         gbjjOC6TPYKLugtgLcfTM6xFCn9GjL9j2+gv5ztHb6mzNxCHCD+EYc/hU2mYo/LIKl9y
         BTMCT2x2d9+5Ou7EQhKXffLA9CzrjR2e9ljm1nQKln/zbBTeuUjUno969uZR0bDz123z
         qDgjXCZVhZhT5eywIJ35oppCPrLsJDeTuLIYrC2wMP2eVc58plglkbvWEq/hPLnTo/Lc
         BkGVasZET5hEkXrWgMp2kUroSmKjcrsZQKnTCNpucfbY3n6ViR4alB26R8JR+xashkdr
         D9Jw==
X-Gm-Message-State: AOJu0YxgcJC0MD0aiR3BEfBXZriJSSQs1kdjmH9AeyAAeD+OhTPjs9wT
	wlaDqb3FCRyLeZdhv0r8RAyjDAXy5vLI8ouLLiB5Ce/pOaotoFwjf9r/KJCd9Vr3
X-Gm-Gg: ASbGncuOb5y3XNjZ2zqew1Gj8gp1CWjUx0MYk5XZBFZZfftlFkMiAf3fqmifORDNGul
	IEbhJcVga3hBPaN23fSUnxMdekUzSVDUCVbJpsAzAsq74tuKk8+TtaJd5saU8Jl6B/9erI9xbYi
	SvSiUFuSSZJD4d1Qmxte2ZootfviImfq+kLSZDXiP1GVG3WNUGlf1/vfzgPN7KW8VQp7+NniSDg
	YCPTImHwDjpgrjJ3LMpWLP9m/i9hPkWc/L0RaVE9aHwwNBqmljqGR5d8kahD1YfoWJDCr3utkJz
	sxf5AT+bFHu2tir+2IKbPY5aJKyoUCv55TqHSKRXO7TTbfvH7gQG3jFSFQckXwtAdoQhYKGA1aY
	kFNFD3l92ZFCgArLVrSebjsujsKfFtqpPIDagpQmx
X-Google-Smtp-Source: AGHT+IGUGwXJE+9bCNQ4PmvIGzkoaxwV0rVgemZwHbIWvjshKq11/3bcmueMsU6X/Kw/FPbcj4I17A==
X-Received: by 2002:a05:6a00:2d28:b0:78c:995b:4e9d with SMTP id d2e1a72fcca58-793858fb69amr21241961b3a.10.1760289262005;
        Sun, 12 Oct 2025 10:14:22 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::fc3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992bb11ca0sm8996044b3a.32.2025.10.12.10.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:14:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] libpam: Fix build with LLD linker
Date: Sun, 12 Oct 2025 10:14:19 -0700
Message-ID: <20251012171419.2477310-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Oct 2025 17:14:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224742

LLD is strict about versioned symbols unlike BFD linker, it flags
undefined ones, Allow undefined symbols like BFD linker

Fixes
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_acct_mgmt' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_close_session' failed: symbol not defined
| riscv64-yoe-linux-ld.lld: error: version script assignment of 'global' to symbol 'pam_sm_open_session' failed: symbol not defined
| riscv64-yoe-linux-clang: error: linker command failed with exit code 1 (use -v to see invocation)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/pam/libpam_1.7.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
index 565b00c264a..882fccd25ac 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -30,6 +30,8 @@ DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
 EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
 
+LDFLAGS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
+
 S = "${UNPACKDIR}/Linux-PAM-${PV}"
 
 inherit meson gettext pkgconfig systemd ptest github-releases

