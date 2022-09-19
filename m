Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91533C6FA90
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 14:28:48 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.20363.1663597720205982086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QulQcPKU;
 spf=pass (domain: gmail.com, ip: 209.85.222.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id q11so17526114qkc.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Sep 2022 07:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=02ziOHCreB/FCqPQdR1GMONFjBUHHqvHoPSCaotPjts=;
        b=QulQcPKUT/sUsFwu7h21ZOifVVoyY5Ezysdf+EL6GSIM2GEZVsluUbcY6uGe4h5xk1
         38PxwukenwAKrqZZqTfl6Db6U67dcNyTPEqBj5c+Oj1P6Ct2Aoga7ey5jKdoWivuWM02
         zLwROLxu6tyFcdEwgA9oykPRUgOMj3dTeKZmWNcj5qZb0rS9bmXb8sjVr34pqMiMTd7n
         vnQAPotpiIlI2G+VEnwuUOzBDSzehDJxdicubj0HXIUrGbpNvySsBZjur9+y9rFfGo/h
         0MTqTzRTAdbePL06KTsI2BO4cmPfQurwvKcN3FjRzRLUzsUQrQ1hv75fHQY0cUJMnBaQ
         2JUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=02ziOHCreB/FCqPQdR1GMONFjBUHHqvHoPSCaotPjts=;
        b=ODHQ125pPYd2BHshRRlO6tLOWUQ5uXumm2uw2xD245j1V5AvHrdm1o5kLC/ZGzHHA6
         XTATyBTA5CQwote6tOx7My5z5R97L1y290bsopA4WkuRpFjW2twhyQjbVAe2K1lFRGx2
         GJZpCFCLquWj7boZOxnJkQMkhVMkYo3wjpa5tV9ENmhQZmaPh/JEqMFWFxhy+P68vywF
         TYc5E+zy4xGBKzVOqLA5G0ciK+ITFc+GKWplhJVhDJvGkMPgQvhxlinxVL41XivNjJdO
         5Wyd5PWsxNHCS72+qmJ6N0Oqhda14BmzLNaDb2eieVZwmwMNJyT8hqkqdYl20u8NWAJS
         /caQ==
X-Gm-Message-State: ACrzQf1l6aTl/k5qa66XMrQL7WpTjGtpcQi0QBi+5Ns4pLmGjSnRfTGT
	rbvvZbIP6aF+9x7iiT7UgFg=
X-Google-Smtp-Source: 
 AMsMyM7mur86c+tIngwFOUnC39imZmzeM2bDa1bHQNGkUlZS+/oAmGmguwCKSPlisKvDnRh1s0faDQ==
X-Received: by 2002:a05:620a:11ba:b0:6ce:1a71:9887 with SMTP id
 c26-20020a05620a11ba00b006ce1a719887mr12877617qkk.550.1663597716479;
        Mon, 19 Sep 2022 07:28:36 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 j12-20020a05620a288c00b006cbc40f4b36sm13362226qkp.39.2022.09.19.07.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 07:28:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/9] kernel-yocto: consolidated pull request
Date: Mon, 19 Sep 2022 10:28:25 -0400
Message-Id: <cover.1663597409.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 14:28:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170863

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the next set of -stable updates to the active reference kernels.
I also have updates back to 5.4 that I'll send to the various stable
branches shortly.

I also have a couple of kern-tools fixes. One to solve a problem reported
on the list about some directory structures (typically created from KAS)
to break the meta-data phase of the kernel build. I've fixed that issue,
then fixed the other regressions that fix caused, and have everything
passing sanity. There shouldn't be any fallout, but I'll be keeping a
close eye on things.

I also have Khem's MDIO configuration change in the queue, along with
a previously hidden kern-tools feature that allows it to not warn if
something is 'enabled' (y or m).

Cheers,

Bruce

The following changes since commit fa86bfd3617b54dbf7e44093ae0e6f35538bdabc:

  diffoscope: upgrade 220 -> 221 (2022-09-17 07:47:08 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (8):
  linux-yocto/5.15: update to v5.15.63
  linux-yocto/5.19: update to v5.19.5
  linux-yocto/5.19: update to v5.19.7
  linux-yocto/5.15: update to v5.15.65
  kern-tools: fix queue processing in relative TOPDIR configurations
  kern-tools: allow 'y' or 'm' to avoid config audit warnings
  linux-yocto/5.19: update to v5.19.9
  linux-yocto/5.15: update to v5.15.68

Khem Raj (1):
  linux-yocto: Enable mdio for qemu

 .../kern-tools/kern-tools-native_git.bb       |  2 +-
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++--
 .../linux/linux-yocto-rt_5.19.bb              |  6 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++--
 .../linux/linux-yocto-tiny_5.19.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.19.bb | 28 +++++++++----------
 7 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.19.1


