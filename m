Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DEC7EE26
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.70171.1684081924638576932
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=VHR5k93o;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5208be24dcbso8414644a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081924; x=1686673924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byUyx3bXwVHaD2x9g6IjyIr35vJhgEmwjGq9LMu9ACg=;
        b=VHR5k93oC2yMbFUPRxjqfAhLTjCPFJBhOr80CwuMvzmnQY5FRkD91KXrfDB7b15Lou
         WpRN6Inu8E2oi0uXZ6vDD4SOdqDWR1dWkbRG5+NVUY9vi4dXsEce5wL1tKKPRm6UMzmz
         gZ4gXE6rN6/vrj2Pt0ZqEqqbQeTB3VPL1CdPO8WFpR0emVEVYvwjjHTTdEPf4aWvcCwM
         9MvAyUU/n4EdZgFeOCAW7dT4tspydyYq1SHxiX0pi/4cfyjeZvfYPxx9eqA1r8KyDURs
         15yELUMh+RfHMmLoQG6VFqFz3GTpk4YiVBMKZr9bVUW9qibCLUy6jy6rfWmkcl9tbBgw
         wSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081924; x=1686673924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=byUyx3bXwVHaD2x9g6IjyIr35vJhgEmwjGq9LMu9ACg=;
        b=KHPmKSgUZe0cDQm1HOqctWGZfah5ueXWtAK950rM8LgeOHcrK4Ck6VOo0vBH1aXKly
         J4teKzh/fKj6BaFJ2piBxXZdIUMEBgP4pF6C/NspOyq6MoJVHqVmZ8nIzGqn2Q9SW1vy
         Gx96pELLru5JolLbTrjptknzvQmthPzc6VLIDl7eQ3pnzqN+SntjAHi8JwLu104Ea26T
         ERfRGA67zbb8NYxoSxMsgRo2dxXa6w2OAFQQ4XxQWitMl2TDI7nooqak3HkB1SCJXoF/
         mYrbSX6DicJUrs+MSYXUKJp2Vh5eXFs4hgPavWWTAyIjGcM2vQllJkbbwbIDp4RQoJ2I
         ShcA==
X-Gm-Message-State: AC+VfDwFrqGTQmBqzvU3XJDAmMGZQFvjkPHtrMuPCqDjfNJOWhUwPUew
	tNNKezYl4SWBpMxIoU2Y5Fj3klHQYPKccRDke5w=
X-Google-Smtp-Source: ACHHUZ6ho7EiSM0tgNixdGRwpt9E093dbxTTDtSrGFWT93cxgnPm7d4meDynp/0VrkmlqO4aCCgcxA==
X-Received: by 2002:a05:6a00:21d0:b0:643:bb16:7ca6 with SMTP id t16-20020a056a0021d000b00643bb167ca6mr40149917pfj.21.1684081923631;
        Sun, 14 May 2023 09:32:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 10/15] maintainers.inc: Fix email address typo
Date: Sun, 14 May 2023 06:31:35 -1000
Message-Id: <f39471238df04a300e2b17735006f3d6606b4f23.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181211

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a86ca028980b501e386f6bb8293a094fd77f97b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/conf/distro/include/maintainers.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdf..5699cac3a2 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -283,7 +283,7 @@ RECIPE_MAINTAINER:pn-intltool = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-iproute2 = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iptables = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-iputils = "Changhyeok Bae <changhyeok.bae@gmail.com>"
-RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.ujitsu.com>"
+RECIPE_MAINTAINER:pn-iso-codes = "Wang Mingyu <wangmy@cn.fujitsu.com>"
 RECIPE_MAINTAINER:pn-itstool = "Andreas Müller <schnitzeltony@gmail.com>"
 RECIPE_MAINTAINER:pn-iw = "Changhyeok Bae <changhyeok.bae@gmail.com>"
 RECIPE_MAINTAINER:pn-libjpeg-turbo = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.34.1


