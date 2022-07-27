Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDE8C19F21
	for <webhook@archiver.kernel.org>; Wed, 27 Jul 2022 00:41:46 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.14373.1658882501172163838
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ENes4Rjo;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id ku18so14935006pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jul 2022 17:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=pnKao7jjT0Sk6uigFyd8iazxRG/SDB+M8xkGYu0JxEM=;
        b=ENes4Rjo9Vm0HLGBgvJdYI9CV7HJbBgSiu8aU+4xw0OipM+B4bkcXExf9N1K3hDwSG
         NLIkdbqX9XQLnIclb4x77Q/pH79ZSK4vxNYbLzcHobaWKgS3K07AiBxUgw/kIGFcRZWq
         ZX24wjUyZzFYtdzH206icm5ORd1xNpBt8Yy75yMnG0RTGgWCx8qgwEUsYGz4D8zv+aIe
         /5pIGW5c04wDve0FAZ3cvHhWo551mtz9zvyGtGWa0hVxCWaNrqIg/5O+QQrB64tb1wgV
         A/k9NDgZikP1leIR6qwkBIR8cXXIZgolJ4MjFdCyR4NmWqJ3A6fbM7ul6iVBa3NEM4pU
         zYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pnKao7jjT0Sk6uigFyd8iazxRG/SDB+M8xkGYu0JxEM=;
        b=Kk88UwnxjAJE17qC8jAFfyCKB5FOaEZFAUJlsYl27CQSOZvb7zzToyIwEMxX6rdp7y
         lNCNFRWJ/YQzi1NyvTbws+zLzSXRsYvN7C5Wx165c6oUoYDmeNPpisoC0OJ0Pc1AgLDf
         yjRCruFC8dlZKPoW87qHzHxLXbVbT37qqj+WnmJHTtKzT9mCXepmHTrDQtdnn3ygzOcM
         sXmIk+v/5FLUsPQjPdhqslxUtZ0RKOXDM+ZJVxELKettNgPDB3CKxAYzpwRysXgrs7Oi
         ilALJ6IaL10TjBl5lsUogcV80gnna2Um91Ld8uNrqHNC7+40j59+i5zmOPGiEUG++F2c
         9dNg==
X-Gm-Message-State: AJIora+PsP/FJt0mxWC6m2ZcHtxbTULHPzI76kBlCvEsXfa1gRMubwUj
	9HoOt448mYfeA38pEY8w61l8io9Klk78VtvW
X-Google-Smtp-Source: 
 AGRyM1tMFgivRuSxL2UYw2xW3tGigXcc+y92qHT85SXuAUlGREyLgQm1m7a4/mAAkqHvMdjbQHh6jA==
X-Received: by 2002:a17:90b:1d87:b0:1f0:6c87:fc8 with SMTP id
 pf7-20020a17090b1d8700b001f06c870fc8mr1604631pjb.173.1658882500127;
        Tue, 26 Jul 2022 17:41:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u16-20020a170902e5d000b0015e8d4eb219sm12356278plf.99.2022.07.26.17.41.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 17:41:39 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/15] git: upgrade v2.35.3 -> v2.35.4
Date: Tue, 26 Jul 2022 14:40:41 -1000
Message-Id: 
 <11943acaacd9b81b09ca378f40b17c393d33cb4b.1658882276.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1658882276.git.steve@sakoman.com>
References: <cover.1658882276.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Jul 2022 00:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168533

From: Sakib Sajal <sakib.sajal@windriver.com>

Minor upgrade which includes fix for CVE-2022-29187.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/git/{git_2.35.3.bb => git_2.35.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/git/{git_2.35.3.bb => git_2.35.4.bb} (98%)

diff --git a/meta/recipes-devtools/git/git_2.35.3.bb b/meta/recipes-devtools/git/git_2.35.4.bb
similarity index 98%
rename from meta/recipes-devtools/git/git_2.35.3.bb
rename to meta/recipes-devtools/git/git_2.35.4.bb
index 794045c8b7..18f39875db 100644
--- a/meta/recipes-devtools/git/git_2.35.3.bb
+++ b/meta/recipes-devtools/git/git_2.35.4.bb
@@ -165,4 +165,4 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
                  "
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
-SRC_URI[tarball.sha256sum] = "cad708072d5c0b390c71651f5edb44143f00b357766973470bf9adebc0944c03"
+SRC_URI[tarball.sha256sum] = "4970108bdc227e2c3687899f8fc7501c54c839dcc42f4d999ac9e3e3f52df583"
-- 
2.25.1


