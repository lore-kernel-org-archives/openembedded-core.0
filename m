Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A81C3600C
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 16:33:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.43710.1742834031945894519
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Mar 2025 09:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ldcrfQf7;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22548a28d0cso89068525ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 09:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742834031; x=1743438831; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U5Z9JRHIDD9gDasyTHj7ojODX/YkYObh2L+IyxC+nk4=;
        b=ldcrfQf7V3MBECF44D1J8WuiHy0k2RctI3PCDpsjKv6Rb2/nYW4wZB/XBHZkFIGfSo
         Q/O6hkX9iN2KI2g5xI2PUFiaEIcY/2+1qpbBPru7z1fVtmts4CyGJdMKmjYKs5tSjeCG
         gFaGcdr1xZQY6WWEvvoSO42R4yvXb+9FKnEqUPs4ef2+aZKLrbUDn/bI70uHCBxNErkT
         jTAV1vUaANGYZq0fTWshxNvCS5q5xx0ZSnQr5AjUnNzPwCSsl05hlgv8D4Q83xV3lupF
         pg/EysgNAOp/el/fr0+I1GodExWpPZeXlF2oXo2GTX2sNuISkzctQRveSqqdtuyYEf2D
         aeyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742834031; x=1743438831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5Z9JRHIDD9gDasyTHj7ojODX/YkYObh2L+IyxC+nk4=;
        b=NdHctzcLCOONl+AvmVur9CXQFa3EuZjGOLO2lgRbLcWLJ4c52+R6sTLf00j3/Whwkz
         q5EcipYRs50a3lxIDhvILx+RHnDIoQIAAW5WKCQkybFwGfo7VNgQ0rFdRpnrW3cZfV9P
         cli+ZZNry83vWfEKqNqdQ5tjgH3Z2shQwNASuvGJfyQRHfM9XhsDz8cHDpAbADIy73TB
         U5P5WW9TbR58B+0nSL33oo4tcPto4AsVQx0toPXRlIiVj3Y1haW9tyj9fu/ZnLIIYEWS
         Vo6x66ihpkZw4mKmjU4OKDmNXQtUXv+EiO965ZQYChgFONYBg95f5sQaBX9Zj9n6SDzW
         XJdg==
X-Gm-Message-State: AOJu0YxWaMVcvJD7nE/ZPQGzqvy52H6JtSUl14ExWvN6axGSGch/OeAk
	UlI+I2vROPrQo43YACbk3MITS4TgVilSsUY7QCLMYGfUH2ZPfK7J
X-Gm-Gg: ASbGncu7kF7/N+mNoG35Wr7Swq98IKsAsueVmW9r0lFMEGwWRsuG73azfRm8iDolzP/
	Ym/OpN3ZFZvI4bKg8crhqzpj+VFauNYxp1JgP6iruWDOUXEbmjgCfFifQFi0tzH83l6qyfsLs+C
	xC8MR3jxMA9cZe0VcVeka8Xg8z4Y6bsIlcPQ3sifHmVn8guJK8TCh80TaRVFL8UYZQZYjwKt7sY
	cGuq/chC+V8iebdsKBtV1ZzBQZFbqzYkKyg438C+doPEh/IbExZrWnMCWIP3UXFWAEFevfn5TmR
	CR6EOCeVd2QP0zJaMHfn94ryryjwIeTMzXgE
X-Google-Smtp-Source: AGHT+IE+AQo8t+xLtmzmgSxooqMNLLVDWd+wourS3JdSu74B33QvHDyPSkbo6wx4gzU6+se167AxIQ==
X-Received: by 2002:a05:6a00:3929:b0:736:ab21:8a69 with SMTP id d2e1a72fcca58-73905635469mr23778672b3a.0.1742834031045;
        Mon, 24 Mar 2025 09:33:51 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::b570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a2803d8csm7372192a12.26.2025.03.24.09.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:33:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2025 09:33:30 -0700
Subject: [PATCH 09/21] db: Disable incompatible-pointer-types warning as
 error
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-musl-gcc15-v1-9-ca68c03c5b01@gmail.com>
References: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
In-Reply-To: <20250324-b4-musl-gcc15-v1-0-ca68c03c5b01@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 16:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213541

GCC-15 treats this warning as error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/db/db_5.3.28.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
index a7d061e0da3d5e92c1cd0acf80a17a0e754c53d8..2e68398f5764dbe1eb9210b372accff2b3f32ee5 100644
--- a/meta/recipes-support/db/db_5.3.28.bb
+++ b/meta/recipes-support/db/db_5.3.28.bb
@@ -118,5 +118,6 @@ INSANE_SKIP:${PN}-cxx = "dev-so"
 BBCLASSEXTEND = "native nativesdk"
 
 # many configure tests are failing with gcc-14
-CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
-BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration"
+# -Wno-error=incompatible-pointer-types needed for gcc-15
+CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"
+BUILD_CFLAGS += "-Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types"

-- 
2.49.0


