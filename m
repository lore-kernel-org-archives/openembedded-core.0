Return-Path: <samuli.piippo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B144E8783B
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 14:34:46 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17768.1770129279938126653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 06:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPX9ogNO;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59dd7bfeb8aso6313582e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 06:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770129278; x=1770734078; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4DvQRRFqKY8Cd/hXypDWGO/O3iY3yGxteWzsd/ls878=;
        b=EPX9ogNO9Ssi4iGo1YwYIQq8bILujjzdSK3TltO7K0Ply0ybwApcQr77fHPje2ju8k
         9XA9FQwCZ5X+Aj9vyTFgvhilRz6tcff5Cl8MrFkAPolk657cbvNZSevmjyvLtTE4RnmD
         xahm33yapR/NwLCXGvuk1d6JL8IbquToJSeg/VcKWjxx57Bx0w/qY3PAfspzFrciYMOY
         S5EIJMIDLhsRO2aZd7n4QUGJHSrGTSZAaqIwzlaKIMdPgSrmymxwau1nSQB4SnDhoKh1
         2KKj89DdGVz95GIsg+UkqRmllA01ZMGOylPFaCEKGL2XEUL3IJBH6nbVjRBTcKucEN0e
         USAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770129278; x=1770734078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4DvQRRFqKY8Cd/hXypDWGO/O3iY3yGxteWzsd/ls878=;
        b=Ay/UgQnQfrsVTqn4ybExrkOcpHMpLxZK6YwFrIEtsviJcuN0PkIV5FJka7mdVQsYpq
         c8Gk3vrvV1F7oPxv8gG2iHSgwC+Wc841vOayPeZtMfW1Jk09ljINs8h+tHEdzNe89Z5J
         BEKnTeUEol8Mnj6r32JXBQsb/iAOtYTnn23DrgpIMucL6it6HYRC9aT1Iwxj+BXqbaus
         s0Oz+p8UgOiaNX5/RMAg6Ot3p8kNZPS9+Kw/JRrWSsZ3ghn69We2kMRjppIM5lIUzptI
         lQ5qYy4EM+dLtXBfajQR5t52e2Fx9TzsPKy6UeS5xT0jC6OLkYeoWBortfOB1mPR9wFB
         elhA==
X-Gm-Message-State: AOJu0YxpILjzEvqrz4F9XNvY5LV9vdhQBbO49Oowoiqx0gCj3vDf+gZ9
	N2QDOjH1uvmhfqyOOjqyE6iLP9CBTBz8/YpmSgzRDJ0ZAMKxG0LEUtakYXYThw==
X-Gm-Gg: AZuq6aKom0JbQYJon9o1QMSvu6VGM04nDCwohiaKPwQ9bqaxPGUVvWUb/P9DgcurzAo
	OVH2d0ZQsgCqanGKXllogdnAGTivBHxvgEk6kwwIGr391VNnFHEI/juhuRx8EkFyn4G7UT47UT7
	I985MV7lUvsMhMK0/o7p4aeOhLTcbWxEBhFocKscLoz9VG7KrPGjkDroaNiH2ZTSTHromdtNtnM
	gLRiQalV/9wvoT1Zaz2fnslNEqj+G2NHNXo7K/6sg1Cj+H7o9g63jJ4xr5z6+iUs+H49/8SN0lr
	gbsTfKb4KO3UzmdQ96NuCC7Zdw+uuE6Adto6vniKZMQyW15rKpCkCkRgaPVgOfdPVxH1DSXwv1l
	IGPDxsNS+0VpC5vmqUEq7fvLFrl29hnDVUudXbyP+o8GKsgQ0uOIyVyydpX1bJTL/RRPfU681M6
	auecOQLMGRxY+qGGBt6n7+j4j8JcBcObwOUq6ve991Jp9FA1Ss4aOp6xWi0a8p8Jcy+ofikAi9D
	g==
X-Received: by 2002:a05:6512:23a5:b0:59e:2242:fb9 with SMTP id 2adb3069b0e04-59e2242114fmr3863808e87.16.1770129277419;
        Tue, 03 Feb 2026 06:34:37 -0800 (PST)
Received: from dcbuildsrv.ci.qt.io (ip-109-75-238-172.customer.as29154.net. [109.75.238.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e08b2fa5bsm4052911e87.26.2026.02.03.06.34.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 06:34:37 -0800 (PST)
From: Samuli Piippo <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oe/utils: filter license packages
Date: Tue,  3 Feb 2026 14:34:34 +0000
Message-ID: <20260203143434.3117764-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 14:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230459

Make packages_filter_out_system() filter out also the
license (-lic) packages.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/lib/oe/utils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 0128ee411d..2b39d4e0dd 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -236,7 +236,7 @@ def packages_filter_out_system(d):
     PN-dbg PN-doc PN-locale-eb-gb removed.
     """
     pn = d.getVar('PN')
-    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src')]
+    pkgfilter = [pn + suffix for suffix in ('', '-dbg', '-dev', '-doc', '-locale', '-staticdev', '-src', '-lic')]
     localepkg = pn + "-locale-"
     pkgs = []
 
-- 
2.43.0


