Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1FDC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:20 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web12.30117.1641226820022951160
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id bp39so30603716qtb.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=RwaTj2rR8fL13/TVG0WPqWbHq8WHIDm1RUwjcn83pQ0=;
        b=jJL1RWTaUTpB1w2S4N9Aff1QE4W4oTFI+Q4d/DCGWYTaxjHw8bCs95lvyETUsR5wam
         UzP05fh5yfmAfnPv+weI9GtYNrMlzW6Q3mIf2Rf4oC/lOzVCZFEdY378UYGBmS6pcuZb
         wSuOW+ogOSRqdoqqQBTnf2D7rTdfxXGvbYfbiwnFvOtSoEwxwkgx99DlQyVMzrvyTJam
         +hYVi/GCQdr2nH5rXtFy7GRqANC/uQn7pKR7yy9Nc8DnqJZfWGrvnCtdZGIYWsmu+sns
         Ut6bvO0SvVi4cdOmD3wBW8qQwtk7VDD5t0ryitkMtSNZlYUV4cvB+KRIeo3nvqUORk+G
         tayw==
X-Gm-Message-State: AOAM532wmwpW5L9RlYaoLLx8fpWm9ZRnsRFg7RQPIVeFXzCezPSqb88a
	x1eVHulb8VNnE3r/sljX1LO9pqX6GcFFs1cb
X-Google-Smtp-Source: 
 ABdhPJxznsDFiWuE/KJ6FRlingY0Oi6/MH5A/pf5N7qdC19VlgOOlc1WliL89zF3Op9MhVn96i/2FQ==
X-Received: by 2002:ac8:5c49:: with SMTP id j9mr41355847qtj.253.1641226818945;
        Mon, 03 Jan 2022 08:20:18 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 r13sm31691854qtw.41.2022.01.03.08.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:18 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 24/24] stress-ng: upgrade 0.13.08 -> 0.13.09
Date: Mon,  3 Jan 2022 13:18:54 -0300
Message-Id: <20220103161854.301148-24-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160141

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../stress-ng/{stress-ng_0.13.08.bb => stress-ng_0.13.09.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.13.08.bb => stress-ng_0.13.09.bb} (93%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb
similarity index 93%
rename from meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb
index f7197a27fa..482fdd2df5 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.13.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.09.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master"
-SRCREV = "0af163e0e378e5c62abb9328a27b653289c05679"
+SRCREV = "757b66b49e4b3d7d008ef7054b34d791c742e869"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native"
-- 
2.34.0


