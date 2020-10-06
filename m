Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.1845.1602011078286780337
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Aru+z3Py;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id c5so1578056qtw.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9DQBcZIXnneOrTj4IJ/Oyf9qXythJUnS9HtORIdt2sQ=;
        b=Aru+z3Py2mHim2/GKHE6iw+R2nmhNAt6uNZwnfOH+IF9nEWIO+xdEQ5MPeHGPIKlsX
         IKDO5rRM/FJu5bYSOaDSrBj/XIDkAv4SxjFr8TZhMkf2Awo1FShIs1lbcqi1HicwqXwe
         plABBAwpX0O77l3r118bpRxsUVGzidvvxLDkWvY7gzj2WwXseq2YeI551eKo/q7SsVuo
         4WxwVOEEQDRIONhrd8Z1xfo8GamNcfROO2VyZ8blAF1Ka54dNITf6u3Df89XB8B/ZsI2
         iNQIR6Du4U0t5oi+xoqViOY1BwtIoYXKkmlDIxfl+KNbEntpsU2Ig6OIUwH/1o5ID3ga
         YcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9DQBcZIXnneOrTj4IJ/Oyf9qXythJUnS9HtORIdt2sQ=;
        b=lf0e3vtR/wn9ke6Fwxf6hw3hSn9v6HWDa3oHL9R7q7wIGe7gZTtZ4WA1reY0RPOtp7
         FKw4FAGiV9fQ75tDqbRUVHmg2VyRQZP7cFnHzy6xCk1VIkx9y0A1bpQw6D2+Sy8oqoVC
         EshAQRTS11BlViCaGbAwXivSkfqdJmhIMiFoQ+l/+qrLE930CeAb8J3tWinq6uIZJcrJ
         WzBUdPXwgfKNZxOv2k7cPhnXKf1d3wDPD9A1r1jXWXIE6V8j0qFCO0gi/gBni43k/V1t
         17Dm23Bsu+VtZ2mnYoph4q3ak25Ry0qq3i+bVjqIN4SookE8lHbwGayglJUJQxOVGAfa
         7iSQ==
X-Gm-Message-State: AOAM530OWVppkNWCuPm0TrcFJMGP1lmqLIGgwENHQuSgyB8W9Pv+z+A1
	jWq0vlLxg4LvTgx+A8Galc4=
X-Google-Smtp-Source: ABdhPJyXN2cMMmcJJzCC1NIM1Zrj6WrOpe9h3F1kpcqk0V3EaE4misgtLkOS5bWnP7F1ygN4/tZ/Gg==
X-Received: by 2002:ac8:1838:: with SMTP id q53mr1993526qtj.222.1602011077228;
        Tue, 06 Oct 2020 12:04:37 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:36 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/7] linux-yocto: consolidated pull request
Date: Tue,  6 Oct 2020 15:04:27 -0400
Message-Id: <cover.1602010968.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Here's the set of -stable commits that I've had queued. I ran through a-quick
on the AB and it came back green:

  https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1197

Cheers,

Bruce

The following changes since commit 520e95902f12feac2850e0c24167002eb2cc7c42:

  docs: ref-manual: ref-variables: add links to terms in glossary (2020-10-03 12:17:14 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (7):
  linux-yocto/5.4: fix kprobes build warning
  linux-yocto/5.4: update to v5.4.67
  linux-yocto/5.8: update to v5.8.11
  linux-yocto/5.4: update to v5.4.68
  linux-yocto/5.8: update to v5.8.12
  linux-yocto/5.4: update to v5.4.69
  linux-yocto/5.8: update to v5.8.13

 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 6 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.19.1

