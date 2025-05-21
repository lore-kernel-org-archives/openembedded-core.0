Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC86C54EDA
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4700.1747808399548261089
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFTb2JlD;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-742af84818cso3823884b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808399; x=1748413199; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=bFTb2JlDtEp/3SM0W2Mzn5tAx/j9HIhIdzB+efXbDgbdfj9Ivz+4e3jB0VuvP1V7vh
         BPlzu/JkJAWAzujOFnqWlBpBVjCSrcukQUGvQWmJSY5DdIAATnn1TpiD7HYBa4YCs91e
         PQyms7UQsCELl/Gd3wxrUuHJkp5KD3K6RjopwaT6hN8oaXmCIJunPQNcHibNkvA0HFep
         FTpzDVsJ5y1u9NyxrpPsjdOJqSoONZS0H8PL/E7pYLx8QD0YBJPjWRGz4oF6wwusfeVu
         vSHHBjIInY4mGnXZrWPE6pf0LNJvr+zamqYTIX74WbIMssp4U3yIxhIYn7z+AH0C/Bu5
         J38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808399; x=1748413199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S0hVcJqgxQcQXH8n05uMBDd8Isak1hFj99Zo5BbXa0=;
        b=Nu6oMVI1E6efuD7OcWmirqsFDRH8pgJ/Lm3rMwQIU0v7TcQegl3PCYWCbxzCtFj7hE
         WxVGW0AniTsLWEjKR+eRHgmHDM1Zq5hPDCHkxNDB0626bl78NG6jIVT2JJxJi4T1mmWa
         42MOEhtkRkZ+na+KPmSHQ1ZN+0ZdPN6DgYMc5hMYwDU9CtlPJSYFtPniHBvFoOwvXxTn
         9NpHftcvCjZV0hlX8GpfntIDQLZjEOfdSGUiL65m8eoRiG0sdjAietE0/Fi8cwpUN9W3
         wh6XJWS4yBYM9GC7B3Wbdsky2j62nluVCvH+JwJvOb6xxQPOoHCvz8sA7hwmnpql5/zi
         in/A==
X-Gm-Message-State: AOJu0Ywq9uI6wemzN1y+sY14ZiGVMGAAxw4wsz376Qwf+EqzPlkb6q2t
	uz0fDTuJ+6dgVPorul9ZpoC/7Pgq0YYBpVB6QvRiveGntgRWsithcIwMaPiWpSKF
X-Gm-Gg: ASbGncv3Yhn/SfsfMnQj0gXDAiMi/GFYr0t0SrtDlGHZk3Ufjla+Ptxr6lZnnoAnUoF
	2GPDonPwJFTJc2iMdhlkXtXErmNwGnNxMmLsUiJtUX/rmx0gvihKhGbXlkIFOp5PJIZzFVxsFUZ
	vuq3UjYl1j25xtMNrvPBjoLd+/guRYd2hcM2o1lzNc6QRyZGq2t7NpKJD6KVV06R9b5enbSc2fi
	D7It/Ilz2l9HO+CYveWRay8UR9Tq3rKd7wLRYd8zcBm6qoYTavb2ART/gQEbWd0m8paZWhThYfT
	BV1CTL6c8woIjwMs1LS60ZLKVqBSIH403jA80DQ+ptU=
X-Google-Smtp-Source: AGHT+IExNZav3EWp5o1zRouTmVn1yKeqpfc+HDiARoMKkXHt481VYkCDz1UXx8v02S9jUydN1P+xQw==
X-Received: by 2002:a05:6a21:3384:b0:203:c461:dd36 with SMTP id adf61e73a8af0-21621882893mr30157167637.6.1747808398721;
        Tue, 20 May 2025 23:19:58 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:45 -0700
Subject: [PATCH v2 09/28] pixman: Fix build with mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-9-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216977

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


