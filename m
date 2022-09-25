Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD625C04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 14:03:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web08.17141.1664114615951046192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=u7wb5rve;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id v1so4085131plo.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=loncxFPkP5XKUSf3LuFJ5iV7NZQF40Pct05Gp+Mei/A=;
        b=u7wb5rveWag/x9B24PaE2wmc6cHy51wiKmXxNAqQF8w/7rTa1NJxA1ykVaZvh23q1n
         nxxhfIH9YjCTmGe+LM1qUAkuUe3oucT3Mp1oFTNMwScj6spCrPnnUsi/GVHYknyUek9y
         5HO/gbcoNHuDMo/9dkqq3FN73K+A2VdwwrgSOxx93JUUrTPNGm0+3lzRt1YkvT2Ldo7m
         8Z+OJJ44CjqaqQhGpcVdGgqSmbUac4yb1/HRaPMktKS4JracqyeATUCNbwzU9jQvcQ6E
         5+hMVJHmVik52LUZQYyvEIQsVHdT6sNADa8EKwC//4evHTQFMWlpts1dRJBVoJ6G/8De
         cu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=loncxFPkP5XKUSf3LuFJ5iV7NZQF40Pct05Gp+Mei/A=;
        b=uPRQP9t5V3VSYcOGKWg+FjG+zEF5zqQEREN09qTOJ2nAC6bC7LZlx/MCnQ/c1hyBIF
         vNXeP36/5mhwKrqYgwk4nAHakzjQkmxdIasaNFTNKD/1bHSDJk2HYDVPYvPUzVKOuqTS
         3T1zKYFiqGXsfGMj6rfXrpYllMZMxeXWqubtTF7h2w0Ii1ryl168JfxllVE9jyuIP7ys
         8YKeQELXk6xD2cN1acsFz+KgsR3M26u/u/cyfy6zN4DZLWGWn6xaPOnkLHeuBRnCVw9+
         aBQIqfnyFiQ9aiPL9KEbQkB/+ajNGiRq1ZAK37W096XzV3VobK5A5JZiLvm/uA65K+49
         rNEg==
X-Gm-Message-State: ACrzQf0oVsfqy/7T8AmH8KSzrxz7X9Fqe8JIf0ojv2tMujEgR2HeUpLW
	HygZtKuOhPT8iKE9dhS/8cqAX9SfNUP2cx1/
X-Google-Smtp-Source: 
 AMsMyM6NIvwUR+STMaGjVAgHzJvnXlETxxKl605UGL/tS5yNq3fPTF3qPIMHn2umXoeMh6vGPn8FJw==
X-Received: by 2002:a17:90b:4d81:b0:202:d535:d324 with SMTP id
 oj1-20020a17090b4d8100b00202d535d324mr19673153pjb.133.1664114612429;
        Sun, 25 Sep 2022 07:03:32 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 y2-20020aa79e02000000b0054c33d37c9fsm10116319pfq.135.2022.09.25.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 07:03:31 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AE5429607F6; Sun, 25 Sep 2022 04:03:29 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 25 Sep 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220925140329.AE5429607F6@nuc.router0800d9.com>
Date: Sun, 25 Sep 2022 04:03:29 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 14:03:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171008

Branch: master

New this week: 4 CVEs
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *

Removed this week: 10 CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4158 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-39046 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39046 *
CVE-2022-40674 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-40674 *

Full list:  Found 4 unpatched CVEs
CVE-2022-2795 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2795 *
CVE-2022-2881 (CVSS3: 8.2 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2881 *
CVE-2022-2906 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2906 *
CVE-2022-3080 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3080 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

