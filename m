Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C442C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:31 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web09.8792.1637163330069959504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VseFhD4f;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id b12so5492583wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ul/FfYX1stGw7Rsa0fZ8HtaEMQc3oNR8J84dfMSgOvU=;
        b=VseFhD4f2f/56aMK1/WpiGI80v9eRdX5dNUd7xwz4hkJL1w014mWv/l8u7200L0f7N
         aaOsuwp13BeUNHIqKGJ1n4wO8FOHAftgqlSjJitaApVPASWyQAdXrupcavJz4paHIUMs
         OwSSLCgHu/Hlvdxfng43DXUC4BSYFw+y0SoiPEqmwCK0MJK/JaR7K+/RCN55tBK5OLOX
         iBKZ1bVFIfCUG0IoeKvC00zZpj7ddo1GSx5helQMPK6ybcWO26lW/5Kce6ZuuLJ55oBw
         r+GwLCx/L3cpZ7lEZKcWtDm8Aq3BXdeEOmQRlquda0+Do+Y7GpJj2p/MLtcgvFWK3Gpd
         wOgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ul/FfYX1stGw7Rsa0fZ8HtaEMQc3oNR8J84dfMSgOvU=;
        b=ZlKGYwS5UL6NlE0uDfj6HHHMOOZcFhQm7olgYJv+AEpJP2yVmu1wosJXQp/sqRNi9w
         Sj0gEwbGo7lrzvsyxu4GV9ux6pioND4r7m2inB8zq9mxqkX/6W3A6EvsCPYHTpplWh6j
         jKvMB9msaSFw6sKx5fnQtc9RviR3zKakG3KJSrhue8cDWN0SIBsCFDlITXVDb6HUWz5V
         8BDRALgUOcD+tqAEEsfAqQ4vuzd5Ks0X3JICXfMr2bx4SvD61D57wt5R4D71bFDaRMIE
         fSrn3PHwUqh5X5+6WoDvHt7yVlHKhe6Ri27b9ZLbylo9wwxCAX0xmU9RLdL5rZTRLsBM
         Ha8A==
X-Gm-Message-State: AOAM531Xvu8DqYK2uLiWWw/AvfYsp3vmSOnwGwe6et7DDqTTBQLPcVjN
	wxGrB8+/+gqS9JPOTsqEe8lng1q3UHk=
X-Google-Smtp-Source: 
 ABdhPJzqA8hGvojfQU2RQNoPzkYFr+FUxX6cusTmZG78aBhHTie0AGgkEHEmHQ8O+19F/Uvy4Rj6aA==
X-Received: by 2002:a5d:6091:: with SMTP id w17mr20760173wrt.65.1637163328412;
        Wed, 17 Nov 2021 07:35:28 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 03/36] logrotate: add a link to upstream review for one of the
 patch
Date: Wed, 17 Nov 2021 16:34:52 +0100
Message-Id: <20211117153525.257146-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158398

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


