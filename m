Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D34CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 07:37:08 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.22404.1697701019315012062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 00:36:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ln10J2/L;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso12247835e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 00:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697701017; x=1698305817; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZKSAkB8AXb+krDxx6iPZFIE4+JVtHFgnD7HuH9JG14=;
        b=Ln10J2/LRZWafcI30ox2K6NorWvHUAEgoufw4Las5VqvbGysKrUzfCSKNtTkae/7XU
         d7XkHzdaVpTJJ7qCOuOZHXqUw0L7azbm98DxAryCNm6N0wEDSgC4wFeTa8l3QH2CW5xh
         dn4rMlU9ZeWCjXM7O1yyPjcVc01gf6w3wSAMTMEfO+26Z1GEUydUTeOdikQnLGJ5rNrV
         eRI0ByTUfeyv8f88ZZeFtziJ/kZw9qFVk3pb7uPYU3dR11sO1b+ttjbpIQwZYRV8O98g
         Y/E6VzSsIOKtIquGRJ6VwnoW6/m8mCqVeZpF7prNKTE/tYjAmbHrLLK/Avm7/eAb8MIj
         Wajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701017; x=1698305817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZKSAkB8AXb+krDxx6iPZFIE4+JVtHFgnD7HuH9JG14=;
        b=tFJUQMoYzfTrkYLKM/UH/6phYkbYLpsMT0bEyFDgEN6LAItjLHLe42xh7aePU7mF6q
         bDYFAJm42I+zVW7h+Chq8prwmsPb+iyWRqeBz8aQAWh0l7Y7gMuVL3bESCUIL7M31Jw8
         723huq8bql2ijF4uJbT3jAMOjZtjOnU+yLPPiEOzvtor7CDK/w0gk1O1xDE3ogUsUYwu
         y36aDpnUtCHPBpf6s40LpEtlbv9Vd0iq9loA6hqWcIkNNVzwTidAtNzZlDZrWHZsQ5J+
         VCWST9J0Vu8LLdV93jpeNsFMG4xiAQO5ITbtUaud+NrcQ9WghFDfMxIEpVIA0kzJcsFX
         ZsFQ==
X-Gm-Message-State: AOJu0YwA04uIsNT3I2CVvZs9QWJ/ziKziilLe8hzGGPcgYxHzy9yYnI9
	/mseWG6kTIHCzOxtQ6qs2ZXeRS4oivPy3+kiMT+w5g==
X-Google-Smtp-Source: AGHT+IGw/Hgu7Bo+OyH55Vgr7aM9APmNXdDLwuyzlkzQ8tUfKxdR+swHYP9ElQfHh9ClJK1vq3wJ1g==
X-Received: by 2002:a5d:660b:0:b0:32d:88dc:b219 with SMTP id n11-20020a5d660b000000b0032d88dcb219mr723468wru.45.1697701017035;
        Thu, 19 Oct 2023 00:36:57 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b0032d9efeccd8sm3809219wrw.51.2023.10.19.00.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 00:36:56 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v2 1/4] scripts:recipetool:create_buildsys_python: fix license note
Date: Thu, 19 Oct 2023 09:36:50 +0200
Message-ID: <20231019073653.1280730-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 07:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189429

License field of setup is not always standardized, so we usually use the
classifier to determine the correct license format to use in the recipe.

A warning note is added above the LICENSE field of the create recipe
in case a license is provided in setup. But when the plugin is called,
"LICENSE =" is not yet present so we can never display this note.
Replace the "LICENSE =" condition with "##LICENSE_PLACEHOLDER##"
to actually be able to display the note message

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 92468b22546..321d0ba257d 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -254,7 +254,7 @@ class PythonRecipeHandler(RecipeHandler):
 
         if license_str:
             for i, line in enumerate(lines_before):
-                if line.startswith('LICENSE = '):
+                if line.startswith('##LICENSE_PLACEHOLDER##'):
                     lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
                     break
 
-- 
2.42.0


