Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.551.1793897295789651610
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 08:48:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=Mcojdcxk;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: vgharaee@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso14686565e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793897294; x=1794502094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QAwbWAVpCXTHqIsaKWpkjnCnzdZTuBOlvCCuU14RAzw=;
        b=Mcojdcxk7hSFuP4rywbHWIWxkP616pt1B9eC9i4KOHHsj1LPLiZsbtJK1twMb20Kiv
         JUCkuccIKZsZfB0jZnW95MPOOOb7wcyDHGXgzTFamMezvZadDyGLkzDCLTLIxWD4yZHj
         0omnMht2ZAJs6B2CgNSKes7kCNJAvq+b0l43SjKvEb5XveEzdnl/3lngYCNlKWkf4lCD
         MR9kHXjR7GyiCn4k90XfadECfU65rXidfl3LkX/AfG9PxoTW1Ng35AvgrIMzT20Gmrdq
         SuzkVyw7r8Qhe2ru3BTaje4qSGdAE5kDwry0oPAg++LNXDvQxnRYzHFUR4314Ne3+lQW
         xNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897294; x=1794502094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QAwbWAVpCXTHqIsaKWpkjnCnzdZTuBOlvCCuU14RAzw=;
        b=G48FNRiNovjN1nf+xgp8WU6YW5PUJQ8DSnI3lNlwUDiCEkvK4Q6P8ioCb6hQ0fZ+ag
         Xs1d8EuDHCmAcPr77JUpcefKQ44/1QteQ9Nmvh1bjCdx0m0EURtdIVkdKMi6r6gPLikb
         qmN71Ssidq745A3LcPMTrVpoORebv89yWQR1lluQRKaUbbTchgNLuxhTSUfs/eRuGj+v
         AdhUfghGpcutOxdgXqDuL0D9jeYaO0tqNbmzNzFFbM4x65Rywdsk9fC6s90Ots87fOIF
         fdRdx0v/WCee2L63gn6EP1DAHgShut3cwP1EySko20oi2ZxDPOFR3cPE9tg6U6xzsgoM
         2WpQ==
X-Gm-Message-State: APuU4Z9Ja5zl0s4XOQmPVqDlJO6UnKcCviku4+CHC1DZTMTDyiCsdIje
	wP+fjDkbPa7gdIA6OgTPfxPqZh4VH6fM1kbyGJnBdDq21wQq/EhrkZ2qZa+Spw==
X-Gm-Gg: AYBFou2CWn/VAf0jE4/Ilev+HwNpuGoOxwYo5T10uM3CXoCTRUvm+UJqatk8J7xnb4u
	8Upa/pxrCgJC72w7P+M+vfBDUFLEYLk+3dD6SBoWRe9E8YWd+MDeQLnerxMaR3LjU+9Eq5gwqmi
	XHCC8ft0wbMb25ByaLNIURoxzJ4LI+zXmSEaf1YM7Ni0K67J4t1MlEW6L2mafdTyEu1hcycP46J
	HwKTDRn0wSLHslio1JL/sufoQiL6UxXwfBgtRJSgVC61gcHgCk5QnZehQquLfsiNeheWah8SyjM
	NAPexDPIBq2VCIkrVsIVSoqbXCUS6O7x/DsFejKETbcXg4vXlZL/38lgkenz8y7EA3n5DLMGyYx
	fLq/q8bWvVEcnaY1/VAunlzyJU3K8Mu/ZFEYw9AMbixdV09RtpMij8DJXOO0Jgw4ftsT0prf6O0
	lVNn6UcsDqiLLrbORitRTzNMz//2C2J5VwIO+M3yBSrb/36QpvxvQH7LWJMkeA8Dnr5xFQO1F8c
	VUtGlOaOZoMSDCPWyrp3VQk93yz3TXR5eVAcGs+QHLHAlHgtWzu8gBYRxennfc9D3SZaL50Fakm
	7Tfv2g4XceLimjW81GvYAwWxDs+WpwHF1t90Ejs35f8zrSLRiRkTOzw3vcRRFOFw0PJ0
X-Received: by 2002:a05:600c:c16a:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4ac16fa352emr438959145e9.7.1793897293544;
        Thu, 05 Nov 2026 08:48:13 -0800 (PST)
Return-Path: <vgharaee@gmail.com>
Received: from vahid-mr.t-mobile.de ([88.128.94.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b63863d490sm42536975e9.2.2026.11.05.08.48.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:48:13 -0800 (PST)
From: "Vahid Gharaee" <vgharaee@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 0/6] kernel-fit-image: Add support for multiple kernels and FIT configurations
Date: Thu,  5 Nov 2026 17:48:20 +0100
Message-ID: <20261105164826.1340446-1-vgharaee@gmail.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 19:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249571
Content-Type: text/plain; charset="utf-8"

From: Vahid Gharaee <vgharaee@gmail.com>

These extends kernel-fit-image.bbclass 
to support multiple kernel images in a single FIT image,
with custom configurations selecting the required kernel 
and device tree. The main use case is to package different 
kernel variants, for example a standard and a real-time kernel,
into one FIT image. Additional kernels can be provided by 
another recipe, through BitBake multiconfig, or as prebuilt files.
The serie also adds validation for kernel and configuration 
references, improves handling of DTB aliases, 
and extends the FIT selftests.

Changes since v3:
    - Rebased onto current OE-Core master.
    - Adapted to the upstream removal of synthetic FIT_LOADABLE_* variable values.
    - Updated FIT configuration tests to retrieve BitBake variable flags through get_bb_vars_flags().
    - Preserved compatibility with existing Python-only FIT test fixtures.

Validation:
    - bitbake -p
    - oe-selftest -r fitimage.FitImagePyTests (16 passed)
    - oe-selftest -r fitimage.KernelFitImageRecipeTests.test_fit_image_multiple_kernels
    - oe-selftest -r fitimage.KernelFitImageRecipeTests.test_fit_image_ext_dtb_vendored_override

All passed.

Vahid Gharaee (6):
  oe.fitimage: Support multiple kernel nodes and configuration selection
  oe.fitimage: add metadata for multiple kernels
  oe.selftest: Add tests for multi-kernel FIT config
  oe.fitimage: Add custom configurations and harden multi-kernel
    handling
  oe.selftest: Improve FIT DTB alias validation
  kernel-fit-image: preserve vendored DTB aliases for external overrides

 .../recipes-test/ext-dtb/test-dtbs-as-ext.bb  |  11 +
 meta/classes-recipe/kernel-fit-image.bbclass  | 136 ++++++-
 meta/conf/image-fitimage.conf                 |  55 +++
 meta/lib/oe/fitimage.py                       |  95 ++++-
 meta/lib/oeqa/selftest/cases/fitimage.py      | 359 ++++++++++++++++--
 5 files changed, 607 insertions(+), 49 deletions(-)


base-commit: 35d103be8b1a2346b7d0a7ff83745ad74d6817e2
-- 
2.56.0

