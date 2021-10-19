Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A5CC4332F
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web08.11509.1634657674754053979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JEKw8zii;
 spf=pass (domain: gmail.com, ip: 209.85.128.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id
 n7-20020a05600c4f8700b00323023159e1so3362149wmq.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Oq8UljlhpwoqrD0aE56qt+YK4g0gziaLZBH61txoPf8=;
        b=JEKw8zii0oXD1K2U5I5rOqCXCpbjbE86gKCrgYQ3XltN/oSr6mpDFeFv+UIu0qacWN
         3TSFCnA6GOowxD9ZwHbtfB9K+VTMD/hFPYEVjfMJ42nelzHkh/KB5mmJ8aN4oCqs8ssM
         Mn3Vy5ZtFFSQhMn/kKqnNbZBP6P+wn+MgfEbaIfwH99yo0I5ocMOdwkyoVCOMqxK+EMW
         wvyGH9eBc4ZSmAa9pnV9creHJ/2nlvVGX6S+DFDZgNO8RcAjSt5knbMz1oVovyNcI9UY
         WpBnxr7GES/VYI4qLvzIX3/pf0TvBUIIg+rw9EeI3kY2ltvwt8gCJIAWtG0xkyBzlzKm
         6hXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Oq8UljlhpwoqrD0aE56qt+YK4g0gziaLZBH61txoPf8=;
        b=tEtpfrVvklWDbHOPS9LKqyGFugnt6A0djsY3jv2DL3fScn7Ops32OrnIAogfl5BE3L
         7cg/LA9wXvfMuCUAURzz1/jo5ftgsgjoxaRplKhBmg4YFsXGi3wwXlovscRqd5HQz1yq
         Fb9H7+Tcpc3zhGGlPvikdyg6beIjV8cT02p66eASnruS3LOUgtUNtLqDtXdXyTRyQy2S
         tPHKmbXwlfMpHAyXaXy64E02IxHbClXU8S55dnRj5Sqjwdog36gIXyB0xtAgVvmd4y4K
         ymMNhiEKPIGLzHjtx+2Er2qGzPIrX4mQIaH7Z5fFALMpfDTuMG8m7O5Wuvs0kFpKoW/e
         AadA==
X-Gm-Message-State: AOAM531TgPgg4te8aJrSB9sel9Mpf8XHJvcJ0QAadIQQywWoE2dXD5f0
	S55/y5N7Sg13VdUby2OtyURvJF98AiU=
X-Google-Smtp-Source: 
 ABdhPJwgUMSGc/d/OJUmfan5dkuUpryw4AIZvd0ZafFExsFZFhtu5bwzOmTRP9RU1DYSEC0Ec0xwAw==
X-Received: by 2002:a05:600c:4ec8:: with SMTP id
 g8mr6802037wmq.153.1634657673260;
        Tue, 19 Oct 2021 08:34:33 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/65] liberation-fonts: update 2.1.4 -> 2.1.5
Date: Tue, 19 Oct 2021 17:33:28 +0200
Message-Id: <20211019153419.3319802-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157133

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{liberation-fonts_2.1.4.bb => liberation-fonts_2.1.5.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/ttf-fonts/{liberation-fonts_2.1.4.bb => liberation-fonts_2.1.5.bb} (89%)

diff --git a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
similarity index 89%
rename from meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
rename to meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
index b8c2946371..32247b09c8 100644
--- a/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.4.bb
+++ b/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb
@@ -10,9 +10,9 @@ LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f96db970a9a46c5369142b99f530366b"
 PE = "1"
 
-SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/6418984/liberation-fonts-ttf-${PV}.tar.gz \
+SRC_URI = "https://github.com/liberationfonts/liberation-fonts/files/7261482/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-liberation-aliases.conf"
-SRC_URI[sha256sum] = "26f85412dd0aa9d061504a1cc8aaf0aa12a70710e8d47d8b65a1251757c1a5ef"
+SRC_URI[sha256sum] = "7191c669bf38899f73a2094ed00f7b800553364f90e2637010a69c0e268f25d0"
 UPSTREAM_CHECK_URI = "https://github.com/liberationfonts/liberation-fonts/releases"
 
 S = "${WORKDIR}/liberation-fonts-ttf-${PV}"
-- 
2.20.1


