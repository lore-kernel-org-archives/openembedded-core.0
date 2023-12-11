Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F907C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 15:49:04 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.11741.1702309739624374638
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 07:49:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Ab95P+VL;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: jstephan@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c339d2b88so32476375e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 07:48:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702309737; x=1702914537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlNEftWYBX3nxE5H+4ULbe6Dsv5yCtsqFrOvERG+G5k=;
        b=Ab95P+VLcz6+kKuEsXXkmvSjcEvCn7xMap5rbuKOYmAbEF9zgM0lZ72OOdYajZYmsJ
         ad4ZZAnZN7zRBoIUOqMipLBn1TA8nYJ/FN3GHcRYiI5t5CUB1mOOcd73JdezB+sX8abk
         2L93L/PrsQ0J6sONVTm69hmOtyDcS1nXshwHXhBZxTYIZgVbp7+9k1czHNMjuQOSoFpp
         hDp8EQPwEAH0zAeRFEnCR4RQc1DQSaym/4amKHrR96j01NCQh2JT0FnQi0b7L3MRVXCG
         VEZUawB43iSRG6zwXzoq514lV0j/aVtISVhkeHX0umiS5sUbKoRFrlRI/uEWb44YfRpD
         4o8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702309737; x=1702914537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dlNEftWYBX3nxE5H+4ULbe6Dsv5yCtsqFrOvERG+G5k=;
        b=b9r68CobB/WlRM1zLlkrlNF8BZIYX7/tSwY36+Laa7LMHBmabUbwE+MYZ80nYM4KFo
         y9zYs67oI0oL/IRiQ2DPoDPyOC9e9fJUuRopFUqu3lxbsSMTsQU9ZFrch7b1Togf0isC
         oFsKmtooDy1RKoQ3lpiJozadUu5mftIxoOfPUGOCgGaVMCRlF1Lc5YgV+A736NGjXfYL
         qK05AYMDLOvGj7k6MxzJeqloCR5PXFDSq2aV4iu7GWhBHmTJXuk63SWsrnpH3cG6d0+B
         W220AdYEIrIlQedIrrgpILavFnLXI4ruCYvxtfjP5NxnlVNchih6y498SvEu3aGJrT7m
         nJ7Q==
X-Gm-Message-State: AOJu0Yw/MTVecUjLouJ63Y+DHvdV7klPRTojI4Z51e1tlv4/hIdBWx2I
	K5SGXmiPUkIAMWouSRDHVgbDCwDOnQ4e6dDUa+l3hQ==
X-Google-Smtp-Source: AGHT+IHsm7A+ewjE2qPZuaVysNLJJ6nkC/vrn8eElEcTAxZTCS0kMqDA+6XuMqp4Ifu5xd2dHRhNLQ==
X-Received: by 2002:a05:600c:4f05:b0:40c:f7d:27b2 with SMTP id l5-20020a05600c4f0500b0040c0f7d27b2mr2450463wmq.2.1702309736997;
        Mon, 11 Dec 2023 07:48:56 -0800 (PST)
Received: from jstephan-bl.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b0040c440f9393sm5721744wmq.42.2023.12.11.07.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 07:48:56 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Julien Stephan <jstephan@baylibre.com>
Subject: [OE-core][PATCH] oeqa/selftest/recipetool: remove left over from development
Date: Mon, 11 Dec 2023 16:48:49 +0100
Message-ID: <20231211154849.2535729-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 15:49:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192176

Remove leftover code needed for development that was unintentionally
committed

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/recipetool.py | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/recipetool.py b/meta/lib/oeqa/selftest/cases/recipetool.py
index d10d61bc5b0..c7f7a066f3a 100644
--- a/meta/lib/oeqa/selftest/cases/recipetool.py
+++ b/meta/lib/oeqa/selftest/cases/recipetool.py
@@ -1265,12 +1265,10 @@ class RecipetoolAppendsrcTests(RecipetoolAppendsrcBase):
         result = runCmd('bitbake-layers show-layers')
         layerrecipe = None
         for line in result.output.splitlines()[3:]:
-            with open("/tmp/juju.txt", "a") as file:
-                layer = line.split()[1]
-                print(layer, file=file)
-                if layer in recipefile:
-                    layerrecipe = layer
-                    break
+            layer = line.split()[1]
+            if layer in recipefile:
+                layerrecipe = layer
+                break
         self.assertTrue(layerrecipe, 'Unable to find the layer containing %s' % testrecipe)
         cmd = 'recipetool appendsrcfile -u %s %s %s' % (layerrecipe, testrecipe, self.testfile)
         result = runCmd(cmd)
-- 
2.43.0


