Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9CCC27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:09:43 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.1150.1718129374244797416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:09:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=YRtK08zQ;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f47f07aceaso51199885ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 11:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718129373; x=1718734173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvkOgVyY1sfDK/mTFKSsi0KyeR+vETRFOWDkFEZqQcw=;
        b=YRtK08zQCsla3XqCe6EOKnSpol6G2oMccBORa9OS7UP0PoRlZKwroxz/2CEi33vAGh
         nmPaij0dGDuGBWtUe/Q2o8bMurXx6CBQZxU6PKuAB65kvnOR4cn+AUwGs/n8lCtnbOo8
         4vebAyjOoZ9LA1VF0OUZvr6G8199+X3G3H1KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718129373; x=1718734173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvkOgVyY1sfDK/mTFKSsi0KyeR+vETRFOWDkFEZqQcw=;
        b=bPCAGoBKuLJwMR9COp40uhU4MzY4B6EjqG9YKnO+g6orPIUIveXfdOVC+/1iinMJkH
         S8o/ZNvcA7Co6nNr3iArFPrYnp2sKX3mGpiG0YCSZQfhdmOWam7uE6V01WnP7kH77oBR
         UlA+0YTZam2gz2ocLY+RURa1j7KCAYh/40QhvEfYYL8bKEWvo6otBsO/ZOcOYROYvo5y
         E9Bt3HBYGdNVU79QnwKCzwiB5Tlx/OooTSomFtlERO27uCPjaEWw3MOpySYuR6V+wEvm
         /LfIU54Y6XCcLatKDT8qni2VrwalN5vTKFNKISgb5vr4m2a3PFVKyLyLq6sMIK5Rm7oS
         wzzA==
X-Gm-Message-State: AOJu0YwYmn2VUGBbQpCVtv5DlJHfMRMaihgiT2A0MAJySmhIIZnWuKdC
	8H2YWKQ0MrhFr6QQ/I9q7C514xKkKf6biiwbybE6Euqw3PnCHjn5btBjumz+KZW/kVE+xehYqgF
	cleE=
X-Google-Smtp-Source: AGHT+IFkhlMp0Zsquvj32CGsWy/PTpjqnU6pOkVf3R4/DE9VNJWI/qhrp8Dv7DMOJS204wtYlx8w8Q==
X-Received: by 2002:a17:902:c20b:b0:1f7:11c8:bdd3 with SMTP id d9443c01a7336-1f711c8bf01mr51975095ad.29.1718129373236;
        Tue, 11 Jun 2024 11:09:33 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd7e0613sm104524275ad.195.2024.06.11.11.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:09:32 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-certifi: upgrade 2024.2.2 -> 2024.6.2
Date: Tue, 11 Jun 2024 11:08:59 -0700
Message-ID: <20240611180858.2858049-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 18:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200545

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/certifi/python-certifi/compare/2024.02.02...2024.06.02

* Various dependabot updates to dependencies
* Test against Python 3.12 stable and 3.13-dev
* Added 3.12 classifier

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Tested by also building python3-requests and python3-urllib3

 ...{python3-certifi_2024.2.2.bb => python3-certifi_2024.6.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-certifi_2024.2.2.bb => python3-certifi_2024.6.2.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb b/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
rename to meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
index 4e61b8d9d49..504fda41245 100644
--- a/meta/recipes-devtools/python/python3-certifi_2024.2.2.bb
+++ b/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = " http://certifi.io/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11618cb6a975948679286b1211bd573c"
 
-SRC_URI[sha256sum] = "0569859f95fc761b18b45ef421b1290a0f65f147e92a1e5eb3e635f9a5e4e66f"
+SRC_URI[sha256sum] = "3cd43f1c6fa7dedc5899d69d3ad0398fd018ad1a17fba83ddaf78aa46c747516"
 
 inherit pypi setuptools3
 
-- 
2.45.2


