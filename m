Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB567C27C53
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 06:16:55 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.92563.1719037008474442578
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 23:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Js1XHbIU;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42108856c33so22217335e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 23:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719037006; x=1719641806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t68O+id0zhbF6VY92I1W/FhUpf9shWYyQbPcRS6zqDc=;
        b=Js1XHbIU0agHEogcolCwrbnxbTbAzAaxGYvqGE7iOBIrWMIhwXSMX/KAKzfPEQG9BD
         XNjQ/aOM5Sg8qE6G8LWPfhv5cH4QZCpikLGsZc1gipxu5VyId0zzzX8OQhMbOatAfvSY
         Mt3XqefPZ9r4tAFUq61UazBOj/2AKJEQGdKUjuAEdvAFnYop+qpJw5hBlwmneukwlWyb
         CNukC82m8MHQoF8e/ghE/B4T09fME2qxvZ0Wu5/8vv6o754JoJbpMO3RKs3/ZDNfjVPb
         B6GM6ZELstmr2j/+O7L4cxdLucsmYfEPOZUblhS7sX1LAocYpoqFaBq8Dnnl9jqsXR16
         ETUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719037006; x=1719641806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t68O+id0zhbF6VY92I1W/FhUpf9shWYyQbPcRS6zqDc=;
        b=uCwEY8AAiJHaWrnJkTas9eDY7XDGRCZ7u2F+kGaYO44eqZoL3A0l00m35S75vLM+ox
         CaI0fL0cdTpn+/z4mCbgrw00T/R88l13bJZdE67ZoDALCA+4HTRsF01N0xnkQCNc8TGg
         pUj+Os0rvWx8ODm5kq6z2jz7qTp/1O3FyLxbSm8CRRM4oE2Moy+qxTRFR9fZVAWmX7nJ
         20kYUrhnKjtb7elIn8LuDINtv4EwxuKuUEQt9nyP8277It70Zbz1Sl5QNafsMW7R/Z+9
         i09FCYTe3w3P0TGN5xByaCdGnBPv3mI1DCX5qnf3uMavh90QyrzYWsOvF74iBp513cSg
         L6vA==
X-Gm-Message-State: AOJu0Yzf1kcxlbKQ0/Hou7t0OPGYwzheQGZFHEv2s9ozq/1fb3su1xcs
	522twr88stvcY+EKg1xu/sw65rbpMTZ9a/44fZHHjwH/4F2oU104P593LQ==
X-Google-Smtp-Source: AGHT+IHwj5L888WyCp03xvmrXCPoXyEWwT+f7FRGaT9aMdgO2+66Yzm7j74xn7+7rC64x7INTYs5sg==
X-Received: by 2002:a05:600c:1c86:b0:422:1446:378 with SMTP id 5b1f17b1804b1-424893e0083mr3407615e9.2.1719037006367;
        Fri, 21 Jun 2024 23:16:46 -0700 (PDT)
Received: from localhost.localdomain (78-20-160-86.access.telenet.be. [78.20.160.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4248191116fsm54534485e9.37.2024.06.21.23.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 23:16:45 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] python3-websockets: added python3-zipp as RDEPENDS
Date: Sat, 22 Jun 2024 08:14:38 +0200
Message-Id: <20240622061438.146352-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 06:16:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201036

Because the Python package 'zipfile' was missing.

root@qemux86-64:~# python3 clTraceback (most recent call last):
  File "/home/root/server.py", line 4, in <module>
    from websockets.server import serve
  File "/usr/lib/python3.12/site-packages/websockets/__init__.py", line 6, in <module>
    from .version import version as __version__  # noqa: F401
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/site-packages/websockets/version.py", line 3, in <module>
    import importlib.metadata
  File "/usr/lib/python3.12/importlib/metadata/__init__.py", line 8, in <module>
    import zipfile
ModuleNotFoundError: No module named 'zipfile'

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 meta/recipes-devtools/python/python3-websockets_12.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-websockets_12.0.bb b/meta/recipes-devtools/python/python3-websockets_12.0.bb
index f89c3b629e..1bebcb4ce6 100644
--- a/meta/recipes-devtools/python/python3-websockets_12.0.bb
+++ b/meta/recipes-devtools/python/python3-websockets_12.0.bb
@@ -13,4 +13,5 @@ BBCLASSEXTEND = "native nativesdk"
 RDEPENDS:${PN} = " \
     python3-asyncio \
     python3-profile \
+    python3-zipp \
 "
-- 
2.39.2


