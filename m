Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6669.1792500751336087021
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=V8Fl3VkA;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so16670095e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792500749; x=1793105549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlkSMnzcD5OdZcGiDPte5c2AcxNmfZP9WAVGp8aZGOI=;
        b=V8Fl3VkABdLmwFM4Ysi8np9d9l+n1EZJEyWKAORcnGqFeN0kNEOuHqoB9oxWrv9Xg1
         SkjoShkjIH6GIWuctDfxwX4Z88pU6qFimimEOqp56uB3qLnJqqkCv8Y6EKSb74v/HISd
         5XLBjaTlVNMlgZ2hX8U+4e39bhMPpIIytTZGjKmt/5i/eQUn2QX65BC3/fdTFEiUieA4
         urcOeKHUnV0xxt1RG6XdDvyIlNbkW8oAkWaOTSLWyNljBmSu8QdwOSpyufXkdKYo5rrV
         B5TYML7FRx+vwj/YpBWqhyFFJczxcwzuCvFSnG3rVni5/iq47Aw8nkLr2AgYtWx0rKhM
         uQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500749; x=1793105549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZlkSMnzcD5OdZcGiDPte5c2AcxNmfZP9WAVGp8aZGOI=;
        b=inxEWEuMv6rsTPe5EKUsXWWS0ZxIHbeBbbbaQ7JjCAhC55U+1tAFXf0Qa32ou2Fo0H
         tn/RJdhMAi/1Yle/CzwDcthICmTZS9hx66aaq6Csg4ELCg9IM5pj2Ac0p+SaPtntmjjm
         J2AWCkN/eEQixl68EGGqfVOYB9ukSXrBuaoWZ06cBefJgcpS5219ka8js4RS/qFsoqu+
         aKz0dQYt+0SEFWCb4Y56Hq/t3mCfyk1JnMhJLtOeFrahyjjsNCSGTc4h1nYjz1ZzmVUQ
         cz09rNFXfJAjA6cj0WaJk3er775W5kVm0hU22mL60jWdEy7QXgu+etGNbuXTWMbnoOT3
         ApOA==
X-Gm-Message-State: AFq9FYJrLeop1P1FGyNhxmTQ8GrmE67bYLWha+3OyEGn6F/yqZnr4Zls
	0r0TvRn+PlAuUWiD/TxlPkn5L7BNrsxJ/ap8KCG44oegOlKmQVnHJgC77vIhDw==
X-Gm-Gg: AYBFou2DmpCqQ16jpGF4sEq78v2YJNRJfUA7BIJ8M+y8R2H8XjRbn+VkzoaTzC/LauQ
	bD1Y6H0tlVLFmeryWqoEoDgHdYRm3BI5IAA34SjR41RL0oFV1lNyb45QzyhJZk8J8/9MOW4E3hf
	mTKDy+71drpUAMUwi3maNA+AIKirn+mLNLad5HaQqRzn4pQe+0VcO+evSdUk2898/G4ZMa+AC2y
	xNTxFEv57FFYnLM+ETZONvvBwentSAn0R49Gv3bIxNcrBQDBUzaF5UesmUtOcUGCZiV/GgUx1aG
	HM32uvSlZhWA13AF6iiVihlXhiNPS0BKEIy/4MM4r8wdH3Goo18nxoHb5Giat0Uk7kIUXwJCeGf
	B9pd0avuKfnfC4BtKIRyaUy8J3yEO+ll4LWYtQdJCDnt67R9WSHKVJcV/ao9gEYDpuN2w0Gs8ow
	NdZU/6PsqelH7osi/1uiPzvVjq4/aVaL+go/WAA8dRgLfjQqLCeKO9jVJD+sT9bEWhZpHhUYvvV
	ulCNzgzG4C7KCfWOE2Gx2DKj1U3dZjol+9vAVJBsRgcKffO/Q0=
X-Received: by 2002:a05:600c:8b6d:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4a1e6a9438bmr125871355e9.0.1792500749189;
        Tue, 20 Oct 2026 05:52:29 -0700 (PDT)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80fdbbsm6335698f8f.17.2026.10.20.05.52.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:28 -0700 (PDT)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/4] Add support for multiple kernels in FIT images
Date: Tue, 20 Oct 2026 14:52:29 +0200
Message-ID: <20261020125233.69997-1-vgharaee@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 13:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248279
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

This patch series extends the FIT image generation support in OE-Core
to allow multiple kernel images to be included in a single FIT image.

Currently, FIT image generation supports a single kernel. This change
allows additional kernels to be specified through BitBake metadata,
including kernels built in separate multiconfig configurations.

The changes include:
- Support for multiple kernel nodes in oe.fitimage.
- Metadata variables for additional kernel images and configurations.
- Cross-multiconfig dependencies for kernel deployment.
- Selection of the kernel associated with each FIT configuration.

The implementation preserves the existing single-kernel behavior.

Testing:
- Built a FIT image containing linux-yocto and linux-yocto-rt for qemuarm64.
- Booted both kernel configurations using U-Boot and QEMU.
- Tested with oe-selftest -r fitimage.FitImagePyTests.

Vahid Gharaee (4):
  oe.fitimage: Support multiple kernel nodes and configuration selection
  oe.fitimage: add new config interface variables for multi-kernel
    image, to fitimage config file
  oe.selftest: adding tests for multi kernel/config fitimage.
    AI-Generated: Uses GitHub copilot (Claude Opus 5.5)
  oe.fitimage: Add custom configurations and harden multi-kernel
    handling

 meta/classes-recipe/kernel-fit-image.bbclass | 129 +++++++++++++--
 meta/conf/image-fitimage.conf                |  55 +++++++
 meta/lib/oe/fitimage.py                      |  84 ++++++++--
 meta/lib/oeqa/selftest/cases/fitimage.py     | 156 ++++++++++++++++++-
 4 files changed, 397 insertions(+), 27 deletions(-)

-- 
2.55.0

