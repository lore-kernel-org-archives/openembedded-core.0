Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AF9C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:46 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.7524.1653489040235668902
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=o+uGd5Fr;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 l7-20020a17090aaa8700b001dd1a5b9965so5260461pjq.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=kacmyvB+nltUNR9KP773HS4VolULR0SNwMlN7yXRIwQ=;
        b=o+uGd5FrZ+qVpoair6vjTJlGF8U3AUbNWsuvuPfg6hZtCcmzru5YLSA9RLiPJM921J
         LXAPsKTEqHQzt8V+KX312TNTYb/+4FPL31pLu4b3oTpHmTEzO1+xe4081WLK3fX7Owm7
         WpsSyVNkcw+n/a0m64LSxokULKJ+o3PEsvioPGH5OMVARiTUZONpB+D9LGO4V4uR+P6y
         y53iB0JWhUJgKSO83ewqnpaNV+KEeNDsZCj8412fTgZbRi2yeCCoi1RK/3tZlM87jGqq
         LKeX0PVciEncSSph77i9NUVD5irYgxSOftC2kPDVLaES0K2sEex/JLMQ9cYbmRt9b9Qb
         TsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kacmyvB+nltUNR9KP773HS4VolULR0SNwMlN7yXRIwQ=;
        b=iJLRiAJcQfv6RkAg5oP4uG6I4L9aY/MBq7yhcQSRXKS1p5kWHMTUrkUE22jIcmAFCD
         mJlnfOOs56rG5RTBnt3vG8cEv29fNoDeAzuGEtpiFEdq+RHV+vJ8rT5pVzIGDM7sx2H/
         Di/oIg4mm/We6pDDz0qtgyTdashBgjONEoiTy7e/i/uhKEP25gHvQtltuuq+YgX3YpFP
         3Hroo7izblhncKXGPFMmqWaNWOxrHf1ZCHIY8nNeaIVH0Yb0G0tM6OnrRY5uXlGY5noA
         GulXpHMN/SdCBaOeCOCkqxGH2C6N6d34+2dHbehyIHKjo6gU7HsHQwONGGb9opX/uuAP
         xScg==
X-Gm-Message-State: AOAM532Z9SYyb9RUsVCSTns8u+BC7Vt4wuMS/Xurgl51oVDd/tzTXFNe
	lIty/oiZi/aMJwbuaQcFpz2NO/HprTPMGm/c
X-Google-Smtp-Source: 
 ABdhPJzcujSe+Xp702PdkN/Fu8wvnsKZQVeNE7eUvyUmk6YjcpOWqOI6xJksBjXexcWIIeehMMZMLg==
X-Received: by 2002:a17:903:32c9:b0:163:6bf9:aeb7 with SMTP id
 i9-20020a17090332c900b001636bf9aeb7mr469513plr.108.1653489039028;
        Wed, 25 May 2022 07:30:39 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/19] libcgroup: upgrade 2.0.1 -> 2.0.2
Date: Wed, 25 May 2022 04:29:43 -1000
Message-Id: 
 <6588c45d6c39f3cd1a6a58a53086bee8908ff7cd.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166141

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

Fix extra spaces in configure.ac's --enable-bindings
Fix potential segfault if there are more than 100 cgroup mount points

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2139fd56da0d8e3769bcc0b337c446e7e4b98f90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/libcgroup/{libcgroup_2.0.1.bb => libcgroup_2.0.2.bb} (93%)

diff --git a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
similarity index 93%
rename from meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
rename to meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
index 857a4e86fd..7ade372cae 100644
--- a/meta/recipes-core/libcgroup/libcgroup_2.0.1.bb
+++ b/meta/recipes-core/libcgroup/libcgroup_2.0.2.bb
@@ -13,7 +13,7 @@ DEPENDS = "bison-native flex-native"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "2dd9c566a90a053e7a5f47607e225648ba7aa9bb7763514dd4778e2ed530fe90"
+SRC_URI[sha256sum] = "8ef63b32e0aff619547dbb8a25e1f6bab152d7c4864795cf915571a5994d0cf8"
 UPSTREAM_CHECK_URI = "https://github.com/libcgroup/libcgroup/releases/"
 
 DEPENDS:append:libc-musl = " fts "
-- 
2.25.1


