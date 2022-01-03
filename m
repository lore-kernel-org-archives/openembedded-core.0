Return-Path: <otavio.salvador@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E868FC433EF
	for <webhook@archiver.kernel.org>; Mon,  3 Jan 2022 16:20:11 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.29892.1641226810780925674
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: otavio.salvador@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id h5so31334915qvh.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jan 2022 08:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:organization:content-transfer-encoding;
        bh=UYBn2G41mzN/Ggu5LhjvxVGJpb11LtuXDjog8t9D9nA=;
        b=D8MHcfi3MwuOpUA6eZPCG3oRs3NMyellgWhAOOd5MMOPFa7UzIbq60/IFGli3yYjjH
         y3/7An+JN/gPkcXY3euediww3HwCSvLx645OuNeAY+fgcIIX/K8HFqSuiRVO2K13In5A
         2BhmnIIUYQ/RwqJOKDKq9ypKabxlqdj8v2EgTu0AHSgmiSKNG0Q4u6GlAXSHlsOmONwf
         Esr5HL0+vaBhb24HWgbQiGNbgxJRbLllZgc4XGH3XZpI3pnhK877yhjpJD1ErnJGwVnd
         qLybYEMErVwV04KMzglXLHQiEOSSkmFFH7JKWnYRXsLNXu6wm49vc9lOe7CON/Bj3Ghw
         B2Fg==
X-Gm-Message-State: AOAM532297WdoFtSVslQAimGrQSMBO7XS5CFYM2nBvAqeROzwjZwQgmH
	hEPwHBvD474KAfcgHArlxHTJmTzKcwWchUV4
X-Google-Smtp-Source: 
 ABdhPJzf0GWnM2orj6Qz2VqhypBlsJdEEib/RG/nj4thkAGfJU5/pHfkhvSzjmI64Q7w8NRV49xJGA==
X-Received: by 2002:a05:6214:240d:: with SMTP id
 fv13mr42256754qvb.4.1641226809689;
        Mon, 03 Jan 2022 08:20:09 -0800 (PST)
Received: from localhost (201-34-65-230.user3p.brasiltelecom.net.br.
 [201.34.65.230])
        by smtp.gmail.com with ESMTPSA id
 t30sm27436618qkj.125.2022.01.03.08.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 08:20:09 -0800 (PST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 21/24] python3-tomli: upgrade 1.2.2 -> 2.0.0
Date: Mon,  3 Jan 2022 13:18:51 -0300
Message-Id: <20220103161854.301148-21-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220103161854.301148-1-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Jan 2022 16:20:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160138

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../python/{python3-tomli_1.2.2.bb => python3-tomli_2.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-tomli_1.2.2.bb => python3-tomli_2.0.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-tomli_1.2.2.bb b/meta/recipes-devtools/python/python3-tomli_2.0.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-tomli_1.2.2.bb
rename to meta/recipes-devtools/python/python3-tomli_2.0.0.bb
index 39030ed218..aa23ad856d 100644
--- a/meta/recipes-devtools/python/python3-tomli_1.2.2.bb
+++ b/meta/recipes-devtools/python/python3-tomli_2.0.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aaaaf0879d17df0110d1aa8c8c9f46f5"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "c6ce0015eb38820eaf32b5db832dbc26deb3dd427bd5f6556cf0acac2c214fee"
+SRC_URI[sha256sum] = "c292c34f58502a1eb2bbb9f5bbc9a5ebc37bee10ffb8c2d6bbdfa8eb13cc14e1"
 
 do_configure:prepend() {
 cat > ${S}/setup.py <<-EOF
-- 
2.34.0


