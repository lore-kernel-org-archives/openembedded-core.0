Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 815D0C433EF
	for <webhook@archiver.kernel.org>; Thu, 25 Nov 2021 23:40:13 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.18256.1637883611931753374
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 15:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MR5L42e+;
 spf=permerror,
 err=parse error for token &{10 18 _spf.google.com}: limit exceeded (domain:
 linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id l16so14766331wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Nov 2021 15:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5vsv6OELz7iFIm+zico3JmmQaXnd/eggpbYR8oSpOA4=;
        b=MR5L42e+3MSVooexqLx2YlFervjsZtG7nAqjTAPJc1uAVTfjj170YUjhxuPlj4o/Sb
         h0s18St+E7nTa2vZZF7sUCNyFMZCcoldubFtOxzFj4V+snU7V2S9zfM2IbrCLXmrShKH
         09rBH1oSQTczgTCWh/mhKqqrCH3UtyuaXj5Fc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5vsv6OELz7iFIm+zico3JmmQaXnd/eggpbYR8oSpOA4=;
        b=wUi3XVKqx9YhQt3eCHpkL04Xhq6zgkkNVHaPWY8RVFUsTwH5R/Tiwopwey0F/pBGRW
         qfkXRGT6VVr2pXSmByfu7ueqjelLKVq8yX2LrDwvqzQBGtwxtawnmWSAJ4X3GJgkt6Zi
         aZ3JQej7q0q4uX3lwrx8XCK7PMvCmfxofBh3iG66N8N2vmspZ8aXrHeOUtoMewplFWab
         AMVX3VEn9+VxMiYLMky3DDrQZoAQfp46l67GpPRwWC3SXhaH03bwR1C6x6rQhSe/vGgA
         iPe12t8wTlSZEBnv0BuNAyaaMqqs1Q48huhrbpDDfz66Ii5dfSsUcio0mjMTjqTW9Fsa
         p3rA==
X-Gm-Message-State: AOAM533lEAAVh5GN2PIUmJErROp4y9PHC5iLiiYFYG06W5h6W9megkA9
	PK3/+Vi4hPLWGJwmwQcWTzhlaVPGEoRGsA==
X-Google-Smtp-Source: 
 ABdhPJzYorIeWtcOYb64emxoXhDYVd4/lt90p0EJN/Y4KrLvBxpqO2ESKRQ49jfG1/PE+PjgPViEuQ==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr10480859wrb.50.1637883610037;
        Thu, 25 Nov 2021 15:40:10 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:f21b:9c01:debb:ef34])
        by smtp.gmail.com with ESMTPSA id
 v15sm3939069wro.35.2021.11.25.15.40.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 15:40:09 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Drop further unneeded precompiled header patch
Date: Thu, 25 Nov 2021 23:40:09 +0000
Message-Id: <20211125234009.147680-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Nov 2021 23:40:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158795

According to comments on the bug report from gcc developers, we
no longer need to do this post gcc 10. Lets therefore drop the patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |  1 -
 ...-fault-in-precompiled-header-generat.patch | 57 -------------------
 2 files changed, 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index afb8f2df5c2..4c18396a15f 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -52,7 +52,6 @@ SRC_URI = "\
            file://0028-Add-ssp_nonshared-to-link-commandline-for-musl-targe.patch \
            file://0029-Link-libgcc-using-LDFLAGS-not-just-SHLIB_LDFLAGS.patch \
            file://0030-sync-gcc-stddef.h-with-musl.patch \
-           file://0031-fix-segmentation-fault-in-precompiled-header-generat.patch \
            file://0033-Re-introduce-spe-commandline-options.patch \
            file://0034-libgcc_s-Use-alias-for-__cpu_indicator_init-instead-.patch \
            file://0035-gentypes-genmodes-Do-not-use-__LINE__-for-maintainin.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch b/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
deleted file mode 100644
index 70afa4f9e95..00000000000
--- a/meta/recipes-devtools/gcc/gcc/0031-fix-segmentation-fault-in-precompiled-header-generat.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 3d59f763b824ac11f8360931092baf0bc1719562 Mon Sep 17 00:00:00 2001
-From: Juro Bystricky <juro.bystricky@intel.com>
-Date: Mon, 19 Mar 2018 22:31:20 -0700
-Subject: [PATCH] fix segmentation fault in precompiled header generation
-
-Prevent a segmentation fault which occurs when using incorrect
-structure trying to access name of some named operators, such as
-CPP_NOT, CPP_AND etc. "token->val.node.spelling" cannot be used in
-those cases, as is may not be initialized at all.
-
-[YOCTO #11738]
-
-Upstream-Status: Pending
-
-Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- libcpp/lex.c | 26 +++++++++++++++++++++-----
- 1 file changed, 21 insertions(+), 5 deletions(-)
-
-diff --git a/libcpp/lex.c b/libcpp/lex.c
-index 06bcc31c87e..24bed9a35fa 100644
---- a/libcpp/lex.c
-+++ b/libcpp/lex.c
-@@ -3531,11 +3531,27 @@ cpp_spell_token (cpp_reader *pfile, const cpp_token *token,
-     spell_ident:
-     case SPELL_IDENT:
-       if (forstring)
--	{
--	  memcpy (buffer, NODE_NAME (token->val.node.spelling),
--		  NODE_LEN (token->val.node.spelling));
--	  buffer += NODE_LEN (token->val.node.spelling);
--	}
-+        {
-+          if (token->type == CPP_NAME)
-+            {
-+              memcpy (buffer, NODE_NAME (token->val.node.spelling),
-+                    NODE_LEN (token->val.node.spelling));
-+              buffer += NODE_LEN (token->val.node.spelling);
-+              break;
-+            }
-+          /* NAMED_OP, cannot use node.spelling */
-+          if (token->flags & NAMED_OP)
-+            {
-+              const char *str = cpp_named_operator2name (token->type);
-+              if (str)
-+                {
-+                  size_t len = strlen(str);
-+                  memcpy(buffer, str, len);
-+                  buffer += len;
-+                }
-+              break;
-+            }
-+        }
-       else
- 	buffer = _cpp_spell_ident_ucns (buffer, token->val.node.node);
-       break;
-- 
2.32.0


