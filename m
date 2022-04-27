Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCD7CC433FE
	for <webhook@archiver.kernel.org>; Wed, 27 Apr 2022 08:40:26 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.5846.1651048814980691243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n8me8hun;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p18so1086291edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Apr 2022 01:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03ZTCqkAWVgMj7/UjnwvJwKQNcHFBRy2+f0ro1/N6Yk=;
        b=n8me8hun9aGKaKJ3VqS+q2e3KxWzGDpbqle/YxqYMZvJCKwhm0p/IkvCfdeW2uLZwj
         fnc+FmyfNsB787kZC4lVV1LHA41QDODuEMhwLUAbtGQARlnNh15CtAzuaPUQshH6BAGL
         hn7ywuL6khfOENnq/PNPDBWPafcMeceq5YLut0xLtY+mr4/8xJ2y7BaicaZ+JjkBG9Bv
         VDqBVAjoo55ECNgWh2Q6Mw6vYciEdGrCfHQYjZ2qMc6YQHkKqefoYSftT8y53wAHK/cw
         Mfvhurt8TwGDBip7v6WLU2rBqjsPyacX/V4o6LWcl0gcSNZFprj1iJC+3a0/6jyqpLO7
         OUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=03ZTCqkAWVgMj7/UjnwvJwKQNcHFBRy2+f0ro1/N6Yk=;
        b=xOAbMy26IiVjImqYjbNJ4ddS7nibeQM+ITpLTNCuw194NCtB9adOrqiIRcxie1xZsJ
         /hNqFeaqbkiWTusjxspBuq63k652itP2yVjTOiDsnFXGtoRIqvwdTVyq9N67iVJgc+L4
         WayAgO3Z+oE1Wr5i/+I2GFG0CdTZ8ETEQwi/LLpJm/Z4xAWfR574IlBhNufE0yGl39uH
         x20QvB3wz+azUHIVi/KI2NCqFeIOdQKLTTJlwzJTw0LRU6OpM1unvQhRZwMrOWGRNW7N
         mdVNZU3KOs1I4QMdiiz3AfzQLu2oq6uPBs1hK9njqVcP1MJhbaUB75ip9qSLnd/tVrb9
         oL6A==
X-Gm-Message-State: AOAM530sLBAlFgmt8W9Vq/+Vk5hrajVY6TyIVoyb3EgH/aXUcUXO1Mf2
	WaGKw6kz5O1Pt1eG52eaXtA95yJLJjA=
X-Google-Smtp-Source: 
 ABdhPJwXUdqj/wAgZYaRmsVq0gOOjojxtUajE89x5C5Wo3LfwWyzSwlNSqZyUGRkxziwxYFIxlnlkg==
X-Received: by 2002:a05:6402:3553:b0:423:ec56:5c with SMTP id
 f19-20020a056402355300b00423ec56005cmr29167351edd.8.1651048813396;
        Wed, 27 Apr 2022 01:40:13 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm7893024edu.51.2022.04.27.01.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 01:40:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 01/18] libxml2: update patch status
Date: Wed, 27 Apr 2022 10:39:52 +0200
Message-Id: <20220427084009.3406717-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Apr 2022 08:40:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164892

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/libxml/libxml2/runtest.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index a89dac8b75..42bb22cfd4 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -5,9 +5,11 @@ Subject: [PATCH] Add 'install-ptest' rule.
 
 Print a standard result line for each test.
 
+The patch needs a rework according to comments in the merge request.
+
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
+Upstream-Status: Inappropriate [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-- 
2.30.2


