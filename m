Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE1DC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:26 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.3573.1652871530816043440
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzlfvNI4;
 spf=pass (domain: gmail.com, ip: 209.85.218.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id n13so1166743ejv.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Wa41at4zW61CvyZobUqEVkPTwFJhJVWZ90CQOeXCl4s=;
        b=WzlfvNI4dJJPM/bEAaMgq82bVGkQqyplL2+FsUWyLFFN01vlpFjCg/sIufE29gntLW
         5vZNVWzZ58JgAk9/+sy8sRQTh8QLtgeahiFN2kncMgpjfK0vH6MLXeN1OagK9nKJQHtm
         QuX937WXUvyRbWfxUTVywwjBe5fFyLUPAJze3xnRxb8+6C4C2dZm13cchPVgiS2fw5ug
         LOFG5Pb+9zfXPXv5hTqBSpRgGSNiDHdGbm7wMTBbDcqe+4W6pp3slRTa+MpMcUTgmUqw
         U2xcdHsLZaF5zqW5DdF+j8CLig3uOu0igh60VtBulQ6rnZRW4sJgBJ89AxRUhdBBeavL
         Besw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Wa41at4zW61CvyZobUqEVkPTwFJhJVWZ90CQOeXCl4s=;
        b=4Qj76zvJyyuGJyPrJPZNpKclQUmWTNmF4sI9uFNYP7FklwCnwScVAdoWp3KHyA78jM
         FC/eV6dHyog90VUvJiQ+zX1v2bOxN4b6SFRKINjlRAsRstoHfkcEcikzg+vXZUnOQMua
         bjjAXcqWyNaJ8eZQ0u3bwWjd72uHPcTO5edw7+SeCtBAxNz+ZTZXY7PL2NjfyE84iFoy
         BusMMD4Ar0Iq0iM2h7sA8AfCxW63HLSxAp1Peu/x3eWJ/mnK5CCnCIWWSf7A2L2MvJIr
         YPlDaI7Kg2LY8q42IJDlNt+Iiipavvd0l68rX3tLtBVsd4sqROa5DhODlXReiRhk8vz0
         b5iQ==
X-Gm-Message-State: AOAM533gHF8mw4PV9V9be2Ez4SJ3MUEbIRDcxiVHQVuvRU5D8rtWFMV5
	vdR5T9MghicsZ44e6SOu8TEcob5s9yE=
X-Google-Smtp-Source: 
 ABdhPJylb5JuWSWYiOILb+pHQk17BBcpbvytQBFSEWYRqJO5/1bLpHcqIoJCnn5XtRkUgupEPF/faw==
X-Received: by 2002:a17:907:3f96:b0:6f3:cd20:b00c with SMTP id
 hr22-20020a1709073f9600b006f3cd20b00cmr23388910ejc.185.1652871564941;
        Wed, 18 May 2022 03:59:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 37/49] python3-cryptography: upgrade 37.0.1 -> 37.0.2
Date: Wed, 18 May 2022 12:58:31 +0200
Message-Id: <20220518105843.3299331-37-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165834

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...n3-cryptography_37.0.1.bb => python3-cryptography_37.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cryptography_37.0.1.bb => python3-cryptography_37.0.2.bb} (97%)

diff --git a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
rename to meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
index 1271954a08..d2de2960c2 100644
--- a/meta/recipes-devtools/python/python3-cryptography_37.0.1.bb
+++ b/meta/recipes-devtools/python/python3-cryptography_37.0.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
                    "
 LDSHARED += "-pthread"
 
-SRC_URI[sha256sum] = "d610d0ee14dd9109006215c7c0de15eee91230b70a9bce2263461cf7c3720b83"
+SRC_URI[sha256sum] = "f224ad253cc9cea7568f49077007d2263efa57396a2f2f78114066fd54b5c68e"
 
 SRC_URI += "file://run-ptest \
            file://check-memfree.py \
-- 
2.30.2


