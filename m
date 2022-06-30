Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C38CCA47B
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:13 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.29443.1656616628944025990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pYeeB5Ds;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id q4so644323qvq.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZUvIEMWz1unMhC/G34c28U3nTn0iVjnpxjRFzEWgSME=;
        b=pYeeB5Ds3NqmiQWi8wU+yc39D7uCVoyAMhOD+p/YQI4+ksaKwnWRUxKdgkT6s1KvOE
         lYtIBwGPyTP3fN+eRR/bXEzNTiJf7EEdNMx/cgd0FMfrpN+GwnuPly9dOgmwiftgdjlB
         4rNM28gJ337lXkQY2NlC2g9MkZxRhGBjycMF8ajgdqsil9QirR9zdmYDjZ0KazXgbO7p
         44WTy9VwQazGDt+5v3fEu4zMJI2IQ3kTdk7KxRK5jqctFoEDcij8YNOuww59CMT5QE/k
         Ean48/dhi6DU7gppMXyeFbP0kIf6dxGsdGkGjirKxjZ0XL4WPjiZ8uBKNK6CT4JTLBx3
         YVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZUvIEMWz1unMhC/G34c28U3nTn0iVjnpxjRFzEWgSME=;
        b=3SwNUyB51IXX6ezXAL8hcdTR4RztTk09mrcpYms2dBShF8q+e/q2u2qJYktU6WU0ca
         omdPL/en1DnioI3e6iLbuocmMSioXC9G3I/YavDY698Yp9IbHfMFS90tvh/ZwVs4oZew
         0N511+VYdGNNLLvWWKnwxpM1JxMrRG4mVhIXbI3djt+aNuQt1a8xc5R9jNv/Phnzt7hs
         umg1rkHon03FxfUb15X/OpQSg5bP0Iuljym5scru+U1CDdty3EYZP7c6KBbmtqdZ/sLI
         /Ie40fHwoLuUKx4motp1Zzv1Tv8ck0epY3g2NbnffB4O1HVpfw//Dpurcddx7ecxMVsn
         l1+w==
X-Gm-Message-State: AJIora8oqie1i56HtagR8BhwPgkI26T+vYfwsqPh4ffw/UIFf/1XhXwR
	fyH0Hg4Y9f9WrGx/JROjUQk=
X-Google-Smtp-Source: 
 AGRyM1sQ3S/EGBpZl04w8LmZyBWzfYiNjcpTkn72QxA8sA07ndIUOC1kfLjo505iif2h2OcV/pbPXg==
X-Received: by 2002:ad4:5ccb:0:b0:470:b59b:223 with SMTP id
 iu11-20020ad45ccb000000b00470b59b0223mr14144777qvb.113.1656616627880;
        Thu, 30 Jun 2022 12:17:07 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:17:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto-dev: bump to v5.19-rc
Date: Thu, 30 Jun 2022 15:16:53 -0400
Message-Id: 
 <f94fc35017b97abd2777dee4992e60dbd1233b04.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167439

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index d35632071b..5a420b7fb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -16,7 +16,7 @@ inherit pkgconfig
 # provide this .inc to set specific revisions
 include recipes-kernel/linux/linux-yocto-dev-revisions.inc
 
-KBRANCH = "v5.18/standard/base"
+KBRANCH = "v5.19/standard/base"
 KMETA = "kernel-meta"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name
 SRCREV_machine ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 SRCREV_meta ?= '${@oe.utils.conditional("PREFERRED_PROVIDER_virtual/kernel", "linux-yocto-dev", "${AUTOREV}", "29594404d7fe73cd80eaa4ee8c43dcc53970c60e", d)}'
 
-LINUX_VERSION ?= "5.18+"
+LINUX_VERSION ?= "5.19+"
 LINUX_VERSION_EXTENSION ?= "-yoctodev-${LINUX_KERNEL_TYPE}"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.19.1


