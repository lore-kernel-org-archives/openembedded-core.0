Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29FEC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:39 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.30160.1641226779372440314
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id o17so30911545qtk.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=3dMdFixhrWOb2MYXXR0v6+AKwg6rRQqm7rhLL13ee+8=;
        b=WLkMJKZChcbujw+5o+mhwftBX5QLCHc3TLfRxxUTKilTcVP/6/TeG5o3sCaATtFL9b
         uWAZ/1oAtaGJ0zstJHB5J3LCYZRSFo4ESPu1M0I5wr/UqhsK3hVnJUDxHHKYGt3Ryv+p
         oSK92BBjusWf3cccn7NOZSBOkaupcxQjzig5Hdyoq2VMVj9cLt3VQyEe/nEd9qjnOVmk
         6wYj5GlOgh723nt8eedhS94lhmac7PNfAz9hN9ucXfCYne12KtbhJ6RazFZKuc0fyMRU
         vbqF2hwCxFIU5LPqu04qNstXHEsGHXVpNSDOvh5NqG/7YrK1NJzGY1vwWRjnnC1C32WG
         Ae6A==
X-Gm-Message-State: AOAM530uZEJBguX9YmQtkCoHcsqaceU3+d5a60gMLVWAc0Zeuv4BUQUE
	ML3/mcMiAkvaMWmtPFArfORgTzil0Itj0sJA
X-Google-Smtp-Source: 
 ABdhPJwllQKt7w5A+S5BcytegRJ1YgFS4Yf4Q646KnbAv18nqkksCaZOyYmFinaWJStqZqBPHSXvfg==
X-Received: by 2002:ac8:5301:: with SMTP id t1mr41139248qtn.172.1641226778299;
        Mon, 03 Jan 2022 08:19:38 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 r24sm27680588qtp.38.2022.01.03.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:37 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 11/24] meson: upgrade 0.60.2 -> 0.60.3
Date: Mon,  3 Jan 2022 13:18:41 -0300
Message-Id: <20220103161854.301148-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160128

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/meson/meson.inc                           | 2 +-
 .../recipes-devtools/meson/{meson_0.60.2.bb => meson_0.60.3.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/meson/{meson_0.60.2.bb => meson_0.60.3.bb} (100%)

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index 7fbb246b87..042cf130e4 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0002-Support-building-allarch-recipes-again.patch \
            file://0001-is_debianlike-always-return-False.patch \
            "
-SRC_URI[sha256sum] = "64e6968565bf1b8152f4f9d6ca8154efb9e14caa9aabf7b22e71e6c5d053e921"
+SRC_URI[sha256sum] = "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
 
 UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
 UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/meson/meson_0.60.2.bb b/meta/recipes-devtools/meson/meson_0.60.3.bb
similarity index 100%
rename from meta/recipes-devtools/meson/meson_0.60.2.bb
rename to meta/recipes-devtools/meson/meson_0.60.3.bb
-- 
2.34.0


