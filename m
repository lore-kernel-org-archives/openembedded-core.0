Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6B9C54F2E
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 06:20:14 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.4741.1747808411342055129
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 23:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IXcTOKLE;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c46611b6so4577043b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 23:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747808410; x=1748413210; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qy9QaZrLFaGyM7LnGzjT2bRHRzFWBr3Y61r2l2V7h2w=;
        b=IXcTOKLEPJc7dGBH46/ZyTLxR3bE4vYn3fJorzjlF8Qpb+jInzS4EW0zk4uGJXffD2
         FiuAyZTLNERPOmGwOpuxiMqh2b2EgKBvVc4OLWQ8RxDpipIWpaU2ty2HzN8BlAnXx6Pf
         SRLDGL9L9hZdatY13baf1nIwQPTyAtwFoscZiutsAmMYghatWnEeO3UAYIe4lF0R/n7L
         SXdP4PJLRDldSg5p2hiOAH+TLG+GXGaKx8zzDP6ZMqrXqaGzajnO3Wvb7Zcxa3IoT50L
         zELxMEALs2LoV9Va3aGOkDnspOR9ylaCZAmkjN7RQQvSv1N7VfnPJotEcdTze34idNXT
         uiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747808410; x=1748413210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qy9QaZrLFaGyM7LnGzjT2bRHRzFWBr3Y61r2l2V7h2w=;
        b=P9h39/sXeqGn9Whvhj7x0qiQEATg2TNJ98TGDL6oeUG+D3Vl6Qn+AxCUSse6mhlYHo
         gaT2z2uFS+SthE3Fchc3NyOlIJzvYCFpf2kXJn00wkrC1w8DNeB1+itkpJPNFRmZxqGl
         KWDhxQFotMAhabo3oedKpnLmAh0Y82IFNLXuNMDYYFJqDaM5Xqdtedq9Ir5rPH4w8UBz
         /LQ73F7vn+e71I+fW3tm3PEh7RpBkxIvHCOELbrsOTCSyH8Qrq8h45TlIb1TRNur2zSZ
         bobJBpFx7ST5wF3DG1XyvUdWBUvJunM1Mv+SHlcXCIuY+UVnaXgWnAZfq8pglZXNHw59
         kGwQ==
X-Gm-Message-State: AOJu0YzcDW4iqO7/sOnDNNgjSkg/uoJv6VyF/U+M19FeZXi7QpKViCkd
	f+GAT0dleJixRNDkpnoxjc/aIRemFtLV1z7/JMMkOD0NsqPCAhd32ksaWubl0+f2
X-Gm-Gg: ASbGncvbVWnmibTD/AEvGgnAmHo/CiomVArOjh7nhmJpxGqpvJMuMU9eQ09nJyE/URZ
	rzWuXJ4nkkT9Vd7/elVOMX+hIpz+3wrVPk040Hti9vQ+w4/+pWXXEyUZZL6umZrnLVt7cl/++mc
	nw5WUMDzfgIdo2TRAQy31hhBL/8mkUgbLE2mYJJ/o56DOM4GJg/61YhAubp4716Loyn3GxKUUhL
	1renRHm3xccQWU5WfvpKLxSl2SyFr1+HsR0mOX3X2qpJbn4TiLXverP70Nx3+iEGuUoQpuaOKuY
	kI/LznDmOQ3EM3ghiJUzIV1TPvgKQD3cgyjy7I0sfjPn3GUHxkZEkA==
X-Google-Smtp-Source: AGHT+IGUGyQg/Vn7gZpQPgANJwLuSon7xza3hr4xAtSgtjlAnBMoln7Dpw4aF/d6Ve59MSJY1hoKQA==
X-Received: by 2002:a05:6a00:c86:b0:740:9e87:9625 with SMTP id d2e1a72fcca58-742acc8ff71mr27371721b3a.4.1747808410503;
        Tue, 20 May 2025 23:20:10 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm8888812b3a.46.2025.05.20.23.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 23:20:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 May 2025 23:19:59 -0700
Subject: [PATCH v2 23/28] rpm: Always use gcc compiler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-clang-toolchain-v2-23-db97c2eb3756@gmail.com>
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
In-Reply-To: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 06:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216991

clang can build it ok but the openmp directives
get emitted with full paths into binaries [1] until
thats fixed in clang/openmp stick to gcc

[1] https://github.com/llvm/llvm-project/issues/82541

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 281fde1c82904caaa4c0aea94994b3ea3ac47315..bcc138dab045a25acf2ba73684d06c0a7df5aeba 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -62,6 +62,10 @@ OECMAKE_GENERATOR = "Unix Makefiles"
 
 BBCLASSEXTEND = "native nativesdk"
 
+# Clang results in a reproducibility issue
+# https://github.com/llvm/llvm-project/issues/82541
+TOOLCHAIN = "gcc"
+
 PACKAGECONFIG ??= "archive"
 
 PACKAGECONFIG[plugins] = "-DENABLE_PLUGINS=ON,-DENABLE_PLUGINS=OFF"

-- 
2.49.0


