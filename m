Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.140773.1598036539953058985
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=si4Nppyh;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id h21so1940032qtp.11
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLOAFV4ox5y85Bf03NuW0t0WApUCmz7YRMsrEUZBUho=;
        b=si4NppyhFjoYCXKXqiWrQp//ZxeHJzAYKz4GKhnya+4jUaynF4G0gzqLkzJDivGF78
         Nd36faxMgfkgYl1jy7lgc4awrmCIPIkcdMfoeveAkLMktyJwVQileXB11NdFQXiyOWJh
         MDg/Rg08V2O7sQmMmX3YJKRFkfdRjG+mOcE9/2ReDJ34fN3AJToWoNDzbiaA2+sHodzu
         KfNzEpLLaDCb4ThC+Ocq7ISuwZXgCDobvDSdAbNWZJmm4oRj/cOSuZD7fWLzMNqdh0uj
         PcYc/45HBgqd4VxGcvbOGb05GwRqa2vPqrTghLdUjA4xGMUxFaWmnYHooUPiwIPdoxC7
         wMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZLOAFV4ox5y85Bf03NuW0t0WApUCmz7YRMsrEUZBUho=;
        b=mH3/eunDQdPfIZf4ev7BXnsIdqvU8mVVvlzEuAJwb9zwxyutl/j4Jl5450tOeNYjTM
         u/di9FByvshDGx0BbCr1fGPq3MMhzqzwBfsPzJPphjbVJIlJqbvhxb2rze7vx9pHfTKv
         RLViL3QrLOyLCyTMLk2U8vVCecKsSdy9pGBbfIJYY7gOEWyXqWzTlBJW6DjG1GF4wbFT
         kKb4Rjxf/UWYromLcqEEcqRlWXUOFMicEPKotW3/mpFKucn122aNlcvvHvXGuTrIx786
         fi7BefCTfLNXfwXHWANizuLwqtxLIi9zRgmfoBEX6VEWpoSlBNhVYQeNsIqdc06aasWr
         FYqQ==
X-Gm-Message-State: AOAM5307X55k2pg8oQnPSjRUf9FeJm1gPTzAD+9nVHC/oajOLIPmbCNx
	PJhZAUryHdnlPR4Iv0k4x0L37a77zFPkurFW
X-Google-Smtp-Source: ABdhPJws9KSDBzkE8fsYtr0o+UwQNDNyMUXMYzIScTGHWwz4cJQDpRZhvqFCwgsyhIYInGRvzZZ13A==
X-Received: by 2002:ac8:4e49:: with SMTP id e9mr3431818qtw.91.1598036538831;
        Fri, 21 Aug 2020 12:02:18 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e61sm2852845qtd.20.2020.08.21.12.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:02:18 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] kernel-yocto: consolidated pull request
Date: Fri, 21 Aug 2020 15:02:13 -0400
Message-Id: <cover.1598036283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>


Richard,

Now that we have the libc-headers and 5.8 kernel recipes in oe-core without
too much chaos, we can try these patches to bump the -stable and set 5.8
as the default for qemu.

These have passed AB and local testing for me, but lets see what shakes out
with these changes.

I'll have a similar series for poky arriving shortly.

Bruce

The following changes since commit c67f57c09ec77568e87d3a6db0c67cc78530e99c:

  bitbake: build: make shell traps less chatty when 'bitbake -v' is used (2020-08-21 14:29:25 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  qemu: bump default reference kernel to v5.8
  linux-yocto/5.4: update to v5.4.59
  linux-yocto/5.8: update to v5.8.2

 meta/conf/machine/include/x86-base.inc        |  2 +-
 meta/conf/machine/qemuarmv5.conf              |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 8 files changed, 38 insertions(+), 38 deletions(-)

-- 
2.19.1

