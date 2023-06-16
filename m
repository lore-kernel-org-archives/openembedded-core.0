Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F049AEB64DB
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 14:37:58 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.281.1686926273092501479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jun 2023 07:37:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=n9RuB5X0;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1b512309c86so6563515ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 07:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686926272; x=1689518272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOTMTGSz7QBh7DT97mrIaGKW6SQ+FKVMzQ2lPDG7mG4=;
        b=n9RuB5X0GThMlvdrLtnJP9hegPPxdbENjwDU5Gt1Quaqp+TfPgGacAUSJfghd7b+lv
         EUArmEivPzR/bIES6nFzS0ug3Q79TLOtsTXIcYf67ZPIBNI3XwGyz1YQcu8uyXUx3983
         m2dAbPbXQOXw/lc3pYWyoskdiq0ykJ76YCz9T+o3vBMNTAWx6qHT678WGGzTkruARqWr
         l6TqPbwZja9PuCeIan9iXuaW9CJXnG0tDRYw1wk0Xtc0u0pT1jIXbb7uMk2Bognjs1X7
         9AyZfmvtJHvqfUm0iF3bcgzrq/kHDsOlzYPsRaAv62/HkjnsvsskvDG/zxpAr1xvCSZ0
         LPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686926272; x=1689518272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOTMTGSz7QBh7DT97mrIaGKW6SQ+FKVMzQ2lPDG7mG4=;
        b=PbkRNJBRi1y0u9eCBC9GX0nxUsScavFMOQKvsYMgej25/0W9HXmORSg/PFhJVcgqPp
         o5FLrPmK/l3Pz73rh6Ol+I37t4/Nfq8TjmlxiaZ5tdQ3eL8sMgbz7Gd79w1WP3nlSprx
         aIAXIxy/U0QilIqnAaFakcNwZJlrX5RZGTWTEthlFa0HiVEf7GFZnjCEmfR9FoKEhQWS
         xtwgH5uuBCCoIc5hhGIgQF2waIzCrIhpVLzD7UB35YroIDzqCOCMaKCiwMB/SDZpJ7P9
         b6Stl/91gj9O03La1sFBEp1H1ciqFAhYxhHgtCH5rzJc66E8mLL8EI8BMsHzX6Kii3Cj
         Unow==
X-Gm-Message-State: AC+VfDxNde5mMMMEr5DVRSoiG1uKhjL04SHVO7QE59Fxekhw7IvL+LXM
	pTxh8Z4DcWFk3vkoV2o9GQ7huFPhlfWCqpZ6bgs=
X-Google-Smtp-Source: ACHHUZ4o7dhwUc5WxiSozH6abrCL3AowyWaoFWJKF8g80I9ehVfZ62p/g97v+SVOvZqmaD+OI4lvQA==
X-Received: by 2002:a17:902:f7d3:b0:1b3:b84b:9008 with SMTP id h19-20020a170902f7d300b001b3b84b9008mr2618963plw.5.1686926272140;
        Fri, 16 Jun 2023 07:37:52 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k21-20020a170902761500b001b03f208323sm15865547pll.64.2023.06.16.07.37.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 07:37:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 18/24] =?UTF-8?q?maintainers.inc:=20unassign?= =?UTF-8?q?=20Andreas=20M=C3=BCller=20from=20itstool=20entry?=
Date: Fri, 16 Jun 2023 04:37:09 -1000
Message-Id: <8c9a247c3bffeda1aae9af69656337a0b8afabfb.1686925952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686925952.git.steve@sakoman.com>
References: <cover.1686925952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 14:37:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183039

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
index db0563810d..733d40ce58 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -288,7 +288,7 @@ RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
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


