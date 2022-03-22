Return-Path: <flowergom@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAC1C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:33:06 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.568.1647981185684334571
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DRN2Vz6+;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: flowergom@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z92so22190095ede.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 13:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiU4dLM3GG3XrixceYSgRNKxR7IC9kq5gmmK2prkI/U=;
        b=DRN2Vz6+ZfItHrKPULzLHhBnCsCu9aWg8T11Wjk6RUeVKK5UDilBbp7gIj1J0ZzvAF
         0xqJKTDgQuR9yhDXkNURwRpixi8BYN3Fltk6AxSraHDo+NiX8g6Acaz+jexW64PO1REo
         KHPtqmHbYaLgY67uGFVOhl+MheriOqvk7xUWIqaGNoJ+NpwmaL8CrvyaSfkX1zemnRWu
         Lh5Ukb1SFRbJXMJMxdj10YlagGAnxLsltnVu4CSyVJfumS40l5NGKQMCoGWdt09MziX3
         0IrNrZ1hwCRIZNFnmzpE/A70GtxWhL+bgdBZ/pk7VB2TlG1dDecOgd9dpIeCDxrElK3v
         bVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiU4dLM3GG3XrixceYSgRNKxR7IC9kq5gmmK2prkI/U=;
        b=CGKkzL74uAfb8GQ4uGkipHf3K+8ZjKqD2Mrus2MC+QrrPqJP4KCD95DF6dPEuGK4sN
         IYpN93/ih+gutHnnvPWjZLzq+7QTvjVlOIZBwO8QPAR2WEIQdOSYuPZ0zMsg8IuKAN1s
         PstzVTGabTbnZeKeltJyR8ruzBZbGKvdXkI29qby3m/nrVB+j6/OxI3kWpFXerqjFuzl
         wNf/5Hc6bhRuN2Qh2609g0kozcw+4q/DYGAbzSGVh8NIJolspFACBS6v7UMpLmTfVOIp
         +Yj4XuQjsA3F3rOBT/soCisaqON2XD9zxfJoVncZQssHBYkpdgvNOE9/vyLcIGt1E4wr
         p2dw==
X-Gm-Message-State: AOAM533yiGZ0JgqnJ+Pm10KcXgvestDKtXod8mx1WjSpPnSnWdzSY3sc
	7e7SJFPOrjpJobXn8zLpj9kgNQt/KiPudwG5
X-Google-Smtp-Source: 
 ABdhPJwDbbJX81TEqdZ3xUsKvXOJAVtvocigI/tCdtbqmvU57fRqNXotYkyjf03cgqqf5zNkdr0dBQ==
X-Received: by 2002:a05:6402:50d0:b0:416:a2a6:5443 with SMTP id
 h16-20020a05640250d000b00416a2a65443mr30897591edb.410.1647981183769;
        Tue, 22 Mar 2022 13:33:03 -0700 (PDT)
Received: from localhost.localdomain (p54ae16f8.dip0.t-ipconnect.de.
 [84.174.22.248])
        by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm10544998edj.36.2022.03.22.13.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Mar 2022 13:33:03 -0700 (PDT)
From: Minjae Kim <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH 1/2] gnu-config: update SRC_URI
Date: Tue, 22 Mar 2022 21:32:51 +0100
Message-Id: <20220322203252.66605-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 20:33:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163574

The git repo for gnu-config was changed, so update the
SRC_URI accordingly with the new link.

Signed-off-by:Minjae Kim <flowergom@gmail.com>
---
 meta/recipes-devtools/gnu-config/gnu-config_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_git.bb b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
index 6b025fce2c..83c18a1ca3 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_git.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_git.bb
@@ -12,7 +12,7 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRCREV = "191bcb948f7191c36eefe634336f5fc5c0c4c2be"
 PV = "20211108+git${SRCPV}"
 
-SRC_URI = "git://git.savannah.gnu.org/config.git;branch=master \
+SRC_URI = "git://git.savannah.gnu.org/git/config.git;protocol=https;branch=master \
            file://gnu-configize.in"
 S = "${WORKDIR}/git"
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.25.1


