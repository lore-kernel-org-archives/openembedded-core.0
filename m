Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF6F1C43217
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 14:18:31 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web09.16786.1667744293403046839
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 06:18:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZolWBbXc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id p12so3426126plq.4
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 06:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtgGro8FSHcc1U12BVQ7nmBGyNlbjasgl7jJZaI2S6I=;
        b=ZolWBbXcFYD+U/1xASJ/JEisZZaO3xg1HTMTY96ZG8IdIovc8Gp4RXDfAvy7t+vdeL
         NylGaeuOMcy7Z9biVnRVR1jbIkduqkW+X3N9t13fD7k1RD2OYlAp27ETv/YMeD6AacV9
         RAM+R59T2JwCesIkbGXzHtyZeUFxSGmqSZhV4jdcMnkCyAcyeST5Vv1PAzFUOVUUwz6c
         xHNNilo9GUMUGsHk8jq6ZPQw4F5qkjqu0XFhqYAgKF6JmiNyH7+UQc/deaDywJY3ncnK
         ++CqbiUpL+I542Xs6bpMjTnDw1LfM+me7ao4Tlc9O3Cr0BxHDBS63afaYHfmA3XGyzT9
         zAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XtgGro8FSHcc1U12BVQ7nmBGyNlbjasgl7jJZaI2S6I=;
        b=OYhABsl9AmjjOd7jfMDYlbq7fMyoaKITZAOwcs+jteCjndby2PZ0zVwyEVTkc/bHtz
         oAYxCwuQF4ytMib4zfqI5hbvZeTBNisCAuvW1GGdph1XAvVoL6WggwSjyavQdgNu3I4Q
         4mX5epw+pTEnIFfRrHLn35QXCKATG/tfP2/V2W/lnDNFYS6xasckVB5K8sN8pU3r2AEd
         xXklZnZiktzmZTozpP8I08L17OtZfnIdqzSjFPJS1q0PVxQVfZ893TwRRopND5Y3P5jG
         18d0e0RenKyxbVp3XLGXOLRHhRnjlyu0n5L20IkRRBsSkayyflDG5mz6YbsHaC/V2+XZ
         gIFA==
X-Gm-Message-State: ANoB5plzjxsJadW4ULhKrXcrK37BTgLbdrXOaf0Pm1K4aC5793KyNXdn
	OHgF3niWlX2glgrZP1KcuwAJRaIpojDhufuY
X-Google-Smtp-Source: AA0mqf5KYcv1cJT7RSHgnDKckrCCI6E3NkjgrPp9ZWlzruMVGovNIzexdbmspJvSDN+frTxhb7h95w==
X-Received: by 2002:a17:903:110f:b0:188:7e30:b9b3 with SMTP id n15-20020a170903110f00b001887e30b9b3mr1810067plh.50.1667744302338;
        Sun, 06 Nov 2022 06:18:22 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id a3-20020a170902710300b0017534ffd491sm3224907pll.163.2022.11.06.06.18.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Nov 2022 06:18:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 26/34] externalsrc.bbclass: Remove a trailing slash from ${B}
Date: Sun,  6 Nov 2022 04:17:09 -1000
Message-Id: <c7e94e74eceef0b22d09d80d0da6ddcd86d9b12e.1667744095.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667744095.git.steve@sakoman.com>
References: <cover.1667744095.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 14:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172794

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
match as intended, resulting in ${TMPDIR} ending up in files in
${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
QA warnings.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 9b5031ed5a0d102905fa75acc418246c23df6eef)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/externalsrc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
index 5905342589..75fb91bcb0 100644
--- a/meta/classes/externalsrc.bbclass
+++ b/meta/classes/externalsrc.bbclass
@@ -61,7 +61,7 @@ python () {
         if externalsrcbuild:
             d.setVar('B', externalsrcbuild)
         else:
-            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
+            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
 
         local_srcuri = []
         fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
-- 
2.25.1


