Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BC1EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:20 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.26516.1688656039588455621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Cwk06787;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b89cfb4571so4936805ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656038; x=1691248038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z5aOcFcJNshMj3KfrK5nELgTU3xfxBqk4LATxvrofLY=;
        b=Cwk06787C5Pa4KcY1Uyz0MC4p+AQs+HHvArlgK5fpN+u8Hp+S91TwtxvdCr0UDny9B
         PP4B24bKgK91heA55Z+sPJ5iZHzM9rzA9sT9qk5EOSav2KTMG8RPjEg8cMaiZXw0MjjT
         Yalsp5oc8odLGAJjZ55olB7tQ/KYLsBDQixR5wEPoIfCHjrLIsuUQmWuGWf5+B1BEJwY
         y6l1KW1xaK+FKP6XrdZQvlffTVwyNB2bRwhpp3ZHZEJzrI3AIBt6TiwlRmw0S5MaSQx7
         P3cl5v4XgiWVSXVjZn+KrG7iBx/DiNSHQQn0kXt1kV10wcfgAOampNo8gxZYc3ZqTTSy
         rhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656038; x=1691248038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5aOcFcJNshMj3KfrK5nELgTU3xfxBqk4LATxvrofLY=;
        b=Ugty7H4rFEevPUuNzEBCmxy4U2Iup8DtK0xgfgHMg4KLYLIPyBBFsdROZrr2dYUq4j
         MAOOjkZeKEqNr3hL42GQlvh9jS7RyOqYHk5LXLpXuLy3v3gRO7SYDwVZ28tmOywLfiQZ
         RlwQC5eFhzjC3nr4QDckN+A3T+wDsgcVOA7EW8+DoAr60MhAs7IX/F79jn9j8nlfyHoV
         E/2A9IDqoDXQddHIPSxc3JghsswD4u3FPvmSSJs4OkCrzs1/teG24laCcA0I+WP/yWQi
         IOkUugY1plofP5QRTFC0Dg+iOa2Pf1oKHEf2lHpVRRbfUoUwzwIKK2YW8KynX0niPOSn
         70Cg==
X-Gm-Message-State: ABy/qLacrxqzQMKhcckA//7w309HvuDVIYlrXoyLSzLVtTsNfuMRBOq8
	WQ2hRGUxgoDcNjWk/b0wjZ6lYaazewuwzOd+xMA=
X-Google-Smtp-Source: APBJJlFFd47rEBq5Kc78UQjuEo2hbgswBqADlls/UiPNR23m7VUjtG7e5QoU9ji5Jpzn5hryLucFzw==
X-Received: by 2002:a17:902:7405:b0:1b8:4baa:52ff with SMTP id g5-20020a170902740500b001b84baa52ffmr2011970pll.47.1688656038658;
        Thu, 06 Jul 2023 08:07:18 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.07.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:07:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/28] maintainers.inc: unassign Adrian Bunk from wireless-regdb
Date: Thu,  6 Jul 2023 05:06:22 -1000
Message-Id: <191ab08c035f1811af932775a767b5e83a95e35b.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183972

From: Alexander Kanavin <alex.kanavin@gmail.com>

We were not able to get a response about availability over email, and so the recipe
has to be unassigned.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3beb88060be9484cfe75dfa60f041b0b32214978)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index d7bf806b05..35911fec27 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -816,7 +816,7 @@ RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-wic-tools = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-wireless-regdb = "Adrian Bunk <bunk@kernel.org>"
+RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-x11perf = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.34.1


