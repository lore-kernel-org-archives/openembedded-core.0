Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC0ADC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:02:06 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.20078.1703073721343136123
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M/bKqrbO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d3352b525so7711135e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 04:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1703073719; x=1703678519; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qu9aR49l4Hes400YfkVOGwYN+vtKmA7LijMmA2oIYUw=;
        b=M/bKqrbO+Bq19CuGfLkSYxt/o+KslEHRsbKQxtNdTxlD6ZqTBv4495wbXlrvNzJjuq
         UESK2WT1QC8UpCTctOHo3LYzK1hvqkHsLlIGlAGyEy65x5nRfkwKf6v2o3QhFRmPYxcp
         G0eOziQI320OstR+cWn2F3quC4QTPe6g27l7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703073719; x=1703678519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qu9aR49l4Hes400YfkVOGwYN+vtKmA7LijMmA2oIYUw=;
        b=wKkUyRgInUqh2CpKiGZogU8RVnr/PzLpyhixzfq/7ALRwh0T73X2FzkARqLeEeFHQI
         V0NkQSx9b2tQE4Ptoavtps/0jIe65y20PGzsbccyQFG9242EJeShGi2y3UmAJjCDASbt
         xlZC+HvoBZomhUO/321fNHHV4h2hpbEoPbefeCrCkqNcgd0bHViBUH43BIwXA8VQdKGp
         xuZeMHAvmSkR2yLduwnZ3pK/0GZgp3DpHwAolofEQlImeIUcPvi4NG+n76RKkAdAEw69
         3sVtq8Rds63yiiEmBIGsjS2aaRkKRGBGpKX19WBgx8IjK++q+wg4iYe3bI1b5VohaIW9
         FVvg==
X-Gm-Message-State: AOJu0YwxownFp4VC+844igxNeIEja9PTFy08rDMDRM6FgYf0HNDcg4yw
	YjyhNy9Ricji3YpBwPgNkrdG06SqUV134CoNfzY=
X-Google-Smtp-Source: AGHT+IFOsZPn6UTDStajbQHDNwLuhiF2tAlgHp3CCYUk/wZxDm46Q0dK95PnvvpdKgMtv1mV3o+yUQ==
X-Received: by 2002:a05:600c:1f87:b0:40c:6af0:ccdd with SMTP id je7-20020a05600c1f8700b0040c6af0ccddmr4407680wmb.84.1703073719055;
        Wed, 20 Dec 2023 04:01:59 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c9b9:95cc:382c:f70c])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040c31bb66dcsm7020964wmq.20.2023.12.20.04.01.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 04:01:58 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/selftest/overlayfs: Fix whitespace
Date: Wed, 20 Dec 2023 12:01:57 +0000
Message-Id: <20231220120157.3629271-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 12:02:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192793

My previous fix missed out whitespace with the append, fix that.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

    #
---
 meta/lib/oeqa/selftest/cases/overlayfs.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/selftest/cases/overlayfs.py
index 19ee228fff5..cd0dc60c640 100644
--- a/meta/lib/oeqa/selftest/cases/overlayfs.py
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
@@ -79,7 +79,7 @@ DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 
         config = """
 IMAGE_INSTALL:append = " overlayfs-user"
-DISTRO_FEATURES:append = "systemd overlayfs usrmerge"
+DISTRO_FEATURES:append = " systemd overlayfs usrmerge"
 OVERLAYFS_QA_SKIP[mnt-overlay] = "mount-configured"
 """
 
-- 
2.39.2


