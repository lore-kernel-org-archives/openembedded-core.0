Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.9154.1593494329903706081
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 22:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aBxTAcN3;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id x62so14700230qtd.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 22:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qbe22MhXsLG2HHHOVCFMd2uuPlrZjwW9804iiXcu4lE=;
        b=aBxTAcN3Y0mgWRUARuav0vXTZYM5Vq/TgwmEngT+YbZOSec1ChK6AjDchbu6GBqn5G
         EciOv2d6ZvpcxrpNnHFtzIqm/qdlRI707Zeh1S1Eoxr54/KXVfZSVMq+jidyx6kzoqpA
         lgwvEudroojwv3rS/qDeFgCWfkpFgm9wuxt845HoLbZ0QKJvdbKZ+BrgVa52j9RqVWhf
         9lboqdMg+j/V4nn8Hp0JOaFl0FhxBZygQGDTtEQtxd0NzDg1hKY/C8YjdRiYDUFtMGDG
         Llssc8IVEi+35aogIJuDp6Kf1/fPm+l7RXstCKqtDsO0opSodwok5XmFi2ZAI5hn7NCY
         ALcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qbe22MhXsLG2HHHOVCFMd2uuPlrZjwW9804iiXcu4lE=;
        b=Ge7AVQTe/FE1a/AHa+JhRbByfz5VOPo3rKrixrQE63TQZIX3/hhGF9aKD+A0Ecrrz9
         l1jW+IUT+JRvov6LwK5JVKNAUfc+XIwSSfhsDjOYyxTBpyN5pDGHR9vjLw4hffNjRVGQ
         R0CeloR3G62FdkzhoumLX8MEWjwt5EwCDvcIRZeeTWqfq3RD/tOa0YWIkTqzUAUzuFb6
         I6za2Zc5c73QIFVxbfbBo+5UzymG7tD5KRmToruS5KjcUU9c8+ULd/ZsfUVPh7sYMtqP
         BoGOSrp/zPceKC/d8Mc+RZIEKMQjxktpsg7ra85cL8ZREYgeD/yA1W1wvsyj9t9A/rBj
         H5TQ==
X-Gm-Message-State: AOAM5330TJLd0k3Jje/bIJv8yIS3f2bhdodOtCZV+AcxR/fhfRHp5t2K
	GeuN2CPTXwc4FTmDpIFIAJg=
X-Google-Smtp-Source: ABdhPJwDXZy3JMwyMOG1tN8JCCI8cEShXgC4uVNb30LEm5dZRDCci3MU0jz2WkGi3bED/eNY4MFayw==
X-Received: by 2002:ac8:22e5:: with SMTP id g34mr19654296qta.227.1593494328987;
        Mon, 29 Jun 2020 22:18:48 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o10sm2163403qtq.71.2020.06.29.22.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:18:48 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6] linux-yocto: conslidated pull request
Date: Tue, 30 Jun 2020 01:18:40 -0400
Message-Id: <cover.1593494109.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi Richard,

As discussed, here are the linux-yocto -stable bumps that I've been
testing locally while we try and track down some of the intermittent
AB issues.

The -stable updates cover the gcc10 updates that should fix some of
the host side build issues.

This passed a AB quick run for me (well the last target is still building,
but it's late, so I'm sending this assuming it will complete).

I'll send a yocto-bsp bump that goes along with this.

If this still doesn't fix the intermittent build issue, I have a gcc10
debug patch that we can try. Which should show us if its a race, or
really just a gcc10 host issue.

Cheers,

Bruce

The following changes since commit 5951cbcabe29e8520876c7646b578c12d6c20950:

  python3-setuptools: patch entrypoints for faster initialization (2020-06-25 10:26:00 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (6):
  kernel/yocto: ensure that defconfigs are processed first
  linux-yocto/5.4: update to v5.4.45
  linux-yocto-rt/5.4: update to rt25
  linux-yocto/5.4: update to v5.4.46
  linux-yocto/5.4: update to v5.4.47
  linux-yocto/5.4: update to v5.4.49 and -rt28

 meta/classes/kernel-yocto.bbclass             | 33 ++++++++++++-------
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_5.4.bb             |  8 ++---
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++++++-------
 4 files changed, 39 insertions(+), 30 deletions(-)

-- 
2.19.1

