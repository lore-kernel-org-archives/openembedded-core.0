Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF01C7115C
	for <webhook@archiver.kernel.org>; Sun, 22 Jun 2025 11:03:00 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.24320.1750590173291524459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jun 2025 04:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=b9Se3nZ9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234c5b57557so33041655ad.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 04:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1750590172; x=1751194972; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpmMEpkCYBMKdGZd+XSXYtzYyHHyJ7JvsNdyDW0IVt8=;
        b=b9Se3nZ9CWBujeMEgAhinkYSrzGweyWKHlc3lXAL2oyjXVhS0vzvuDmmbT1qdiaiTq
         yyHBKpUgbdj90hSexkCor62vpfXJRShIEZmrzVjCDrUI3n4H/6UDyF4xLdGTkFnt/Eva
         UVkAE/pQBaSeSyNSTtEIbZIgjJWsfAAcUDHAJJMOhvM3+jqaWfYtpy7ABin4LxcPfkM2
         8V1LKtOcAEpIVeFpdCCRmgrEGHmmtoduVNDjEH7oC5lJb7jpZfBUM6JLwsY29j6v7Svf
         EKpmn1hieseJyHtppPOcIygr9nQev5EJioeKXMpJjYOYSUuDsDcIRcukopa11x6nSAYS
         F7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750590172; x=1751194972;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zpmMEpkCYBMKdGZd+XSXYtzYyHHyJ7JvsNdyDW0IVt8=;
        b=b1DCtPmstzl+QYrReM4xxegcfom5ASoHroeB/VOlfa7VZTA6w2+dTylWKYGRPT2pdC
         z85/TyzpFShCw025toLarvRkXKr9d+HIS99FXYQqDBCvzD9i+bLwk3Xhiw0DVZtnEjxZ
         7ojdhoACMHKZowBJpBGq2ub7Fp4w97NfK5Yk54wrbr7mGShy0teXYBM16jloJB6rBtGC
         67ZA8keLOJ4FdVCPF4PiodmBp2yVvUpyd0vpU6vjakrD0K2/5Jqfa8qdryxhqfoFb/Rv
         Vqv+hiNdxTHiDPHxZs9B++sIHBvN17PPT6WhFyK0jxf/rUmaSQUq0anY0159ZdULy2Rg
         3GOg==
X-Gm-Message-State: AOJu0Yy4bWDOyvBJcO1ykpc5D8fHDu+4VwGjNJ1W0WDjZ4Lauxawb9w/
	8jI1KfnvM/wF/pwP+ekzjIduDbJPMjdVCm/qFXNiScWqGRTCppt6t0swnMALRIz6/dMqMt4sPFp
	J5H9b
X-Gm-Gg: ASbGncvJqmcdArnZCMM0hmx3WL2+LrCGKoV1aJHJNDwlBGGQ43i72DI9xZeGxsfxZ+N
	FmEWBsIJsAGglhDc8aq0pbS6r2Ui4AIJATurATXP1sTujgT5BeP7/l3CotGlPbgSEoUDhlrKfOz
	LUrX7IqBTG9xwZN3wvJQrb3jGYHOc1W9qLu3xo5RHKbKx2Xjf5V+vgBu4+BaOUVmTvK8Qiqq2xp
	OUzwJ253zpAmN0iayFdzn1shmph1tXXdy4c5RHh+KpVIWeLCiD0TMvKYntclCmvoNJsvNl0MfZr
	2xhIAoBJikoifjU8u99zw3B0yPrEOu3PJ/rUMumJG04o74dY8y91Drky8fV9lXz/Duw=
X-Google-Smtp-Source: AGHT+IE+AGy1GxU4D69Fj682mJMNrnnoNUI9zXACMt1M3g8idKailYbbCimx4XHXErEUj8vtUfKzlA==
X-Received: by 2002:a17:902:ec8c:b0:237:c8de:f289 with SMTP id d9443c01a7336-237d996bf44mr133570555ad.36.1750590172433;
        Sun, 22 Jun 2025 04:02:52 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86103e5sm57775335ad.120.2025.06.22.04.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 04:02:52 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id A3C6D100337; Sun, 22 Jun 2025 01:02:51 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 Jun 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 22 Jun 2025 01:02:51 -1000
Message-Id: <20250622110251.A3C6D100337@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jun 2025 11:03:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219170

Branch: master

New this week: 1 CVEs
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

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
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-5914 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5914 *

Summary of CVE counts by recipe:
  linux-yocto: 23
  libarchive:libarchive-native: 1
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1
  sqlite3:sqlite3-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

