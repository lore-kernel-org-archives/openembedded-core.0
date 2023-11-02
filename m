Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C534BC4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 12:42:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.29977.1698928918313331000
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 05:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jvQ+kBD2;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c434c33ec0so7174075ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698928916; x=1699533716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kizIHqFkPm2nbfiOMaziHfp6+mbzsEBKe9mOC4K7YsU=;
        b=jvQ+kBD2ofY/aYZ5ibD3k6u/aOWfaGlIwm3xvpiKlO9TqIS80EzdzOsIVcfSul/ICo
         WGhEWKEZeTdn+/Sm9rYXo+WfqkD6pD/dyL3bjw1cr5pe+TFvLyDvhR8uOG/Jg4dKlzci
         S+ZkQW1fFpkX1Y/G17wr1LcWr2iTr0XDAReSDnk2PSOS//dBNdZ7YdjGCVy6TNpj9lJh
         J8XdzGDizUK5eGKfjSsujY4p7GmfF1Ymt5N5yy4YAlDK6a891y0A421BsvBi65FZAI2r
         EMp1qedL6XX/0h4OJ19YZVxkYmAHxAs1/UiGbzYMkFlRWbB+2o9eit7s+nknBTUHK1jh
         vP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698928916; x=1699533716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kizIHqFkPm2nbfiOMaziHfp6+mbzsEBKe9mOC4K7YsU=;
        b=orcGBpw23sgPwK4O3p6ysqmHSXvtEeQEmcpNEAlaxL1UK6qRKJaTq1TTsv943UI7AH
         WCskcGZ+WXFqt0uJkt8r6Jo4UhA3gCDM0H6ax7kfB6itEXGfFOXu8o101aKhMBan4Lpm
         y0brIcVYblc2vQdzs+e3TqJplwQFDWsHBsb2raxD+CWBlnYDUygHR5G9t8nlHihYbEil
         braECOYtyd5Z4ALV9vBOLwfWhdDvOSg4P84YWg8VsC4KCgCkAPcx9e9fh3/K6Cqoj7pJ
         JbK8Qh1wBQLlpTZl4KO9fQBYLv7vo+6/XWKJynToLZbWs7/qYbcLaW2uNxuXLrPckwdc
         iVkg==
X-Gm-Message-State: AOJu0Yz25ay72kw4QFaYvUvICvUhGOnksCtf44TXN/D9EWYhFu1yPjSa
	ysE11whISAj3PNX5s7TkT5hCnyGTAZaSvw==
X-Google-Smtp-Source: AGHT+IEDxLFnVSenz/Zq9hvxxhRl9nP+CR53CxLYVcdcRdKPoUIxvKYXf0N1Moy3zfeOb/sjxTLyFQ==
X-Received: by 2002:a17:902:e745:b0:1cc:45db:e21e with SMTP id p5-20020a170902e74500b001cc45dbe21emr12192397plf.37.1698928916455;
        Thu, 02 Nov 2023 05:41:56 -0700 (PDT)
Received: from localhost.localdomain ([61.84.2.32])
        by smtp.gmail.com with ESMTPSA id e19-20020a170902f1d300b001bbb25dd3a7sm3030971plc.187.2023.11.02.05.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:41:55 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH] python3-beartype: upgrade 0.16.2 -> 0.16.4
Date: Thu,  2 Nov 2023 13:41:42 +0100
Message-ID: <20231102124142.1452764-1-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 12:42:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190080

Changelog for 0.16.4 [1]:
In beartype.claw type-check PEP 526-compliant annotated variable
  assignments in methods
Fix an inheritance regression introduced in 0.16.3

Changelog for 0.16.3 [2]:
Add hot reloading
Support root superclass validators
Forward reference issubclass() proxying
Readable forward reference exceptions
Class redecoration eliding
Documentation update

[1] https://github.com/beartype/beartype/releases/tag/v0.16.4
[2] https://github.com/beartype/beartype/releases/tag/v0.16.3

Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 .../{python3-beartype_0.16.2.bb => python3-beartype_0.16.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.16.2.bb => python3-beartype_0.16.4.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.16.2.bb b/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.16.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.16.4.bb
index 20a5b92c61..ad4462e0e2 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.16.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.16.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e40b52d8eb5553aa8f705cdd3f979d69"
 
-SRC_URI[sha256sum] = "47ec1c8c3be3f999f4f9f829e8913f65926aa7e85b180d9ffd305dc78d3e7d7b"
+SRC_URI[sha256sum] = "1ada89cf2d6eb30eb6e156eed2eb5493357782937910d74380918e53c2eae0bf"
 
 inherit setuptools3 pypi
 
-- 
2.42.0


