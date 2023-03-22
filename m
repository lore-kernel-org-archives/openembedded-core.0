Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBACDC74A5B
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 20:46:25 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web11.55754.1679517975858676261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 13:46:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eTkMsfdn;
 spf=pass (domain: gmail.com, ip: 209.85.210.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f50.google.com with SMTP id 14-20020a9d010e000000b0069f1287f557so6719881otu.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679517974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SOAfC5+gQNjZ0LaADnggghnPj2LYuu74mCisMzXJBZI=;
        b=eTkMsfdnyozji9RPfSdJ+BFms52Mss5UrlT+KMQy8h2fx50bgJKjtB1PUXLPR1je1w
         PyRlEN31rbDSg6MNXRj4yiZDRgk+BslELiwgjqYhBRd56LmXY2BlXx3C7CDyB6z0xy+x
         xwMGo71HMpiVsRvuH8HTuzdsroPGt8+ee3MzYFVpEH344l2tYeM9sAC++BW1Es3/81Vc
         iKNqNKLMi0CdP4O8Q1Ang2WcUWCvqGm25nMsvuHyhca8T3Le0uY645PSMTROrjuHj0Mx
         OvsUgwApkJzzRc0TVgBdQTk7gWtxJevtO+UOswv4dw88MvrQ1bY1X+w/M0RFyzw27cSD
         5R3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679517974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SOAfC5+gQNjZ0LaADnggghnPj2LYuu74mCisMzXJBZI=;
        b=Cyo8ZsnyOTbeku9BKNb0pAE4MFAVwmHQ29/1g0tD5kC3xnEUpX8OUGZC2o2dK8rhsU
         AqoSrzggn6pMoyZM+K4KzeEa/fX7Ri2vMcISEunkj4cLwEzankuIe/4jcfxoYSekbxLz
         LCt4+pYHto33VKSXJg9Ubss5iB3Fzb3fzAWd5MtNgzTm+lVTMtf/aG6ENtEYSwbIgM/A
         C4n4WwuDdvW1Da21MxCHf148ymm7I6/vLtVyCtVJMA/JsADuf185qbDn3c8t/1m6cquq
         4aNgS+PnN+/XoLvIccxhZKMMNBLqT+0Liky8cyTrH37LQy+u+ROTW+xWl6djOQGK6Bm1
         4nYA==
X-Gm-Message-State: AO0yUKWguEULeaiYZDuFo79FblOyUcWhHV1mc9sso56aoc/wdLbRRlVk
	C6qyHPCuTatdDtvMJY1SYAIkhLKxen8=
X-Google-Smtp-Source: AK7set+K9axvUJ1dQXQij6dtCJd7iCGkoCO2GdPECdytJ/1f7FHE8EIgpszvnefRpDaHl5nhlJ0xzw==
X-Received: by 2002:a9d:7391:0:b0:68d:bd4d:f4b7 with SMTP id j17-20020a9d7391000000b0068dbd4df4b7mr2138730otk.21.1679517974624;
        Wed, 22 Mar 2023 13:46:14 -0700 (PDT)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id y21-20020a0568301d9500b0069f87d2ae09sm2288561oti.54.2023.03.22.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 13:46:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][dunfell][PATCH 3/5] licenses: Add GPL+ licenses to map
Date: Wed, 22 Mar 2023 15:45:56 -0500
Message-Id: <20230322204558.1386634-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230322204558.1386634-1-JPEWhacker@gmail.com>
References: <20230322204558.1386634-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 20:46:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178959

Adds some missing licenses mappings related to the "+" versions of the
GPL licenses

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/conf/licenses.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 0149b1dc44..d14c365977 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -22,21 +22,28 @@ SPDXLICENSEMAP[GPLv1.0] = "GPL-1.0"
 SPDXLICENSEMAP[GPL-1.0-only] = "GPL-1.0"
 SPDXLICENSEMAP[GPL-2] = "GPL-2.0"
 SPDXLICENSEMAP[GPLv2] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2+] = "GPL-2.0+"
 SPDXLICENSEMAP[GPLv2.0] = "GPL-2.0"
+SPDXLICENSEMAP[GPLv2.0+] = "GPL-2.0+"
 SPDXLICENSEMAP[GPL-2.0-only] = "GPL-2.0"
 SPDXLICENSEMAP[GPL-3] = "GPL-3.0"
 SPDXLICENSEMAP[GPLv3] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3+] = "GPL-3.0+"
 SPDXLICENSEMAP[GPLv3.0] = "GPL-3.0"
+SPDXLICENSEMAP[GPLv3.0+] = "GPL-3.0+"
 SPDXLICENSEMAP[GPL-3.0-only] = "GPL-3.0"
 
 #LGPL variations
 SPDXLICENSEMAP[LGPLv2] = "LGPL-2.0"
+SPDXLICENSEMAP[LGPLv2+] = "LGPL-2.0+"
 SPDXLICENSEMAP[LGPLv2.0] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL-2.0-only] = "LGPL-2.0"
 SPDXLICENSEMAP[LGPL2.1] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv2.1] = "LGPL-2.1"
+SPDXLICENSEMAP[LGPLv2.1+] = "LGPL-2.1+"
 SPDXLICENSEMAP[LGPL-2.1-only] = "LGPL-2.1"
 SPDXLICENSEMAP[LGPLv3] = "LGPL-3.0"
+SPDXLICENSEMAP[LGPLv3+] = "LGPL-3.0+"
 SPDXLICENSEMAP[LGPL-3.0-only] = "LGPL-3.0"
 
 #MPL variations
-- 
2.33.0


