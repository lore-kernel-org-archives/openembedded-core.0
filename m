Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E203CC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:19:42 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web09.30353.1641226782474737434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id i130so30737975qke.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=y6v6UMv5xmi8CCQZfg9Ys4IbURnUm/XVcX6LodP/Nh8=;
        b=SMKQ4f5ocgU7GTs57gJovD922wmRld12xF7hjMx9UHoO+ZrvfO5s7/18NsZF3CZoI9
         X2dF22hiDCP/1eSFsWMBn51Uss281h0ifgpDctfrdAxtJQwrVDnp+8VQhsBZgKH6EHKn
         2YgfyOzzmen44FE4LN4TmfjBgIvaufe8+d4mbV6gjlMot8Wht2bLv3rvNviKQFU+m+h9
         kVNVCfzIQ+iQFztqkSRkE5mprH+Y/ozMzai2/pR0R8rWlgqcgHK6tbuAHMdRzjI7qupL
         sbXNpDW3cWusMWxCrWayQXK+7IltI8LPr4sU5C5psskcoUIrj+L6iogZ/NyF2jBhQXme
         vLRg==
X-Gm-Message-State: AOAM533+SV41fZfFRO89EigAZvpmW8guYi8gZpPwSpPh1VQT+otRViir
	G7KRbSN04xdQSCAGDIdnQ+EqV0bLuL9AD8U0
X-Google-Smtp-Source: 
 ABdhPJwZPWZIKKyccMYtiwEQuCcUf0e59l0FSBVFpZIcdegFerC9+M0ZwK1n2JoBUrnA5eJcLcMe+A==
X-Received: by 2002:a37:aa0b:: with SMTP id
 t11mr32389344qke.101.1641226781169;
        Mon, 03 Jan 2022 08:19:41 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 x16sm29693567qkp.67.2022.01.03.08.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:19:40 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 12/24] mmc-utils: upgrade to latest revision
Date: Mon,  3 Jan 2022 13:18:42 -0300
Message-Id: <20220103161854.301148-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:19:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160129

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-devtools/mmc/mmc-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/mmc/mmc-utils_git.bb b/meta/recipes-devtools/mmc/mmc-utils_git.bb
index 507d5c4466..5ccdaceb79 100644
--- a/meta/recipes-devtools/mmc/mmc-utils_git.bb
+++ b/meta/recipes-devtools/mmc/mmc-utils_git.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mmc.c;beginline=1;endline=20;md5=fae32792e20f4d27ade1c5a762d16b7d"
 
 SRCBRANCH ?= "master"
-SRCREV = "a1b233c2a31baa5b77cb67c0c3be4767be86f727"
+SRCREV = "3969aa4804edb8aed7bcb3c958e49d0c7388b067"
 
 PV = "0.1+git${SRCPV}"
 
-- 
2.34.0


