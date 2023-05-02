Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5DAC7EE25
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 17:40:55 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.533.1683049248347643744
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 10:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MK4UbYia;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so26243053276.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683049247; x=1685641247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JyjgpmWCdvD9FZXG0+kjFL1hY9Wx7TQLgPKFQGmTLXk=;
        b=MK4UbYia9N3X3ynkDaw7TUJj+R27IXMCvq8uVquKf1fK34KuHtp5I8nmg5QhPs7Fhf
         igXiNFD5cRasaAb1lo0lj2cDrtWvWLKqXxx93kQCjkOpPu1zTO4PIKP+eaLDc/nhX3gY
         kgjSFF2iNT+LBqV8FEdZEaC2ZEPnceIs2Nr4lmkkfyBajASGHGLdSO4eufjfXZTDMru0
         Z9Hit9STMjSnUXxF26fOVlSXhs5ROVbhZCsGCnov7jWVuR6kWqgYdl/8zGCWAb9zqQxn
         q1kmatsiWvJPJBQm0ZFSNtMZZqg0pjfb2WaaqlZbDS7d2bVhq1BNzaa3tbyEC2zOtmMi
         YzeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683049247; x=1685641247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyjgpmWCdvD9FZXG0+kjFL1hY9Wx7TQLgPKFQGmTLXk=;
        b=DtD6IvhDeU+96XU8x/uLG0hbbRFPPLHdu9nk3c6ap72LGY7Y7rfQic90o7MAsrFUZG
         keJrD0YTf7OdwBe+b7pz+9srZNbeCKgu5U7O/3BuQUyobglPwZ07eAqF7/31bAGyvXra
         TGLAnLgL2L4aBMFDbifHHnmxLqB/XgFY1TiGFSAqHWGfylpfXIe0OZauVgOuL7yR3urS
         arhWTpxmYhRnmCgujVh4050FTXe/RkmZfBFI1NUvDnzTkTCzli4vbFwWF7a0Xl3Cvd7o
         FvetfidjiePv3XNlkzjJjkQWQGU7aDscaEdKQquIIR8zbZYzrHqKNp5TGuUqt870NtFo
         LOBQ==
X-Gm-Message-State: AC+VfDzWa7mziZHFBBkRyjXynPdemUggmAXbaE7xFREsXQOyhbBFvx6t
	UG5JV0WKnditBqAOZ4V8k298MtWe38k=
X-Google-Smtp-Source: ACHHUZ7j22ahkLFbsKtGuXONIqi9+Lve9k1YqM0xefp1hBTzCnzRVKUxG8kYiun9QoBisHP6Wm7Shg==
X-Received: by 2002:a81:99d1:0:b0:559:ec94:50c2 with SMTP id q200-20020a8199d1000000b00559ec9450c2mr11074826ywg.19.1683049247230;
        Tue, 02 May 2023 10:40:47 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:6f7a:c057:293d:a9b7])
        by smtp.gmail.com with ESMTPSA id k63-20020a0dc842000000b00555ca01b112sm2880797ywd.105.2023.05.02.10.40.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 10:40:46 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] maintainers.inc: remove myself from assignment
Date: Tue,  2 May 2023 13:40:44 -0400
Message-Id: <20230502174044.2725466-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 17:40:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180762

Found two places missed with droping from this list a few years back.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 682ec2cfdf..d54c9f4252 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -60,7 +60,7 @@ RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-bind = "Armin Kuster <akuster808@gmail.com>"
+RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
@@ -411,7 +411,7 @@ RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
-RECIPE_MAINTAINER:pn-libuv = "Armin Kuster <akuster@mvista.com>"
+RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.25.1


