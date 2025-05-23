Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00912C54FC6
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 03:52:57 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.40735.1747972368913218192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 20:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G1bStgFa;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so8927558a12.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 20:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747972368; x=1748577168; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=G1bStgFaSg2xrwPQLBK4IQiS9ZFIbVVt8GDmr1vCotk9XWzJs7OV6yGqtH22Eo5oQX
         r2gL1hrIrYO6nOZmaVr5QrEm1kLKocdnIM9JRLEl3oLclK5F1Mv0m8m46WNCFq1fr5ND
         omA9l+XVdAjcTuladueD7Xf1oOuGXjOu3bI/05h7g9/pcNfCi9cD/HfthCNGr6bap4F5
         Xc3VmAK6HeZDmnlFA+mkmxw/UR/FoR1fWSNlLslm5Pm7SnZQW3iQGvQ3MRw2yChGDyAF
         XlUDUCnyXx1Jhku9IMM37pZN16XUWc3Q+HfjJYZ2iJd0utOObPfdPf1Y043+smGLYpAI
         b3WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747972368; x=1748577168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptf9Pd1wAS/Hhn6E/sgUC0L8FIEDsCEt9oko0uNb1Kg=;
        b=jEdr5x3bobBrjTJdcJ04s7sGw521RiFyw7UIyNlZFlD6zn3kbOhwIG5NpCFuAgvmxs
         ByrWtVMkM89Y1VV2Rxx6St65jNM2fdf4JZz9Zq6TsFtIwLvyQF/KoYJbaK+HVJ4IRnS/
         nbLOkYVGQKvwpbQ6GWcYsoRAsbC4cHZ8j8+VdwA/UTqsv7+gjW2InK89tqObRKAV/HzS
         RwYiiVa8OCUHbInBFFv0a4qFbsn5HQRLA2brqTqt1MXXuoUXxO62rColCMJHf73/QEsx
         Ev5Iky08yqcQH8Cbq4QhmSaxVqjZUICeo5MNj6LhjTcUBQ+D/uWxcAogYt3ePAZtvZaH
         Yo8Q==
X-Gm-Message-State: AOJu0YwJgq/gLnNSdVBtNE6KNe7ydo/tpKgqZ0npFicoeUPGUX7+nX6A
	Us9GmMVrhI+nLatm0kxB16lamQqnDAbIFELU85ZdVICPTxv4ZrifU7MAgACX0i8e
X-Gm-Gg: ASbGncv6W4xhkoEdvClbduY2HKIOIxT/SrBBgLKZGAMqJCRA62nQXERXpv9uusbKAd3
	MYa2kr6FK94g46HYljAsO/SUnCySnNzZumsu3anQpR9vWfKYtEdM5S4Fjqe9Ep/9/WAakN6HzgG
	D6BpyLfSl4ppQouHVgmuYTdBRghckIRS1aDKFA8uMVbFszAk3X7GVK79rDChikZUT44hi9QPne1
	J5U1FvdT/E84c3/6LIkr0wGlarc3ZXF5seJ9J/Zp+t77DZKN54dt9qVRA8tzkQC6JevrGN8U7f3
	PDhEGJo6aHan+zpGV+g9AvBKy7qGb1XJj9fBgOiI9zg=
X-Google-Smtp-Source: AGHT+IG3OZ2cIfjkJg/IOqVrX4kx5KVa4xVEYXc0wyRM80aqUyCqtKlQdPCmoDO8zUIOtS77BonSDQ==
X-Received: by 2002:a05:6a21:502:b0:203:ca66:e30 with SMTP id adf61e73a8af0-216219edf88mr43956293637.37.1747972368287;
        Thu, 22 May 2025 20:52:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5f56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231ecd5ea41sm107181155ad.228.2025.05.22.20.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 20:52:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 20:52:40 -0700
Subject: [PATCH v3 06/13] libjpeg-turbo: Fix build on mips/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-clang-toolchain-v3-6-16cfc6d9891b@gmail.com>
References: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
In-Reply-To: <20250522-clang-toolchain-v3-0-16cfc6d9891b@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 03:52:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217166

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
index 8533bd8525311e783572cbafb6fccf240db9e0e8..90aa2ef43956f0a1e64f8e08e47d953bf5773e19 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.0.bb
@@ -47,6 +47,12 @@ EXTRA_OECMAKE:append:class-target:powerpc64le = " ${@bb.utils.contains("TUNE_FEA
 DEBUG_OPTIMIZATION:append:armv4 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 DEBUG_OPTIMIZATION:append:armv5 = " ${@bb.utils.contains('TUNE_CCARGS', '-mthumb', '-fomit-frame-pointer', '', d)}"
 
+# libjpeg-turbo-2.0.2/simd/mips/jsimd_dspr2.S
+# <instantiation>:13:5: error: invalid token in expression
+# .if $17 != 0
+# ^
+CFLAGS:append:toolchain-clang:mipsarch = " -no-integrated-as"
+
 PACKAGES =+ "jpeg-tools libturbojpeg"
 
 DESCRIPTION:jpeg-tools = "The jpeg-tools package includes client programs to access libjpeg functionality.  These tools allow for the compression, decompression, transformation and display of JPEG files and benchmarking of the libjpeg library."

-- 
2.49.0


