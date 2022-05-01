Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B02FC433F5
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 14:03:08 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.34045.1651413784662737706
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 07:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ykE9CZPw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d15so10746505plh.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 01 May 2022 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=EQbQd7c06SDNf2H/yIJ3eMlY5OTEzlx0R5c+zDtw2PM=;
        b=ykE9CZPwn3GT3Pe6ccwQVS+0kfp33T9thHyuI7mNEzODCtb8EPNH2rg/GdnX5oqy55
         vuVlTFOFI6QadtcG7GeI9JEjbYqXDxuf8rxsF2GUxTSKSJ1XokCRliPloCMvj/w7JYDw
         FGlu7yIjFUuUwWq9Bk+nLSDqy2QlciO2vv78Mg/Ccv9M+aSH6AgS7Df8YbPiE2a7CHXz
         yzF3CYDRPsgPeNlnIb/FihP+x/IeCX+cOsBl1vY2Hd8qUp3kSDIUa6g2IQeRMaw+IpLL
         UvQCG79TYAmma5Dme8YKfJaHwfzbjsVx3Q+70Di/62eBnhRBhxGMQ2AVRpkyfNhUdxyI
         eRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=EQbQd7c06SDNf2H/yIJ3eMlY5OTEzlx0R5c+zDtw2PM=;
        b=xMCsq5me1Pxndcd+7sAV7fF7MaL1LvsmZwewz9vLbRP3vO5N1ozF/YGdpGX5+yXR/6
         bk7DiM9uVPV4ViogKgje001DVz6xxxvqqd5cGTSs0LL9jnBxkQfA13H9qfMLTdHZXIfH
         gXd5MzQODwoh6qfxaqAHZcUFVM/kYlEtJcGBoGEvhJtLIQQsWzX8n+6PujMJo0BqQxks
         GDjmOh31cGWoG4ZH2IrwRpbUwAw/G1QF7lbuB0XyWXi+Q50oDqBfasEZiXeLNlyuG7Pi
         9txIuYQakVAlMKQyfS+LpEFzZzHBi20flufOfh6w8OSkL9QbI37HNldh97b9k2b798oG
         NlRg==
X-Gm-Message-State: AOAM532V1hxghIaxMcROwfjN/mBBHUkkpGY7DRed566cSLYxtRjxRUF2
	SyrDou5qO9YdPTUj6J9VZmuD40MaTftzaLIsvBg=
X-Google-Smtp-Source: 
 ABdhPJyVWenYnhl+2V1pfQdJ7IchbrW0k+VjLbCDa5tgeGXxl6Xyy4l34Ibhx0G21F0VNvvuPzItwg==
X-Received: by 2002:a17:90b:3510:b0:1dc:bac:64f3 with SMTP id
 ls16-20020a17090b351000b001dc0bac64f3mr11837912pjb.137.1651413783235;
        Sun, 01 May 2022 07:03:03 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 c14-20020a62e80e000000b0050dc76281desm2920880pfi.184.2022.05.01.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 07:03:02 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 89C72962709; Sun,  1 May 2022 04:03:00 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 01 May 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220501140300.89C72962709@nuc.router0800d9.com>
Date: Sun,  1 May 2022 04:03:00 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 May 2022 14:03:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165081

Branch: kirkstone

New this week: 10 CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *

Removed this week: 6 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *
CVE-2021-44647 (CVSS3: 5.5 MEDIUM): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2022-1056 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1056 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26280 (CVSS3: 9.1 CRITICAL): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26280 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

Full list:  Found 15 unpatched CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *


