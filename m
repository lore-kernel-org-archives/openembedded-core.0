Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03758C5AD49
	for <webhook@archiver.kernel.org>; Sun,  8 Jun 2025 11:02:58 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.35609.1749380576497037634
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Jun 2025 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=j4NwWpeX;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-231e98e46c0so32058455ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1749380576; x=1749985376; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/zH33h1RR9/f5PTJFgmdW2VKEtcHPZgc4Dh/Arca1U=;
        b=j4NwWpeXnXXhRS3r1pipqKaTDWM0R8NXsc7rL0aSv0QdYUeRFJm+l1AZgpyomnl0ZO
         YTUPQbwA+Q+9z6vaRICsPzmu+a4nTbFJ89VAtkduQ+A7IoWHNbi3gWwFfY1l7DhxMwY8
         l9uhiEvLlz1s3kdZfqgWoHLSyn+jMMxkqy4adQAne0OTakJq1zFe3H60dZhmyzS59oGS
         0WvjJv5fuVjrtl4Brle2tM0we7Pyzu6LUP8TlYvxgd021OMnZJeLr0GNQzr6zEF3FCih
         rPgc/qb6DkAxWheGuO4yA1hgEryC6Nkhn2VKnIwp/PSCKDBlnSsfrhucuJSesss5+1VY
         9nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749380576; x=1749985376;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/zH33h1RR9/f5PTJFgmdW2VKEtcHPZgc4Dh/Arca1U=;
        b=tZ31R98wsA00WAcFG1tcT4GQDGhXfz4eT8yf+rzW0kz+snm8ca+XxXoEmQ/JzTA78a
         bWSAB8sJ9/GqIwMe5jJqsYojKc1xT0CPBXGIb4jb6+I00H9qNAsn3wX0ZdrG+iZogjXm
         RTuuRogeoRW5vwjWmn3UdwSHR/1UIX65k9Ep4ar+0BDEly2mOQaQgM5jUkLlAQHymJSH
         sVDd1AzmaDLoxgehVfwtI+HQbz86vyng18s9qd565U8JU2uJE4jTwtV/rsma1fONsxVN
         kywwcM3/UrW6Vg1pZW9pxuc0EjaWGrneqwxNuOnr463ly0bs7CY+SqRQ2qddxjUgbBm/
         HbNQ==
X-Gm-Message-State: AOJu0Yy4OxC4IOD35UNrRYWxXIW07tMB53TJJgNNkgDqMh6hwiHAIKGh
	RWEXrSkuz7As2pOOZk6qkXJhLEHaZugji0Ao+wbCdThAsdPWaqfMN3Krya/svMGYBVGHyW7et0c
	1b3Z2
X-Gm-Gg: ASbGnctH6p/8m1BBvg/9Z66WkK8jl0Ku8VCqs987OHtxXYSUwjzTQtdnKIXGTbJsxnL
	MXnGtTNuigkV4e+z/RfP63yPeyw/WSuSRojlXBXFMnMuHv0qAYTWVCQXG6/b8H+Vl/kjCfsK7HT
	itrLnv+I+Ugxt9it8Kyc5TJjIKM9Sip0/L16jBtZz7JKPDjTB9ScvI2wkb0kfX8TjvD/T7pTh3B
	+g+gGaz+Lynh6TaMLHHCPVMvM1Pfkri4IkxwNT6A9p6X2Z1E4x6TbFkHicebyraA3Tyq/SPDyb8
	N9X+VX+db4w84hAmKNg0Km3W4A2XdV6ZogBguXY8LE9aLCqT73l8n1rHfVO2g6Ihs+0=
X-Google-Smtp-Source: AGHT+IEA8zfC8RcfswHiJU1+U+1LTlDSu/ooQdXY6LNw4qPg1SPNUQkxCtmo7bZrV/pmRbc1YoZy5A==
X-Received: by 2002:a17:903:1107:b0:235:225d:3098 with SMTP id d9443c01a7336-23601debd84mr133607395ad.46.1749380575689;
        Sun, 08 Jun 2025 04:02:55 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077f21sm37932895ad.48.2025.06.08.04.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 04:02:55 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id D5DA0100328; Sun,  8 Jun 2025 01:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 08 Jun 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  8 Jun 2025 01:02:54 -1000
Message-Id: <20250608110254.D5DA0100328@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Jun 2025 11:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218213

Branch: master

New this week: 1 CVEs
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *

Removed this week: 0 CVEs

Full list:  Found 27 unpatched CVEs
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
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

