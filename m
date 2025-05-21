Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAE0C54ED1
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.4710.1747808408715904434
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQv09kM5;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-742af84818cso3823950b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808408; x=1748413208; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3zFkidn76fOxIPSMoKzPRVTaJ6fuYzuEkpMoGhomTk=;
        b=HQv09kM5QPqxQV0X2BstMy/1WimS4fEl+Q0VFbFWjj3VmBD5VyWzP7zKdHHxylbe9K
         NPb7xtx6K8cS5p8HQuP53DrpFLu4fYa4edrSpQOSguO60j2KwmIy2e3oELFfcVWBA8R9
         ++hjrzeFHvmm3KhNshNx1TNELgOs3tuFxvKFuCQTM0fRGZd5LXtVaMp/Ajuvqq14QUVl
         zc1xOc7dKigYCi55aKUFst37Qk6QCDCSJgIb0FBSU2746xS62iub01KyUbaGerqHRSM/
         4P2ABWaXGDVu9paJ1hhkmPgPt1rtqR4rJczfzjdYtt6viqb6oV8RwcNZEpBqtKz5Fmlq
         1xug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808408; x=1748413208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J3zFkidn76fOxIPSMoKzPRVTaJ6fuYzuEkpMoGhomTk=;
        b=uRXpvwkd1bU4nuun3cnfsnAZfdbHUfSsCT3oFIzXUkTueYYNK/q4rnOAbw3ZOqEEyT
         0ynSOdTz1YiG/0I6S5vm8t5Bv/Xzxf35cQSwHfdRzL5DzkYaeawVrW9K6Fc+b1uiCYJW
         RzjFvBk225/566XLbVCkQpaaDHLVSyUC4Hz2kA/0ZHKDt/hh2IPeR/YcWl4cqvbe7Lta
         w4K1vymj6FpgTbOgmteZ757slpJORh+7iW5UXQFyFPj09si8u8X2K92rqq52Xr4ITaA5
         vtJpTyMbwshomR2Gc5MBJeaRiaQwzhzLuiHd5qxc+Z5u8MuiTqPcFbCiJb9uHzbtPT4I
         lykg==
X-Gm-Message-State: AOJu0YxmBOylARQk/p1Ul8NsIDlC1pdSUURVsA/w7gxzQ76/r3qIGwgg
	dxE3IikvniOD3DvDjUIX0V25Gv16E3JXn7RNWg5qKllKxF2GDXdVl5vHRCgGaN2e
X-Gm-Gg: ASbGnctFuqVTv6MM0knxjucJh2aZF569WtYePhiXVzLZeif8qrKqhOVfNod9+lXZvDJ
	MnYJVTGer2JjKhb9hkfQBRPsKELYem1te1yCLKuDNr8LbtNwy4PYJ3mxt7iAM8q0aZXUTObjdMN
	2/CfDESuHA0cnfGNWkx/Kx3QuiYULmo6OEFP2vC5Jrk0kpFbu25SMimP+uOecSfrHmoesTUpSBm
	KTDemecT6UN8x5Q85GDPG+yRwlTfJoVYiCSBXuVN6Qqz1LH2WNJ1/TobN2mmJMg+5/18XgwMxUi
	NVwaf71+i7P+NOXqTGYWLSCDUfATlB7UEjfP1Vauwvk=
X-Google-Smtp-Source: AGHT+IFY5ofRxV3FDreoxspz/ib0PjRl9JC/RcgG5Ez750ePDFRxlcKTksLVK5T5pEviUyICI10/Zg==
X-Received: by 2002:a05:6a00:4b10:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-742a97eb61emr25769931b3a.11.1747808407871;
        Tue, 20 May 2025 23:20:07 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:56 -0700
Subject: [PATCH v2 20/28] systemtap: Pin to build with GCC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-20-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216988

clang find a lot of warning

| In file included from ../git/tapset-procfs.cxx:11:
| ../git/session.h:169:47: error: 'used' attribute ignored on a non-definition declaration [-Werror,-Wignored-attributes]
|   169 |   static const char* morehelp __attribute__ ((used));
|       |                                               ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 21d50ffb04977bdd9666fbabb5e27289aff01370..254bac4d6f9c8637c575b4b7896322bd42e96841 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -99,3 +99,7 @@ do_install:append () {
 }
 
 BBCLASSEXTEND = "nativesdk"
+
+# Emits lot of warning which are treated as errors
+# They must be looked into before disabling
+TOOLCHAIN = "gcc"

-- 
2.49.0


