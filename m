Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE13C61DA4
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 01:03:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2233.1678928591412677266
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 18:03:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iWh5NVcF;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id iw3so102649plb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 18:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678928590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qucjb2gLBfKDcsjCB56cejYotVL+YjQUv0+mFwk9gOQ=;
        b=iWh5NVcFUY03OpSX/3u5fKQDq+W6AUcbs8eaDkO3dJ/Y7kCGxNvzX4FxAkgNPFVB1M
         58uJjOi5f0XGMs3mVKPxG2dHcED7zaqJBzoH6i3NegTVg85y8NMdczT81Qm/5i7SVBtm
         L5vyVh+71BkOfdyTyStg/dFlS0+Y2XVKw1RULH7v9kk8Os2Q3klcU0PzouC+bXj44YBl
         YovSNxk4bHltfTuDEC4GO0XnyAV9DiD5D35vrbood0e9n6f55lkezZdyheqqxW2b7TCf
         midq1jV7DSn9j3iN9/QCoqEjzgwLkr4qj3UY6whfLvy3yjmSQvyjMgbNbElsia4+sroT
         gbqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678928590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qucjb2gLBfKDcsjCB56cejYotVL+YjQUv0+mFwk9gOQ=;
        b=dYYlhMdNepRN8DeaSeQTLvuu3nSiRTMaSf0lDJGXfhQvJdKFMSRZGGgGQeMRIHcg/7
         U0qKZte6PRB/u+FCoqNAF642fTKsvK7/J7bUi/DUaWUl5rPPuRg/eouskZT9g2R3QpSu
         3fiWCH2d9cCNs/iyE6oMvnHyEO9lNf9omYd9C5OvZU+NKKImhzGWDnFTc7864mAojUYP
         EE0bQOYU97cvmD9KdtkTsHOLV58lnVOdTEJ8OqmjbCW+0IKhq5pN2mQnkOvgND7BfSDI
         BpcvCnDwDjQG60WhygFh5W9VXEQvZO/0Zk6qeoIzmRcAZUIJfK5m2Z8evxmBTrnizR2f
         99GQ==
X-Gm-Message-State: AO0yUKXAhr2yQvpJBcvDl93Z/srJvysF8Mrzqfr2SM0YGosR6fgTUGlB
	XVxNU91Zn65bP+akZ6szlk2IIam68qY=
X-Google-Smtp-Source: AK7set+t2E+eqi1Bf23nPj0cRn4p4gCUMrrJIUJuX4ClmFsdLtC/cC0LKKxYg4eY5S0Al0q/Kb0e2Q==
X-Received: by 2002:a17:902:da85:b0:19e:6eb0:a746 with SMTP id j5-20020a170902da8500b0019e6eb0a746mr1743774plx.26.1678928590339;
        Wed, 15 Mar 2023 18:03:10 -0700 (PDT)
Received: from nereus.hsd1.or.comcast.net ([2601:1c0:ca00:cea0:66f1:cb87:4495:5f63])
        by smtp.gmail.com with ESMTPSA id kf16-20020a17090305d000b0019309be03e7sm4240035plb.66.2023.03.15.18.03.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 18:03:09 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] Recipe Upgrades for AUH 15 Mar 2023 Run
Date: Wed, 15 Mar 2023 18:02:56 -0700
Message-Id: <cover.1678928363.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:03:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178665

Build tested on qemux86-64 and qemuarm64
Basic run-time tested on qemux86-64

The following changes since commit 37b5d544d34c9caaf70def0a29dfb0cf896dc1b7:

  scripts/combo-layer: Fix python deprecation warning (2023-03-14 17:13:11 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/recipe-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=timo/recipe-upgrades

Tim Orling (5):
  python3-pytest: upgrade 7.2.1 -> 7.2.2
  python3-scons: upgrade 4.4.0 -> 4.5.1
  python3-poetry-core: upgrade 1.5.1 -> 1.5.2
  python3-urllib3: upgrade 1.26.14 -> 1.26.15
  python3-wheel: upgrade 0.38.4 -> 0.40.0

 ..._1.5.1.bb => python3-poetry-core_1.5.2.bb} |   2 +-
 ...ytest_7.2.1.bb => python3-pytest_7.2.2.bb} |   2 +-
 ...-scons_4.4.0.bb => python3-scons_4.5.1.bb} |   2 +-
 ..._1.26.14.bb => python3-urllib3_1.26.15.bb} |   2 +-
 ...roject.toml-from-flit-backend-branch.patch | 100 ------------------
 ...heel_0.38.4.bb => python3-wheel_0.40.0.bb} |   6 +-
 6 files changed, 6 insertions(+), 108 deletions(-)
 rename meta/recipes-devtools/python/{python3-poetry-core_1.5.1.bb => python3-poetry-core_1.5.2.bb} (95%)
 rename meta/recipes-devtools/python/{python3-pytest_7.2.1.bb => python3-pytest_7.2.2.bb} (92%)
 rename meta/recipes-devtools/python/{python3-scons_4.4.0.bb => python3-scons_4.5.1.bb} (90%)
 rename meta/recipes-devtools/python/{python3-urllib3_1.26.14.bb => python3-urllib3_1.26.15.bb} (86%)
 delete mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Backport-pyproject.toml-from-flit-backend-branch.patch
 rename meta/recipes-devtools/python/{python3-wheel_0.38.4.bb => python3-wheel_0.40.0.bb} (62%)

-- 
2.30.2


