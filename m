Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.21898.1584839895073463549
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 18:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gAOR4PzK;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id b62so2180735qkf.6
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqspBu9Cag8LSD3uK5SykQr3Sm9MW0wixBmlsuVWCLM=;
        b=gAOR4PzKLVtt32n01aqmgpE1DlFa7pTKoo5bSVDafB8lj0WFQKsuZzxWqyBOJFktMK
         CSuJ0VSK5yVcq/4i3JVOXIBRIavKtjZJNlj+zP6Bp1/v1RUJYZVfG1dmqbEk52zgYH8P
         SQiNvCjVS4fJD31JoNTb6jxBnuPYkRJf6z/NJdSLVV9rFpmT2gQ2x+gcTDZ9+mHxGVmq
         2bLaMHge86wHaJ5DXKmn28HNisi0F+RO4BZbC1B1gYMR3uqXy0iIJDevl+1IS9CqxsTR
         mw3VYU4Js22osYK/845durwdd53KOcfczSeQ6PIKLaZBFT8lUdxdWFsFi6WVhoJ2oZgh
         i6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wqspBu9Cag8LSD3uK5SykQr3Sm9MW0wixBmlsuVWCLM=;
        b=fJ5YCOZUZ53b1bliJY1d7MlU9vLe6NPpr8+OUZ4Smmz8WspOLFcbwbGPYMaMhmlYGF
         S/VEyUygkf7LXFYy772K4sa0Wz+JZDSIVcD65f3jZuS1QfxCnCouAdIvBw2P17nzU3l8
         1lJ58VqICqx9iM63Ps4t9VUkiYrVR+s+VTLRp+k6DscNA2q0OEmy5EGhX0oTiSfD6HUO
         JDbF9J2+RK0kyXVhujbOigDEAC7VBlGZ35YVTp5moRzTkFM0C4BfhDOdmvPM+wlF3whL
         pecgAydBjoTfEeP6g9aigjgr09H0yE9kXDztoQ7A96DSsiYBVFAuX9t5yok8yrjg1clq
         r4aA==
X-Gm-Message-State: ANhLgQ38zVkX4iND2G/vbwdMJJFL2KLgyXser+TQ53Mgt4YxRIxYHqLT
	ZZwH6Y+/44vi+XnE4+VopSo=
X-Google-Smtp-Source: ADFU+vsMBCWoe80vXRxiVoI+O99wb0OfTZX7h/EmOtdWqlk922+VfFGZL/yx7dZL7VppBtcq6oaapQ==
X-Received: by 2002:ae9:ed4a:: with SMTP id c71mr14681540qkg.418.1584839894073;
        Sat, 21 Mar 2020 18:18:14 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q44sm4536614qtq.11.2020.03.21.18.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 18:18:13 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
Date: Sat, 21 Mar 2020 21:18:08 -0400
Message-Id: <cover.1584839764.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Here's the latest set of bugfix/CVEs that I've collected for the
linux-yocto reference kernels.

I did a quick build on the AB and everything came back green.

Cheers,

Bruce

The following changes since commit 9c20e8de6f262a4bda7879eb5c43ec5cb9ded016:

  bitbake: bitbake-user-manual: immediate-variable-expansion: Correct description (2020-03-19 11:28:31 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto-dev: update to v5.6+
  linux-yocto/5.4: update to v5.4.27
  linux-yocto-rt/5.4: update to -rt16

 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  4 ++--
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 4 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.19.1

