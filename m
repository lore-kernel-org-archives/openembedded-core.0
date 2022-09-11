Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED610C54EE9
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 14:02:42 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.10131.1662904962011331085
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 07:02:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sHTqREpO;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id j12so6181074pfi.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 07:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=WWEtmUe3lNyseybqyFhLhJa+uDuYfHHv4Tn85hYBlCQ=;
        b=sHTqREpOlo6guWeQJY1w1HsaFYzW+PFkZ9lG/lbQtxlRRbJNnFGrftOVtl0I01uTb1
         i9Ib14rt3Ht4EhjEauGJpMBBbMzcyZe52fSZhZkGXznjyvnidYGXDNywA37weDpC2rIZ
         OOw7cWSivTsUMppJN3tptbAhUQhmQUNOJ6e7ohXL8YStCHhR933BoVwyv8Q4EQpLqav4
         M1GhGxvPzz1c1Tz8OlI12gIWZvCcRNTSJ8R+1GXQm2+JOWaOaiKVbxmfuPpKF4iKzMFA
         dO0/7DHaTesmNVGtP0tZh2HVgjtqqA1pncasJzi/w4OHZDh92dHNOuf2p+dT3S7cpITg
         tNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WWEtmUe3lNyseybqyFhLhJa+uDuYfHHv4Tn85hYBlCQ=;
        b=eCq/6OY/JKuBVNdpjc5NuWi8vZczc0/Tg5gWLelF+H1AibuTh1nPP+pWCgVwGpNk74
         rJm/oqUFhbuzjGw8w8YVibL0wAIF+4aVJ2+SvjHQSKvphs/ql/OVkVaOR09sM7Y5AQc3
         kMwexjQCSxbs01C2HzUBRrgqZNaUiG1FC5ZdGz0ReM0ECiqaixnqMEEsnhLFpDfnt2K/
         Dz0sOR3FevinwIil+6v1M6VbPobnvPREBDvADBjmzIIhURRzM/hq8KracTB5G+vtDNjw
         GrR+r84uSLAjMtrv4YxRTr10UfivIiy950YeqFSxPBAze96cgKjRUUQoElXyQnHQ10kC
         TRwg==
X-Gm-Message-State: ACgBeo2hKFQibyXBZNbgqjbaJYWXsJa/DXw3GGRvdndrKWcWMkyzNcdq
	5jNXH7pQaNsBwWc7nQv4ZExYeJFzYzac5IiL
X-Google-Smtp-Source: 
 AA6agR5UlzqeVt5DFVbgO2jRCllmy/ifNqP70V+3nu3+YTAGJIjRNv9yg2djGrT/Rhg4Q1NrmWCmwA==
X-Received: by 2002:a05:6a00:16d6:b0:53b:3e58:1c6f with SMTP id
 l22-20020a056a0016d600b0053b3e581c6fmr23324256pfc.7.1662904960908;
        Sun, 11 Sep 2022 07:02:40 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 d13-20020a17090ad3cd00b001ef8ab65052sm3524725pjw.11.2022.09.11.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:02:40 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1ECB1960B01; Sun, 11 Sep 2022 04:02:38 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 11 Sep 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220911140238.1ECB1960B01@nuc.router0800d9.com>
Date: Sun, 11 Sep 2022 04:02:38 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 14:02:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170518

Branch: master

New this week: 10 CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-38126 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38126 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-39046 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39046 *

Removed this week: 4 CVEs
CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3929 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

Full list:  Found 15 unpatched CVEs
CVE-2020-35538 (CVSS3: 5.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35538 *
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4158 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-38126 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38126 *
CVE-2022-38127 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38127 *
CVE-2022-38128 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38128 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-39046 (CVSS3: 5.3 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39046 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

