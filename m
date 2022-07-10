Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D319CC433EF
	for <webhook@archiver.kernel.org>; Sun, 10 Jul 2022 13:02:43 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.16612.1657458153500101824
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 06:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sWV5fIbP;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso2682890pjh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jul 2022 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=nqAyaT4Tpo6mKHzCo+KYhCaFiaCYolfAGf1zufh8Xl4=;
        b=sWV5fIbPnYHuW2vvi5tw3cyrsnDrBjL2bUiPrSZG18ZRzB9T3matyE55IUXr7ybTKX
         MEVv9ug3ZiUWTTvz+zaTOsdmZ8f9hNxZofg1X8ZJkj5zqeP4+sIq3FtmyPN85EhhW2o7
         6tnx7R+iVWpMj0ss1AgX5h7bvG37BjB4j5fwiYhxjMJ1o/RFTPT7hdDfA0Hj2M2lcSxe
         sm88TKjMuqGQtGnSeQN8D1KqAVCBqjswhmX5cgVuDKOrUWi69CBwtjpPfR9VZFfHMqT/
         eO4qSMNgi/igtlRuAB689WO8PsugCGd/BTPIsAHdyV6SJRoaIODcxzODCldCNsanPjR3
         AXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=nqAyaT4Tpo6mKHzCo+KYhCaFiaCYolfAGf1zufh8Xl4=;
        b=Nz7BXYddIN+EWe1MlI2Zorv79RqZ+hqpgopew3h1+82NFSRmOXprE6FrH/XyH3nNbY
         L7K+PzwFg5miTIPifcp7gfj7+/g83wzZA1WbQfmDgHF7Zrw6hhBAwh8YMTkMN3o7msda
         FcZo+CHyfNGVXdWQZCZGmWJ1+9lfU0x4yqMCsN2sCg63gafUy6L9r+YMWVY4n0NSkAUU
         bfM6bDI1D8S7AaaSDi2/U4N6YT16OF9lZ8ealpinnbyJcojzNpP6dHRP5AaFgx1r5exI
         Xh3jiE0rgX8jXk/aOdIpsLiw3yKywjkEqm7pKAaYulBWmEgjJV5C4HCn2/QbkXd7U3b6
         NUpQ==
X-Gm-Message-State: AJIora/siedOANhTwgu+RxF2FDax7kedLYCbOmzziwzen2BKTtb/tbix
	bH83ZhzBRUqzN1oN6gN/8fwMXpk/lf5XQOKw
X-Google-Smtp-Source: 
 AGRyM1v+Sn/YV9Ctyfzf/TEWsBYzZQB7qOMtMhoyN9a3ho7SmgcvVpXsVTRjbuhkL25ofaO4Y9Mv5w==
X-Received: by 2002:a17:902:d50e:b0:16c:1664:81e5 with SMTP id
 b14-20020a170902d50e00b0016c166481e5mr13628405plg.149.1657458152341;
        Sun, 10 Jul 2022 06:02:32 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b001635b86a790sm2703250plk.44.2022.07.10.06.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 06:02:31 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 8044E9624F0; Sun, 10 Jul 2022 03:02:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 10 Jul 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220710130229.8044E9624F0@nuc.router0800d9.com>
Date: Sun, 10 Jul 2022 03:02:29 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Jul 2022 13:02:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167846

Branch: kirkstone

New this week: 6 CVEs
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *

Removed this week: 16 CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-2068 (CVSS3: 9.8 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2068 *
CVE-2022-2085 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2085 *
CVE-2022-2124 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2124 *
CVE-2022-2125 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2125 *
CVE-2022-2126 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2126 *
CVE-2022-2129 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2129 *
CVE-2022-2175 (CVSS3: 8.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2175 *
CVE-2022-2182 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2182 *
CVE-2022-2183 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2183 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *

Full list:  Found 10 unpatched CVEs
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2257 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2257 *
CVE-2022-2264 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2264 *
CVE-2022-2284 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2284 *
CVE-2022-2285 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2285 *
CVE-2022-2286 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2286 *
CVE-2022-2287 (CVSS3: 7.1 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2287 *


