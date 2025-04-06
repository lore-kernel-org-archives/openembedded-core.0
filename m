Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45A29C3600C
	for <webhook@archiver.kernel.org>; Sun,  6 Apr 2025 11:02:51 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web10.22980.1743937369636854213
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Apr 2025 04:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wNbUXAdk;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.182, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so2629595a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 04:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743937369; x=1744542169; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbXv+wUuGqVlg7n1iYmL/Ryuq9ACxf45Il90ZsbZyag=;
        b=wNbUXAdkrROBK16GaLzDeabwEobMOGgBR4nX8wz7q4v+kU+KvvmJUZb0xTEXosIqvf
         dLS/B2Ox1Pce+wa82D0HqSuXUOr6VU8P6uLlkcC78jT+1/LkzxoNFPJT1oWRZUTyGCbh
         z4wmSx6GcEaDg+qTH8X0JbyKWuJZeTMX+lTpRiUg5HNQGJsssNo9DVAlOnovdtSTm0Kb
         TJMqOFpZqK9cBRchtlSUDWIm9pcKmG8OR/f6MAdm5U4u3UUhUXscrHd2XbtNobCGTGU5
         NVezOXLXHzOh0lIQMCMu95xauM7BvbM7J+lbfVExcfhPIEusP31y8KMDyeXBnjAMm+LO
         ZmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743937369; x=1744542169;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XbXv+wUuGqVlg7n1iYmL/Ryuq9ACxf45Il90ZsbZyag=;
        b=jcKivyGpk11fm1nvtoHve37Yt2tIYPhQEYO5BXbUBtx5hGNmMS9x3sw+qLOoGVgcs+
         XgZIq7HSO9kemzTtgK9iqOz13PgRA6GBzQY+kW2qjIlfON3YZwMwnBN63rBDP2zsvckg
         T6A3wL+ekDeXRvDmJ47gjVUX+z7aBqqHvggx2Ga3ZWNGrLfrWlCy9bldBOWZXlcsB99z
         TjVqsw3r9lp7t9ufXZ4TJcXGGDKCh68gYX+e8MIoBUFckidzAqgEt6XZ1jOG1473Sz4E
         lfDszffqdVp52CnAu1GFqNIzeqBQGGxZpWxKNPl/7rev9UoGTLKrrA1nNnW5qOZHvwNl
         NH0Q==
X-Gm-Message-State: AOJu0YyyZGfDTy8coPnZkQSuNQadi8N5dRlGc1iYpSIvLAUbNY4cE/SE
	ERP48emGTaElxdpim1ZFSm2QnKtyVUvyIJ26geyRlGrUWvCIVhTi0ZeP65Tn5HzfCDZi2ANoVGV
	U
X-Gm-Gg: ASbGnctOMcttyl6dFuZf/AdxW6HaptmLgOHmez0CEnpTLH41VLHYiooNhrblXwKw4te
	QVbSGx+8eLa7a94Zp8+fa+pHSvpr06II2qcTkrZhaAM+dbCWzad33I22zP8C5NWCfJ98ASfH/W8
	ak2adW5MOC3O47Twa8iWkRq0O6pvUTb3bgLAC53Y6PMkpK/Hw74rhaycy4z+Zrur3tjo8xtlSy4
	3llRLgG3oKEYfX0QHFt8RL1JhpSDXJo7SxAz6h3jKbNyBEYiektOQSpf8NMhoboFwtHutMp/aTS
	VjS9vCu83INp1TECN4K927jbVTBRiSUi0+/a2UAVitg0mTPFdtp4jDrIG6GQ
X-Google-Smtp-Source: AGHT+IHPtTBAwiz2XoTOLHGYuAkO+t7MgZ1uzGxOOUB2IZaviHDdq5MYVLN26NzUGbNHxM/+gJ00og==
X-Received: by 2002:a17:90b:5150:b0:2ff:7b15:813b with SMTP id 98e67ed59e1d1-306a615bd8emr13275238a91.17.1743937368545;
        Sun, 06 Apr 2025 04:02:48 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a86asm6903376a91.32.2025.04.06.04.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 04:02:47 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 54AC91004B5; Sun,  6 Apr 2025 01:02:47 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Apr 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  6 Apr 2025 01:02:47 -1000
Message-Id: <20250406110247.54AC91004B5@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Apr 2025 11:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214379

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 22 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3079 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3079 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-52904 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-52904 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-38381 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-38381 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *

Summary of CVE counts by recipe:
  linux-yocto: 19
  qemu:qemu-native:qemu-system-native: 2
  libsndfile1: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

