Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.16371.1598526017916712388
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 04:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d7iJyB4B;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id oz20so7068643ejb.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 04:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zTTMKnSORLtOqsYR9C8K0sfQb1ZNi0uW+c8VInUpy9o=;
        b=d7iJyB4BG3Yog/V290Tc8wHT7E7twg7K/47MnIcquuKoT6jSgOuAZSSZbNJScQsIjA
         tl1cSIwqfQlhPoAhJzfmRVYId2VJAScuSFUbLPTuVKKzVRRIHJIsWbCdJxrprnnmvou6
         UogmG98pTtYmRSteIBsAooLVbLYzeRcaOEbinujlhGBRjVVGA6yZhcGI86YvIs7ZUT5H
         /dQmlwyrOXgSwEuS2SdgIL9I9u1m5hUpkR1tCCsJD43U/02UxVvbBuWHCV84vBDxxqHk
         5nxIitSPU1gbfDmbBfAaSJIDvcfGc8R1SxPcul/BwI/fwyPwbQ6OcPDg90aq+3WbRCsg
         WObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zTTMKnSORLtOqsYR9C8K0sfQb1ZNi0uW+c8VInUpy9o=;
        b=uPW4K9t5OoY/ekMtHoyef027tKtifucbdj7psNG5tBzwnMdFll0N9m4jIgLiTvyJG1
         zn1r26ZocVxluMp+PMagcmWJkGsdbuXExjjYe93Fz4HtRAi/DzLHkeEL6nfwYEKdeBET
         TbRBRHNPe9gHHCTF25mM0dUMpN0cVDwXjhvgaJ80R7n3kwfrUs3IfQDa7qd56q546Qvu
         ige4u+g4pzatX/jkUtsimKsUhT1wX1EBpJDisAkYSpUyPJf/Jsgqy5zq2CtV2O5Ykczq
         1afhtRBKgXlg5oG3oX74TU2NZByrJiAC+pVaUhPEYQDN9lKLLqwJPeVfO0LxTWzibtct
         /OuA==
X-Gm-Message-State: AOAM532oRkTeHNVcn8iY2HNcicDxSPTMamlsErgOocBRwHdBb3Os+Po1
	gODAzaVz4R1C2lAbMPGvId3VIMy8i08=
X-Google-Smtp-Source: ABdhPJxlWCT/CghP6uypmoAmSOWu0E+JK8VhZviEFKllUy5aFsY9WcAKMs7sCH90ygnWzVDTAN4tBg==
X-Received: by 2002:a17:906:34d9:: with SMTP id h25mr17656845ejb.80.1598526015888;
        Thu, 27 Aug 2020 04:00:15 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id eb5sm1623132ejc.94.2020.08.27.04.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 04:00:15 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/6] systemd-boot: bump version to 246.2
Date: Thu, 27 Aug 2020 12:59:28 +0200
Message-Id: <20200827105933.3575-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The recipe includes systemd.inc and so shares SRCREV with the main systemd.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../systemd/{systemd-boot_246.1.bb => systemd-boot_246.2.bb}      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd-boot_246.1.bb => systemd-boot_246.2.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-boot_246.1.bb b/meta/recipes-core/systemd/systemd-boot_246.2.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-boot_246.1.bb
rename to meta/recipes-core/systemd/systemd-boot_246.2.bb
-- 
2.28.0

