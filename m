Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.17216.1629907584704587779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 09:06:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kFQVV0HL;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id j9so206979qvt.4
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rbvd512QE4iziQlb0rXqDCZxZsZC9PV9tSITXSUboQI=;
        b=kFQVV0HL/udqstA87BnMWghSBF+o1V6ilxd5Ybmdo8aTQl8jK6O2OvYWcoPYu3JySO
         ogdLSKpHthokzGeQDd90seRbugtDQEHMyO6zGWONdlKGOPLNB8tfRfOr2C1zXyLovFTO
         mj5bcVYSlGYkHgUimDgO4CgD38Vq7QamZCVOptZeNR8rZne5v+wpWnNxMHLb5pcW8ZDO
         atTlTS8GgjG9y0zA9qDvaO+s2GjjrkkxiuLzxkfGzXHuaUrvGyD+kcP5WzdcJTe3cZwA
         FC0sS+KPIrStepTJN+cv/r5NwweIA/TSgZJXWJQckFSzYERA+YBtdSTK2Vdgjf4FrYN+
         AlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rbvd512QE4iziQlb0rXqDCZxZsZC9PV9tSITXSUboQI=;
        b=LoTAMYhnS/xCDra8GI9mGmu8T97c4pgHl3xnznhWy6QLX/OIFZyxLLDemXYSVH6ajs
         o5ZKK0CEGzg7DNf2jSUG3UREBALMhY/WsNnBTJEv95Ccu+JewL0goNQT1keJ01wKxPst
         r/cc/1yIQ3I6sIuyWL97EHdfEg19mhA8iCfrqCmVKgqEueTBHoVlqrSSZhuW8a3IijOl
         8qodq3b/nh0RR6vuWHfhIdnREMHhBUCi9dEPNJHjtoANBieXR46Kbu4xxHkEs2o5z3Zp
         h45U2bqwvlF285qUgtym4CcHpFYayfjJ2W7cI+Wm4JlcwB+vHeRIqM9fwaDrt/BHDFXP
         oX0Q==
X-Gm-Message-State: AOAM530mvIzeQP/plq/zn5J9RJ/23ZYPcQp1EhyLaCLd9MZq5Dwyzc5Y
	Pe75MksKfY4j3txBIgRWt20=
X-Google-Smtp-Source: ABdhPJxxJtAcyoSxUIm9x5hVAl62M3lSO7ziJFCbQ/S7H8K8+yuB9xoUIUSzbI3snz3IJR0ArP9DZw==
X-Received: by 2002:ad4:5f0d:: with SMTP id fo13mr45995287qvb.31.1629907583727;
        Wed, 25 Aug 2021 09:06:23 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n11sm312992qkk.17.2021.08.25.09.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:06:23 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] kernel-yocto: -stable version bumps
Date: Wed, 25 Aug 2021 12:06:17 -0400
Message-Id: <cover.1629907508.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

Nothing too exciting here. These have all build locally and I haven't picked
up any issues (I've stayed off the AB, due to the extra load you mentioned
it has been under).

Cheers,

Bruce

The following changes since commit c3e72164e7a0c51de04a9295e5f50c2e233965f7:

  libjitterentropy: remove contaminated hashequiv entry (2021-08-24 09:37:22 +0100)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib zedd/kernel
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (4):
  linux-yocto/5.13: update to v5.13.11
  linux-yocto/5.10: update to v5.10.59
  linux-yocto/5.13: update to v5.13.12
  linux-yocto/5.10: update to v5.10.60

 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 ++++++++---------
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 6 files changed, 39 insertions(+), 39 deletions(-)

-- 
2.19.1

