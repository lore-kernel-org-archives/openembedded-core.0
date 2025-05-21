Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84FAC2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:03 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.4703.1747808402728624720
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c9K7pnZ8;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73712952e1cso6042944b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808402; x=1748413202; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlu9UQaIsRJea0pO+0eZjqIJfxKq09w0iCzrAN0HbTg=;
        b=c9K7pnZ8VZiWKQ7fwHGfUuuVA9mngn3ze+3zAwkcC0x4lifgTMVM4GlbKWa5KF7DV5
         3E7jC4F6igkR23wdBjG41exV9tWMsmnnOYDctAhIC7orwILDONATmRn6UPKGqyJWFbv9
         RUGfSdBtSz5rmBgiAyB7en48Ujh+dITLKj8jX0K0B/oSNkxx7noamwFCEFJG/tuzINu0
         z9qK0nz60lrhoxWCgZxCr4x8vpgabFba4A/OccqFmzwA88t9HkJTHXdn0KzB+ppvJb0u
         QTDMNJ1DaVvakd5N+DAjNbD+RaR4916Joh2iijOplhuc/Ror1h6Mgy3oNIcN8GDEzntp
         CxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808402; x=1748413202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vlu9UQaIsRJea0pO+0eZjqIJfxKq09w0iCzrAN0HbTg=;
        b=PphhZCWdfdReOsky70CRlrGk8cIL+7yZk0aXk8hJRgbl6JT6He/86MZFLfdR4/MJN+
         DWyQsYUVjaU4u5UuDyxRlqEyfE0DkyzCYX4i9LZ5eLTMK5dyks1gVVEIy4t0dX4glFjK
         XGsP8bRruglG/8/2LSAjljPwjdzf6vwaXcIUiIRSE78okmLnYOrtUK+4+mKss23UsMlG
         lepKyxzjc+pP/1/34XZxUQBjhMkav0R7BZGIWoObZY2U2IXq1PxwXtIF4+HPBuR08UjX
         MECz/M6CiXtNro0N+QdbtN1vyz0ik65T+/ojFPbXgdStuPl8s7OwRESB3ytnAMiZEr1a
         TJLw==
X-Gm-Message-State: AOJu0YxjffCaKvaS8CTDf0cJ3eyNzy8+MDCTl1nUSOmQhRosJigTL7/t
	WGC03LpQDmENWI+f/7Qp8briM4aCh03FhSfD9LyslYx7AMfIr4j9p+zfSs/n0uCk
X-Gm-Gg: ASbGncsjhJVFCd5PBFejTmqw+a6opy/a/1Llr9o6WgJedYfB7auFxD42RdjHw6ZXT1t
	5nIur8ObEOY6ksIuqgStYHP01mi8QdiTDdtD8I9royeIK/2/fuyz333HfGOTFw5D9KHeg53yfk2
	YnMRxRAV82FQhRXq2rc3o3g9Rkv78A1bDpkmPRtV/0VYu8FZ97T4wSNdbZg1BdTlI26KAqyQpTT
	iOyHzXLmG3JrEiGJk5FgWyvmeRjTsJRaYpbfP3Vl8HxDo1rDuJvFWoAJkTdF8i0l4kOXScSxAh6
	QXrfhRjstAkQLpK2ABoiEJiwRkmBtHHg4YT7IEtowpc=
X-Google-Smtp-Source: AGHT+IFTHaAQfberopMRQY0AkWt/QmNpxaIhTSOvdZk6jWbH81WQCiqajLQizmnrVXJorWjNKo+GuA==
X-Received: by 2002:a05:6a00:1305:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-742acd5096dmr21309553b3a.17.1747808401868;
        Tue, 20 May 2025 23:20:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:49 -0700
Subject: [PATCH v2 13/28] qemu: Link with libatomic on x86/clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-13-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216981

Clang does need libatomic to provide 64bit atomic
builtins on 32bit x86

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_10.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu_10.0.0.bb b/meta/recipes-devtools/qemu/qemu_10.0.0.bb
index dc1352232ef58c7f64660871488ce8cd67f7cacb..5d544d8d132ff228fe9aa9a5f5e567a3937406df 100644
--- a/meta/recipes-devtools/qemu/qemu_10.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.0.0.bb
@@ -7,6 +7,7 @@ DEPENDS += "glib-2.0 zlib pixman"
 DEPENDS:append:libc-musl = " libucontext"
 
 CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+LDFLAGS:append:toolchain-clang:x86 = " -latomic"
 
 RDEPENDS:${PN}-common:class-target += "bash"
 

-- 
2.49.0


