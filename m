Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BBDC61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 16:38:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.24378.1700671086289537160
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 08:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KArYDRr1;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so58424595ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 08:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700671085; x=1701275885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i8XYGq2/tWkxiebc3JoCib6owR3Uzke21bQhWNYSG0=;
        b=KArYDRr1Fa0KLtsLYPalIygAFluwt2TD6rWKad4rFBB1gutSaT29OFbKOzo8xSw9dl
         lOKvN8Ak/fhz3RnkdoCRqZ03slA1yfVHMDk5HJC5XDFFfr4aijXmcPAnX1hBNshpXwTv
         cD1WxvfkbrVVIQId+MZE9U8WV3ns9/vRjpzRKokaxfrHTIDxqFzOW2DBzEm7WLONKPc+
         C8ibt5dU9ae3M6bCwzRl1wAifhZn6+tlCXOEdj9jQbCwDaCtr1K300n/HDMRqDce0YSm
         yFpdWpo/LZMg+i906/Nbt2hzWHSi1O7NVsK5JTqtLeKCPOIK4Fph+UkW51l+vLrgdWB0
         Wztg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671085; x=1701275885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2i8XYGq2/tWkxiebc3JoCib6owR3Uzke21bQhWNYSG0=;
        b=QZ+MSOrm/+Shkpt8qMMh2tJYyBntzK5EYAZdobabY5f2TLTsplrMuyRd9hRdwxxWP/
         Bi+ONaP0pQ/uppyri2zXq1HMqe6dxFb3dQN2+wn9XZQefSgNknpDCChQBQryOR5ZMefj
         UUA0QZLqOOuGg2GBFqvUuAxF+Vx74cSrqMcmnOmSEhi3ShGmgAk73Tr6siItgQBMHgbq
         fFbfv7h33Qxxc6fPH0TJjfUyVXAIHWHpqGaj0Rck9kYUnH0+eznal7TdREjkQV63ZAho
         bpBzAyWi7mxTHW//3iE976BX+ILi/tfOWY6cua8LrH6hVJVtlM2tg1BpkI4lCjT4iQ6Q
         ZZZQ==
X-Gm-Message-State: AOJu0YwisMGX7zV//+KgzYOfkEGeYOb0GtUDRZxtLTgnCvLGzzqTBzxX
	RdyW54SM3sN+6whnricfl0QQlZ8x425Rmg==
X-Google-Smtp-Source: AGHT+IFET1OwjNiaKJPryNd/HwzJ+O2NKpce1LUU7ZOkcJEffrjYnVVFO+p1H+v3CReGh6SQUTUhZQ==
X-Received: by 2002:a17:902:c408:b0:1cf:7911:4619 with SMTP id k8-20020a170902c40800b001cf79114619mr3298804plk.49.1700671085261;
        Wed, 22 Nov 2023 08:38:05 -0800 (PST)
Received: from chiron.hsd1.or.comcast.net ([2601:1c0:ca00:cea0::b328])
        by smtp.gmail.com with ESMTPSA id i1-20020a17090332c100b001cf5d1c85cdsm6154138plr.218.2023.11.22.08.38.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:38:04 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] python3-sphinxcontrib-*
Date: Wed, 22 Nov 2023 08:37:49 -0800
Message-Id: <cover.1700670471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 16:38:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191117

Most of our python3-sphinxcontrib-* recipes have been upgraded (excluding
python3-sphinxcontrib-jsmath which remains at 1.0.1 as the latest release).

In this series:
* Python 3.9 is now the minimum supported version in pyproject.toml
* the download filenames have all changed from sphinxcontrib-*
  to sphinxcontrib_*.
* the build-backend has changed to flit (inherit python_flit_core)

Tested by building target, native and nativesdk versions for qemux86-64

The following changes since commit 4bc0346d8c4211bf03a283ed1cde5b779dbfd3b4:

  python3-poetry-core: upgrade 1.7.0 -> 1.8.1 (2023-11-22 14:08:48 +0000)

are available in the Git repository at:

  https://git.yoctoproject.org/poky-contrib timo/sphinxcontrib-help
  https://git.yoctoproject.org/poky-contrib/log/?h=timo/sphinxcontrib-help

Tim Orling (5):
  python3-sphinxcontrib-applehelp: 1.0.4 -> 1.0.7
  python3-sphinxcontrib-devhelp: 1.0.2 -> 1.0.5
  python3-sphinxcontrib-htmlhelp: 2.0.1 -> 2.0.4
  python3-sphinxcontrib-qthelp: 1.0.3 -> 1.0.6
  python3-sphinxcontrib-serializinghtml: 1.1.5 -> 1.1.9

 ...p_1.0.4.bb => python3-sphinxcontrib-applehelp_1.0.7.bb} | 7 +++++--
 ...elp_1.0.2.bb => python3-sphinxcontrib-devhelp_1.0.5.bb} | 7 +++++--
 ...lp_2.0.1.bb => python3-sphinxcontrib-htmlhelp_2.0.4.bb} | 7 +++++--
 ...help_1.0.3.bb => python3-sphinxcontrib-qthelp_1.0.6.bb} | 7 +++++--
 ...5.bb => python3-sphinxcontrib-serializinghtml_1.1.9.bb} | 7 +++++--
 5 files changed, 25 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-applehelp_1.0.4.bb => python3-sphinxcontrib-applehelp_1.0.7.bb} (52%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-devhelp_1.0.2.bb => python3-sphinxcontrib-devhelp_1.0.5.bb} (56%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-htmlhelp_2.0.1.bb => python3-sphinxcontrib-htmlhelp_2.0.4.bb} (56%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-qthelp_1.0.3.bb => python3-sphinxcontrib-qthelp_1.0.6.bb} (54%)
 rename meta/recipes-devtools/python/{python3-sphinxcontrib-serializinghtml_1.1.5.bb => python3-sphinxcontrib-serializinghtml_1.1.9.bb} (57%)

-- 
2.34.1


