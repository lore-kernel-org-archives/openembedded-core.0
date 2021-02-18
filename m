Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web09.2367.1613620781507611329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:59:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=myRTu5+k;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id w20so549835qta.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cwo/Ds6hjMj6iEzEjgV5hoOOwEHmETVCMKNMCCxRVBU=;
        b=myRTu5+kRZ/0eht1DN1hWmuqS+7+yOFqG11rmzILr3h6aJj3QsexZa6c+4XWN6u3CY
         BPQvCfxPPWdj6Mwzii/J3RAhmXxLlnZMs3Hy2tZG0hTFUH7CEKh7fqhWWjW+uvzwOXgo
         3Yh/VnsTVME3OOcHz5qlhg2XL1ZjOd3NqSMJqhMKYdCb7t41VtLnXTPYSKlBU0r6vAN1
         zGFtLV1TcJzbNTITxhzN2j3QetmKi44EWD8U/HbBkPwH4MjNGNHfXCFdw9jxYYUABmVy
         gIewugfwXRMDFRUh8TKHcB9UUS2Fz2ilCPdr9TsoaCASlRcE4IRnokmSWR+gs9DV8n2U
         //NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cwo/Ds6hjMj6iEzEjgV5hoOOwEHmETVCMKNMCCxRVBU=;
        b=KzORajM1Ysqv6a0fDjxJwsX4Q415qTdQ7J1xX7LBbp53T79L8PFwZJr7lzmh3H79WL
         sDO2jqzj6zKR6RlRYHRE/1TPHbHMOQXbFjhVi55JxN8MqA2kU3UfZgDpE93+U2lRR1Cs
         MsZo1tPB5AVGLV8AZS1YwMB7AUynoNhDlHwi27TTuwCvOpJs0qC9dJxaK7Xz2il7vUjT
         SYcN2NLhWmS4nFlvF8waD1PyO9S/13t4hgvLLJ4Hhc/6BS5Zr3BAIFBzJ87WR3baluFs
         Cc6iNsf/CPJCr3/3YLxPN0x8lqCc3nWm6ymXaoPjjUKsZgH6fRCYcHh2cKDVwIBrEst+
         7FKg==
X-Gm-Message-State: AOAM531FEBpBgwxad0hip2AbP9vGj/yFr2Y+iHSbwrcehOapsI10BYX+
	0WbAP1dN664fT/pzI1SzWvs=
X-Google-Smtp-Source: ABdhPJwMtDIP7QcU7GofmOLLmty1RET/ayHV8NtOsFExrDzIxOI3EbA16UmutCalaJ/KPK2areScmA==
X-Received: by 2002:aed:3926:: with SMTP id l35mr2583248qte.340.1613620780661;
        Wed, 17 Feb 2021 19:59:40 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g9sm945184qth.53.2021.02.17.19.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:59:40 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: consolidated pull request
Date: Wed, 17 Feb 2021 22:59:32 -0500
Message-Id: <cover.1613620662.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

These are the -stable and -rt bug fix bumps that I've been collecting
and testing for the active reference kernels.

I haven't picked up anything out of the ordinary, so they shouldn't
cause us any issues.

I've also bumped the -dev version to the full 5.11, since I was able
to integrate and test it earlier in the week.

Bruce

The following changes since commit f5f6504e5781c6e9d4cef3e9b1c2280fd0a8afdc:

  bitbake: contrib: Add Dockerfile for building hash server (2021-02-16 11:53:25 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  linux-yocto-rt/5.10: update to -rt25
  linux-yocto/5.10: update to v5.10.14
  linux-yocto/5.4: update to v5.4.96
  linux-yocto/5.10: update to v5.10.16
  linux-yocto/5.4: update to v5.4.98
  linux-yocto-dev: bump version to v5.11+

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 7 files changed, 37 insertions(+), 37 deletions(-)

-- 
2.19.1

