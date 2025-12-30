Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB90BE9411B
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 06:48:38 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59935.1767077317117175735
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 22:48:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G/lST6Ll;
 spf=pass (domain: gmail.com, ip: 209.85.215.196, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so10314437a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 22:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767077316; x=1767682116; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EurDEAflvg2OP5ImAfUTFaJCK/XzVXHgh865Jggw0t8=;
        b=G/lST6LlBsgseIMo9l9qXxXK2hYNpKis1/RKj1YnwJWoJ1UDNgjtRHqQLjLoQ3yCFE
         dCc6O5bZr29eHjIjskmKRK+4FVVrRKbuc2ZH7KBBopkuYqvMFOpxcaVR3YDnfkylRW8+
         +mlHZrtf7NdV1xZeNPEDK8fuiipnWvEN7v0v/t4mrZ5pVYw4MpgTur4U/Pt8sN5J/D1v
         ZF/6+LefevOKt2+PlzBJ5lZYMlevJ7QxgM4fQH31KSb3NhAsJbmyiqUS4yPvjAgqSAnq
         Iw+fmqzP8A5Ddf48HOylqK6WeD8hKGMtudr7JmV7g4+VAr0ycpnPufcr0pm8ryOlc2Tb
         sMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767077316; x=1767682116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EurDEAflvg2OP5ImAfUTFaJCK/XzVXHgh865Jggw0t8=;
        b=dRIgrEOvTxDuUpSCrZPDdiKjoSRfEeben2jao2UbvWpX7YZyAB3nFUplExiNP5XWA9
         MjAbvk1ypN0nvFlyczQwY5TjpJnsGLquJSGHLS1BeuxB8Lxv43GHVA8v7nsCCLyk6k61
         W7S9X92FjzIEI9N5kA1Hljl5vIu/Mz/6lFRjJngHfYX2yV27VD6lyWR+1FolsgD6fNFT
         MTNrKcnezlZ+pItBElubb5F80YUMkDoy5T/L+cuaVaMPxD+yfLbdVgL+SmLdPKs36ePy
         vFb9yuCmufa4J2WbLN+18MqwGWoT2ouAlXMg4UyyKMEUUYCAdlBq2T3q4yj0FQX4MxZM
         lu6g==
X-Gm-Message-State: AOJu0Yyr3njAaZ+OTQklhvLXO5mfvDeYu03zNS4vspQXVeQbX+t+3MlI
	iCgwK05s/3A99tlSNxYsU2eUkHq5YGKU/9Hu4d9O757p016TcNY92ME1FtG4UTnrkJU=
X-Gm-Gg: AY/fxX52Qybx3Ugfq+U+pvwQihc5sA4x/GkVRnZ/irhLazeaorBGe1cypvCescLtLCg
	ynTk/kueJSZSTJLkgwt6yaw3HMnzARIqwAHBKobfV9G5UmwZ5Ewm3MB3n1V8qQaV5IJC1qErR4B
	lhymxQpaL9kWjPjjU2LxBSedgUZniHXP+wxFA3EElA7fMBMlJFG6vvYOrMs7NSxn81m2CiTMDH1
	sMbzZOyjAiiQK2wHEh25Fab2kUFGdvWv5bkND9m1hC3F5sp1FIC5rd6UVbOHANVjpmhKEfKjugq
	5OUzaftAE54uHOq0BTS3vRH+g5rpNtF/xmwPx5xyKsPNVsDu6VpvxpmW6Lacq3ZHIsDHwDDj34E
	svuwQWEVPMqzh5GHCe8JmQvGKuwwJhYYYVKg/2JLRQxvjJxcwyPBboXpkN3FjSTXwZNCqTIKCEG
	ASSXuJOG3i/ZnDtNtEeeJZaNpTUio3pb4b0RdzoFNcvL0UWU52PbsNB+fOKodergpaq/IoESLOf
	dlmAe5X8U6Buq3FK09E89dYIgAkG4o=
X-Google-Smtp-Source: AGHT+IGOhmEIpYWP9eFrawOVJ8OGpBTCQ49Tr9JO74u1wGhShjw4NBwctmrMO0YpFfFtKpvmPedOLA==
X-Received: by 2002:a05:7022:238d:b0:11b:a3a7:65cd with SMTP id a92af1059eb24-121722b253bmr33280494c88.12.1767077315874;
        Mon, 29 Dec 2025 22:48:35 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm126215705c88.17.2025.12.29.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 22:48:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] toolchain/classes: Add lld-native dependency when using lld as system linker
Date: Mon, 29 Dec 2025 22:48:32 -0800
Message-ID: <20251230064832.2257911-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:48:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228627

This was not an issue before lld split from clang, but now its an independent
recipe and needs to be brought into dependency chain, otherwise clang fails to
build with -flto as it does not find gold or lld plugins.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/toolchain/clang.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 9a3cd0e584..9648063f1d 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -26,7 +26,7 @@ PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-crosssdk = "clang-crosssdk-
 PREFERRED_PROVIDER_virtual/nativesdk-cross-cc:class-cross-canadian = "clang-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/nativesdk-cross-c++:class-cross-canadian = "clang-crosssdk-${SDK_SYS}"
 
-BASE_DEFAULT_DEPS:append = " compiler-rt libcxx"
+BASE_DEFAULT_DEPS:append = " compiler-rt libcxx ${@bb.utils.contains("DISTRO_FEATURES", "ld-is-lld", "lld-native", "", d)}"
 
 TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-prefix=/usr", "", d)}"
 

