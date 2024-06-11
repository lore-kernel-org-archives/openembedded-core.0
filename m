Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5473AC27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 19:43:44 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.3286.1718135023291878020
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 12:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Aj8D4noJ;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f4603237e0so158715b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 12:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718135022; x=1718739822; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZylXCA6bV0IE/uMMM/TYofNjU89cFUQLAjK9m9UjFs=;
        b=Aj8D4noJwJq3TzVFLU76kgxdywKb40ZIdvf9yiUm8mSch30SrC2Z0wJUbdUEmcpraY
         6bSZ3KPiHcsCTrVutsgHJGZhDLrONeXshoFApomOfi8B8lD8K/bU/FB/DXtUl8aC1mXv
         QtvumW6jQz9m9zmzNGB+1e1yOUwuPH6y13F/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718135022; x=1718739822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZylXCA6bV0IE/uMMM/TYofNjU89cFUQLAjK9m9UjFs=;
        b=hAVuGi3JgZtEhVljhl2HZ1mUUu/9YheA2ZSrINjP237AYmPVc9Um7ltixUsaIwcrU5
         jJ+D3MGe5eZCzsSAI2rTQlDyPeYU9JujjzKxrtnwMNPfEFxftU+jjpKAjKeI0IK/vA7U
         44tCYVP9N98Uvkyv+/DghEj7IevOi7Vj8+e+bIJ+tR7X6J2gV7sG5vsIwFIu6BQ9Jf7u
         DJOhsM3yxY1Z22Yqc0cJyH2kZdKM9+oAF1C1+ctGQF6K8W+B7MJh68A9yhUI9ESRWC9H
         LIAuahHy2hRhTW1xeToa4RufHFal8AKeSZpx8iU/RtvGW7YHkA9O7TTvHcG68sNiO/J7
         3GAQ==
X-Gm-Message-State: AOJu0YzVa6pfQlhx6aDTzjDz/g4//oPQ1cOFikaTLGBIiPOAopVJyQvI
	TdonX6YJl3f2fUuOwOr63MdFRnxrTZLOaJZ7tfwMJ5IiWDd3xYtxfAa0qZWAZBvaF2syu8+sAHQ
	KAGU=
X-Google-Smtp-Source: AGHT+IHL/QV3GyeALYtF91Ath4DsYHVGMdn7v/XO2MLkC6wVN6Pev8vrxCqlmKsLlEXzMCPCEicSkw==
X-Received: by 2002:a62:e40d:0:b0:704:1f04:954e with SMTP id d2e1a72fcca58-705a848b20amr4631979b3a.5.1718135022168;
        Tue, 11 Jun 2024 12:43:42 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-704287dd28fsm6012891b3a.58.2024.06.11.12.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:43:41 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-zipp: upgrade 3.18.2 -> 3.19.2
Date: Tue, 11 Jun 2024 12:43:37 -0700
Message-ID: <20240611194337.3139940-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 19:43:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200550

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/jaraco/zipp/blob/main/NEWS.rst

v3.19.2
* No significant changes.

v3.19.1
* Bugfixes
  - Improved handling of malformed zip files. (#119)

v3.19.0
* Features
  - Implement is_symlink. (#117)

https://github.com/jaraco/zipp/compare/v3.18.2...v3.19.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/{python3-zipp_3.18.2.bb => python3-zipp_3.19.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-zipp_3.18.2.bb => python3-zipp_3.19.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-zipp_3.18.2.bb b/meta/recipes-devtools/python/python3-zipp_3.19.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-zipp_3.18.2.bb
rename to meta/recipes-devtools/python/python3-zipp_3.19.2.bb
index 97aa1fed259..2bb69f2ac8b 100644
--- a/meta/recipes-devtools/python/python3-zipp_3.18.2.bb
+++ b/meta/recipes-devtools/python/python3-zipp_3.19.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jaraco/zipp"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=141643e11c48898150daa83802dbc65f"
 
-SRC_URI[sha256sum] = "6278d9ddbcfb1f1089a88fde84481528b07b0e10474e09dcfe53dad4069fa059"
+SRC_URI[sha256sum] = "bf1dcf6450f873a13e952a29504887c89e6de7506209e5b1bcc3460135d4de19"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.45.2


