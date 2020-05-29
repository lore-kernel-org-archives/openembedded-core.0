Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web11.26610.1590715763273608076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 18:29:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WzVf93Wh;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id q14so458445qtr.9
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 18:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26R8KtOXYcME7I6QkmSgiM33nEZpaDLmCHFFjdGGuro=;
        b=WzVf93WhiFfMOa9YqHyTXGB0D5OXtXrSZrMtUn3r0z++sm9ojNuqQRkYaOkdaAYS1X
         e2IvADKJeEACRaXJJtqjjp4xEQmPoiVC2YpDyhzdRi+r7VeuKyq9UrhX8OPPgy9ndEub
         AewcZiy0y/87WTAWp0mx19PFSn+EzokPkU1fWOg5EoplW96Hx6l+uUp6aszgDXR76Urd
         EhHET50O4ehwODSRzjlaTV/OrGV4I/Lm19LoRHQyrvps4KuLno8wy1+7LsnzOR1zkWRo
         mwdbi49Gd3DtgrDpAWnRnXgLGKcyMEx7toyaqCzzrLP76IPYnMuD3t85tYdz25gVJM3n
         ALTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=26R8KtOXYcME7I6QkmSgiM33nEZpaDLmCHFFjdGGuro=;
        b=Cs0EwIQNbvstn9NTemIhXjo98tm87OUE00wyoFUqCXMZZlT0TgdvPq6NRT92nAjm6S
         aTvGfnalReKaQsS0mtShXwxJYrqx45R0luyNgbLhgnu3rV5CfF5wjY1vb8FBy/WabyZy
         OYwQc5p9rITyt/aM2CVom5fjkJE5nTIEs6RsYlUC8jcu4OjUJ3OpmlDfHRnN6fAM+MYd
         rE60G9ocMv7WPHaXznQJjaIZ01sKjbhjMmG2KGonqsAsXlSQgn9r9eVzeiHBALbBAGC6
         aNihYX5xOxzGyPYqIFS8U7chg0LEHpJXDgt6YV70cAIimpo48kT9iKfTLkoJj+VX1vnV
         80Pw==
X-Gm-Message-State: AOAM531n5bNkbhR6XITHi2AVwUAK8oouiWo7BANUi5OoF/uVqVqdy0L/
	v5qE+rXh8tEp7qokogyUMwM=
X-Google-Smtp-Source: ABdhPJxBZJt1bjB0hCJJidkYIwdE34kk5MkV49KA83WTsDf8wfz+tm/v1qg1RG06Z+2nF0FyhlazbQ==
X-Received: by 2002:ac8:6b0b:: with SMTP id w11mr6380437qts.115.1590715762252;
        Thu, 28 May 2020 18:29:22 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id c16sm4101292qko.100.2020.05.28.18.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 18:29:21 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/5] linux-yocto: consolidated pull request
Date: Thu, 28 May 2020 21:29:14 -0400
Message-Id: <cover.1590715483.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi Richard,

As discussed earlier, this is the pull request which contains a temporary
revert of the CONFIG_IKHEADERS config change that was causing the
periodic issues.

I added a kernel feature that can be used to enable the configuration from
a recipe, that way I won't leave anyone broken while I continue to debug,
since this still is a problem for anyone that is doing reproducible builds
and wants ikheaders.

This went through AB quick and came back green.

Bruce

The following changes since commit 392ba004f42be2fd9dcf121d3dfa5b414ff83f93:

  ref-manual: add PACKAGE_ADD_METADATA documentation (2020-05-27 11:05:04 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (5):
  linux-yocto/5.4: update to v5.4.42
  linux-yocto-rt/5.4: update to rt24
  linux-yocto/5.4: temporarily revert IKHEADERS in standard kernels
  linux-yocto: gather reproducibility configs into a fragment
  linux-yocto/5.4: update to v5.4.43

 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

-- 
2.19.1

