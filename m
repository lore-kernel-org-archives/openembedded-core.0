Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4460EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:47 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.17386.1687961619904735650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AC8bqrj0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1b8171718a1so18909975ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961619; x=1690553619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oWl9NxuVNp1oIOKwAvuL/VUt6jinrvLuj/9GJKvw4hg=;
        b=AC8bqrj0VD3FEAVvBadrfP3jvIf43/MXCrX6jO/YZ1SqV7CFxA1mlR29e3nCSaudre
         V4SPUoKy7Nel48OKBIdLi8NSivcaZzRvt6zSQvrOeU6sibdCYdcoTY9F3FTffD7x9ouR
         umk/37TZBlPW+haUDCBfXWM+O9zybNhoGN/EDkEAQ8gMmfigPy4yn+2ETJsTVllLK2t3
         d5qFwJW1LZIFvQ2r99kaYdNUyBBDNK/CGyy6XdS/rd/xvzjNxYcw/xy6lDsewPOQIyGT
         rGT6eGqbHd0ptW2iLDzBamAYHMaFCWHIhwN6Uccwu0HNgEI5sKUxU3q/spVCNjTwEO5b
         FakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961619; x=1690553619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWl9NxuVNp1oIOKwAvuL/VUt6jinrvLuj/9GJKvw4hg=;
        b=kZWgBeHy589JB6n4mpobEDaa1UVX1HfQX5JIkTdI6sAf27YZXl/IVS1nV4v7hxFUq5
         HIpGM3Vi7zisokLKY8sTG1w50S7x6GTA7ia75GaoPL6Hz2/rs0+Kuxihc4ZoehEOsT6A
         Kzi1WDitJhwLFdJF9LdvJTnUQ73qW/KaFR/W1t/MpcAgiYC4jS0BTv+YDuz9hgfmNo06
         8gX3OLoJyN5oSLlxml8EV056gq/pzgpNKrKr42aDhH+2btJ3sG0StJiZyRc4++I36oun
         ap9uNsMlfGuQmpwiVVxTN+h3blrzf4+8rnGOfa7oZ9xVbxgf76YJjCxEwdjzE/6qsWA8
         X/uQ==
X-Gm-Message-State: AC+VfDzG2vNK5krmDQ+wM+U9d8y9b6LacTtQr0HXrXwvyFAfLORwicqu
	O8us1sGrMsnLHIZLRSLllEZJKDkWQ9gAhrGwRg+dsA==
X-Google-Smtp-Source: ACHHUZ4gxnkuucUJcQpTfNpOOvcTwxIfz6IgtbFZJQRlAPAKVIg/fqbeJvvwKEacwwlBhL6lI6wURA==
X-Received: by 2002:a17:902:d489:b0:1b7:e49f:d with SMTP id c9-20020a170902d48900b001b7e49f000dmr14123182plg.28.1687961619041;
        Wed, 28 Jun 2023 07:13:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/29] =?UTF-8?q?maintainers.inc:=20unassign?= =?UTF-8?q?=20Andreas=20M=C3=BCller=20from=20itstool=20entry?=
Date: Wed, 28 Jun 2023 04:12:47 -1000
Message-Id: <0823449cb03876ad88643df6c41c9450625d435d.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183577

From: Alexander Kanavin <alex.kanavin@gmail.com>

This was confirmed via private email.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc8bb0da24419424989548ced27b2e76030340d9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5acc80f059..78f85a6c79 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -281,7 +281,7 @@ RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
-RECIPE_MAINTAINER:pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
+RECIPE_MAINTAINER:pn-itstool = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-json-c = "Yi Zhao <yi.zhao@windriver.com>"
-- 
2.34.1


