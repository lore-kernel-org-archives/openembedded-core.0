Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEA2C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 17:05:34 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.46656.1753117532102745690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 10:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XtNhFhTh;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-237e6963f63so27012085ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 10:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753117531; x=1753722331; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0avxweRVF/Owonjg22QnQpeXs8Ttz4szWSzEEhdRaJg=;
        b=XtNhFhThNvdsWQgXmvk9fJhUSYYfyiz2n4tSAPJlDFZ6R8MMA1DQikGMIw8DHsrCw7
         xOZv194qjh8DgFAXcoEOAFUyDRh/Qx8J9ZXc7PSsIQ43LD7m0LuXBQSJxV+ZGU0sqgST
         ItehOpe7lFcpggym3sIDFkkLr+ZWWBRwOnKTbISOHY6cPm6ZVeInTxCETxjoGGb1MmTQ
         XckUNZSG7tNxXaVRrmWAiqIE1MTAL1wCCz+DEjvNh9wCZcIbBvODVlks2waSzwCs4qLb
         Qtr3adRNxA0nBKATEmAqInB5CGrXgZh/7x+WDuWKwWItySOnJofwlcyHRAAnJbVm1j8H
         ErZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753117531; x=1753722331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0avxweRVF/Owonjg22QnQpeXs8Ttz4szWSzEEhdRaJg=;
        b=CDSgxkC4CQMmnJaYRB+AJBsyIqIojIqE3unn1x1Egmc9fNTe93UWE5WLCqewBV/MT1
         VeYRY1A3UruwF7FwXuFlBBRh99l0lLEXSKlq9WMRxG7499cTqRG55pcjuHnW+go3EkZv
         Q5zlETDXSf1ojXB3+QLwEZ0Rvpvb1reco4+7KQPtMJxls4wteg4cZzIH7H5iUtjmMTFx
         NlfzTyuU73DnszCgt06/G4Thk40e6sq8Dom8sAWstURQXm2Zho/p0PsAvyrbVfrHCXA4
         DAE7Yu5xXa/JpbGtHqsMCQrQenraA8/xRuh1R1dwIfB4BVbCeQx0zgzrsxk7J4LvJPzP
         7smA==
X-Gm-Message-State: AOJu0YwXGjl83o0vqt8AMBijqbeFVbmhZawwN+mWCdqVsZ37SYSaiAH+
	lLKrHHYitbTHJpYjGkE1GWq7czqgeSXQuy4LPiQ6uDnikO81kQ0hwRysOqBVNaNK7xQ=
X-Gm-Gg: ASbGncs5abC1ZBS6y/ZOGEXr6enmwPyPtDGD5V4I2gU6GbWoIbs3bU2YADLw1N1xh7i
	GnRbV/sygNLvV9CiaU4LskOALVKL9mG0NqEmZa8fcLms0lELxhybDVBvN4JCgETC4bBfJbtFUkE
	cQSl8mm1PY3wrP1q4dhngxQSei/qibRpTVuTNO+Kx4AGzb1a9hCi3t975/h2KtMTdoDzQccf1w1
	95fG6FTZJKvYLFjL+rcnldtvZQ8UhqOEY58E/Kk0LlirDqlR12Av1TT6JzrJLwYlFlbRmYEnDBg
	4/h07qld+9WNTqc8BGr2yP9ja5G54ldbDB8/H1zmn3qhF0q2qCVZCMWDbmzGSM55Q55MLXJ6QaK
	be5/FB9QLuClJlU4w2F04BCHW
X-Google-Smtp-Source: AGHT+IGo31Tm409wUnTxe0/oIcrnYYcHKsrnpKUSxX/cd8ENG4xCjkdmsIVuvIplaPSnGSlE35RSlQ==
X-Received: by 2002:a17:902:f688:b0:235:880:cf70 with SMTP id d9443c01a7336-23e256ae9a1mr265220305ad.14.1753117531018;
        Mon, 21 Jul 2025 10:05:31 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::abef])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6efb69sm60317025ad.195.2025.07.21.10.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 10:05:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] toolchain/clang: Add clang specific ldflags and dependencies
Date: Mon, 21 Jul 2025 10:05:28 -0700
Message-ID: <20250721170528.3094277-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 17:05:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220707

Add clang-cross to sysroot via POPULATESYSROOTDEPS to get llvm tools
e.g. llvm-strip, llvm-nm etc when they are used at default STRIP/NM etc.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Separate sysroot changes into independent patch and fix commit subject

 meta/classes/toolchain/clang.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/toolchain/clang.bbclass b/meta/classes/toolchain/clang.bbclass
index 7c6ed57fb31..b6ba1fde6fc 100644
--- a/meta/classes/toolchain/clang.bbclass
+++ b/meta/classes/toolchain/clang.bbclass
@@ -34,4 +34,7 @@ TUNE_CCARGS += "${@bb.utils.contains("DISTRO_FEATURES", "usrmerge", " --dyld-pre
 LDFLAGS:append:class-nativesdk:x86-64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-x86-64.so.2"
 LDFLAGS:append:class-nativesdk:aarch64 = " -Wl,-dynamic-linker,${base_libdir}/ld-linux-aarch64.so.1"
 
+# do_populate_sysroot needs STRIP
+POPULATESYSROOTDEPS:append:class-target = " ${MLPREFIX}clang-cross-${TARGET_ARCH}:do_populate_sysroot"
+
 TCOVERRIDE = "toolchain-clang"

