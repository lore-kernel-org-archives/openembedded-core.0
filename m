Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FEEBCCD184
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 11:53:25 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.23268.1760874804653691920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Oct 2025 04:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=f13UHU++;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso3111275b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 04:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1760874804; x=1761479604; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=f13UHU++4p6yavxIb3/pfTKaB1ERkmp9MYAcNwEje0i4btSx1a8rgShgDsYmjJaXD9
         qXJgYvkAv5s2zIVoD3LoYf0KLaVJL5IfI+21o12YGvw0KijHznVMgRlTLFxXjxDPR1lB
         gAv9BDGVH32+RRuUT0Mq3ey4gMKLRXSxLb72Wcvg5L1rog+OizgcVwDV81PdoIBB+rU9
         HfkFtUWJ1h4E+Q1O6g2vy9UzhUux+tZ17aGPM2mQbE9qw75OIK6ROduiMcr15q8fECuL
         0BJHXgyFqB5BiPvE+WJRf1ypdC71Myh6sRMetgnPjUjZOjSMEQxjvpckRrznXKgoI2CL
         y3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760874804; x=1761479604;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRXpgVi8LPqazmE1K3dm7wH8qJjrn7sIgeFwJUL71/8=;
        b=unhzBcYzdhc5yzMN2rCutXnbhivZ9RbjPMJVdLeA0KCEO3K4ES7nZZZ4SrQMHg5oPJ
         zIl/L7gHG8QUJPamgFY35zlRcZcVk/ML+05FeVgtyc4qH+Uknfi3a3cGtdjZROdbLGH6
         tbUKmlDH+e5kf+94X7Kabm63TvWlAJB0IaYPuPljjeF9ty4kIroz+EIoahKy8Fkq1EJG
         MbCKY3xlkXZdnf6SsvdFvNXJ1rDXc+hhWHJXcwcZU3neWC7AQCvuPie0x5Uwv6jI57Pq
         GBZHpdClgjFy905MjfLxFZR8rf1nxiWc2vyJPvoHmEATURbaoRdUQK93ObLHLP3LggXp
         +Gyg==
X-Gm-Message-State: AOJu0YwTU2gRm6IuKHeRj72SlDtUgz3PnapPg9ScWj7jktzQBZixCaiw
	ZB8a5sEsIabuKlEnIX8w+/3gKfgpVq/wbwIql3ElDPbCAjtttotosQK7uUnPeegBrWmCc4EznCp
	NvHnA848=
X-Gm-Gg: ASbGncvdperq/VAXHiOFoOMNgDWmWDxH1znBdsVTF8fv0W5ICuqy5V4biMhXEB+3quv
	xENySl3Arc9L+uLlEbXXiKNJ8Typz61dYG5+4kpadDFpgyCE6lc8OLoAv1lMPqzc166Zjc69Irq
	Ga22E3ToQ/g+y2OYD6NxLoeiYEJkMjx2gRbcOU4d5VcuFCGyRIuqtcqvOr8sS81RUomdnWErAwD
	+dkXNxG7FjGP51DR+UvbOGeJirRVnR7S05cEUTwtOAH+ZyS11W13hkN+0mfW/zBORnHI7evYkRW
	OviLbCCD96LfLw22eDuHiKzraGp1HqzXJa57J/D0SEAgddVBx/9JA0Ak86hpmpYAeHAwY4svc1w
	3DGuY4kcHjz2mE1G91bz4CRfonbntTvAdq3oBcJWl3OKMVgAJcSHjigXDfHBLxbVkgevlQk1WON
	H3jtbC
X-Google-Smtp-Source: AGHT+IGeaMuUOckPITeiWXqRTvR9Ur/wrI0tRCoApIHOKR2T5AOFhqVSP13AMzU1YrGanZ8IaKfsSQ==
X-Received: by 2002:a05:6a00:1492:b0:781:1b91:8e34 with SMTP id d2e1a72fcca58-7a220af023amr12510671b3a.28.1760874803866;
        Sun, 19 Oct 2025 04:53:23 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f24e9sm5310459b3a.44.2025.10.19.04.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:53:23 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 1C9CB1003F0; Sun, 19 Oct 2025 01:53:23 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 19 Oct 2025 01:49:56 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Oct 2025 01:53:23 -1000
Message-Id: <20251019115323.1C9CB1003F0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Oct 2025 11:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225083

Branch: walnascar

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 33 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4598 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4598 *
CVE-2025-46394 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-46394 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-59798 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59798 *
CVE-2025-59799 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59799 *
CVE-2025-59800 (CVSS3: N/A): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59800 *

Summary of CVE counts by recipe:
  linux-yocto: 25
  ghostscript: 3
  libsndfile1: 2
  qemu:qemu-native:qemu-system-native: 2
  busybox: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

