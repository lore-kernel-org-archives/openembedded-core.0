Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EE9BC27C75
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 19:12:14 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.2599.1718133128829064275
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 12:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FbPOAYcc;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f47f07acd3so55086125ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 12:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718133128; x=1718737928; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06e016MhMW6vRJFe4wmA60pKLOomxsG/g0zthKzlBuA=;
        b=FbPOAYccfvtwG6zAV+JV9KRPKCR+qNuaEnhBp9Ww8W/PS0K1b1Pacscz72Ldr6XEbW
         D9OD2j8ZCHwh3aIhEjSpiKwAJpphWBpUwbfrlUuIhNckMVh4gS3WnrXxDtC+aGsuX0RY
         HcMF+JrL9fP4JDrt9ka9ReM2Ni/YmJAFVVf/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718133128; x=1718737928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=06e016MhMW6vRJFe4wmA60pKLOomxsG/g0zthKzlBuA=;
        b=xT9wSYUQ8AzHn3v05x4OO1U1dz58XBkbaVBD4Dwe+n72/GUfHel2BBsTUUP7XBXkvc
         kxTaA54o4xLnOUhpn/Nq8SkHb8me8IgZ8oBy8S1qBH/L3G8Yp8K2eDAQ3soGDqq5mPZX
         FxikOe9F60UbA642rAOiF/y9H48zCGjVff2ZBBnHwsdmHZj1ExSZ0j5yPa6yT241wd63
         5+1qCbLZ3MbHdSJ5qROUMkwFOH75W3SA9jTIBOS/OKDVtPKSjdVv7dPmW4baIQEF9mub
         ZwGntDHMpWetOpcmTrQTISt+MUDpAFTE1ZySOquMtpU67xvPmq66d8nF3f6t6dw4OJqf
         7HyQ==
X-Gm-Message-State: AOJu0YwHOldwW5bCaVNueNnWhN0QNmr96oD/hlmqSffdp6yQBqxdpktH
	xsTr1dOxeCyH+qplzybXWgSFPUHXEXHYm4aAhsgv0x5SIf7YEORcMdr1ieuEYV36EaW9TqQ9K55
	j70w=
X-Google-Smtp-Source: AGHT+IEUXLPPRVc+3kAfGk+a/6t5jhqjr3XV4hA4RWcYxeauwDToMxvVeufjoeeEonyW9BXeg3AujQ==
X-Received: by 2002:a17:902:d487:b0:1f6:ea71:34ee with SMTP id d9443c01a7336-1f6ea713848mr132870685ad.16.1718133127395;
        Tue, 11 Jun 2024 12:12:07 -0700 (PDT)
Received: from localhost ([2601:1c2:c182:4da0::2bc4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6ecd79090sm73304055ad.302.2024.06.11.12.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 12:12:06 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-typing-extensions: upgrade 4.11.0 -> 4.12.2
Date: Tue, 11 Jun 2024 12:11:58 -0700
Message-ID: <20240611191157.3077086-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jun 2024 19:12:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200549

From: Tim Orling <tim.orling@konsulko.com>

https://github.com/python/typing_extensions/blob/main/CHANGELOG.md

Release 4.12.2 (June 7, 2024)
  * Add typing_extensions.get_annotations, a backport of
    inspect.get_annotations that adds features specified by PEP 649. Patch
    by Jelle Zijlstra.
  * Fix regression in v4.12.0 where specialization of certain generics with
    an overridden __eq__ method would raise errors. Patch by Jelle Zijlstra.
  * Fix tests so they pass on 3.13.0b2

Release 4.12.1 (June 1, 2024)
  * Preliminary changes for compatibility with the draft implementation of
    PEP 649 in Python 3.14. Patch by Jelle Zijlstra.
  * Fix regression in v4.12.0 where nested Annotated types would cause
    TypeError to be raised if the nested Annotated type had unhashable
    metadata. Patch by Alex Waygood.

Release 4.12.0 (May 23, 2024)
  * This release is mostly the same as 4.12.0rc1 but fixes one more
    longstanding bug.
  * Fix incorrect behaviour of typing_extensions.ParamSpec on Python 3.8
    and 3.9 that meant that isinstance(typing_extensions.ParamSpec("P"),
    typing.TypeVar) would have a different result in some situations
	depending on whether or not a profiling function had been set using
	sys.setprofile. Patch by Alex Waygood.

https://github.com/python/typing_extensions/compare/4.11.0...4.12.2

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...extensions_4.11.0.bb => python3-typing-extensions_4.12.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-typing-extensions_4.11.0.bb => python3-typing-extensions_4.12.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
rename to meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
index ad45b669ecd..8f0755473e1 100644
--- a/meta/recipes-devtools/python/python3-typing-extensions_4.11.0.bb
+++ b/meta/recipes-devtools/python/python3-typing-extensions_4.12.2.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=fcf6b249c2641540219a727f35d8d2c2"
 # The name on PyPi is slightly different.
 PYPI_PACKAGE = "typing_extensions"
 
-SRC_URI[sha256sum] = "83f085bd5ca59c80295fc2a82ab5dac679cbe02b9f33f7d83af68e241bea51b0"
+SRC_URI[sha256sum] = "1a7ead55c7e559dd4dee8856e3a88b41225abfe1ce8df57b7c13915fe121ffb8"
 
 inherit pypi python_flit_core
 
-- 
2.45.2


