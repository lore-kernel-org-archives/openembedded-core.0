Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7074EC3ABD8
	for <webhook@archiver.kernel.org>; Sun, 18 May 2025 21:31:08 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.37991.1747603858574933337
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 May 2025 14:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dujjLgxt;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso3833417b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 14:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747603858; x=1748208658; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d/MOTy9w12tFAWlbx2f2w0NbMtOauROl/XNnYCFtKI4=;
        b=dujjLgxtpz3dWsY/lf/nQbD0NU/qdbnQm/kwaP0yKyyEsnd9OqZvl3pczffjBMNPy/
         TX8bfwNyV23Vw7usPED0WGOb4/SIkju+m527gdLcSmC9QLiYHIyU4TVWFY/R9iCt5xxU
         IW+BykrR0+EWSVLeHXSXCg8h5TPUGER7dW10/sD0r4NeW9JNWf3TV09w7vSyBXF4ln/O
         qnMw+UDNkL8I1RfY40qF8j3b8aK/mxsRMAtdFQfMYHvwJLOIKkaXNJ9rmB0D7Wvjn6P2
         c53N8sy2IJfIM49mYGjQdihDiefZOoJ5byOgslH7zDmR7c2IZnRFBLo+pCtGWMHV/kWq
         KXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747603858; x=1748208658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/MOTy9w12tFAWlbx2f2w0NbMtOauROl/XNnYCFtKI4=;
        b=oeBxFCVY1MTahW0hEYZvJ9+d1MUvAZh9SNfmyVhnusaP/cPejiLA96Y3T9FsTMN0U/
         hh7RSn666/7MxbObYAwyXD/5XCEIOR5NXgwf+XE6AmUzooHJk1zT34B/hwcAZ/AzpIlI
         JoPaTm1YYu+8Ax/UEPRxhzlRznYOSVrYsZx8Pdh51bTHJtDPG8zVOXJZA/j3GjGc+q1r
         kIL8SYd7V6baqi6ZPLamMDG9vIuVKH77iSCxeHhp0LGSFnwuG20HmFCT4COskLncHIDP
         AuIIH2+n75hHoFSDg/wM0r+Zct+6xP+w7wV8LzFcf5BttBUJOzGUGwkvyCBTwNnF4Ydz
         G8Rw==
X-Gm-Message-State: AOJu0YxiWF9yJFpo1Vf0GO0HPK1ylITj66MYHd49YcmN1ogwAfBNdgyM
	MxZYLg1HUoLmF2Eg5MzwzrApDMAIWaNbcGmx3Um84t8sqV5l3K5DLw3Fl9bWUryR
X-Gm-Gg: ASbGncssUlHM3hn+75JA+6tAi5yuDZwFmfHeoU9Tmy4afzZ//0DFfUFjZiv1/5dc8EP
	IgeRiEX5FSmEhyPCN078KGtwjrQKuHZBzkbMHE7fPpU4NTFCo5QkD6E/Bq3RxY8Is3IzB1ht2G1
	ns2nLcnEzstRlNL/GJDGDm39sWKbFHODEB1XFjlFxm7rHAqmUDcAY8zCS/WO3XHDx2nzCZNcJzE
	FCXjVkTaqCnHjUKRzgOcbcWzyXPvvT1oUvi+xeAbpxo9Lkzanm4Zq6rmiyDTbjYWPw15BCbe5kp
	uS0WJmGUN/+vlZYdFtcGvXe1jHT4CdFzqZmKTNJVRYLkIxVVOdzwPQ==
X-Google-Smtp-Source: AGHT+IHBgJFFnPc696/DSuAo9hrewPiTRUxoqZ0oMEoA+Anune43N4wk1uJ4pKuTzmQ8nLf7xzIitg==
X-Received: by 2002:a05:6a21:3990:b0:1f5:7cb4:b713 with SMTP id adf61e73a8af0-2162193707fmr14171185637.19.1747603857763;
        Sun, 18 May 2025 14:30:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb081aa2sm4976849a12.48.2025.05.18.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 14:30:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 18 May 2025 14:30:45 -0700
Subject: [PATCH 10/21] webkitgtk: Use gcc to compile for arm target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-clang-toolchain-v1-10-5be46f8c4af5@gmail.com>
References: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
In-Reply-To: <20250518-clang-toolchain-v1-0-5be46f8c4af5@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 May 2025 21:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216793

Builds with clang run into compiler errors

<inline asm>:320:1: error: Relocation Not In Range
  320 | movw r4, #:lower16:.Lllint_op_tail_call_varargs - .Lllint_relativePCBase
      | ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/default-toolchains.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-toolchains.inc b/meta/conf/distro/include/default-toolchains.inc
index 014a44ad8280e3ab086459ffe71c626dd5d31cc7..4d3cd9eb4fb92fe6d5d12a2f593092d30d196a0b 100644
--- a/meta/conf/distro/include/default-toolchains.inc
+++ b/meta/conf/distro/include/default-toolchains.inc
@@ -28,3 +28,6 @@ TOOLCHAIN:pn-pulseaudio:armv7a = "gcc"
 # Clang results in a reproducibility issue
 # https://github.com/llvm/llvm-project/issues/82541
 TOOLCHAIN:pn-rpm = "gcc"
+
+# Clang-20 issue - https://github.com/llvm/llvm-project/issues/132322
+TOOLCHAIN:pn-webkitgtk:arm = "gcc"

-- 
2.49.0


