Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96A3CC636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 16:49:42 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.88627.1675788574668512672
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 08:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=7+J23b5Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id c10-20020a17090a1d0a00b0022e63a94799so19211625pjd.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=461HjjwAUHPZ1smDTpIhQ7+w+F1+KeTMYLQ3suk0hYo=;
        b=7+J23b5Zuw35MjLchjxqlFqtp7uJ4gbgmIWorfvp4Z/Z6TJKcVTbqInnMb5ECDngly
         8HmVGumZYnOOT+9VyRefEBau8i90VxaGcSGCy1ttVVAEC5JpWOz8es61WtvRe0jeVyvc
         6I8F63f77/EECWkObrQ1uJ8XCIic9zvYr8H088XDHGc02+LSnwq5hS53vEujwEu89HOF
         znxw+rOS2dYc/i1Mn79GCNqOVmtoHwLNEJVoWDWC8hRr1axcRI2lVirN38BXpjZNljh8
         70GZ0ndPGHxEjigVlR3sVpHKL0yFpXiiKNE86jW4y9u+2ydTv9zzDe/ks0K8KIkizm6k
         Df7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=461HjjwAUHPZ1smDTpIhQ7+w+F1+KeTMYLQ3suk0hYo=;
        b=jXC4GNAfBueD+K1oOm5fuf6LR7AGGZxMaQe+pnscyKbKk5OFnvLP/NBfrj0ZVrl/Zw
         9G5wkFuQ4OTGaVfpPp5GfDmDqCJ1DYEXOvPhNmRmKt8kJIbfhCZIxhDRGBRD8iQbyBVa
         XEvqfkeScEa48odpdw5xXv48tB9adSBoViShuB3KtqE5Japt9HmLmeqw6IjEKohwCDbk
         +bYxBGWW3Bd1BAmBW/bbXGvizLix2vqccTWxwPHWnvIv7qRObg+YCQnTmJNAzv7aWgJ2
         YKS5TFx1X9o1wDvErjHsIF24nZd6hN1JbILtXYrSpWwdih1CQlJoiwhPpSA1aqPFdy06
         OmmQ==
X-Gm-Message-State: AO0yUKUMeEOVRgBMjS1PQCoCj7vJmGBGb8XyZ5XhaYRNfWeXoZqE3eC6
	jtucevh0lNq2lEUjL36Lf5XS8ZVPCLYidQk+3rI=
X-Google-Smtp-Source: AK7set+6j1Jm0oZo4VVQWsClqcqf/uIuX9UdoEtRMLwbHMhYUEeZM7qXaQ+9+1CU1pOnsZ4kN7MSoQ==
X-Received: by 2002:a17:902:e88e:b0:196:7c6d:2aee with SMTP id w14-20020a170902e88e00b001967c6d2aeemr4255405plg.11.1675788573420;
        Tue, 07 Feb 2023 08:49:33 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k8-20020a170902760800b001963a178dfcsm9141179pll.244.2023.02.07.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 08:49:32 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4D379960323; Tue,  7 Feb 2023 06:49:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Tue 07 Feb 2023 06:45:37 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230207164931.4D379960323@nuc.router0800d9.com>
Date: Tue,  7 Feb 2023 06:49:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 16:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176821

Branch: master

New this week: 7 CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

Removed this week: 4 CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *

Full list:  Found 12 unpatched CVEs
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-46457 (CVSS3: 5.5 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46457 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

