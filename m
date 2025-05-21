Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B47C54E71
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:19:53 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.4694.1747808393457171664
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a1DlsUNC;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b271f3ae786so1754478a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808392; x=1748413192; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKRD1a2ZZrh0b3nlUbf/DRM6Y43WykfFA0U8Pgpv9Bs=;
        b=a1DlsUNCDbZXpy1urKDIJsXjpcE1BuEWgY5IIW4kriqL5uajYTq6HAsNBB1+wwsXlt
         2R3KGRl3OjYofogY2P1zNGkevaRytnfBdlFdnCHqN2fnxL8bp+Eep9qG5TqaXCB07Fdf
         S8UwayIbZJLVAlibvHWqyHlfQaYPEHMSiu2k0uxTNRz1v/fDC1PEPAVi3ZI11a8V5vL9
         /91auj+cobK50JtFnRFpjKdZPtEg3dv6P8wJe+bimFOC7aHjpcVrW1QMVHssFbWO0Rwl
         Uan2s4OJaFwQnpAyw7wOPl6zY2ZZojh9mElQchVhsJfvQ2Aa2HzvCQM9QVThAZgYcmdm
         QphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808392; x=1748413192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKRD1a2ZZrh0b3nlUbf/DRM6Y43WykfFA0U8Pgpv9Bs=;
        b=AxFqB92BzozX+1WgAeFv8yLg2Y6SEV+y1IEEuOdSq9koomIPglYnnTncIPNvHaA+D5
         jpy4smVRtOGtiBqjz2Zzq0o6j2ELTZFWR0DEMzng8maaQWTl/1YDQ4Z6FzlHtTk9UNqW
         VZc3B0arN7HjU5OLwdRwJgHIKx4KALoWZNEBnnicMv5676OmCkHod7UTaWzqY+hwr9NP
         C70It325yQbNi7fKo5OoDPTMm7SEPeg3yjvWag+h7vCq/Bj+qSheh4fD2IWHlHbLTAQw
         xOhgqPO2AzigHYJYZLzlbJwB/2+2arEFBl2sgO3ZZjyFy5N67w7s3b1Q6smrtZ/hHLUV
         YOHw==
X-Gm-Message-State: AOJu0YxJjrQWPorGsXPFAfMO3Hh7hTmsz5ZoUlLlmrnP93UEL0GR2gY6
	UDCE8gsJmtqYrwNjFR5hKejxHXoVEzR4yjfX746GeGJ88517f/KIRwgpgQE0cOrK
X-Gm-Gg: ASbGncuB/Y6SBfV7Tn7qD5/prpcLXEacPhAXnsvE3QEEM4r2FegU6BNFc0pyG3ENgIl
	QWPUDqaSN7tU92PI7doamNofM2i17S4Cx2qVr2BAevKFUBrrwbFlJoiIg+/mLBxzP/WHYMzeWHO
	Aog6bI0iM+7Hvt1qPJp0M4Wv0pQmkxoevTb5iMuRHtC6/bDCuLuZ+LrFqTwTbr1yVmzV5+Hp5Ys
	QwWLj0W1PRwY9d5BBZBRwg5ESIXRoq9fvrk3QRMEuPvdlsvzUulaEyuInvKVTabj00Vv8TvJ4ew
	9NIbupWzRAUzut66IrGiFjshuCVRQUb5aguStNnllQM=
X-Google-Smtp-Source: AGHT+IH16pVkIPAGX8dnInqZFFKj4M8mluwDkVbBdEz6dH3OB7exMfNwMgEoIkg7q/jooFJSQyx3WA==
X-Received: by 2002:a05:6a20:2d1f:b0:1f5:7f2e:5c3c with SMTP id adf61e73a8af0-21621882913mr27767393637.1.1747808392565;
        Tue, 20 May 2025 23:19:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.19.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:19:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:38 -0700
Subject: [PATCH v2 02/28] clang.bbclass: Specify ldso when using usermerge
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-2-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216970

This matches the expectations of distro setups and clang's understanding
of what the ldso should look like

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/clang.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/clang.bbclass b/meta/classes/clang.bbclass
index be8b888918d1b4b4ae1d245df2c9da013cdc826e..ddf8f350f951744940893698188a1e6056edf7cc 100644
--- a/meta/classes/clang.bbclass
+++ b/meta/classes/clang.bbclass
@@ -25,3 +25,8 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
 TCOVERRIDE = "toolchain-clang"
+
+TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
+
+LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
+LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"

-- 
2.49.0


