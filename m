Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63DAC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:10:04 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web08.1802.1645114203725352003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NMjkzG0A;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id p15so8415327ejc.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h1vuO4jsR95e30u5Cop4RAY/ZIwAKZDzLzfq8MOFqUc=;
        b=NMjkzG0AmVeOD/pbj1EnTp/AKqvOveRVkHg40uLfwtFDdNPX+KxoQM+ScEZ3vdowrY
         yRbC67XxqF3HHx8C45SEwG1q8H0Gb1BglV2UCE0HvKTs2DCA73IIIx5jjYSfdSSWgRHn
         eJPf9+LNtbHcde1jwaWSWtW36vzqEUtvc0mLCFnYTwD/09nTnF9q+C8BBYD9rFmqLtmT
         bGV0SiQ9xPbSXfPmyvIsi33PnWUEl3MuoHHKiV2fYyzt1nq6p7LKLrHk18wM+ZMxuU0D
         LIn/ur2+RMTmP8fSTVtz7nof7ePkINusURaFgW34+vB0DniUPki6IwemLS55IrOdMvm8
         nPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h1vuO4jsR95e30u5Cop4RAY/ZIwAKZDzLzfq8MOFqUc=;
        b=dsAr6CK3WoTCVrQ52TuCKFnmi9InSLcj9Izj0Ag3lfYw2S61MhZNeRg8YZOrrBj/Vv
         s7IvZ1aTMq1J3cmYoqdjRvfYHUdQe8+yuKQwmkDMNFP8Z6bO9QeCmlaX3xZvHUluJB8Q
         j9rKBuqksRBaAWOmwKRnsjRMdFjTYth4u571jL6VRCWB6petL0ajAKQ++UagN7Ahb1S1
         HBwzTiijJq6OcIuWd/HRSTt95fwOHmHn/+XEtHXLye6+mcSicUTM7HEZVqZBA3i6wSK8
         FTyOxAzuoSM2Dx0Tg9kvTWQ8DlPLTyIb53h2+lU6idLWWVk+DeOmffTPt8qcUjjCdV6d
         35tA==
X-Gm-Message-State: AOAM5321NDYhlx/OgVdSTcDWeycAAK0SZr7nBi5934iUw+vDMdGNtcZO
	869K4/4vrBKDJXgx25u7FHN0dbLNORI=
X-Google-Smtp-Source: 
 ABdhPJyt06WKICZT6h1Undl8sWOOTiVHoa5c/rILbUcnPPxXZ++8s4Pc59F2f0U9ODUIzGllBizH4Q==
X-Received: by 2002:a17:906:3a55:b0:6ce:c2ee:3e10 with SMTP id
 a21-20020a1709063a5500b006cec2ee3e10mr2863790ejf.210.1645114201937;
        Thu, 17 Feb 2022 08:10:01 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:10:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/28] util-linux: upgrade 2.37.3 -> 2.37.4
Date: Thu, 17 Feb 2022 17:09:24 +0100
Message-Id: <20220217160939.1424397-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:10:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161830

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...til-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.37.3.bb => util-linux-libuuid_2.37.4.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.37.3.bb => util-linux_2.37.4.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 0309332722..c48f9572f5 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -37,4 +37,4 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://avoid_parallel_tests.patch \
            "
 
-SRC_URI[sha256sum] = "590c592e58cd6bf38519cb467af05ce6a1ab18040e3e3418f24bcfb2f55f9776"
+SRC_URI[sha256sum] = "634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83"
diff --git a/meta/recipes-core/util-linux/util-linux_2.37.3.bb b/meta/recipes-core/util-linux/util-linux_2.37.4.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.37.3.bb
rename to meta/recipes-core/util-linux/util-linux_2.37.4.bb
-- 
2.20.1


