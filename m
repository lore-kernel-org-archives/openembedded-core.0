Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B56C2D0CD
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.4715.1747808413124123905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AQsf1kbr;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-742caef5896so2991006b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808412; x=1748413212; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xra1JA2vLpqyYbfNNBjSebz93oiatkmBwPvx+NKgrqA=;
        b=AQsf1kbrgwTNjWJaMAyQytU/5gcwrOgAvuZjE7KCu3lYNrF+iq3RKcbaIM3osyjd5j
         uK6rL/m4drz2L62b0RKGmC390PUcEYblND/3nZ0b6KyVJFPsuCpfxf4osUbhPOy24IZm
         KjDSW6sbU9oF+GPKz6aQ+8N4hGs1wc1qUnc7UBkBgoni317ch3jcSvN03erfJGs7xb23
         GMiPIgsd2C6XD49/XnGyZefICicK8GYLfraOAdHosT2g/vG4xjmryVkHZqcfwzRdxu1Q
         Nf5q30yX7t4ePYVXz93EF6NZuAFKBcE7n3+IicWAHfYfIR89/1XYvhM/sbQULHUJ8iyV
         MYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808412; x=1748413212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xra1JA2vLpqyYbfNNBjSebz93oiatkmBwPvx+NKgrqA=;
        b=B6rNOHxG6Pa5T1ZpYvZfyft+V9Kk2xGnxv4/JwvqUVb2QDizcZSDzUlXtzbM9Ht7ds
         gnNGnvrt/a+fe43dfkiE7ysbPIkJJwBJlw8qkxhfEG6AGGqA5g0zVI5flz705XwLB/l8
         MN2HOmT5oEyQ8+jS61JzuB5xcocONA38BBUVbpP0KmfdoQHGv4LkZOcXKcuD4qLPHF6n
         xGEejZ+JS7ikygkeG0L00hz3HIi0omt8bhBnkCFYl+bTZ2cihBtct5UwlyNZ4yrr2mM/
         oBo+xcFr0k3MEJXsQW4KSIol6OdRSI1ohL+2uM7tV21cbms3jam/Yig5EYZz6UKyMFza
         55dg==
X-Gm-Message-State: AOJu0YxPE9/rt1nG8tj8bK8Vs+2mJXEg1w86xzgKAou6Hy2WRh4MrCn/
	SVWQsvwuZuPmOe98NrVkjbs2M3d1MYakJeT830GtRsZc+xI6Sgqf10MRm75RR9Wc
X-Gm-Gg: ASbGncsZDzCV59uI5pwIB7NIK/leftyA5+km9PhB9440YrRMF/+R4AvEVgSynmGNcW3
	cqZEdQovBwuyC5oz8fyFpC3nMuRC+dxOzIz/xGwDv3tqUMiCnD6yvYyVXFdVmk+wK6t+glbQMXS
	oxnLvGnkuB2Sc7m91ytGUGMiLoLetYZm8RCLyHKZJyKZhSsjqYmCXFWPkoU6eP938pVZQK2QsQ0
	hKvzLzhd+XWMjcFbWSa73qvfAjb+C2APq5PmUvR+lK1g2b3JmkMbEBGRvOPvTUXkW727Qg4ohIP
	7TriUJ4hu3HDvn3GZ9yLqIhBEgK5ghyw3OoMrYxE61WvjQYwDnwShA==
X-Google-Smtp-Source: AGHT+IGJYtaDy4i5VUwmF8oIGjzzZil84sk+4Tw9N3kZcxdWgBNoPa58O5F0iSbuV16VY55anujxPw==
X-Received: by 2002:a05:6a00:9455:b0:73d:ff02:8d83 with SMTP id d2e1a72fcca58-742a9786a85mr29437661b3a.3.1747808412208;
        Tue, 20 May 2025 23:20:12 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:20:01 -0700
Subject: [PATCH v2 25/28] seatd: Disable sign-compare warning as error on
 clang
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-25-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216993

Make it build with clang+musl combo

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/seatd/seatd_0.9.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.1.bb
index 8ee43a3dc8f61eeb6f1c03dbd5a68585fa471424..87e1c3b67d69ba29cfde14caf17e3a2010046eac 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.1.bb
@@ -15,6 +15,14 @@ inherit meson pkgconfig systemd update-rc.d useradd
 
 # https://www.openwall.com/lists/musl/2020/01/20/3
 CFLAGS:append:libc-musl:powerpc64le = " -Wno-error=overflow"
+#../git/common/connection.c:154:55: error: comparison of integers of different signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare]
+#  154 |         for (cmsg = CMSG_FIRSTHDR(msg); cmsg != NULL; cmsg = CMSG_NXTHDR(msg, cmsg)) {
+#      |                                                              ^~~~~~~~~~~~~~~~~~~~~~
+#/mnt/b/yoe/master/sources/poky/build/tmp/work/riscv64-poky-linux-musl/seatd/0.9.1/recipe-sysroot/usr/include/sys/socket.h:358:44: note: expanded from macro 'CMSG_NXTHDR'
+#  358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >= __MHDR_END(mhdr) - (unsigned char *)(cmsg) \
+#      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+#1 error generated.
+CFLAGS:append:libc-musl:toolchain-clang = " -Wno-error=sign-compare"
 
 PACKAGECONFIG ?= " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \

-- 
2.49.0


