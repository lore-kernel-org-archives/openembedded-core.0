Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC3AC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 22:00:21 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.734.1657231211926253796
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=5WH8HhvI;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id
 cp18-20020a17090afb9200b001ef79e8484aso217571pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jul 2022 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=tOHApdCinHC9hsw07BazxC9W+jMe40bZvWech4Ph5Gg=;
        b=5WH8HhvIwECiGy92F0VjHvwKeJ1pNKj6xXwM+HZvpCJREaYaN3z3Nmm1kxlWHPIWfW
         RP9NBbWxQrjIeSFIjXndABlXfLUcSag262GBUgQLRcZTkEKuAZ9sS5BOhnl5mMmvYvq0
         rmGw1EQRCEXBQFhVEWWEko6GkLyftnCv8/0Dao6vJO8W70BFCSiM5dBAZxeSIscaQgTS
         dCZLzN3fPJHCyuZPQoW5UrHnRec4Nld+nsCzR++NRoKC1FdWpd4W3+EStDh4RDitLbvy
         aPEjFqNkwoFb4lWqxd8MxncwWYOa+rdjA9RnOkn5P9e5I/mVw5qINOJkmXjmZBMUEQE5
         tYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tOHApdCinHC9hsw07BazxC9W+jMe40bZvWech4Ph5Gg=;
        b=XQ2A/bMwPtKAbdZZAP5WgcSxMGXsXZ1AJlH65WkbThpiOe6KxT3F6fyrmAh2HIGE84
         /iMhMnnohJTi8q++C/iKabb5uuIkmdD36eoW9Ta7+j9W2qyXnF7C1tW1hVQTYOTOhjZ+
         KtLUKfnWWligzMbIJWCNFDxUoQllqTs2yxk/Mn6Zefuwanq2gQzdAOUa8fT5QVGH5G/O
         xk6vg7tO7oTce27IFMuxRe0NVgLQpoQJdG94JZx01+oOblTrFESyd4jfRXlSfROP1JiY
         GnFF+Z7abEY7xbXYBbRAI22YWpGoqJzLKRnRxccmCcEcLpOF2geaHbXF/en+0FgLeQrw
         Y+IQ==
X-Gm-Message-State: AJIora8xLos0GBMTJU8Z+56u3Q2qXMxna/cvSTc1ezJRAN7q02OoS/JW
	wPYlaEEWtMRjPBrjx7xV5kkn5butjIrByEvQ
X-Google-Smtp-Source: 
 AGRyM1vULvShr0n1ezBoEx4dQ7gO1y/jXB8fUM/oU/1MtZJjhMu8DbpB7nV/2r0quW7ClhSifamvDg==
X-Received: by 2002:a17:902:c153:b0:16b:e7a9:7716 with SMTP id
 19-20020a170902c15300b0016be7a97716mr186835plj.20.1657231210887;
        Thu, 07 Jul 2022 15:00:10 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j1-20020a17090a31c100b001ef79eb5033sm56840pjf.11.2022.07.07.15.00.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:00:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] efivar: change branch name to main
Date: Thu,  7 Jul 2022 11:59:29 -1000
Message-Id: 
 <f7af3c555d9ddef54264fa7da911507bca3eecb4.1657231055.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657231055.git.steve@sakoman.com>
References: <cover.1657231055.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Jul 2022 22:00:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167805

From: Anuj Mittal <anuj.mittal@intel.com>

Upstream has changed branch name to main from master. Change SRC_URI
accordingly.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/efivar/efivar_37.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/efivar/efivar_37.bb b/meta/recipes-bsp/efivar/efivar_37.bb
index fa1fe1ecdf..858c61ae6a 100644
--- a/meta/recipes-bsp/efivar/efivar_37.bb
+++ b/meta/recipes-bsp/efivar/efivar_37.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6626bb1e20189cfa95f2c508ba286393"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
-SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/rhinstaller/efivar.git;branch=main;protocol=https \
            file://determinism.patch \
            file://no-werror.patch"
 SRCREV = "c1d6b10e1ed4ba2be07f385eae5bceb694478a10"
-- 
2.25.1


