Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091DEC54E90
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 11:03:04 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.7490.1748170976582937676
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XZhFarJL;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-23228b9d684so11897615ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748170976; x=1748775776; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eC+Pu3i5PtkJpTAT8BWbclsfFcRrE4kteGfoR3zGGwE=;
        b=XZhFarJLN9OwQ55xymnqoYcxeCUXpt6cSx2D1th7y4ZouyEiw4EBHhp7OC/Rbf4gG1
         bW/V0wCMUppnmHNRw5c9+yQG83esT71iTeekoZJaT+EeZI26spMWjBpzKNK8sR9El/84
         +Ke8Ytwsy7+26tfDIrP8DcGi8qRakhsdk35hf1kpkw1VYQF9jTWJV66CZeVWSwm6xh0X
         iqPr1OLjAeoe8aYrN8DysM0ID/EfM21jWpMJbUdJTkS+CtJmKy7uf0CPO6mVHYQtR5Cb
         b2OQ1cSI0qCcvCZKDDbGFryIVqE2d92l58ga3vlDsLCmWeiOX8o6PIetSbB8aWRbtt2a
         bJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170976; x=1748775776;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eC+Pu3i5PtkJpTAT8BWbclsfFcRrE4kteGfoR3zGGwE=;
        b=ihTKphl8ye2CF38Fsr9WD38JNZNG3jxyzTovMY6QR5A5PkUkYicHzduKdI3ZVMAPyD
         xMC+pvlhXhcs8uo633dioB7LATdF+L5KNIlNqAhGYO4I/+AmzN4EzRfIq/GyNAu+DMry
         yvdD1Ll4eCDkhAUsD00eq3A1ZimDgA6bzeeOf09Jna+Ai9R4duv2118Cbnwkd/Kb/QKd
         T1zSKUZEAB2ebQ8THUpqAhID2bAYYOHOJZlTCfdcOpULLt7OkwDVWmuBnrbCDdawPrZI
         5XK5W2jYVEOIqG90v08fwVRDajGEEO4z2ltL2PjNLDqLN7tzJsKwQKqjFwwLt8Cab9AC
         8iIQ==
X-Gm-Message-State: AOJu0Yzqccv6o9itHDYCjSpjeOODbCKpANj8KW1BC9nPiOK5fE8P6PC/
	NgKuuWwSgXP/cSA2EfAOxM+4zkc5TOb9fnpEhYvBYLnLF8huhJFZrcnbPwQ14ZkIONfnjR9eKhA
	SX+gP
X-Gm-Gg: ASbGnctMVQnvBj/qVZMfeXyhpZpQ/qyD/0Fu0+soVILq/aRc16HSJJIohOPax7uEqB3
	V1EbXImp9MRNfNGiE6TVr4C4ZnBlZsrNvZZlaIrdhs7tES4XOZwgRP6Z5mBdRIEPAWGckw5AO5E
	JD0XADqIHSSkZGAkqfJFCcnLEiuBGXk4Sq2DBYJyNFeWSfCdTfXrP3bQDhTL/FuYx9wSQMWMWfF
	buk671vhq8VFjfKhSpbqQ5eKl6ZpLWXxjDC3VFxnjaThCCKyOhu0bnxCTkL5ql+aEPaF5csTE+I
	DSIco4lCsRLBjr+KshiHgrzaeZNd89Ii3Nt/PwFHhhRBnaASmouH7sRe
X-Google-Smtp-Source: AGHT+IEkswNLEU02BAWb5H9288l2ROyyslTDPDwa7e2WjuALj1f91nnCm/tVgv96M+0l3TLd9rwzmg==
X-Received: by 2002:a17:903:19eb:b0:22e:4586:e33f with SMTP id d9443c01a7336-23414fc09d1mr92215595ad.45.1748170975597;
        Sun, 25 May 2025 04:02:55 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2341e8ca4acsm21376765ad.113.2025.05.25.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 04:02:55 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 9765C10038B; Sun, 25 May 2025 01:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 May 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 25 May 2025 01:02:54 -1000
Message-Id: <20250525110254.9765C10038B@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 11:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217241

Branch: master

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *

Full list:  Found 26 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-23137 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-23137 *
CVE-2025-29087 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-29087 *
CVE-2025-3198 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3198 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 22
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

