Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
 by mx.groups.io with SMTP id smtpd.web11.36681.1606592391587746357
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2020 11:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JK4SLGct;
 spf=pass (domain: gmail.com, ip: 209.85.214.196, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f196.google.com with SMTP id t18so4305728plo.0
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2020 11:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hm3cV9uXe2VC5GYyicLRHBzWdvCVCpztSSOmv+5t3bw=;
        b=JK4SLGct4hd4EFv3Ela088Hisyc3AKPvm1Zrvj3MZj08jywxMKIN+H8n4iHunjsNgL
         FTo9WmGRvhlWw+5J0Kybij/Dp05/Nr2RiCWEf35WGu9AMOO2jZP8pEJmo36Hj53V2FyT
         RN3YJ6749lqJ2CCn0NUPgM4qAfHSslHYLj8Il/OlNWT3eDeuOr/sJRR6NdVtu9DeFzkd
         x5WV4H/ze8fJnDFZsJwL9jGKwkf4E8QrczHAVHA420psiy6SHB9meEHbVJ9oV2qJkpZO
         FHQVfA51Rto4H7y0leCKhMiGVwos8fdCAKkxKL0xFOaBtceh3Bhl/1jNpB2oAdmfsq+3
         QcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hm3cV9uXe2VC5GYyicLRHBzWdvCVCpztSSOmv+5t3bw=;
        b=SRa9Tf/enQlZL3a+CfQNa2PI7GqSlx34NGg4+BEwaYyypu8egoFK2WEoWiiaHbmUyN
         jM6wQ93Xe15m7b9FOUTd+lOkm7hOAaN9HVlKQ/W8B25Cy8rpALAwrwR5prUwAGBaN4KH
         jU8W5JJ/VwHnz/AJDiQaoVTLxt5zWYiTD2Q6wbuzsziWSjLwTB06I8LKg/BpWrDEMb4n
         Sw0nS6DI1CjLMBPhEJe+IrdC0rkPh31+hbUGSXyiNpITl+dNCofeGsyW96Q5NjZYqqPo
         FhT/B/7fNtM5BXMV2Dq+XgBQwgI9Ma0cTB45NtjkMOoqZFn9SLVWg7NrNfXiquyDLiK4
         44Wg==
X-Gm-Message-State: AOAM533J4sNCOk5KdQfw7d3CraUT7ZN6RspT56s9HCLNsA4BS49PUqZw
	ERNtN1ERCE+ZeWqNxATCopip+qqX4mTsHg==
X-Google-Smtp-Source: ABdhPJyndYoIcTCS3dm+M9PX2uoyLmZoRPA9TkWoxEq+XSLquOxmceP5+Jxo/uWO5UveDVerbcagmg==
X-Received: by 2002:a17:902:7594:b029:d5:eda6:fb45 with SMTP id j20-20020a1709027594b02900d5eda6fb45mr11905703pll.5.1606592390280;
        Sat, 28 Nov 2020 11:39:50 -0800 (PST)
Return-Path: <ticotimo@gmail.com>
Received: from thetis.local ([2601:1c0:6000:9640:58b6:35be:25dc:8a78])
        by smtp.gmail.com with ESMTPSA id z29sm2629795pgk.88.2020.11.28.11.39.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 11:39:49 -0800 (PST)
From: "Tim Orling" <ticotimo@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Move numpy pytest rdeps from meta-python
Date: Sat, 28 Nov 2020 11:39:33 -0800
Message-Id: <cover.1606583783.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

This series in intended to be applied on top of the previous series
moving pytest to oe-core.

Thanks to Khem Raj for reminding me of these additional necessary changes.

This series:
(1) moves additional required python recipes in order to enable
    ptest of python3-numpy
(2) adds self as maintainer for these new recipes
(3) upgrades python3-hypothesis to the latest revision

The following changes since commit 7790d9b16011aec9551dbb526d6e558772670165:

  python3-pytest: RDEPENDS on python3-toml (2020-11-27 18:49:03 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/numpy-pytest-deps
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=timo/numpy-pytest-deps

For convenience, the same series is also available in the Git repository
at:

 git://git.yoctoproject.org/poky-contrib timo/move-numpy-pytest-deps
 http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=timo/move-numpy-pytest-deps

Tim Orling (3):
  python3-hypothesis: move from meta-python
  python3-sortedcontainers: move from meta-python
  maintainers.inc: add self for new python recipes

 meta/conf/distro/include/maintainers.inc           |  2 ++
 .../python/python3-hypothesis_5.41.3.bb            | 14 ++++++++++++++
 .../python/python3-sortedcontainers_2.3.0.bb       |  9 +++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-hypothesis_5.41.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

-- 
2.25.0

