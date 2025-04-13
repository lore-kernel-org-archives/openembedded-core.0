Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF525C3601E
	for <webhook@archiver.kernel.org>; Sun, 13 Apr 2025 11:03:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.26750.1744542176620997431
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Apr 2025 04:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iah3zMHJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3250950b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 04:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1744542176; x=1745146976; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6puGhZRZvtkL3IQxjeFouyb0iyRUJyQ/3dDzPv06Mc=;
        b=iah3zMHJdksPZBL8Zj8Ub1apLrcppmOo0jKbXr0lwomZZ/YXiM6dZ4Haf5FxXo1lbF
         z6PICTRpPbgBmC65SjokfeJQ6wCNJqb+bz3g2+GZbAknIURga6XJuA0LsusQTfMXRmyh
         a98I2BpV+jxygfLLX+IJh42c3RW2T8w1vZ7nvEpqI20ThTbzJvN3jHUiQVPE18b11DVt
         +jhgeDwQJLYV2Fwkt5Ec2CL5xCtDICb7OFqZqn6wgHr4ganbqrsxhcNNXBejCSk4xgcT
         DqFIhU70HI0yYY8TVEjVDACL+ykHnUFKP6jI/rQTvJ9PW6tSxUgccpbW66Dsg103phvd
         7uEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744542176; x=1745146976;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6puGhZRZvtkL3IQxjeFouyb0iyRUJyQ/3dDzPv06Mc=;
        b=rv6mNqQZ51IIYMdDyGrPr4anoGqpbPRtbL+o33x8+VQT5QYsxzTeYPDa34CRkWoSc2
         y6eWe8Zuh7QuwtY5JEnEJqG7T35x7jLGXEdKSkpHm0FzfSKCet4LvvxVVLI54PNny5sx
         Vaj1gmsdJ/UflxM9vHsSDX44IqmrXKFAW76rbsDcFM4OxQQrQEy5qS3vCl1tDMEYfDtV
         RgdzgauyR5bD3eNiAyvLZalcKSBnGKg//Punj2zw6vxrVvwoUml4e7n3xgQvzQcHeE1x
         EhDM1bDhW0Wh8MbG3onmHzWfxBVmDR8w/7y+n35yadWl0OitTBnP6sTeTaAyIAW0I8L5
         49+A==
X-Gm-Message-State: AOJu0YyrhVxX98u4OOScabFtb3Amdj6JpUoJZ9SzYUthYhvZZ2C3oH7D
	koMn1aZ/3eEVsOAAkxCCCuKN1Z4ZY+JxRmuxOHnYvs8WmlnjCIA/G2VyMwMsYaVBMW4dDzGdXHJ
	M
X-Gm-Gg: ASbGnctITnXiKrkywdCBOOMu6Cimr9NYSq/Ph74ithSnEF4/7dB+wozrZA+lS1+9FUi
	godSHQIMNJwlqTNeVFk50Ya086X0yYgYXSmGpwkyoJcQLFxbtoO4JeWpclCS2huUTTQu2BwU+Sa
	uS6+jYlDw7BWw4sjwnhYjJ9FWNFlIlkpWVZhbU09TPI99C9qmg8tbBTf9edvU2r3bNeDKjHloth
	ryK8t9L0PWRLyNKHaO+cpTmEIE9DGqwwMq15/k8gigUL1HVfANQuawN4ym8UBy0//zqSPjsT2t1
	LKiwefbOjH3wOBfUTkigB6vzPCO39DInX7LQ6g6HmoCORg==
X-Google-Smtp-Source: AGHT+IElbQ0p636gZY77TyLWRHbrKJllAVKeD9DgqttCJ/WBszdNEWKtfkzz9IXltSEboVSCjIXIJg==
X-Received: by 2002:a05:6a00:189e:b0:736:a540:c9b5 with SMTP id d2e1a72fcca58-73bd12afc86mr11398446b3a.22.1744542175383;
        Sun, 13 Apr 2025 04:02:55 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1012sm4935096b3a.96.2025.04.13.04.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 04:02:55 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 8CFFF100349; Sun, 13 Apr 2025 01:02:54 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 13 Apr 2025 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 13 Apr 2025 01:02:54 -1000
Message-Id: <20250413110254.8CFFF100349@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Apr 2025 11:03:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214781

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
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *

Summary of CVE counts by recipe:
  linux-yocto: 20
  libsndfile1: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

