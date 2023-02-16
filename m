Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C53C636CC
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 23:58:53 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.26263.1676591930924771718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Feb 2023 15:58:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=X/8vDPRW;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d8so3824036plr.10
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 15:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqBwZA2syuqs21lpCigFs/US8J2zCX8kHaD5fI4WnBc=;
        b=X/8vDPRWngbtO/GklYBM9c2RlM2t3st9yagO2XiF1b83dRyMbsjKDmdfOIrzjJCKhD
         vwJdvRsuAVkf53eEoddspnj2cNB8wqKFZMGQrcJKqZGtlzGIN+ugHTl4HoQ0y3nbP36P
         Y+80av9cTO0nzrzvIcoauzQ/9xFhTJUlzLGt5y29WWvXvzJWciCBOj2kSmUlC9z8ROoG
         +i7rlQnb9RX31QxR/ivYUQrsCA5ZX5AE6LBYD8MLQgPT2BZ7zNf4DLGAQf9KGIwc1jLw
         1LNqgNcb4tItgBBtqCi+6owt2Ju1+zYMgRrtP/ZN478lIrG15yA0nIpu1TAsKwHxAxth
         MdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqBwZA2syuqs21lpCigFs/US8J2zCX8kHaD5fI4WnBc=;
        b=alD4l/1diV12U9V83NJ0/7kybOn/VL5E+jsq+HQ4NsrznAwG3nTCYSb7f5csQA82qS
         Plh7EZxEi51GEJW3atx069QrDgYhG89RU3JHSW5WCrcLqeR18Gdx75wSCSK0dZe29aRe
         HYKP5lrKlAbweiQ1wz0c4/kOtgehmqqBVgdQfOss0REJokwTNLmw/CykCJxEbWlGrBb/
         XwNe9bG5IrEawyn3qVfKgA8BZhYti4pt/PHf1WkhHS7TGaRbeZUJTNuCu8a/1Fwy9/cO
         Fl/xaYJ9FjFeAwBriCVnN9DEeyhWuqUf7jZPn641i8mflhdaurZZwvidkzf3bkmeEYIn
         7EVQ==
X-Gm-Message-State: AO0yUKXK83aihnCFiUYy+CDaOfdMbz598ULIcEWYW0Y7lpWxNstLnRcx
	eaxrFepBBWmE+4+6zOQGkW60i3RowtAUTQ==
X-Google-Smtp-Source: AK7set/TbcRtPpJohH9RkkK1g9VX24X3/quzGgy4fmRQOBZV5gM92Z6aDTJjyCQmp5v8DMa60QFJLw==
X-Received: by 2002:a17:90b:4d05:b0:233:e426:6501 with SMTP id mw5-20020a17090b4d0500b00233e4266501mr9238182pjb.19.1676591930039;
        Thu, 16 Feb 2023 15:58:50 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:f2f2:691e:e829:c393])
        by smtp.gmail.com with ESMTPSA id 6-20020a17090a174600b00230dc295651sm1729300pjm.8.2023.02.16.15.58.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 15:58:49 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] python3-typing-extensions: upgrade 4.4.0 -> 4.5.0
Date: Thu, 16 Feb 2023 15:58:31 -0800
Message-Id: <f58d76cc24c8bc61552bd18100ac127076487591.1676580166.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1676580166.git.tim.orling@konsulko.com>
References: <cover.1676580166.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 23:58:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177302

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md#release-450-february-14-2023

Release 4.5.0 (February 14, 2023)

* Runtime support for PEP 702, adding typing_extensions.deprecated. Patch
  by Jelle Zijlstra.
* Add better default value for TypeVar default parameter, PEP 696. Enables
  runtime check if None was passed as default. Patch by Marc Mueller (@cdce8p).
* The @typing_extensions.override decorator now sets the .__override__
  attribute. Patch by Steven Troxler.
* Fix get_type_hints() on cross-module inherited TypedDict in 3.9 and 3.10.
  Patch by Carl Meyer.
* Add frozen_default parameter on dataclass_transform. Patch by Erik De Bonte.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...g-extensions_4.4.0.bb => python3-typing-extensions_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.4.0.bb => python3-typing-extensions_4.5.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb
index 27ec7560ea7..80f87cae841 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.4.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.5.0.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f16b323917992e0f8a6f0071bc9913e2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "1511434bb92bf8dd198c12b1cc812e800d4181cfcb867674e0f8279cc93087aa"
+SRC_URI[sha256sum] = "5cb5f4a79139d699607b3ef622a1dedafa84e115ab0024e0d9c044a9479ca7cb"
 
 inherit pypi python_flit_core
 
-- 
2.30.2


