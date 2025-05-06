Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EE9C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 05:57:12 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.69809.1746511026151688682
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 22:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Rr3aKoqp;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227d6b530d8so48934375ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 May 2025 22:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746511025; x=1747115825; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMxz0TO7uAS5Ueop6tRSc+UA+IK8upo5bdtZnh7V/Mg=;
        b=Rr3aKoqpxJGgPYAbKhMrK8E0JLSk+84p0mguHlDTgVhJ7H6YYhqq6rSEt9+Nyo8qfb
         hA7SYniRzYBmDfT+Y9/g6rN+c4MSv71BFNcM948+ihjRdPzxtJp0FJPoBMCEJrnh0QLH
         tR3ArD9j5ZyX3NkQ2YcSFJVNJsbKAQ9X8iA4m32BjuY1PW+Lt3J3Ar/K3OlSE7LZlGU9
         lpBXs9Lhq/yvPXAsNt3fkTg+KAehDcK6qhjg2ZNRZ957rEvj0xcgl1g/x1Pq/TmcAuzI
         tu+GmrlDodij6pPLGabrZj+guGQLz17TiK4mHjQmhk7tg5/XoVbwE3tFTyE0Q49m2r89
         iHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746511025; x=1747115825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMxz0TO7uAS5Ueop6tRSc+UA+IK8upo5bdtZnh7V/Mg=;
        b=hyrf5eRA4+7eoVs3NpuHxsyX5709sc18EqdoxFOTOZnGJICkhV3yH2ftN8MASk4zVN
         Kcsx3sxscXInbE97QOya4EEhELEtqCd2wiaHkJy7iYQgKppmwHQ9a1Wxu00EkYKecsXI
         n829FgjZ6jpqFnpPsl5hnO+8baoEtYjtSMYAjbEANlTWNZPgWqNgneEzp2THajPZWZV4
         MxYAmX7A0MfLm0r8aznQOHBG/UcEpAi5rVubJwae5GvOd2+bWSOf3Yk7WYszeCs1PzkC
         DjGbPZvwonDuJfHxWW1dUBVfAntvgg1+fFjiooRJWIBT0wSS5hU5rqxKuxPlWWYaIrzo
         bpeg==
X-Gm-Message-State: AOJu0YwjDW7Oi+MRETXiZkx2jMK/fRF4YFC2l17R8UbGbGVwh2qrxaM2
	jYyvL5wfZa/NfaLoo37zntVyClnNTCoDXi6iEzm5NMgnw1/3qOEXr12FOIQ2
X-Gm-Gg: ASbGncugj+dUW5VK6jPOD0HAVzLpPBKnZAJ+Gs7tFxdtgv4k0JNA9HOfo8ybf+7y6+L
	fdUFNVnq4dkJgu5fJmmhTXZZnZ4ZOI6Y7QSPrd6/D66TDIUMoui1D9w4TdKeFf3fQWEAzv5A+0b
	mj2jgab9C1jAJSFBf4enxEB3G3ud5zJm2OFXfCHhUnhofq+yPOiM3H5ILePkHhSMWfuV4Mekr3b
	g/2FYT57NYjUylsgJHzVvL2hAUttRq7q39aVUh4uyqR6cguclDLosXN5GQEIDHT+c3D/IUTxmp4
	j/zEOiRb3w/0Fsoyv2MF0oeUGql9zrIg
X-Google-Smtp-Source: AGHT+IEoPqq5j0yJIdNEJRj07B9Uu2sJ1hr5enA9swON1oXLs92ADSKkPmcPajlmQbqqOKdV0X56hQ==
X-Received: by 2002:a17:903:1aec:b0:224:1935:fb91 with SMTP id d9443c01a7336-22e10313ad3mr234457655ad.27.1746511025289;
        Mon, 05 May 2025 22:57:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15231ffcsm65195885ad.234.2025.05.05.22.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 22:57:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] arch-mips.inc: Use -EB/-EL for denoting endianness
Date: Mon,  5 May 2025 22:57:02 -0700
Message-ID: <20250506055703.310591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 05:57:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216030

While -meb/-mel works it is not documented as supported and using -EL/-EB
also makes clang work without tweaking TUNE_CCARGS

Fixes
 mips-poky-linux-musl-clang: error: unknown argument: '-meb'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/mips/arch-mips.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/mips/arch-mips.inc b/meta/conf/machine/include/mips/arch-mips.inc
index e39cdcab5dd..baadc61d652 100644
--- a/meta/conf/machine/include/mips/arch-mips.inc
+++ b/meta/conf/machine/include/mips/arch-mips.inc
@@ -8,7 +8,7 @@ DEFAULTTUNE ?= "mips"
 
 # Endianess
 TUNEVALID[bigendian] = "Enable big-endian mode"
-TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -meb', ' -mel', d)}"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', ' -EB', ' -EL', d)}"
 
 # ABI flags
 TUNEVALID[o32] = "MIPS o32 ABI"

