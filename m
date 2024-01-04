Return-Path: <jermain.horsman@nedap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA1FC47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 10:29:01 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.51015.1704364133749651476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 02:28:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UaMsG9Vo;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: jhatnedap@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4283ec43d54so2259741cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704364133; x=1704968933; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LdRCaFj2iPuY5xAXTXS+AUrwTymshBZFF8LPVHDhnDc=;
        b=UaMsG9VoHgUb8W/Uda5ntSpHBxDRO4JUFkJ+L/IYn7PGwWkdowPZuqs3J+ygE05o3c
         +wJM0uZ7UmViu3dTTikAPfHHlBi0bB+EMlDGYOMIYKPgpStrKFVwSoHBom4E+oG15G1m
         Icx9OnHHA6ArkMJtRkpWaodqkxFHMQISulzL47J26TxSl83eW+QWQJcnl7ls8fhiZw0c
         a3JxeE5WcnE+jJE+vAJlF13i3ZElK93AjLkq/7oUkqEMF3EANSaxHgtE8plJr1Nod/iz
         TMWdvlpS2QmQaTncXE+7cQp/f+eUsnqb/nRjBuv+A4Vc5Njf0LKA2zTTk9z6TEGlzXxi
         MyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704364133; x=1704968933;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdRCaFj2iPuY5xAXTXS+AUrwTymshBZFF8LPVHDhnDc=;
        b=bs56LI5nTqoKeqz9xLaxnICyIccuMuic4dGML+UMT+SRETDkw+UUdBkSxFI71OKbem
         ADnEXG5PybTsVU3SsEOnlri1gE3yVoFf7au4T8HNY6Rnb9MULNUBy4yhOFcgAOo2AhdS
         PLlIKCYni8gnZpiHAwfLFXHGs/DkT7c9tbv7DJw6taEFgrK2DCggMgqJ6fPARBIRhk8u
         DhzpyqDoiE7P/+2IRkYr9QXLmGK4irYYvVPbvUQiyBJura/npBBI+fy7HeBut+Fyrs2f
         X2FbruJdUXz0g5KSWhKs1qQvMPbbXpSNdXyEiKdwbPNvy047VBh7v7JiO8p/l3gzMhcU
         Ol6w==
X-Gm-Message-State: AOJu0YwIg/TGkpF+gAJNq9E11RFYGeIAwtHJam0LSLWhVbtWz/lJN+UC
	RVIuX4xy2kcdE4ce3e6PB3nu0cZxaGU=
X-Google-Smtp-Source: AGHT+IErMeSjmSywBcAAh47MrKn3zC0wAkhVG/Vih3av29n/XtH36cb0Jc2vhJeIysxrMA9Hr8/CWg==
X-Received: by 2002:ac8:7d92:0:b0:428:13d9:9217 with SMTP id c18-20020ac87d92000000b0042813d99217mr539981qtd.80.1704364132848;
        Thu, 04 Jan 2024 02:28:52 -0800 (PST)
Received: from NVC4181.nedap.local ([149.3.168.10])
        by smtp.gmail.com with ESMTPSA id fa15-20020a05622a4ccf00b004280cad48basm5923316qtb.77.2024.01.04.02.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 02:28:52 -0800 (PST)
From: jhatnedap@gmail.com
X-Google-Original-From: jermain.horsman@nedap.com
To: openembedded-core@lists.openembedded.org
Cc: Jermain Horsman <jermain.horsman@nedap.com>
Subject: [PATCH 1/2] lib/bblayers/makesetup.py: Remove unused imports
Date: Thu,  4 Jan 2024 11:28:26 +0100
Message-ID: <20240104102827.782-1-jermain.horsman@nedap.com>
X-Mailer: git-send-email 2.42.0.windows.2
Reply-To: jermain.horsman@nedap.com
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193314

From: Jermain Horsman <jermain.horsman@nedap.com>

Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
---
 meta/lib/bblayers/makesetup.py | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/lib/bblayers/makesetup.py b/meta/lib/bblayers/makesetup.py
index 5fb6f1469e..4f27c565ee 100644
--- a/meta/lib/bblayers/makesetup.py
+++ b/meta/lib/bblayers/makesetup.py
@@ -6,9 +6,7 @@
 
 import logging
 import os
-import stat
 import sys
-import shutil
 
 import bb.utils
 import bb.process
-- 
2.42.0.windows.2


