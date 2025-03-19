Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589EC36003
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.2961.1742372196900392631
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m7bW5HnP;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-224019ad9edso13909745ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372196; x=1742976996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=m7bW5HnP2hL4FrJOmtB67bNYOGabRq/ucN2Xpz2Q34K6G04OnFikWNuG80DqSjSp6E
         yGAvkkblDTXizvxgvwvNPDNt6RbzImtW4tZexuTVNGiudgxtSAct+qEQz6/USlvIFxWF
         6Dt3XgmxRP2DJjtWY//BzI1PaCFTxIIeyq5M6MGvh/Kb/C5LH0Sziau9CtGMurQJ1ogi
         FXvvssWAlNMpTG3fS2klqhp4h3+88rQJIlnGM/VVqcZAp4wC2Z1LJMjjrRpZoWdbnhw1
         A5+ckDRNtewoVfV/FtMaM7QVqRbGu8Os4DRTDDEaKTg8+0tdrBRpB0SOzJSKvLSXZYBQ
         soYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372196; x=1742976996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc6/+KXa5zJlOJ1+/3NMnaKQLW7j5GiiXOdzk+yFN/I=;
        b=Lf4NNuEdvXMnWrMvt4exUXqcWvuDEibGkVeNaUwd7iRpUPw4URp5zQMrJAmylKh3oT
         FG+yO9JxEbzXFxjwPLsewagkFuZTOw6KKsx4dtpZ8MSkbMZFo6u9o+dZmExcLNg8K8F2
         L/RQKda6nHhBlHbXZaka897olVZxYfWlNI5VlQQk/d+ExhTz1b73Fz82+DsbEKsaXhoM
         MXxZyDTOfAkpGdZ1vYEZZI2JjOYCvy9NpNgX8DtiTzUJEIjEgM41i2rXs/bjZGVuE1c2
         PacGR+ErbfS5Q56YboHdhA5/joaicjG0LJnUf++THcA5eb/J5icUwynr2UJRqtEUFUrY
         nHxQ==
X-Gm-Message-State: AOJu0Yy2i1EfowuWEtdFHiNAVAY3enkKnvCG0GWOVfQF6Bvq6BHcGzpx
	DvMeXyYUucgxdAbLZ3TjKUWWDerGCpgZVEZ4+OIYGRMN7K2S+gF0tGvru0cW
X-Gm-Gg: ASbGncuUM5v65slJ+0pez5h5AMxcmmG5yx2u/dkCpwy3Z/1WB0mEz6pFVyprNLZM5yK
	a7f1f+MEz8RdAY6YChTevZALAn7AyfL1Yog22+TfFmVXn4Csi1WUlQQ5fHgOfg4Zt63R5vBlACt
	G0oo8N9Q/XJXc7w7TYJjLFVpEtCzXwDLtbYI8IimfjD7WhaPHMTNtuGihVTxYlmduI+OE90aL/D
	mQ8TkqZv52D+HoZMQt3F9owaHdceCDSHuhV735AP/ZGpgEDPKSvivSDNqIOmLvVC6dLOQi75Jpt
	p6YabyUhstB+n0XWYVfm+5ybFKxTlZlXuqIo
X-Google-Smtp-Source: AGHT+IFoJH6zYtHLZUKllmveMEGA8qeF8EytGhhqvWl6pkRfKMN9XumUpANBERLGvcDQD3AkcDklUQ==
X-Received: by 2002:a05:6a20:2d12:b0:1f5:a05b:c741 with SMTP id adf61e73a8af0-1fbeb899973mr3305245637.18.1742372196111;
        Wed, 19 Mar 2025 01:16:36 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 19/25] expect: Fix build with GCC 15
Date: Wed, 19 Mar 2025 01:15:55 -0700
Message-ID: <20250319081610.3536475-27-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213293

Stick to C17 standard as GCC 15 switches to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/expect/expect_5.45.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/expect/expect_5.45.4.bb b/meta/recipes-devtools/expect/expect_5.45.4.bb
index 65f717cc5f7..010e18dd24a 100644
--- a/meta/recipes-devtools/expect/expect_5.45.4.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.4.bb
@@ -42,6 +42,8 @@ S = "${WORKDIR}/${BPN}${PV}"
 
 EXTRA_AUTORECONF += "--exclude=aclocal"
 
+CFLAGS += "-std=gnu17"
+
 do_install:append() {
     mv ${D}${libdir}/expect${PV}/libexpect*.so ${D}${libdir}/
     install -m 0755 ${S}/fixline1 ${D}${libdir}/expect${PV}/

