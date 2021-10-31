Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7C9C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 16:58:56 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web12.32838.1635699535086802871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=OxkAgj6/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id e65so15060440pgc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 09:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FKtkOi6AyqrjWflrfPQX5HkdGe5zBaKLXMHt+k9NG/Y=;
        b=OxkAgj6/FsyeDhWsJGp+zO5Fd2MpCUfkd6skowxdrGCNqG7ThO0WQhdPt4qj8sRDy/
         NMl33WeV374+AvtDbb8bLc9O9nhTplrGdQaYIVapZMm7U5dGsK5VLtWTa8a81lchuPRh
         /7NK51EgUvxTfuYMmUVUm+q9WNmLcp3KCd+hfNNU26cotoyAfm+bFqAC6iiiJXTeLHtG
         cFVCYX+oxpfzmQhQhnxoTJw20VnxVfZGVIMDb6PFbgDGkihFgzg2TRkRkbi/Ro+vC2+q
         FTi8e1+ZNplQYRu/SJ7fQXaTo86/BHYSkfhhnp4IZ4e/WBEHC2az8AfCll9lO65jNfpf
         wGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FKtkOi6AyqrjWflrfPQX5HkdGe5zBaKLXMHt+k9NG/Y=;
        b=FXfT/J+clZAukaZBmti30ed8xmcz5Ds3TgC6FO6EOqce+/hfS0D32Vs7fDhOKkHRhy
         0RlAiuLQX0P9HhSiSYVQtcoucg6Aien3X9Ag+s0NJ3hhrNqDlkf9D4j49HRm673CCQqt
         s9ULq6MXpDkLVWXkQLQmsr8gFAnGXoC69UiVLgkPcnFFZVMV5hJgmHZZUFrKf498zufh
         WXaSXSvLhnraqUaljHnM/SUNSbLwxnPFSnNEcRzFrMJfytqTESslG3VPrbEHCYl2DwFi
         qX/jrYRBf6d/FTb2NabOk9Ax6PmQZDUuKRH7AtvpPRZF7TLYkVBigI3UBU0lTc5XIvaS
         C/+g==
X-Gm-Message-State: AOAM533JqZ2A4oGFTR4laCt5WBVHH6d3GSruUVLQPqlSUJBa7KmbplSX
	LGzfroOkhGQLYvSoAjtuLvzjYRto4OzwvFkjk1c=
X-Google-Smtp-Source: 
 ABdhPJyRFjzgjQkV7PgE86vuem/uuIUs+GjV9A+rP/jOJIeQ0ZpydCTgOAAECb2axrD0OfTaO9CfuA==
X-Received: by 2002:a05:6a00:16d4:b0:44c:22c4:eb88 with SMTP id
 l20-20020a056a0016d400b0044c22c4eb88mr23630728pfc.75.1635699534169;
        Sun, 31 Oct 2021 09:58:54 -0700 (PDT)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 s21sm13476617pfk.175.2021.10.31.09.58.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 09:58:53 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 26/29] wireless-regdb: upgrade 2021.07.14 ->
 2021.08.28
Date: Sun, 31 Oct 2021 06:57:45 -1000
Message-Id: 
 <106bf947d3192bb962f0bd80b69524ab8aeba292.1635699172.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1635699172.git.steve@sakoman.com>
References: <cover.1635699172.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 16:58:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157684

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 00c590f50d6894089ff7ce8ad6e263431d9cc550)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ireless-regdb_2021.07.14.bb => wireless-regdb_2021.08.28.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2021.07.14.bb => wireless-regdb_2021.08.28.bb} (94%)

diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
similarity index 94%
rename from meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
rename to meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
index 40b4d563f0..376311804e 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.07.14.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
@@ -5,7 +5,7 @@ LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 SRC_URI = "https://www.kernel.org/pub/software/network/${BPN}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "2e2dd216a5f1a310b849774af63e6309d94c2207c34771a534c47ae18b162742"
+SRC_URI[sha256sum] = "cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446"
 
 inherit bin_package allarch
 
-- 
2.25.1


