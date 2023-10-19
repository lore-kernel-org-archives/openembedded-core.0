Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FD3CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 15:42:11 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.31438.1697730121082427282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 08:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6pfRVWz;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-66cfef11a25so48013816d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 08:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697730120; x=1698334920; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+FXW+y1AkmRNVQmIfm/TtNc8rrLCmApWfAwPs5vCU0=;
        b=J6pfRVWzVJGsEVQlkw+e6VkWmiuYGaXUShQ1aqGgf7XKa4bqnQiG5/xnRNFje26pQ+
         n76iHyHUZ/MYxbBNvZ7u0Mw6MsL9UOBZX2XbWuO75urqsC8wugvBMNndrzy5wrU6IQxt
         3bPYSrH90+pfTX/uutJRwPzIIz0fgbrOqO9+u8115ePrfV4+s9FIT5gU9+/kUzdNudkM
         UnzOLJzOWPFqktOtCUBr+nlLJzYEaRWZlnjxg1WeBdEAVxtPYF2fkhW/eyCW9TRbWov0
         E4MtkNae9xz5Js+a6YONyD18ZXQIeQJW2zzMPLCH2yNwrEsbWAgxbWKgXjWcKfbhhLuM
         rbuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697730120; x=1698334920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+FXW+y1AkmRNVQmIfm/TtNc8rrLCmApWfAwPs5vCU0=;
        b=PlzG4+ZJosXCbMWeJjDVHLviBmT5ZxczKp/QVXrse6tbw+Y6yRY4IsTQTr41pvrEFK
         xciVsBtjXp+X3r91JYVlqoCctQSkXlp3Oog8DXi52aKILonjvW6BKrOQZ/8R57K+jZCS
         f56MXl1BRKOwtS8097eIR5wLEmStAMSOHrzXtuYUzMp0S5myvyXiExjwVBrFc+qfmr2l
         LMx+Zo68NtUbjmnPX/frdwjDg65sg50cl/sA04Uch/KiQCnXTX12Qa6mSd//odrv1a+U
         IVuZoo6Bnc+ZSjd92P6aGN9BkwHp94iAGdvMBsFKvTuwvxxX4CEcx+tN26JmV3MrJYOT
         sq2A==
X-Gm-Message-State: AOJu0YxYoYCxDBh8dAWS16E8SsFpNbhrojr+7YyLodutrBTM0M1Ujl4q
	MZoPUOBl4miOVZp0bubagZM=
X-Google-Smtp-Source: AGHT+IGMHxAoeWH2Gu15NHBswcwVF8g/RWWYROA5nHMt610sVS2Hwgsw/dEjOCBgQLzCTbulVfEjWQ==
X-Received: by 2002:a05:6214:224c:b0:66d:2785:a2b0 with SMTP id c12-20020a056214224c00b0066d2785a2b0mr3650880qvc.29.1697730120015;
        Thu, 19 Oct 2023 08:42:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id s4-20020ad44b24000000b0065af9d1203dsm867088qvw.121.2023.10.19.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 08:41:58 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/6.5: config: remove VIDEO_STK1160_COMMON
Date: Thu, 19 Oct 2023 11:41:57 -0400
Message-Id: <20231019154157.2324100-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 15:42:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189472

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

    4531e74daf0 media/media-usb-tv.cfg: remove VIDEO_STK1160_COMMON

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Apply this before the recently sent serial core fixup patch.

Bruce

 meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.5.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index ff61a33db6..985490e5e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "541ff832e9f2a168145f96ff41857a6cf1c74289"
-SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
+SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index 6ed9972549..e2214851ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "8ad515e79001700d5e3d36e6ffe37ebdae2b5cd4"
-SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
+SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index f63b93ce49..bd99b54bce 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
 SRCREV_machine:qemux86-64 ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
 SRCREV_machine:qemumips64 ?= "59ac3aaf836bd355d0f9f734e7bcca3dde44573a"
 SRCREV_machine ?= "79a314e29b53062b4dfd316569d5480ee0d19249"
-SRCREV_meta ?= "7686d2c442df26daa77f91098f7fac8fdf5b35d7"
+SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.34.1


