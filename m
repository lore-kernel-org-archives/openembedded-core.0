Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9455C433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:30 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web09.30342.1641226770274509833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id q14so30839531qtx.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=QXKys8l6moYBbWfMMX6Z97ZsGgxxGILBqugSQ9kqt/Y=;
        b=M6kuOBYssCJJ5jVZmrMeguWWBwQ4zaO2lbIF8L5I++HSF1VzBmHXx04kNlOcd5dcZS
         vzjdaG5BIPO/tSR0TiPpIoGi81hIwweLwmnURwAWrRW/m5Iq5vlX4/O8G7ZJeqIFeJIg
         5iElpJjjFOVUqRh2Q3EBfx1w3Pj47NuDJwCf9zEezcFyTBtKFvGySThd0Uhlez1QFaLV
         X6E3cyDtaaIPRP1nvyEGLEgKWsKH3fFuh/1paK3v3JA5xTyyKEBzxHSsolDrnZ0o6PyT
         sgOyvhhe0Sfl2NxAMFM8S/ACTWRDKmKe+4nc7vRPBo6YZievV3i6Mxl+kcembAMZHqKb
         2TOg==
X-Gm-Message-State: AOAM533XrbpZiFkV7anjiaGWAUXhDTzq9rh1d8MwDwKDSnek/AXPlh9F
	NVLgUp4y8HO7aQ2P38tp+P+YjrtL/Zx/LMiX
X-Google-Smtp-Source: 
 ABdhPJwXr32SAgNg0uN349oHkWEFNDZnSx68jjgQZ3tDLcD9i7iywn6GrtXZaFQXi5ZRjw1mkT2ZTg==
X-Received: by 2002:ac8:4e8a:: with SMTP id 10mr37227093qtp.43.1641226769162;
        Mon, 03 Jan 2022 08:19:29 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 r187sm26675096qke.11.2022.01.03.08.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:28 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 08/24] kea: upgrade 2.0.0 -> 2.0.1
Date: Mon,  3 Jan 2022 13:18:38 -0300
Message-Id: <20220103161854.301148-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160125

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-connectivity/kea/{kea_2.0.0.bb => kea_2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/kea/{kea_2.0.0.bb => kea_2.0.1.bb} (97%)

diff --git a/meta/recipes-connectivity/kea/kea_2.0.0.bb b/meta/recipes-connectivity/kea/kea_2.0.1.bb
similarity index 97%
rename from meta/recipes-connectivity/kea/kea_2.0.0.bb
rename to meta/recipes-connectivity/kea/kea_2.0.1.bb
index 9f33c325bd..900ceb62e4 100644
--- a/meta/recipes-connectivity/kea/kea_2.0.0.bb
+++ b/meta/recipes-connectivity/kea/kea_2.0.1.bb
@@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            "
-SRC_URI[sha256sum] = "05854e0c3871b452edace18eccc6ab618940e0249fbe7c232a36d06ae59bf41d"
+SRC_URI[sha256sum] = "f50bb9a954e314316b4033a175dc807496bb9c1754110bd92a21c165a9e84c57"
 
 inherit autotools systemd update-rc.d upstream-version-is-even
 
-- 
2.34.0


