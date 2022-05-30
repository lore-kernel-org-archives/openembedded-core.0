Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF22C433FE
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 17:02:21 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web12.39430.1653930139682372182
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=CNw8aWZa;
 spf=pass (domain: linaro.org, ip: 209.85.208.177,
 mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f177.google.com with SMTP id l11so1517858ljb.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 30 May 2022 10:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTf3YRN1XRGiAYKp7wkdWPDX2d0O1YfqoUKCWRokEHc=;
        b=CNw8aWZas1i5znPDtbRGHt9ztuvhgjo5zjRlv98kRMiXcgOpzjdfbkWXb/pr+QoPqR
         I6tkdYnfp+ur+OKjZIjmpOX5mQJVaF4Vm5Ftm9k4Br29ysScwusH8YLrC/8av2BrveHq
         kMwjXpm5SGDKdMb+fpzELyWPbxl40WDukvVxeCzzEKw4ouH0doNLR9Ke2Yzoj6ossTl1
         QZIIf9Nj0n/dfnUZt65P6j672hBc9XNmLz6x8+Onc9WsTbXvX5AWcp4EojPz7Zoh2cm2
         5DuS/kY+U34/1Taqs4q53cdpJE9ae6BHKl8sFDTlhqDLSXFswXmFQOVavD0cT1Bpy08s
         861g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTf3YRN1XRGiAYKp7wkdWPDX2d0O1YfqoUKCWRokEHc=;
        b=GMYitBhGoKH68L1jHR/NCtvzo80vi+bJ9LecSoxCpREX2ooOGXx9ytlMK43V5dmqn0
         PQ38HJG/+1lKTFlZpEsQ1x384yADKHIePLe5364c/X3SYyMcUH1AGGPZvBLrSNPdzy4W
         l4WDdHhqf/EGwFc68QBjutqgAqrmNi2owdWLV5KRFedDhRfOWkBGclrJoWRRw4cVr5+9
         08VOsYeczt94nUVpo4ZMUFb3lczFIcf4rx85yOJgbFwyIiWne1EuPB7z+w8HG7v5eox0
         XoK/al7cBMMsAMtWIsAzMJwBgYRnrAfMvouErDe4bUp9e36wx4eroQsKKXE8eCSoZY8b
         BKVg==
X-Gm-Message-State: AOAM532Nuj6CoXrbR+CU35nvCMj0BOWEH58wKTaWbDHgYytRjLaIJ4bB
	QebUblp6ukq51XgJSxaVfHilLXOGH3n3Mw==
X-Google-Smtp-Source: 
 ABdhPJwegxLYSojJNc6qWFt50YBj7CMOVwWYM++ihx47rvx0EljkJqoshTUBjdfzaOPpBc0eQyuEvg==
X-Received: by 2002:a2e:7d10:0:b0:253:e8ae:af01 with SMTP id
 y16-20020a2e7d10000000b00253e8aeaf01mr24447582ljc.19.1653930137428;
        Mon, 30 May 2022 10:02:17 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id
 t2-20020ac24c02000000b0047255d210e6sm2410752lfq.21.2022.05.30.10.02.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 10:02:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [kirkstone][PATCH 0/2] linux-firmware: pull two patches from master
Date: Mon, 30 May 2022 20:02:11 +0300
Message-Id: <20220530170213.1562720-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 May 2022 17:02:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166294

This pull request cherry picks two commits from master branch to split
several packages that are usable on Qualcomm platforms. Allow using them
directly rather than installing huge linux-firmware package.

Dmitry Baryshkov (2):
  linux-firmware: package new Qualcomm firmware
  linux-firmware: split ath3k firmware

 .../linux-firmware/linux-firmware_20220509.bb | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

-- 
2.30.2


