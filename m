Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A8CC83F0D
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 06:38:22 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.12706.1751956694980992330
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 23:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gMxGkWG7;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-234fcadde3eso58457525ad.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 23:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751956694; x=1752561494; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3oO/oZg/LDkiTDr7e+aQ3dVE65wKSwQvWK9HO/VB5Nc=;
        b=gMxGkWG7a5Gd3LMTGfP4h0SDhw6wzyscYOZfUB6xAJxmorfzZPHH4B1kLhtKS0MrPk
         eli6994QxYh2Cs/fXj3QaxbJ2RS/OyLjhWTvi+qHQvh6ZvmMUgSZ8i5VRJ/svS2PhvNW
         eQCgMFsCjPvGDnI5Hb/po/ol4cndFglRM7VF1bCjuM85Dz8FYN12gCTkH6iCwserVhLm
         k2jNtxsPUSvDy/NvLGJ9fFmDod3v5GnHer+RCPRqfUP6kW0rOaX4DAFgBJtC7dW6vW2O
         wPtvjxVzgj9M2w4LpHWEobpNiu/zwC+3ZP4uPZRlbDNoXqLUwJTyLngqdLHDATlUFjr1
         vK3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751956694; x=1752561494;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oO/oZg/LDkiTDr7e+aQ3dVE65wKSwQvWK9HO/VB5Nc=;
        b=E3VBVRFnaQuGW4VrWJ5T4ihiigbTsQ+aTjdmhL0GuJbnAmytFxAiIIJGs0a6s369dl
         uIO2Yfv8CsNTcB0azlOsB5znjWmEuguoCwmCljcn1sUEnxdba365QjzGQQ5+5vUEZtvP
         4dj81S33y4qc1dLrvGXJWKUJ/g1gV9mWrU5c3nauP2zxaUj9EUj2XucCHJCn+1PlEcik
         ghMAEehg+CYoDar8E+Emp1TQrKloD5a/6oHc19QvS0WL6pnkyHt5Ct4liI1Fo4XXyz0U
         4QFlCOI/Ed1HS9+UvYs2hDZExXwXSwo+jBVGYL1+fSS6twAukRFj1VLDbOiyl8amRi8w
         uG4A==
X-Gm-Message-State: AOJu0YxSiPBJUR1P3XGQRajiPuhE1O1OUmD6vLryH9eDnStVS5vZJD9g
	4Zxgn1pxr5geKOEViA8bZMB4QD3WvVJWgLs+en1R74V98fX2AX/kr+fgnFchCbTh
X-Gm-Gg: ASbGncsA2Y5fHE1ECQAw9+R+AWr0BHdJWM11UJTRHZNejGbCpGGC3bxsXupqI2hXkPD
	epxB9VJc+/j9pMbZ6eSC7vy2zrkLUHu1hiFK9vZiTBbNgwfII0k9xoS+4LikHOEpn3jhJt/3uSI
	9S1zoVCruJfTyu1w2F/omaoxPi55x5sbdO7428Wujvafx732H7lKM13RPWOk4sZzfbFGZ2LcDy8
	NE6TFfEcvjvL4vE+nf+EZJyN8sXx9bp5GLKyrN9AmP2j43BkBtL1W4CbKVhgGJyM5tugRkQaWPz
	cxmDK5H2LO4OJAd1f3/2TalLjY9Wx0rrRHvYTbNOAonYxcfv6GKQxw==
X-Google-Smtp-Source: AGHT+IERngsh3toj96+wnemar+IWwY9ZYUO5SJatoGP/BuedgFKQc4uY6dgi/ZLIvWoijIyhlrUnng==
X-Received: by 2002:a17:902:d58d:b0:234:d292:be83 with SMTP id d9443c01a7336-23c8746ffe3mr263244535ad.10.1751956693995;
        Mon, 07 Jul 2025 23:38:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8457e9e1sm107839795ad.175.2025.07.07.23.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 23:38:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] re2c: upgrade to 4.3
Date: Mon,  7 Jul 2025 23:38:08 -0700
Message-ID: <20250708063810.1921024-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 06:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220010

It introduces new features, improvements, and bug fixes, including
- a new code generation model using recursive functions
- new block types
- improved compile-time performance

It also adds a new warning, -Wdeprecated-eof-rule, and improves
the handling of the end-of-input rule

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/{re2c_4.2.bb => re2c_4.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.2.bb => re2c_4.3.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.2.bb b/meta/recipes-support/re2c/re2c_4.3.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.2.bb
rename to meta/recipes-support/re2c/re2c_4.3.bb
index 06960806035..eafdf930781 100644
--- a/meta/recipes-support/re2c/re2c_4.2.bb
+++ b/meta/recipes-support/re2c/re2c_4.3.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "c9dc2b24f340d135a07a1ac63ff53f7f8f74997fed5a4e9132a64050dbc3da1f"
+SRC_URI[sha256sum] = "51e88d6d6b6ab03eb7970276aca7e0db4f8e29c958b84b561d2fdcb8351c7150"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"

