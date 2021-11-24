Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B0BC433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:34 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.3350.1637741313303168363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJxphqdS;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id a18so2598976wrn.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ul/FfYX1stGw7Rsa0fZ8HtaEMQc3oNR8J84dfMSgOvU=;
        b=UJxphqdSGjUnH243JTJ57g/7/IZ2UhUubRCk9OSia/0qfixH4XbKkLRSn1NkQ/cyj5
         6ln+KgQ0MOuA/3mu7iLvgpQ91IRyImfM296DTsDDsA7OntVDOYwslI9jUh6ABck95PJt
         vg3hBdPPChbGVH5TN2ZJMKW+iy41QF0ywVjtS1QDCqqKGeh+kEQ9I2xZHYN3GrLYpsZj
         ImHdmFm2IrV9bhv9W2KuVjH43YvyYshJcKyx4LpcZDcz3FxX1fIuNcBSoogwH5m0gQNR
         155RPiHH6cYKlqd63qE0fQfPyjRuslq/3AoXsfueea1QSJp7HdvR5fdb2EVMpLaQzxwC
         S5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ul/FfYX1stGw7Rsa0fZ8HtaEMQc3oNR8J84dfMSgOvU=;
        b=ctpVZtJWII8dd0LlyBylSc18skhb8uBHBnPPidvV6JDzEcHWyVmd0PXTSCh6uBPvFR
         uC0QfcpuPZ6aYMoDcl2n4higUfcfY2kyMRO6n/kmM9388pVBIZbV3Da0AeYEDOAZyZQW
         8cZs7mj52/lLPfi9QlrOthrQvpvbSTFLb7Zv1+bqR8Ft9zGcOV4YsL9gjQESBVlJ27Yd
         +M5Q7C/uBtsSxhllrtKCsxL2OguF7A7aT9wnQGSzyL/DXLRrrbqJth8VzR3nNfWht1iW
         neBkmLq+B1yKwM1zVeTIOk8GZlFgnWWSXSLEjoE+ZNBnbVtmC4VpR/a9HQ4YqCmZCOGe
         d+nQ==
X-Gm-Message-State: AOAM533wu/jpnQzI4nJsswz1lBgOPhBDAi4j/i1/0i+oD3MaH0l8LBuK
	kwkKnc59hqPmMe3myjVbNXh9UxPh3hw3Mw==
X-Google-Smtp-Source: 
 ABdhPJzwpQ47a0xssCieSWyjDk8m/+N76lntPYmYvomMx5Z1jLffSFehu18Qed8d2MzrOGelYin08w==
X-Received: by 2002:a5d:59ab:: with SMTP id
 p11mr15987837wrr.340.1637741311708;
        Wed, 24 Nov 2021 00:08:31 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/21] logrotate: add a link to upstream review for one of the
 patch
Date: Wed, 24 Nov 2021 09:08:09 +0100
Message-Id: <20211124080828.530981-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158658

The patch author (Robert Yang) has been asked by email
to rework the patch.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../logrotate/logrotate/act-as-mv-when-rotate.patch             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
index 671fce4ac8..4efd471906 100644
--- a/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
+++ b/meta/recipes-extended/logrotate/logrotate/act-as-mv-when-rotate.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Act as the "mv" command when rotate log
 Act as the "mv" command when rotate log, first rename, if failed, then
 read and write.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [needs a rework according to https://github.com/logrotate/logrotate/pull/429]
 
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 
-- 
2.20.1


