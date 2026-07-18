Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B08BDC4451C
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 13:25:30 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5899.1784381124561159593
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 06:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=neIophLD;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: adam.blank.g@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4954df200ddso5776875e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 06:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784381123; x=1784985923; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+cGKuAhpja/yVRUPrcysdT/zyyNoWCxBH3DK9j40+U=;
        b=neIophLDwzS7vNZ3J2rFxOw349BaTXi6v182Z51+In6lkMty9MRJBTIa+KJkwzr1Uo
         s4cABlzVVDw2iVUXbFZjjsZ4d6+ZY5sUdQ+7L8fjWLU82wyCz3VutlPqaBgNYim/LMyJ
         j5Xee7Jji5NVPrnMIYXTPOrzsIgQRQ6ZHyV1RHvaPliEjWKXd2AJvtNKGAiQlgQk8zOc
         /8Np9V+USOrV0amArD8vlgM1zKa9mPilExT4IbVGpUU4UmvRGteqQdzwfC60igUp6AgJ
         18UQcOZ0jH+hXzD1MsqOHAKx5i9Tw2vo59JVzD0x9lZsVDGUjGCVZdXMfg5YS0o+zXLn
         ZpAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784381123; x=1784985923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+cGKuAhpja/yVRUPrcysdT/zyyNoWCxBH3DK9j40+U=;
        b=GscMmN5C2NlqlNfZR3DJ9+/8dHOeErI27eCEjDun/M34zEWscV3P+XK6YL84ojty/I
         nIYc7A50uOeXooPT9uU3OgKFvlBzd6Kjfd9ZYJwKq7MmJSfLdfh0oxuTijqqcb9zGmnz
         HYzszwY1UE2/q+3bVI0Ea4wBRIfU09BQ7nG8GIgwpqAq1FqkxV6pLdAPNzGfIpjID+DC
         xpcNq5JEutlxfRDLtjOGD/ReaDSfQALvKgTcN5jPAVzjP+nCqnH/wqicYdmaysuqWAYP
         wjkmGZdLmbRKohMgWD+zp+bzhpqg3SZWHFfFaGjjXTSj3n4qb+zkOs31JKKfiG7ZDUOl
         o+tA==
X-Gm-Message-State: AOJu0YwnakoNDeLy/4LiuIJ/6Kypnok/z78RlHNBuZERUztTeVringvz
	54bnIu5Ewhd81pTmM+TJ27/Ntdg8qsK1RMxDMSupusQpkoegV9v2MQs/NvWbDQ==
X-Gm-Gg: AfdE7cnaC/PEjWLzUhaylsKOb96t8gko/mnM6g34VF0IjbA3M4/z/Zc8KtKVMwgeQBL
	BZBNPmFnZFLllh0b68f8kGybQoxPjXIbuigMiuoHA9ZlhM9FJKRGA4opCFAXxmaAoaVr3L5vuXF
	0InZUVSP62PNmfKjMJQCueQCyxn7K1TLJ2J+kX5LJvJ+yhE0j2JFk+YZt8PG/KK10/+En1rWbWp
	vRT1F6SSrXGFAcb8foqxHumZN2Xb/vMhY/5yb5+QLpkIv2PCatAj8CJDe6K91UFEGmiq8L9jrrW
	wUdCzMOC16kqwBMuPZpe1I8FBb6aey6IuqBXcy32LniBL9SVhN0qLAv2Svghetx5+M9bad1obII
	Xxf0DqVajsXGu/TaGkWBqFbxdRMbADzIMYrAZ4U/ngNrW6hJJDIbfcWixG0ULqI2pcsHIlKgm4t
	kJCqTsnRHY
X-Received: by 2002:a05:600c:1989:b0:495:699:84ca with SMTP id 5b1f17b1804b1-4954a798f17mr69297365e9.28.1784381122707;
        Sat, 18 Jul 2026 06:25:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:689d:c0a3:3de0:7033])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2a2504sm136563175e9.2.2026.07.18.06.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 06:25:22 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Sat, 18 Jul 2026 15:25:12 +0200
Subject: [PATCH v2 6/6] bitbake.conf: remove 'extend_recipe_sysroot' from
 BB_HASHEXCLUDE_COMMON
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-extend_recipe_sysroot-v2-6-b7cbf35d00ec@gmail.com>
References: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
In-Reply-To: <20260718-extend_recipe_sysroot-v2-0-b7cbf35d00ec@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784381116; l=1273;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=awYF6CrVSOUJE587mfqv9E/g4mt8SraEeNw3xJkMyeM=;
 b=zxLwIBKODiJ6q/WzOw+S8zU29QOgrNKy/PILjpbMgkZTSXE0pBKuDIKbHVrBpWH6g/XTZlgSS
 mnOPaSLNhroAU2ORMfRkji9Z8nmHcQH3XlmaZZu+xSBILSQTrvMNu4h
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 13:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241264

'extend_recipe_sysroot' can and should be handled just like any other
function. Fine grained use of 'vardepsexclude' is capable of achieving
the same effect as ingoring 'extend_recipe_sysroot' on the base hash
level, but with a better visibility, and is a more uniform approach.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index bdf37d0da2..1830cab753 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -964,7 +964,7 @@ BB_HASHEXCLUDE_COMMON ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DI
     STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
-    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH extend_recipe_sysroot DEPLOY_DIR \
+    BB_WORKERCONTEXT BB_LIMITEDDEPS BB_UNIHASH DEPLOY_DIR \
     SSTATE_HASHEQUIV_METHOD SSTATE_HASHEQUIV_REPORT_TASKDATA \
     SSTATE_HASHEQUIV_OWNER CCACHE_TOP_DIR BB_HASHSERVE GIT_CEILING_DIRECTORIES \
     OMP_NUM_THREADS BB_CURRENTTASK"

-- 
2.43.0


