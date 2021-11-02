Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74EC9C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:08 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.6612.1635842587281065477
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gXxBfsDy;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id d27so14050847wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JRbvod4hq2D/bvnFurHSaQLCaKOHACART9XXrdYLtp8=;
        b=gXxBfsDytucR2wH8QzPS7xvLwX3Ov1y0nPSgLdjMVOGz6lYTvJbBxFIiI4Je+tav8D
         egGtBrR6jMW8E1uHyFX5unkLnuaw4sCcHjATWDjDNsrLe/fIkXFt9eSSw307erTVTAcp
         U2ozgYER0w66IDezSc5/BqT5lo2M8KiWIHinG/Uxkige0lpT8P9BXxVRYw/hHJQrwDPY
         SfATG9pLaB3cPzPo9J0EwvcQNqNLuaMOxn3ettMdETrm24aFedzw9V0TFnDbg4z1D6c4
         ObHA4fr2BdJUA71RBlsls89Oly0SJKBDxQoLYIe9DzNNGz6RBuTAQvpmgcT5V+lLdjlx
         4eLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JRbvod4hq2D/bvnFurHSaQLCaKOHACART9XXrdYLtp8=;
        b=FPUZbuM7vibO0WVUcz/VGhZuGR5oSamDy312+N0qys9bJs9pMqjpDXXeCjiVlptteM
         ldIUOqwZqtdkvXOKJadEpxYZOfhI7fDzDFCPgqd3DfbfB7YMyrXaLcalIvPYsE3ePR63
         7XcsI8aLmCejwntQpuWeYyiOyBgmA5JGrHtg03XumtPup/cnZoJlxiqTO7nxBr+16SET
         7wLlReoxgNO+I1M/MKTCg+z0x5nO15ws+wkMKtslMAAFUcrnz3xLcVoBLlbCp961RS8D
         k/sDhmwlFYDbw4J0Zhbk/nCVMX08aOr2lbEGEgZ87bUmRo/zNjz1ractYAXOr7Ls3N58
         firA==
X-Gm-Message-State: AOAM532igaEzGBBaLcIRlbHOkaWalRc23NwpbQhB7Dv8hKxP0GqC9Jol
	SN/1CZFjfQvLcUgjE12sUsnpMU0/VQw=
X-Google-Smtp-Source: 
 ABdhPJx7AmM0/1M9zRxaFJ+YzGQ5vUh+u2XoYXBOrMVEkOaDX4mcFPM7s3FJkvFXd65AZHmOBF9cBw==
X-Received: by 2002:adf:d1e6:: with SMTP id g6mr46378101wrd.33.1635842585929;
        Tue, 02 Nov 2021 01:43:05 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/33] libxml2: submit patch upstream
Date: Tue,  2 Nov 2021 09:42:32 +0100
Message-Id: <20211102084303.2974802-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157740

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-core/libxml/libxml2/runtest.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/libxml/libxml2/runtest.patch b/meta/recipes-core/libxml/libxml2/runtest.patch
index c7a90cd3dc..a89dac8b75 100644
--- a/meta/recipes-core/libxml/libxml2/runtest.patch
+++ b/meta/recipes-core/libxml/libxml2/runtest.patch
@@ -7,7 +7,7 @@ Print a standard result line for each test.
 
 Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libxml2/-/merge_requests/137]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-- 
2.20.1


