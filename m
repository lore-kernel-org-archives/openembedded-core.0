Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.2927.1621556413680744405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 May 2021 17:20:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WTpSMR+7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id d25-20020a0568300459b02902f886f7dd43so16513252otc.6
        for <openembedded-core@lists.openembedded.org>; Thu, 20 May 2021 17:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUXsgEkt9UQuPpkY/nr6wZ6mVpcvH+2D8z/TIJA4U2M=;
        b=WTpSMR+7UZ/QHEHK7GQa+dYaOG22cFsrUPEk2kef38LduHLH0CZhBPFVOz5easn7UK
         svlabxktmH7senWMVb08ro4T8DLcuVB6cqvMnBdNBMbRR3shqEQlLno1ANyAds4r37vZ
         IwjdUrYBosx7gdL9ejaDo84x1QQUE2hdiKTFRWGf1To+8NiftwWGt81H29fUVzkmoMU7
         NUpMe9CRiEbadD5s+kTqhjQJsgmhEdoGy9GuHyQokcrOi7NNLF9VStKB76e97R8ubLEN
         QbcUSMJa8n2+qTR0G8j7iiYjQbgbYYPet8mpWobvVTefZd7at/2RTX5rttJ3TFIEy5mS
         XdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UUXsgEkt9UQuPpkY/nr6wZ6mVpcvH+2D8z/TIJA4U2M=;
        b=PKXkVNX5z2pfmCCnMfgSD3cf8Y4Ny/UmWbUUZn+ev/IfDzrQi7klmZpWHtLTqbr/sA
         SrkOGAS9WBOD1qI/BFidsNeLw7F2ZFXVLB39Xza9G+I8Tqnaaqzvj2iCYtNRAbzp7ZGR
         7Yxx+cwJZIr3WvY+hgnAt444TEyfsqAYQCltlL9d/1Vg/Yfs++OEMPFFeGKV7UGRLyIs
         803YyI0mprG7kpkLMk31KpWaGPwZ9UxMLdx0BWQH98mnpq1HCA6jS9KXuqJRg5bZEG/O
         lnqMy3lQvXJN9Qq4YcGi6s3HmhKhqv9kcEtJFY/Wb5ydVzC4XkBJ309001MXOBBEhJwL
         bwhA==
X-Gm-Message-State: AOAM5305VWeU3rNikOnsUOIwwtwIu4O71GWt21Li38qI/AM4XcjcS61c
	StyQU7zaXxUWaR5epvEtcegrXxe0/HYma2pNBKs=
X-Google-Smtp-Source: ABdhPJxazz3KDMAoSisJxmz18FkcmgZMRh0KyRoNNFW//8SVOOGRXnMn3mQ/xQ22mBwug+jO9DCDlw==
X-Received: by 2002:a9d:7312:: with SMTP id e18mr5814747otk.334.1621556411848;
        Thu, 20 May 2021 17:20:11 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v22sm831013oic.37.2021.05.20.17.20.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 17:20:11 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/3] Patch review
Date: Thu, 20 May 2021 14:19:26 -1000
Message-Id: <cover.1621520845.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review this final set of patches for the 3.1.8 release and have
comments back by end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2172

The following changes since commit cc49591d84d241d90e3dccb3e174ddfd737de311:

  meta/lib/oe/rootfs.py: Fix typo "Restoreing" -> "Restoring" (2021-05-14 07:16:38 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Richard Purdie (2):
  Revert "cml1.bbclass: Return sorted list of cfg files"
  sstate: Handle manifest 'corruption' issue

Stefan Ghinea (1):
  boost: fix do_fetch failure

 meta/classes/cml1.bbclass                   |  2 +-
 meta/classes/sstate.bbclass                 | 16 +++++++++++++++-
 meta/recipes-support/boost/boost-1.72.0.inc |  2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.25.1

