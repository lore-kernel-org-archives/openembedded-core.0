Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD575C87FD3
	for <webhook@archiver.kernel.org>; Sun,  3 Aug 2025 03:35:04 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.11008.1754192103173271305
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Aug 2025 20:35:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ljcrc4vX;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2402bbb4bf3so26744565ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Aug 2025 20:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754192102; x=1754796902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb2kVLLGYRJ50QmLjF2Af7Cjoj/29VkowjbW2SqGuOU=;
        b=Ljcrc4vX35p3ipePzLrJQYiqC6ufT8ZaiyF6kEZ+fWWBJJAkpHx3S1EaGA3bo0NQMM
         GySO1DZvk7W0IIJDseenX28HUIhxq1k9iQgzvdB4sJngOk6QlFf6a+TiOXiD/uvuwP79
         N9BLX6BamRdBr78wMl4uYTxVvPO45jahgMx8cjTffLst56h46bnVusRdVf+NC/ehVFT8
         2WQnb7FkPWTe6LMbTo5kXPHFrcMtFUy3N5zQBpokNAfwOE2EKf27STwNvv/RGNaHCqGj
         h2+YhjekhKrc3iWSk9Q54tpwfU6XrQbQKWH4Ir9m4mLeyo3Owcm1n2OyQnjOj7DrMpSZ
         s28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754192102; x=1754796902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb2kVLLGYRJ50QmLjF2Af7Cjoj/29VkowjbW2SqGuOU=;
        b=s8TJLQI6drfnjQ9sxzP76JIz4xVoKPmVgBb6bhtJMHbHC6mHGAubpgEgRe+xLax6WF
         gijzfvJKYyox8H9iwALEPOhmnwMYxf1jYJ4Bta3YjbQPBbC7iB+SA+FfAK5ILKjVKgBF
         fVHyx7IK/avF1+z12OZJreG/Q5JH9EBAh3J1+Jb//0mmdr68d9s3rxWPbScqe+8pODCJ
         zZO6zGTkhDhlSWnzbgRBxJi+1EONkhZjrzQHKMDR9Xx4AFUciHhJe6Vbs+bX4zDgn6Yv
         GZ+n7crroccelVhd8VVJVHBcZxZoiYcITjeMV4RHJDGqf2QSn7V6vvgz/OQdGfkBaF4/
         RoOg==
X-Gm-Message-State: AOJu0YzLr1INbvn5HuSSgdqTMc6xXA/gZtKoYWQzeS3loWljnVm2aVv3
	qcT9JoapfjDaF95HciiX4n/ToUXL/ve7WGSExHfrf0lH7FLqBXRjW4eUpoDozt67dBw=
X-Gm-Gg: ASbGncuKp3a9qYz21ogxm1Ih3DErIhDFs8RcrbbhS6SB3/D/rI3XL0mVha4J9HhEGFC
	r5Zn1X2azH2ljSPWrwKl4+fVbgZmJilrV5AuILPixbYUuueQSbkA5HEkgpzLNYpl+pUJ+gDvd/E
	6MPIdjUR6ZN2zT9Db22/VNlG5do0Z3H1g9fx7meN/PPj9nux9nSwkv6QWTyGdtwbiR+62BtOR8U
	xn/IzFvv5nGe2vu1YIr/AOybF0tt0q4PEztg4T855JjDprA7ArQO017IEdJ5LA/gfcLnhU4MNI+
	PVXwNwCWOo9/VoiM0y9ov1ScFCfgpTTY5gnEn4JbnPK4aGnkkyZkYiYgn700JQC5Q8bDQcs8ibE
	J2fkEeA16QLbZq+qKneQcqg==
X-Google-Smtp-Source: AGHT+IFIjZEonrC+gB2Jb/vOxvDv/08mmwjbq1+/qDiukECs/88nF6oNa1N970xc3L7X6nIrwBGlBQ==
X-Received: by 2002:a17:903:22d2:b0:23f:fdeb:416f with SMTP id d9443c01a7336-24247014048mr70721215ad.35.1754192102285;
        Sat, 02 Aug 2025 20:35:02 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8ac8dbcsm77830365ad.194.2025.08.02.20.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 20:35:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] clang: Remove dependency on swig-native
Date: Sat,  2 Aug 2025 20:34:56 -0700
Message-ID: <20250803033456.2029035-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803033456.2029035-1-raj.khem@gmail.com>
References: <20250803033456.2029035-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Aug 2025 03:35:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221403

LLDB Uses SWIG to generate python bindings, however
LLDB is no longer part of clang anymore, its a
separate recipe.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/clang/clang_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index 7ffecc4637f..6c5987a74ad 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -140,7 +140,7 @@ EXTRA_OECMAKE:append:class-target = "\
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
 "
 
-DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native swig-native llvm-tblgen-native"
+DEPENDS = "binutils zlib zstd libffi libxml2 libxml2-native llvm-tblgen-native"
 DEPENDS:append:class-nativesdk = " clang-crosssdk-${SDK_SYS} virtual/nativesdk-cross-binutils"
 DEPENDS:append:class-target = " clang-cross-${TARGET_ARCH} ${@bb.utils.contains('TC_CXX_RUNTIME', 'llvm', 'compiler-rt libcxx', '', d)}"
 

