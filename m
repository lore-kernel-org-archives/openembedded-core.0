Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web12.74627.1629400103347341837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 12:08:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=0DZFN/x8;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id w6so9811475oiv.11
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 12:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gQuexsbJTsHX2GBbr0yuDWKSlcwfch3yyYae1Zn/HPg=;
        b=0DZFN/x8ZRx/AXvLcp1bxg4YbehpvRg1naWOAPDjklYUofsowQAfwKOBHrNC3GMwg7
         5kkk9o/qUU8k00zv4hrZ8m1Yuk70pT3H5oBhKPegB07qaElkJcwxpY3R81iBYxs++uuL
         xIV9uhSC2WayF+zbRW1QrBWMFWoo/D1vDIQu9wPlGl425LW01g44uxjRbEWxcfoSd6e9
         PAaNKa3nbu4HpvIfjEx8sdGcq1Re/wd4GiBXUG2iUBcJM3nW932V9Z8gOfpSDiGNeOHy
         6pLHC/AJzseGbYBDUXVcl47WIYF4TOFkzFcDhAC5BkpmWyGsxbL50SVq8w+/g8daJDGA
         /hkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gQuexsbJTsHX2GBbr0yuDWKSlcwfch3yyYae1Zn/HPg=;
        b=noF8IM8FBMoc2lGs6yhk4zyfBs89vOuN9nw98BBKX1RxVrcqSIz8K6F6/FTfkkVtB0
         CtaAk76aWhYdM3zubfGrF8O9/fTxtlfwIfa80s+Eg0SqQ+X2x/DKYWvpRrFSOJvGfhnI
         86KjbXI/ZoJiDky0ycUO5UodidJ4W5G7yFUvQvf9P264LOl2gj0xG3Pr74G3etYV3QA2
         VmAoBZCeUPqw4hixlzYoMz+mKnLC4YLBRfST9IBtH0SZJQLPWAWssTtgR3cFe6+UC4JF
         7dku7IDmc5mMRgxGvyLhtbLOP0tvbR5C0O1PxqJ3a8gNeB2Ezi6/0gpgMg6g5e0fnBCL
         W9HA==
X-Gm-Message-State: AOAM530k4Oz5hORrFfMZ3o8XQwi/acZ7j5bHcxxUxigXH0zh+WwM2KuC
	IuHB2LoN2pCAt3qctnuuKFmGDNaZynaLvz+a
X-Google-Smtp-Source: ABdhPJzvme/taaEcXqb8Mv/SK83j2UANHdWkwtEFymxN1/3w0HZ/Xj51oqGUWr1zHKq0g8HMo8E0Uw==
X-Received: by 2002:aca:df88:: with SMTP id w130mr203230oig.82.1629400101921;
        Thu, 19 Aug 2021 12:08:21 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s10sm765080oog.14.2021.08.19.12.08.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 12:08:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/12] Patch review
Date: Thu, 19 Aug 2021 09:07:50 -1000
Message-Id: <cover.1629399953.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this next set of patches for dunfell and have comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2469

The following changes since commit ce78c16409363741d59a2f787aca66077bec93cd:

  sstate.bbclass: fix error handling when sstate mirrors is ro (2021-08-16 04:41:07 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Alexandre Belloni (1):
  oeqa/runtime/cases: make date.DateTest.test_date more reliable

Bruce Ashfield (3):
  linux-yocto/5.4: update to v5.4.137
  linux-yocto/5.4: update to v5.4.139
  linux-yocto/5.4: update to v5.4.141

Dmitry Baryshkov (1):
  linux-firmware: add more Qualcomm firmware packages

Dragos-Marian Panait (1):
  util-linux: fix CVE-2021-37600

Khem Raj (1):
  sdk: Enable do_populate_sdk with multilibs

Purushottam Choudhary (1):
  python3: Remove unused python3 recipe

Richard Purdie (1):
  oeqa/selftest/glibc: Handle incorrect encoding issuesin glibc test
    results

Ross Burton (2):
  tar: ignore node-tar CVEs
  ovmf: build natively everywhere

hongxu (1):
  sdk: fix relocate symlink failed

 meta/classes/multilib.bbclass                 |   1 -
 meta/classes/populate_sdk_base.bbclass        |   2 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 meta/lib/oeqa/runtime/cases/date.py           |   9 +-
 meta/lib/oeqa/selftest/cases/glibc.py         |   2 +-
 meta/recipes-core/ovmf/ovmf_git.bb            |   2 +-
 .../util-linux/CVE-2021-37600.patch           |  33 ++
 .../util-linux/util-linux_2.35.1.bb           |   1 +
 .../recipes-devtools/python/python3_3.8.10.bb | 363 ------------------
 meta/recipes-extended/tar/tar_1.32.bb         |   3 +
 .../linux-firmware/linux-firmware_20210511.bb |  17 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 14 files changed, 79 insertions(+), 392 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-37600.patch
 delete mode 100644 meta/recipes-devtools/python/python3_3.8.10.bb

-- 
2.25.1

