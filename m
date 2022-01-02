Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E5CC433EF
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 14:03:33 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web09.13224.1641132212753084123
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 06:03:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nskabd3w;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so30097624pjf.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 06:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=rBcMcfa/rey3j+2QOwBquMgU1IyUsxJTdb1uS9uI+hE=;
        b=nskabd3woRADWvT1H4kWNK2rH8dDdRG/ONNFa3o6PrqZTjJKh3xKTS6cLY5MJH2XR5
         M7yhCzL+3TsEo2O1Rol/fpDW4J/cfLfarxcBdeItIhrvfHM85ZaXldubZGueqyZtU3l3
         ceEYCT7M84qHNUVfI8ig1zbtnWtGQay9QiVwmbixu6uVuHftVDRE4us1l2/ILOm75jRM
         STLQrK/lYVcLODObt+po/KH0N7Dt2lozXFU1BqzE47E1MXoJ60yx2Q3/TXj7NPzSViqf
         RselKVd34avc9A3iyFQOM/n6ZGtq3Ff4zBqvHCtM32kXzCRsXfd77WLWkipju12OpTJJ
         MMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=rBcMcfa/rey3j+2QOwBquMgU1IyUsxJTdb1uS9uI+hE=;
        b=z/zUQSw4SkZJoazfopB7Ywa7AkJouE9IpZxyW5Kq1JMgKQGmZeAXhgm9Y5viWo/QGA
         KTbpFh6WCse9ilh27sqkIW2Ofu4zz1FS1g5lFrvWoefpsPNj8SoyDVCNZnVtZJjkwfC5
         a640zTHqzHw7H6GsmjaeOBJPTAZz2RBfTcpZhEldbiO66dW+ANAjzpzFbj/edwixC0aA
         4TmBK3J0qWU9ueMPmTGgdKUIifWrlDf5u+EQ1VGobMYWAoKGyQcxkqFqhcHpWszPcbiq
         eV5yPo6TCXtZJdq0cAoI0KUkkQhwIMsND9jqCFmxOCoaZW3Sz5y2nBX0NiPbdu11LndP
         2UUQ==
X-Gm-Message-State: AOAM530pmLS4cL1Oal5iXYkYlwReig9iUE1PBRmrqJ1ruukup3RR9TSn
	W69bR8SZiz2tP/7uW3IptXc8hcJinnZnfULWFmQ=
X-Google-Smtp-Source: 
 ABdhPJwHdF2YbxUOrNG2nCJC1yEItbFVqoYg+dWAa5RMMCfJ28EVQfBRj+PyNWGeK7E/VxHGjJEKwA==
X-Received: by 2002:a17:903:1107:b0:149:98f7:9629 with SMTP id
 n7-20020a170903110700b0014998f79629mr20184558plh.160.1641132211483;
        Sun, 02 Jan 2022 06:03:31 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 q17sm13312640pjp.2.2022.01.02.06.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 06:03:30 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CE5649606FF; Sun,  2 Jan 2022 04:03:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 02 Jan 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220102140321.CE5649606FF@nuc.router0800d9.com>
Date: Sun,  2 Jan 2022 04:03:21 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 14:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160101

Branch: master

New this week: 1 CVEs
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *

Removed this week: 0 CVEs

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

