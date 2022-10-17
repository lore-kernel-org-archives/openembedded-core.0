Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B63C43219
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 23:09:16 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.643.1666048144202412891
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 16:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=q0gdQ+Oo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id y191so12480057pfb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrZAeB6z661kGVB/hiSWIMK0MaKOH9d4VSHF1zvhIsQ=;
        b=q0gdQ+OoqG06MsHMOJM0YgVweX1YPjJ9YtKieKfbfOV7xw8rA5A5q9OoVm3KFXvzar
         +i9m3a/pCCXSkxHLC0MMdLGDk3iKvc8vpZ4crD1Hd/zNujO7eDLF1OY0mW109yYksNro
         Y/6LSf92D43AT4qg4TqdpE0dCnmK+EovT2DjpbjRPwyTH/L576gt2H79yA/shm64GMCi
         V61FO/H9ZQPM8my9BzsFB+WMKXIE/WBI+kqHZeyJ7V/KGLhWhgHpMPgO24eulkqEIf5O
         +hlA5NNiRabO5lPk6AV+gZd8pklxZ/ADZItTlRhRIjnc2XdAWT60Ng9w93E82Yiqewuw
         /Ejg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrZAeB6z661kGVB/hiSWIMK0MaKOH9d4VSHF1zvhIsQ=;
        b=ug1cHizIOR4UhDx7thRxGEY360i3I6xbsSIGjplckSpYzm5uhuhBlydaqDpUEi7Ak6
         HwubohGFhVXpEFCeLpbw6b2lIkHOWAhDuIj8S+vWf9Gs3t7SJT6JDer5R5qSo08bvxnE
         J/Iosh5PFzkzFuBlvNdVCUB1tISz/bpmW5wCIA5Ibnpde2xtWzKplG6Hv7wVIjpsrROy
         Zl+SdzZToC3Qqbx4aAyiFjTX8WdqdHhmZ3iZMe6tZftOO/7Hc4y5YeMC6a48/JHbenTL
         A6PfUiePJdl48wCQ0b0TYo3zDI9EKiu976rwUFz8/YbhfD2tWR4qqLD8eCm5wQqbUh/E
         CCUQ==
X-Gm-Message-State: ACrzQf03FoqW0Yr23rKXICcEmxazgSFe/lJsrrYUPzU24KPzq5h3DL1H
	L/939GYBZdRsmjZZkk/OiacZrKn48UuamnpB
X-Google-Smtp-Source: AMsMyM7Lwt0WRl3l5+vHpO1l0lZ6KZpBUTd+YgNCKZmjSHuNV9mt/g2NOvdhMRlh+o5Brl2ETuBWrg==
X-Received: by 2002:a63:6b09:0:b0:453:88a9:1d18 with SMTP id g9-20020a636b09000000b0045388a91d18mr113966pgc.41.1666048147142;
        Mon, 17 Oct 2022 16:09:07 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a694600b0020aacde1964sm10119479pjm.32.2022.10.17.16.09.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 16:09:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 11/13] linux-yocto-dev: add qemuarm64
Date: Mon, 17 Oct 2022 13:08:27 -1000
Message-Id: <793c2639431ca0d29fcf12d08bba1288de9ca7db.1666047986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666047986.git.steve@sakoman.com>
References: <cover.1666047986.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 23:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171929

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Mark the qemuarm64 as compatible

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
index 75b1cb2a49..403993486b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
@@ -50,7 +50,7 @@ PACKAGECONFIG[dt-validation] = ",,python3-dtschema-native"
 # we need the wrappers if validation isn't in the packageconfig
 DEPENDS += "${@bb.utils.contains('PACKAGECONFIG', 'dt-validation', '', 'python3-dtschema-wrapper-native', d)}"
 
-COMPATIBLE_MACHINE = "^(qemuarm|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
+COMPATIBLE_MACHINE = "^(qemuarm|qemuarm64|qemux86|qemuppc|qemumips|qemumips64|qemux86-64|qemuriscv32|qemuriscv64)$"
 
 KERNEL_DEVICETREE:qemuarmv5 = "versatile-pb.dtb"
 
-- 
2.25.1


