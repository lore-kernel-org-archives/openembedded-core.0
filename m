Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D92C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 15:34:42 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.11478.1634657681060440774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Od7BE732;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id m42so12447653wms.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VsTv1tjRHhU1fFfGarETu/bCa5vPqVeaUUbaZH7SeVU=;
        b=Od7BE732u3VscS6puhDTRd9lty5e9dY1lUB+lOaErNKxwZayjgzVQdlDv04UQTedwo
         Jif4skATE/BKO74Nx6U8Kqy8Ct3mkBtJWgRUE/eGcm4FSWR0I7Bun5lUzVY/rLF8mUF9
         ZIEIH4arxfvgHiwWchpp7bzFAoYSElQdpv3r/gGZuVsewJInhB6hdbFA+uBWidbW65CB
         /mAAcnDGnAM/aVbxEPD8ReYZSUUWBXjUqEt2kxzrArRfXhyqDvtNEU3OFaH807IQkqOw
         mfCGu+MSEA46PtFTWVQAfzhY2lS4WrI3SszP0CadVpNiialiRnml1SBogur2zN93Ryjf
         OZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VsTv1tjRHhU1fFfGarETu/bCa5vPqVeaUUbaZH7SeVU=;
        b=Yoyy18PjKt66Czp4C9wiiEpZF0ftgTmnFPo3jGxa5W2lBpJhG+M4Gyf+wmHfTIvk9Z
         WPQlgquEsF+Ngfjkdy5WUCyo0/Uz1wVOtPJKd25ZLDowVfufRPBtn7i/Jc1DPUPKlzJ5
         jJko8HAt/G6WCVi5LxRVJ82aJL3EEy0shKA1aR7q7POapX8jLCa9BHjk/Karu8shMQ9q
         Jy4FaMyjbErqo+So6qmJzDDib1qQJZzo0fNu01RQizyfn+qsdxMxw6/GHd5Z8qtmuYRU
         bE0GH3bkfsbrT1+mlkh99nCnFOEtWJW0+vmLKqtl/E9pHOTXgEWgLmz/wOC7aWL85AtT
         s1RQ==
X-Gm-Message-State: AOAM530bCWx3ndmCSc72na5pA8H2VrKR8cpW9l2i9aXKX2sGr8c9tb9z
	AvzCt5YsIW3TGHFWdDLnG/2UiWi6Um4=
X-Google-Smtp-Source: 
 ABdhPJyhtyvy6dGC9zBU0l2iPvPpiPKn3/um8B3jwlGSVNayZbEZa6YeE8cqPCkwoZ7BG6Tm/jsobw==
X-Received: by 2002:adf:e746:: with SMTP id c6mr44354627wrn.367.1634657679658;
        Tue, 19 Oct 2021 08:34:39 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t1sm5868537wre.32.2021.10.19.08.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 08:34:39 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 22/65] git: upgrade 2.33.0 -> 2.33.1
Date: Tue, 19 Oct 2021 17:33:36 +0200
Message-Id: <20211019153419.3319802-22-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211019153419.3319802-1-alex@linutronix.de>
References: <20211019153419.3319802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 15:34:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157141

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/git/{git_2.33.0.bb => git_2.33.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/git/{git_2.33.0.bb => git_2.33.1.bb} (51%)

diff --git a/meta/recipes-devtools/git/git_2.33.0.bb b/meta/recipes-devtools/git/git_2.33.1.bb
similarity index 51%
rename from meta/recipes-devtools/git/git_2.33.0.bb
rename to meta/recipes-devtools/git/git_2.33.1.bb
index f8d4dacdbf..0dbde7fdc1 100644
--- a/meta/recipes-devtools/git/git_2.33.0.bb
+++ b/meta/recipes-devtools/git/git_2.33.1.bb
@@ -5,5 +5,6 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "02d909d0bba560d3a1008bd00dd577621ffb57401b09175fab2bf6da0e9704ae"
-SRC_URI[manpages.sha256sum] = "ba9cd0f29a3632a3b78f8ed2389f0780aa6e8fcbe258259d7c584920d19ed1f7"
+SRC_URI[tarball.sha256sum] = "02047f8dc8934d57ff5e02aadd8a2fe8e0bcf94a7158da375e48086cc46fce1d"
+SRC_URI[manpages.sha256sum] = "292b08ca1b79422ff478a6221980099c5e3c0a38aba39d952063eedb68e27d93"
+
-- 
2.20.1


