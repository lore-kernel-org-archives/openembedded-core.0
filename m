Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF90C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 11:21:20 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.50129.1638789679124299524
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:21:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MDRhhEk6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id q3so21651143wru.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 03:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f77rOi+qgZswkpNJI+U26hq/OWYQMpLuYs/xds5dXLQ=;
        b=MDRhhEk6U5fbwyM1mR190Cz9ZZKFu5aRg9s+5BVhwplkmCWPwrn1Mt/tpUHTnIQlRP
         OQdW6z5P0gVPThDOMZq2lWLc5tdmn5N/jK/f2FUFyyIM9Ru+ikM/Hmhez56pBL+OFhcU
         qFszb2EtbjJP2FlmAO4Ko1WP65ZtOb3aZDMWM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=f77rOi+qgZswkpNJI+U26hq/OWYQMpLuYs/xds5dXLQ=;
        b=XbAaMZTEmDpAYjxxprZJ4pnELcRyOu320UcRkBoXPxT053Tyz5ffNDv0u4VmbIaemJ
         LZM2LyOuH85RNHbQ2KVKOt8EsTZTwhTrP73w03jfE77RIX++9vCmg3tCgT7f7CKzsZJw
         3frp6TJhNUERQsWNsnkvVLWlMk5Sx0r8Vq1Q42yqP+zOie99fzb9+huDwFyMGYCZMTJq
         c55OF3SINy38U+8doSgTA5X1Aku7uTmnmLA3vUWs2w8XxEyv9JLqK1PfVOIiRpnOeLKf
         HjadPP5FAFw/LUGUCvhFA9eZZfocv18I/oqZ5GGnBHmAML6VL6MzI3l98FQBuN0oRz6t
         UYBg==
X-Gm-Message-State: AOAM530t7hoMwtff+A+iDDVIHk/tvArUYp+MvUFK1Vk9JnfdNjNb23xo
	3N/orKU3pSB1A/Pyi+/YwEdU1p+bLaQ1Dg==
X-Google-Smtp-Source: 
 ABdhPJwg5xBaIKGLKaci3fmMyeCjl8ILcGoXhXoV9yniNe7UcMdumVDKjpLOgCZq4qYGrWxcyPAiGw==
X-Received: by 2002:a5d:64eb:: with SMTP id
 g11mr42826486wri.438.1638789677154;
        Mon, 06 Dec 2021 03:21:17 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:50e7:dab5:2141:24aa])
        by smtp.gmail.com with ESMTPSA id
 q26sm11057673wrc.39.2021.12.06.03.21.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 03:21:17 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gcc: Update patch status submitted->backport
Date: Mon,  6 Dec 2021 11:21:16 +0000
Message-Id: <20211206112116.494630-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 11:21:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159222

Patch was merged to upstream gcc, update status.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
index 6b6925735d2..ebee30bbd62 100644
--- a/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
+++ b/meta/recipes-devtools/gcc/gcc/0012-gcc-Fix-argument-list-too-long-error.patch
@@ -17,7 +17,8 @@ gcc/ChangeLog:
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
+Submitted [https://gcc.gnu.org/pipermail/gcc-patches/2021-October/582722.html]
+Upstream-Status: Backport [https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=66e157188bd2f789809e17e85f917534c9381599]
 ---
  gcc/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.32.0


