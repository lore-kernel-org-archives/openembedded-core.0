Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5378AC369AB
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 03:17:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.20816.1745723818007465025
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Apr 2025 20:16:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mMGoLqhQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-224019ad9edso53741445ad.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Apr 2025 20:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745723817; x=1746328617; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=mMGoLqhQQAhsEAYNoqWoecXe91K3RccKP+7hRFfvrpy954SnBlYGMkYT3zd1Q8p6Ef
         GwOGZ6reda3Ud2452VYzswzpLZmwBtYrjhmTC1x650aIsuOF/T7yl6kjQlkeDWdBgyrq
         ThPL31TecSgz6oDk+ZDp9Zrc6cjWc5SzpLIzGb0gOk7b8wBbSZc4QE6b7c/sp9qfzHjC
         e2suG9jj1lSR9M8UhsSaUkaoom+bUOKqP+Lje+dP3g2btlIKkhASAJ8lqDLCqYs20IbH
         H9ZiYPlnL2WLouQqD4Pe60YiPg08KqrCj8zPD8wTWBdGl7Lr6PgqHj4i56w+BvUqbX6Z
         DU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745723817; x=1746328617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH9ycSrD7ytatXY+2Q+NTv2xbhftYfwAh/p9+7Qjx04=;
        b=gNBRW/iKRz3XjZasljmVIBQ+HVvCCIVgZWn/e/7FA2BbJbs4kyzc/g0PHPHkhwKiQb
         C5kpmccXND1zEaE4AxIKkk35XMeZ2AR6Fa1NWw7JUPVKCi15V1Sc61f2pJbtdoxzC8nE
         PaXoyV0/ePPmJoR9obocwlCoPZis4Uc6RlDaNlwaK6jlbYAAEbjL75iExdjmShGimCin
         5dHM6A4uc5sYn5lxFFkVbcvaoO5uOsGxl4LqYhMBBMIBEWn+j5p0NU5gYL8mbbm2ymtj
         Gv1ANjE5b4h1MY4SO9VOZv0kpN2fw4SSQG91T33+ydddRebI+s7cijVFbj3xjOlRJNn2
         jGOA==
X-Gm-Message-State: AOJu0YzcaL3ycMzZpECLXCg5k26PNN0RcAqzg82opzpxYi3yaEOTQPSY
	pUZeWKwltb20xJ9ono1DBUIfM3BvqHBqL88hndXDIsIjSyvZ1mS3
X-Gm-Gg: ASbGncvNoTjiHQW/EpYsM+jYnqit8eAgKVeK89BXII4An0jenvdrRuirhrUQH7NKKlj
	3v5YyX9A0U7D6LvBiwCS4jZ1AfqUTftU0x3f9jRJwaKvoUb29rcjD96VwvW5yvJORslXo4a3Qqd
	iPC8YWv3iJZLULdbHY021qVK2YKDMeJucWZKHV5yVkvaLgo456obUxabL1oZjuyFLZquE8iHD4Q
	VT8+rXeUnwx2bwShbaEB89agkbm/CX9xYq+vu1aMcogwaJw5Kq/+uDICxGUSg/F6KW+Th2mm/z7
	HXxaLViXG/m2cv427cVsT+I8/YeqgbNm36rLgOyMGwY=
X-Google-Smtp-Source: AGHT+IEOzb4xyzQAb+tIBakD1z2LC3+uPDnXesx+JIgasiRzhOJdTojx4xboWtVx+uLtp1DM/vwhOQ==
X-Received: by 2002:a17:903:22c4:b0:224:24d3:6103 with SMTP id d9443c01a7336-22dbf6218a1mr120512505ad.35.1745723817362;
        Sat, 26 Apr 2025 20:16:57 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ed40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm4362452a91.12.2025.04.26.20.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 20:16:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Apr 2025 20:16:41 -0700
Subject: [PATCH v4 02/10] toolchain/clang: Remove duplicate RANLIB setting
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250426-clang-merge-v4-2-42d205904261@gmail.com>
References: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
In-Reply-To: <20250426-clang-merge-v4-0-42d205904261@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 03:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215533

Its already assigned couple of lines above

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/toolchain/clang.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/conf/toolchain/clang.inc b/meta/conf/toolchain/clang.inc
index 40bfba2fd4febec0d7316a51b10fccda3363c43f..0e5f0769f85a8373c58d4b54dbe2bb1cf7dbd50b 100644
--- a/meta/conf/toolchain/clang.inc
+++ b/meta/conf/toolchain/clang.inc
@@ -7,7 +7,6 @@ CCLD = "${CCACHE}${HOST_PREFIX}clang ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}"
 RANLIB = "${HOST_PREFIX}llvm-ranlib"
 AR = "${HOST_PREFIX}llvm-ar"
 AS = "${HOST_PREFIX}as ${HOST_AS_ARCH}"
-RANLIB = "${HOST_PREFIX}gcc-ranlib"
 STRIP = "${HOST_PREFIX}llvm-strip"
 OBJCOPY = "${HOST_PREFIX}llvm-objcopy"
 OBJDUMP = "${HOST_PREFIX}llvm-objdump"

-- 
2.49.0


