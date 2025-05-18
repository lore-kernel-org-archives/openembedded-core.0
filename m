Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E93FC54795
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:30:58 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.37981.1747603855376136790
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XAjYoimk;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3833398b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603854; x=1748208654; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jvx8FYd6DwVb7knHUcgk8N/L5pnR+574lv5b1VFv12Y=;
        b=XAjYoimkDiwSmfjmy4+h8S9cxAuj8bf4pRKeQIWQzY/dlsOqE68vuMNDQxGLcGB9NI
         BL88ADOcoEWOhQtk2h9fqprt5BJtY1jMOlJ5LkUp5CqOJp/xAu3yJHIpjxLIn9JibQpW
         EVo1ikDfSaXhidATQAcshXxWiX9ooQqWaCVEBcHzm0ajah7fGa03sqw7PqCMblpLecKY
         K0SqOOShgsaAZ+KyJGXq8tW77Dc9a1mdmp+JKOZfvHzljhR6cWE4CFggfkQS60P99LID
         T98jCF2wc8b5tbr04pDOoHdpXVG369SbCOg/evD1dWeEwJjMabkvikbnZWANiA0cx4au
         gHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603854; x=1748208654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jvx8FYd6DwVb7knHUcgk8N/L5pnR+574lv5b1VFv12Y=;
        b=sDhyCauM08m4xcyR/1AUhPnIUMLl+nBt/3a/FrTQ+5tJk2wiUQilI9VNon7VhTS+ZR
         8PJzySjz1eq6UgcLTFwfZVgVcSe0AEP8HbrHyXt3w/D0n7O28+R7cyDWo//bgQsX6lrP
         yy3MDVnLD6ZJACGgsH3AST4kISqcLkRRbknSga4amz74chYdhthtBpLFqcW//TgPMaIj
         Kv0vdSmcl86T1aD3hg6Q6LbpVEQ0KdDL6wHW30o3+jztk63wz344VMT96a9VC7B0LV4x
         elPXZTCeqOckULsRlo2bGqLKrd9KMcHX9LmFWA/KdhP4eWJDEpRIhCHYpJQP1rB9opds
         Bbkg==
X-Gm-Message-State: AOJu0YwtmHYtX4ehTRwTy2kRRERi30Dvgp9o2Dc/1y2XFsJw2tgN45BV
	vvSE++O5EAgypv/kMH8vtkE3+TkVa49Dk5Aj2RFqZQgS2qZc7zDv0FRG+SbiWh+a
X-Gm-Gg: ASbGncvmdzs46ezCnkb3V5RVFn2Sa4SChCvgXksPRJenQ+gqx6LVH6UknhfiBs9I/Ht
	IezEcJadI5V+9kV8jMCy814EyD0+vYhBy+HDzE/f24RbzII+sXLPqRy4L9BVTpt77xBxjIUIoQK
	vVGBMhA1Nk6hQ/2t52KQ36Gi3i6y+Fand/QAHt5NhDKIQvjaxWT0BTuZEbMvg9W+kEyx8fmTKIr
	J1pJoHmZXYUluYt8hmEaqbWVH2LTIi3j5ab6Z7sO5r+uKjCV8DtGP/rq3O4ovYJl60W/92RPfho
	F1LjHMlkWHPTZxhnlNDKMwt1cncN98IP30gSK1ITuGc=
X-Google-Smtp-Source: AGHT+IE9/y0vyLRiFwQ96GhZ/XF3fZjolTtNFSBmkoqXZdP2cbhs5Jq59OXkSBGiKFNGyeq9xY8I1g==
X-Received: by 2002:a05:6a20:72a6:b0:1f5:80eb:846d with SMTP id adf61e73a8af0-216218e1abemr14729051637.10.1747603854484;
        Sun, 18 May 2025 14:30:54 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:41 -0700
Subject: [PATCH 06/21] rpm: Add openmp dependency when using clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-6-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:30:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216790

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 281fde1c82904caaa4c0aea94994b3ea3ac47315..7b9ac4a54056a8ae395d20097e85632cd8d20c40 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -48,6 +48,7 @@ S = "${WORKDIR}/git"
 
 DEPENDS = "lua libgcrypt file popt xz bzip2 elfutils python3 sqlite3 zstd"
 DEPENDS:append:class-native = " file-replacement-native bzip2-replacement-native"
+DEPENDS:append:toolchain-clang = " openmp"
 
 EXTRA_OECMAKE:append = " -D__CURL:FILEPATH=curl"
 EXTRA_OECMAKE:append:libc-musl = " -DENABLE_NLS=OFF -DENABLE_OPENMP=OFF"

-- 
2.49.0


