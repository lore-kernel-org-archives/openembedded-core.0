Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9932C433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:17 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web08.30370.1641226816952826272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id f138so31706110qke.10
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=T3SwfLychfRflBvTr2kpbQGDmTOvGzX5OweLHWQ2MgA=;
        b=3qWPWQDQlzsdMOm8WIX8p+0BmIQ4GJRQX0SwOikYz34dOaO77kTpl6p//5RfWQIkvb
         JVDlpYtfMfdRjZtrvlNGWSjTenyCdqECFDZK9OnucMz+J8ABQAoL+dedvRdNVCoj7NbP
         46POq8pGJA+KOP5I1JvaXE+O5gkVvAaTGOS2LD9g/88ippcYWrPkVA46D+/b0jhMdqa+
         V6F+8UjUZSTW25cGpS24VLlcOa8KlWa4RLmpUX3v8MlGP3dLfu31vqIEP5fusDgUwv5F
         NGPRkSPDHsAPCE1tjfcbXBtjewS70dLf4L8Xd+J5cTM5hReCJM38g4TGaHFeIcG9Kiul
         Aoyw==
X-Gm-Message-State: AOAM530D0+wtk4Fr4/cn4jn0zvug9mBnuXcT35Hc9K1hYf0LIPYHwkBp
	n0lKcpuaz1uqxS1trqRINPcxuPgq+W+qIpgC
X-Google-Smtp-Source: 
 ABdhPJyYr2ORnJaHTarsfUMAGBBq+9HWBtsZGBLegcSmdNZJi8zO5kV8ZHrq61iSCU63gfvM5MYnDg==
X-Received: by 2002:a05:620a:d95:: with SMTP id
 q21mr32340657qkl.178.1641226815854;
        Mon, 03 Jan 2022 08:20:15 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 j9sm28916176qkp.111.2022.01.03.08.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:15 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 23/24] sqlite3: upgrade 3.37.0 -> 3.37.1
Date: Mon,  3 Jan 2022 13:18:53 -0300
Message-Id: <20220103161854.301148-23-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160140

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../sqlite/{sqlite3_3.37.0.bb => sqlite3_3.37.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/sqlite/{sqlite3_3.37.0.bb => sqlite3_3.37.1.bb} (86%)

diff --git a/meta/recipes-support/sqlite/sqlite3_3.37.0.bb b/meta/recipes-support/sqlite/sqlite3_3.37.1.bb
similarity index 86%
rename from meta/recipes-support/sqlite/sqlite3_3.37.0.bb
rename to meta/recipes-support/sqlite/sqlite3_3.37.1.bb
index 68394c88b0..a13cca633a 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.37.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.37.1.bb
@@ -4,7 +4,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
 
 SRC_URI = "http://www.sqlite.org/2021/sqlite-autoconf-${SQLITE_PV}.tar.gz"
-SRC_URI[sha256sum] = "731a4651d4d4b36fc7d21db586b2de4dd00af31fd54fb5a9a4b7f492057479f7"
+SRC_URI[sha256sum] = "40f22a13bf38bbcd4c7ac79bcfb42a72d5aa40930c1f3f822e30ccce295f0f2e"
 
 # -19242 is only an issue in specific development branch commits
 CVE_CHECK_WHITELIST += "CVE-2019-19242"
-- 
2.34.0


