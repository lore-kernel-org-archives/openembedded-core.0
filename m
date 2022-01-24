Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68C1C4332F
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:49:24 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web08.829.1643053764097370341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jCGaE3sJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id x11so11085486plg.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04BS3HEBzOxQBg7wO3x2pbuthhlW6/5cL9frocPcqAw=;
        b=jCGaE3sJ6vVMVTsir8NzvqlgbVNmu0qM7vuor4+bSacwUv8m9Af5Djdv6DuZXfHwx0
         SZf5PfN4sCz3d1b5nU2Ug2cNgmH4gLsGroxnRExdxDpKcYUr2qWdZzSd3KYdMd0+7wH5
         Q5yu9i0fZTzPWnD8Y6k5iVZIES+IdO2JvoocZ3CXohsixeEHQqEN02SnF0/nV5Pq1Qjp
         ItfXCgwWHZO8ypGu/BkQzRWS5gmiKI1XgT0c0zuwOOQnYPk1OKJ/sTPOXA662VKBVN84
         Y5bURxZXyKiIZ12BFU4qC2m5zkBTWqHp9L8jim0pX450orr0Gqh/QxYZoDKf6P2Wi25n
         NptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=04BS3HEBzOxQBg7wO3x2pbuthhlW6/5cL9frocPcqAw=;
        b=iSDsWpCvjarsVQxEm5Q56TrTYqs2rxGVnAswPvJTNAuwS1NutZa4/6Y0ZlSTIThY3F
         ZCeQLTHO0A7Yfp4CKLuK5EmSuP/d1vM01QBpbA5YfenE+81DOj38w3L23YYM4d58ifo/
         Rg03TYPa32Y75t+03FRQebdJoNaPerN1JUWPewq4j3QL3TxTInVwLkgBXnJJPOru9t3j
         rVzCB2W9Vrtl6CYg2SPqz0n3v2mN6jjGXx7ExHgeWGD/iokvsyhKHTzFDj7LQIuh+wJa
         Gon+2kIOYA9/5mhDk8S1EjXgkGP8ro1uI1tPc75yCoeu47qszHXf7Gt88ts09qx9BlwY
         2hAw==
X-Gm-Message-State: AOAM532DykrZ+MwGe53USHJXnB6NNd7ungRmVGcU1JEYvRvLgdZ4YPGh
	BJFemQoYk+0rN062OYRpQh4iGkPlEr+c9w==
X-Google-Smtp-Source: 
 ABdhPJzwSLA1IAdJmaYBu8FmXZ+9IbSBezkkvAXNsNCMDeIBEYWZMDa6G77nK8InjDf5RgoYO0nmmg==
X-Received: by 2002:a17:90a:e7c8:: with SMTP id
 kb8mr3435519pjb.35.1643053763110;
        Mon, 24 Jan 2022 11:49:23 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f265:5b05:90c1:d910])
        by smtp.gmail.com with ESMTPSA id
 t2sm17617202pfj.170.2022.01.24.11.49.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:49:22 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] AUH python3-* upgrades
Date: Mon, 24 Jan 2022 11:49:04 -0800
Message-Id: <cover.1643053417.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:49:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160897

Upgrades with the help of AUH for:
* python3-hypothesis
* python3-importlib-metadata
* python3-pyparsing
* python3-setuptools-scm

The following changes since commit 27ff420543f0195dab024698d804aca33f2ae139:

  build-appliance-image: Update to master head revision (2022-01-22 11:28:56 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/git/poky-contrib timo/auh-upgrades-2022-01-24
  http://git.yoctoproject.org/cgit.cgi/git/poky-contrib/log/?h=timo/auh-upgrades-2022-01-24

Tim Orling (4):
  python3-hypothesis: upgrade 6.35.0 -> 6.36.0
  python3-importlib-metadata: upgrade 4.10.0 -> 4.10.1
  python3-setuptools-scm: upgrade 6.3.2 -> 6.4.2
  python3-pyparsing: upgrade 3.0.6 -> 3.0.7

 ...othesis_6.35.0.bb => python3-hypothesis_6.36.0.bb} |  2 +-
 ...4.10.0.bb => python3-importlib-metadata_4.10.1.bb} |  2 +-
 ...-pyparsing_3.0.6.bb => python3-pyparsing_3.0.7.bb} | 11 +++++++++--
 ...s-scm_6.3.2.bb => python3-setuptools-scm_6.4.2.bb} |  2 +-
 4 files changed, 12 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-hypothesis_6.35.0.bb => python3-hypothesis_6.36.0.bb} (91%)
 rename meta/recipes-devtools/python/{python3-importlib-metadata_4.10.0.bb => python3-importlib-metadata_4.10.1.bb} (88%)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.0.6.bb => python3-pyparsing_3.0.7.bb} (47%)
 rename meta/recipes-devtools/python/{python3-setuptools-scm_6.3.2.bb => python3-setuptools-scm_6.4.2.bb} (89%)

-- 
2.30.2


