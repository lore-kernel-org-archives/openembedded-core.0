Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 421A4C38A04
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.17311.1650805507219166169
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 06:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=SsEZxuGp;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id t13so11193478pgn.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Apr 2022 06:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=yBtXYSvsEprYhlfGccxenKGBxhEhOu1nn/hdCOb2/rY=;
        b=SsEZxuGpesawEuQLmp8pxly5xavdgTCDfqQL9pgjJBdv4c976J3GOjT+KnDRzCcgix
         UhSImVo0SA7Rqh7bqBjHPcYFX8xlsvSBOFV5FbXLrm5HGKpViB00jb5dh1sk8GfWkwIJ
         Z2b8V0W78xG6PA7GyXGZNbHYZVRSEzNgk8d3yU/5zwhJFshf4xAKUl7Vq+6+A/klF1Rl
         PRZymOSvjAjDGuDtXXfC5cmWp+sDGpC1q2privEwr1nteEhwTsYWq1nPOpB5lu72zThp
         g05h4wPUMyo6IQbJF+xGISUyGNQfBgIYgZNHii+sdRBV3sAgnK3Xuawz/pSLz27naary
         JP1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=yBtXYSvsEprYhlfGccxenKGBxhEhOu1nn/hdCOb2/rY=;
        b=dMEl8XwZ3Fg9/HpGsReDLQNP0JJO6FkwYI8LmcrWQUhGiknRcMFn51kEejH3l7kGP1
         bYX69v0gpsqwG6hjxnlPnzcunXHtKjRQDX/IGhEEW8BzXHcFgwMuWjo1Hj1MVWHCGpMj
         5qTDrJCn9JDh6sm2QV/+eWRX8YT5uc0qIao41sbdpBdI2YPZPR1TrPBH+6nyn1BNu8Ft
         uCINvjrSLzjWm0eOrWCX07q7j/sv/V8JpsZ3Tvcj3zkmudAl4fSOFYAVo0ch7F79Mn9h
         K76RYsYhY0nKIp93PqvF0lFbvH2L0LZYgrGtEr29/cKhk3dbLnqK0NF9VWZjIVnUT556
         hEVA==
X-Gm-Message-State: AOAM533sOHLRaZccAP1SUuY9gYNJeebrN8Y7P+fqxjjh7f6VElGOkSM3
	uE7ECsa0gIEiA6BIJn/kXj55DaJFiIeMtXA5Qgs=
X-Google-Smtp-Source: 
 ABdhPJx/wTXFkTy8DbPYvxOCsGf6Bq/o7nWOQj7qSHyBplO6Hhr16qWJJc+abJ2g1PaHb9ef7jmKeg==
X-Received: by 2002:a05:6a00:d4f:b0:50a:3ea9:64fc with SMTP id
 n15-20020a056a000d4f00b0050a3ea964fcmr13986182pfv.41.1650805505895;
        Sun, 24 Apr 2022 06:05:05 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e13-20020a63370d000000b003810782e0cdsm6877666pga.56.2022.04.24.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 06:05:05 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 49EA09627AF; Sun, 24 Apr 2022 03:05:03 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 24 Apr 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220424130503.49EA09627AF@nuc.router0800d9.com>
Date: Sun, 24 Apr 2022 03:05:03 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164806

Branch: hardknott

New this week: 4 CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *

Removed this week: 1 CVEs
CVE-2022-27191 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

Full list:  Found 58 unpatched CVEs
CVE-2013-0340 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2016-20012 (CVSS3: 5.3 MEDIUM): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25220 (CVSS3: 8.6 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-27645 (CVSS3: 2.5 LOW): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2021-33833 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938 (CVSS3: 7.5 HIGH): libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36368 (CVSS3: 3.7 LOW): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-38604 (CVSS3: 7.5 HIGH): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-42376 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-46705 (CVSS3: 5.5 MEDIUM): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0204 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0396 (CVSS3: 5.3 MEDIUM): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0561 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-0563 (CVSS3: 5.5 MEDIUM): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-23096 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098 (CVSS3: 7.5 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25313 (CVSS3: 6.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
CVE-2022-25314 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
CVE-2022-25315 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488 (CVSS3: 7.0 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *


