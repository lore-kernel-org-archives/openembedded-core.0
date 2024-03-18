Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13047C54E69
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 02:22:13 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.34189.1710728529807525407
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 19:22:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=EGU/hQ2V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6e6f6825102so2591365b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 19:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710728529; x=1711333329; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMQjMlGNjPPlSP3KcyC7DHFgBrPdGdLyxrQr74lvlvs=;
        b=EGU/hQ2VznNauBUh7SsekqPLXDxwRJ1a6JEHhcny1uPaIZYa9VtBxgvY79vYe3L7xN
         WFaI1CoiJ1IOsd6bLOpnwkR5pSUnr80Py1K+yPqnIzCbRh0Y/EetIvJn6sZugOE8avbS
         jQcqGYzO+3KddTUgp1g20SlD64eUFe3RxtGS7t0J7oCIHsVOdAb6+LDrYgOzL63deNwM
         OYj4kknZeSfhRu46HHeG885+9insI8E2kW+5uMNnh4iUtlafhKm50CLGSuyuBvdfz9Db
         rtRXxbXQA4JwcriXjovJjm1VM0XET1k5zFwD6j7ijEzj3hdxHXG9mTkW0RcjYynOGZlw
         pCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710728529; x=1711333329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMQjMlGNjPPlSP3KcyC7DHFgBrPdGdLyxrQr74lvlvs=;
        b=fddfspxd8oiFqgnfNlKAgx8qqaJnKIpll1NcIj10tRhWArGdGaBH5Pc/BWB3aew4dd
         V7gWpCaiVkWaW4PHbRaRQ+kvxQiF52uk8YHhMYew4MG/qqY5UDdtmziOKEFPMNi/9lBB
         wAGyfvLvcqlmJBafF4SdxNlw49uikDsJgxGR7SiUrF+ei67yz05XiuZxryoqPlJVoQOT
         XExmUToYmif2Bj00XQ15JHGaIav4EHE+iV22LEikwJVTZJs6Ex0zDprgmK+Ayz/37SiG
         2RMwTlTM/gUswoJJgPbELqQrToRpPEWRl73cSEl5RMGNRoN31hxTP4PuoL1lHQEyb40u
         SU7w==
X-Gm-Message-State: AOJu0YzJffktJbjkumWd1ZNwN6ehxE6TYfIMaTvSfnzZubS8iexL0c+W
	atehicNK7Si2ZazsO3f00eNUUCWH5l1MvqgwtgZxqtfLdD5TrAaU8SjdSMZsnaMZQkpk1NF5l0O
	v/9J1Tg==
X-Google-Smtp-Source: AGHT+IGRyp27dlwiISvpIFfH/vHjfJ8ZslL3NzlmNaBIJgk708IvzsoZov4LkzsjMypjnAelQB1RyA==
X-Received: by 2002:a05:6a00:1790:b0:6e6:4dfe:4c7 with SMTP id s16-20020a056a00179000b006e64dfe04c7mr15869542pfg.6.1710728529083;
        Sun, 17 Mar 2024 19:22:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 25-20020a630f59000000b005dc2ca5b667sm5953953pgp.10.2024.03.17.19.22.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 19:22:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 03/14] cve-update-nvd2-native: Fix typo in comment
Date: Sun, 17 Mar 2024 16:21:47 -1000
Message-Id: <0c2e186e1ed8a904945066672e8e2af8b2ea284c.1710728384.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710728384.git.steve@sakoman.com>
References: <cover.1710728384.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 02:22:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197277

From: Yoann Congal <yoann.congal@smile.fr>

attmepts -> attempts

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc18aaeda8e810f9082a0ceac08e5e4275bbd0f7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index bfe48b27e7..f21c139aa5 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -26,7 +26,7 @@ NVDCVE_API_KEY ?= ""
 # Use a negative value to skip the update
 CVE_DB_UPDATE_INTERVAL ?= "86400"
 
-# Number of attmepts for each http query to nvd server before giving up
+# Number of attempts for each http query to nvd server before giving up
 CVE_DB_UPDATE_ATTEMPTS ?= "5"
 
 CVE_DB_TEMP_FILE ?= "${CVE_CHECK_DB_DIR}/temp_nvdcve_2.db"
-- 
2.34.1


