Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCFEC4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 17:28:09 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.13676.1664904479720936522
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NCy+f4LM;
 spf=pass (domain: gmail.com, ip: 209.85.160.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id hh9so168463qtb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=zzz19NS6+15tVdZhEV4EKXXUE3EcWYUKTc+U030IncY=;
        b=NCy+f4LMGUDl8gvdIGARpDnLeK+7Wl0v6GEGeeckclJQc25AO4YR5cZj4V1IOwi6zY
         P7+vonCx4t/VJLwn5Ng2JS9okqxjowE05sxOKXVjvFT9GJLZ1l6BeYiz1blTHaur0SFT
         6vz/fZUUffRMg/vtdgQWlOb0ppsc8TCkDGkznzzpogXCe1xlMgKL7f7snAfO4EQgqKGm
         AdYOzTtky8PR0yd/bJ6jJGVUVB40mv7nNAAfzAOD4d/PU/9xLX19iX9jIIPhB0LySM28
         +qkhOcK1TYYPEQRMguLT6wz22dmE5b9/l9M/kmxyLI188TSZdOOyfeErZGpjOdNVOEDa
         IyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=zzz19NS6+15tVdZhEV4EKXXUE3EcWYUKTc+U030IncY=;
        b=tv1hkntl6LRB4a9hDx8WC8kUaRsPwb4q6b8KVYlpUMyi+yGJjLQO/aHhwp1d+lDJsk
         M5o6P+IkTaZtykS2wrz/3p4xDVxWAEM2+qUBjyImQhNFSvJYMH3ZuQGDOwt4gvuLJz9B
         hGjsOXGu4B2A0eZY9X1vLhOFujywjO0rP0dEJsgOJmPRnjV9T2kGiVy9aWijUvJi//ae
         pwCON+M9U+QXsMpjiwtStNCt4fDCQhUjsgIEOO8UjodeI3IbNQZHBcLoZYv3H9Ea/evg
         kAvJY3ThvS5dyQTo2yMIq1/r69Mx3ccKZeVABuYhiCqbsOvUTXrwaqsoGUWjHb32Cq+T
         aO2A==
X-Gm-Message-State: ACrzQf1JDSV0XYyDbB1jsOxg6SbZp8WcxUh7w3ba00YV/A5aRTyHjDbI
	4ivUF57JJ4UcXd3Jb5Us/MeieYr+6510KA==
X-Google-Smtp-Source: 
 AMsMyM4StTx/TyCsJm+bUwwEp/qF1RsoH6ti9Kbi1FiYI4BHBhkRFC8T5O8ilYAesw4PVUCbfsGCtg==
X-Received: by 2002:ac8:5bd5:0:b0:35c:b058:92ec with SMTP id
 b21-20020ac85bd5000000b0035cb05892ecmr20766544qtb.83.1664904478767;
        Tue, 04 Oct 2022 10:27:58 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 y3-20020ac81283000000b0035a6b89412bsm12037878qti.46.2022.10.04.10.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 10:27:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto-dev: bump to v6.0+
Date: Tue,  4 Oct 2022 13:27:53 -0400
Message-Id: 
 <35d0bc8e63b28ca3f06b0290a7f24d9defee3563.1664904217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1664904217.git.bruce.ashfield@gmail.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 17:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171428

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index b1b57beac3..a79079e038 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v5.19/standard/base"
+KBRANCH = "v6.0/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.19+"
+LINUX_VERSION ?= "6.0"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


