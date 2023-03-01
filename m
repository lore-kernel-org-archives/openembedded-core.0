Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C25C7EE32
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:13:59 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.24965.1677683633878530311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:13:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=YCnJXVwI;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id l13so14589717qtv.3
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxaiRZJot0NfZNA9owYIS+b9CPmLq4AueUohvm7AOTg=;
        b=YCnJXVwIGfgHfvbj6S/7f6jgd3mghpN7r52YpZBRn9/O7GjrP0rKOfuGEEqoJMqA/w
         fCEYQ6D6Wypi8jy506nCQvj9gGcTMv7lv5wscMNOVzNMWRSzbxlbKk/+c2Imy7odRu51
         S26nwOrkEpqJygtfqOQR8BdAhr7kH4oojOX2MPR1NZClndEL8+FDx7lO71LES3rcX3b0
         VpNY13BpiWvnESID0iziZDyhdODrVhxaA2f+/sgkRcyL1EabZcO/sd+bc1LZQD7cvTaK
         8M3Vfakt+LKk7M5zQzix8ancnkwikr0KTZ44VdNAITLP6sIhUvz/dJuZYPDtcGBb0bfT
         pGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gxaiRZJot0NfZNA9owYIS+b9CPmLq4AueUohvm7AOTg=;
        b=2WNzVvTpxUJjP0snIPOx/Zy1m6/WnsLajRq7FKmNqozwbZ0SeVN59Xenw73nDiCdnL
         4bLsHFj19rHOjCr9ipu8+aRpmAD5KNLQyTf7AZbgTEiQqR2jLmIWmxlaWFg1cunm8rvk
         2UvnHkq8Yb7126BX1m28wWj+uHH0sOW0DQ5f5lW/hw1ftjL40TGIy6RSlJQVvRvkTNqS
         84v+xOMTGRRS1XgYcoHhihncO1cviAUcn+xFyArmBk3jZbZEUXLVZmK391+t62NR4G9D
         aSy+0tDmFR2RjYSFUguuYj40865zQchu/vXk1H5DlOTNUIzfW/sqTUk3FqLHKGIeMd8z
         Q1yQ==
X-Gm-Message-State: AO0yUKXlLc5k8gb6NrRKPJ1jD5noHxDIebIUgPD9wE/GR8PZgcfePUNR
	28cRNrpvNsAguQdzd6y/rzU=
X-Google-Smtp-Source: AK7set8m7oW/vFIZiNfr+zREPoM4NQWYXye/mF+eCanpxmSiXiaRolDRVhKNPS0km4xQGkuvuMWVJA==
X-Received: by 2002:ac8:7d4c:0:b0:3b8:3a7c:d204 with SMTP id h12-20020ac87d4c000000b003b83a7cd204mr11569772qtb.58.1677683632802;
        Wed, 01 Mar 2023 07:13:52 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/8] linux-yocto-dev: bump to v6.2
Date: Wed,  1 Mar 2023 10:13:40 -0500
Message-Id: <87d29240e46ae804842e46d14357ed80bbb9dd19.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177937

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating the -dev kernel to the 6.2 kernel.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 05e405f81c..9ef5b80a37 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v6.1/standard/base"
+KBRANCH = "v6.2/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "6.1"
+LINUX_VERSION ?= "6.2"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


