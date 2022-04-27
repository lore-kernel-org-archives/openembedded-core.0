Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC93C4321E
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.5890.1651048820082995162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Uj3lhC9F;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id e23so1071838eda.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=atTm5Ub3rSmUdgtjrwlgjQFOilgE0QvFoM/8cueb+VU=;
        b=Uj3lhC9FqBI/Kf8EtAtE3WsN6SQBbquGLz5xQsXbW66GEeDN+zHT0j3Qdc7Hb8NWlF
         DkicmROAiTjIGG+DKk6EIXk5HhHlZJnB6x+SVQdQYyhSrwFTWU1fSgfFfyzreM2ux3iZ
         b92vdZuQ/lV4/tHCXCosDexip1lNZTPKx6xs5t793dnPrMdTdNsV6LFoACV/TzD12Div
         ft3aI+mt4qJeHXP648c4K3jJ02IAGSfeV80FJZh3FW0Jfin1iAkYEdVBdopUdt2q+/bi
         SDrhivp0cfs3NBdkIXKPiBGcFyPcJrUoyxXy6iixWseTMsgL03VzxB91piuQwzrqELXD
         dwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=atTm5Ub3rSmUdgtjrwlgjQFOilgE0QvFoM/8cueb+VU=;
        b=Mw4ZoEYOeCYvVbrCFR00VwF1jgrT5iC8BWfFanXafip3O+Ju4zyCV065vi/PaL+9Jh
         cF1tFFc8OtPi49Mtuq1sJKdbxkXvX+tilf3U5pw+la+vW3IZGSDb/fmTW5+lpaHeZFIb
         vUGuGljHBCr6FQvRwyKUdMQpMTQp3rGbCgftkrn2KJ1CLJ5vM5KbIabt7iDAgJe1Zjzf
         s/boIeYmmtl0urSttHYZXAayTI/byWmfWMz/8MTENT/7Ld7X6u0Qobu3JcZXU5jD+xRp
         /tw8y4EkqX0C4NHAlBjNwO3APTgpuZ2fR58DP9VqvlErNrAhn6VgtvBwts1IBncPUoiU
         0OUw==
X-Gm-Message-State: AOAM531MYqapmAErlNSnVhqEoU5jJV7b9fhcWeqeH9J3gojXGQMPMZAb
	+CNMSNPqmuahyxXHk/LNLTI8KOj1Ifg=
X-Google-Smtp-Source: 
 ABdhPJw672Lr8dA3Fu8pGfvCmlF2ju8+J6YiGk229PdKW+vBXyoqkjXsohDFGZAQBDqlpiPi6wy3HA==
X-Received: by 2002:a05:6402:2945:b0:41d:aad:c824 with SMTP id
 ed5-20020a056402294500b0041d0aadc824mr28903056edb.364.1651048818684;
        Wed, 27 Apr 2022 01:40:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 07/18] python3-typing-extensions: upgrade 3.10.0.0 -> 4.2.0
Date: Wed, 27 Apr 2022 10:39:58 +0200
Message-Id: <20220427084009.3406717-7-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427084009.3406717-1-alex@linutronix.de>
References: <20220427084009.3406717-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164898

Upstream has transitioned to flit from setuptools.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ensions_3.10.0.0.bb => python3-typing-extensions_4.2.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_3.10.0.0.bb => python3-typing-extensions_4.2.0.bb} (73%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb
similarity index 73%
rename from meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb
index a8e83fc824..3aac39b8ef 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.2.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
+SRC_URI[sha256sum] = "f1c24655a0da0d1b67f07e17a5e6b2a105894e6824b92096378bb3668ef02376"
 
-inherit pypi setuptools3
+inherit pypi python_flit_core
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


