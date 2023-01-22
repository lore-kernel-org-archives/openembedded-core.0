Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD5FC25B4E
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 13:04:13 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.17465.1674392646696838094
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 05:04:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=U+9+XGO9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id p24so9059114plw.11
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 05:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ5Ym9DSyLgufVgwDZYngY0VThqOB5Z1/XvYP6LHH5w=;
        b=U+9+XGO9Wwi98CK7MORsUgQ1+nWFmAvN6gQ0ct2emnxofTJ5cdyE+Tni3in3HoJ/8g
         YLDZcMt2bq4vBIBNLm0z7TdQLu5qk8S2d0axrxyGk+Ft9hjS0ak+aHnyM8kApMcmud2l
         slERd0YJ/gtX2kwwJgaVU9ANc88tCX245Dlo/59W9jJMy78Gi1sDXc6ZYfj5rHukmagP
         Vj8igjcVf2wKwrIeJITHzvGL8luivv6VuUKgkZ968mNpXYxdmMGuGabIVVNaXK2gM/MP
         y338iWW/bzB8pu/HNgv56Z/371himtIXQ07nBSLU5tIeSmcO6BFzNs1Qp2IowtI+bu/U
         5FNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EJ5Ym9DSyLgufVgwDZYngY0VThqOB5Z1/XvYP6LHH5w=;
        b=BfvkIypEmrdp1/yqdpoCm4D2U7lJmirCEHVETP8zAaXqzKrMTBgIERi8PbrWH8xX7N
         vpGbJPAnNPGC6JfuAsqXf/8R6gzeYUI9Vw7b6W8LJxgogDKFRiddGdI161k1IoIc79WM
         He+nKvQ2zEL/t5QjNqgQ63U3TUEHRGdGcYGMFMfYaGJx7gz4/5LnkmtpZFgvJ10liBBx
         pMaXL5lFoXyFw9341KQXEhpboTenclAfA+hrTFCfVKDRATlBVXOZhGQxFPjr1pXhW/U7
         x4Jz7xv4pCR1C11lMlcW/yKpK8L2ZSAtkfI/payE89AR8K9do/c4t9MTvQWJeMkFwV30
         AYqQ==
X-Gm-Message-State: AFqh2koWprCTzx9Jvq1vpTUnOI16G0j4OuTXH8DhC9eJWvBtfgTMSpBo
	K3pQ/57Z0ysSdq5viVX7wwkKLVSouJ5sDFqRf6w=
X-Google-Smtp-Source: AMrXdXv7xuDaJHvVZrYx+eNV4kvS7VbgZ3xPqnFg6splU7pVRERy/EECOTlwZ46qosR7dhlCDYDKvg==
X-Received: by 2002:a17:90b:4d8e:b0:229:ade0:d0cf with SMTP id oj14-20020a17090b4d8e00b00229ade0d0cfmr20239533pjb.3.1674392645563;
        Sun, 22 Jan 2023 05:04:05 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id y6-20020a17090aa40600b0022bb6d75a6fsm4028739pjp.15.2023.01.22.05.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 05:04:05 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 0431D96035B; Sun, 22 Jan 2023 03:04:03 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 22 Jan 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20230122130403.0431D96035B@nuc.router0800d9.com>
Date: Sun, 22 Jan 2023 03:04:03 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 13:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176261

Branch: kirkstone

New this week: 2 CVEs
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

Removed this week: 0 CVEs

Full list:  Found 20 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native:libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3996 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3996 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-40897 (CVSS3: 5.9 MEDIUM): python3-setuptools:python3-setuptools-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40897 *
CVE-2022-4144 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4144 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41717 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41717 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-4603 (CVSS3: 8.8 HIGH): ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4603 *
CVE-2022-47629 (CVSS3: 9.8 CRITICAL): libksba:libksba-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47629 *
CVE-2023-0049 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0049 *
CVE-2023-0051 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0051 *
CVE-2023-0054 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0054 *
CVE-2023-0288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0288 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

