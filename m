Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEB7C54E93
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.38001.1747603865250830490
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoJRZEg0;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3833458b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603864; x=1748208664; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=OoJRZEg0+QqwOrsRY4aUNQOJO223EINspXK6CzX22+yLgMR/2VKTCOemrI+wHiWoSA
         5yE9kVOhtDs9xS+x6GX1kjAJUbUsFPdGo6SFmzCl4tuTklnBU/4Dgn6bE3QxZiKbMtsx
         Le4t9cMtbZbErhrhIGJUG95DkS+Yxta6oJhNBa2SbN1j4Um5QCC9+U7EJ+JgwUmZ4y6X
         cq1zt6OKaBvNRppmf9RfBN7R0mN+GZ+PdNhsvoiGOWgMn+BMxaJDe7wHUCYJEi3a1EY2
         Zee5MxFqjYdZ8lIQJ3qXFzlbGqmWlgs2dNritH8rSE4ZRPFzqce1NaZrLZLAz3vVWhA/
         XHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603864; x=1748208664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=itGgD2sF/aS8KiF6/KGgICkGwEakjldAhY536INfUS/sJlFxBAUzqRxUCM35rT0xfI
         saSJ27triqrMo2lrLiZK+LokImUJvCHZGRhNof9pA4UG/u8RXqjJgzZbex7z2GFGYCTv
         Ank5KdCnnRlB8L+5hKF6YvSBvomsaAfmBNpm5iTYkBRKmVqQuj1ZM7jwqgmpway5s8WO
         Q8MhMFi7Xz8Vgy/Rz6o6N+9FGjL3d10g9MuF39aUTnQlE+y7P3cefokrlq6izjy30bWi
         8E1wDuzdU+sQVINebO3dEnWaZQKGrhYN0da3yREzdZZY8Y4mLmcwKxFXgg3/bJz0l7bi
         pRZg==
X-Gm-Message-State: AOJu0YxQKXBXfLdTb3W5MG/uZfyNlaBmcJe4Q2oaJOy2Q/gFfiYcUvpC
	pl9aBeozR0GpfQ1kzLrv8ADCiU/JWu5ZrsQEqjzU3y5ZlICg1UVYNGierFcNfQ8t
X-Gm-Gg: ASbGncuMxUPZHKjtMO9nwyVS0fQ5Z9WS8LKLGQfEX/CHPmbHpbK8Pu4H/+8IlEU53SR
	YB5+MzLdK7GV5Af1GyHzc+Xn6b4lsmJQ25q9Kt9PvRJ3LRucp3voAXJAAAkMiYdEk7CfP+13YiU
	MWoZBPT2Gkf8gh0verRxG7g80Glv8cWbq51kaC8ROOUkwDeYqaQYIEcZ52a3gJCNXcV6X0aDwQ/
	zK7Nmhl9/dsuAsoU4jR4EL2tz6u76MntH4VljSRAsnJpPnz7kr6udwKaqKVepybPkrekNBUqnam
	mVywQuaVkL80SkkwldUz+0IQFdUG1CwW8D5nbwBD1J0=
X-Google-Smtp-Source: AGHT+IH3vkPoSmkq2jEcK6ry/hDM266hv0AqmELw25R7wATtJXBCEwrhsfYa9HQKmPNFgCmu5YEe3w==
X-Received: by 2002:a05:6a00:2786:b0:737:6d4b:f5f8 with SMTP id d2e1a72fcca58-742a989b00cmr13487718b3a.17.1747603864265;
        Sun, 18 May 2025 14:31:04 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:31:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:53 -0700
Subject: [PATCH 18/21] pixman: Fix build with mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-18-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216802

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
index c1c71fd42023fbd8c82d49ff623a981139f5ac7e..0c779ac3b4e6d035d9105c98aea0560a71d57ba3 100644
--- a/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
+++ b/meta/recipes-graphics/xorg-lib/pixman_0.46.0.bb
@@ -6,6 +6,7 @@ including trapezoids, triangles, and rectangles."
 HOMEPAGE = "http://www.pixman.org"
 SECTION = "x11/libs"
 DEPENDS = "zlib"
+DEPENDS:append:toolchain-clang:mipsarch = " openmp"
 
 SRC_URI = "https://www.cairographics.org/releases/${BP}.tar.gz"
 SRC_URI[sha256sum] = "02d9ff7b8458ef61731c3d355f854bbf461fd0a4d3563c51f1c1c7b00638050d"
@@ -38,6 +39,8 @@ EXTRA_OEMESON:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon","","
 
 EXTRA_OEMESON:append:class-native = " -Dopenmp=disabled"
 
+CFLAGS:append:toolchain-clang:mipsarch = " -fno-integrated-as"
+
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_STATUS[CVE-2023-37769] = "not-applicable-config: stress-test is an uninstalled test"

-- 
2.49.0


