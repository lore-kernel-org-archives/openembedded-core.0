Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4D0C63718
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.28585.1650198824436553851
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 05:33:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=WNPuAWvg;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so15227091pjb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 05:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ikgwB92cEazfhD3ZFDDSV9j+NedLKvrT79fEx9MJvdw=;
        b=WNPuAWvg5WCI0+LcoNpI0FuNW7se7stbiK65FdtEXlfyQSaX3POXUmN+YMDJF4xRxc
         rLy3wBhT2obDItICQJKRa/wjSug9LsEGiMFBJOZkPdbi0XeL8VSVcDcEk416cOoD+Hbz
         9jMMnfovi5pYXQr3yQ3ec3uoDIKf49xc4GrRBLQ2YlkXABmVmx7D6gQcHE7UIQwO5yy9
         ezhfQmzpfmfgSzvLz5Nk4qGNSf5G20V7m2txK/FDV8CmggBe7B3R6AP2QGprdOZ3EsY+
         YMOAYM8rwv1IDFgOE92hAOuDaUX3Srgqul8duZoWUgfdX7u+Ji650oyiEZ0yTuhpO0zf
         J5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ikgwB92cEazfhD3ZFDDSV9j+NedLKvrT79fEx9MJvdw=;
        b=DEbCZMZgT2nid40Spu17RPboFJEZ4TsbB3+ZKFKapB5xNE9gweH5irqyLjALw0LtYh
         NWUvpfvG5WLpfSkfHo4yBVk+69pC0+3sJev5eyQI9sFsHYn/MVr3TertN8TQU07/muLd
         UR1oXho9wFdLWtQcTxMvmnEFJ9rkqqlt1ddegi1ABKre9k0gJ4xAqfsSNUMtrE/0ij5c
         87khTuTc8GdfwPbsC6LPISfGTJPloA5SZ+OL/YmmCUqcwJcobAQIqKNegPa25VwPcyKl
         qYre4B7iFVdf/t45yrwFPjukghFGmolkEz+55YzI0xAlwj3UDq8XDJLbIl2ECeus/cOu
         oAzw==
X-Gm-Message-State: AOAM533t7SGD1cfIuuGove0Wo1XF6vz1TJYrSMvwBSHhC5ZHr+ypen3C
	lPBnUBpPge0XV/dIQxDqHb3AyU7kW9sk9TnLTAg=
X-Google-Smtp-Source: 
 ABdhPJyZtYVH2jH8Mai5pRGokoa5LAfQhPOH5uoTBwm+Yry0fffUDnR8UC9rnpSpMyDNLhe95m11Og==
X-Received: by 2002:a17:903:2d1:b0:156:7ceb:b56f with SMTP id
 s17-20020a17090302d100b001567cebb56fmr6951207plk.11.1650198823126;
        Sun, 17 Apr 2022 05:33:43 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 k8-20020aa79728000000b0050a48df4947sm6814214pfg.132.2022.04.17.05.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 05:33:42 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CB5B3960780; Sun, 17 Apr 2022 02:33:39 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 17 Apr 2022 02:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220417123339.CB5B3960780@nuc.router0800d9.com>
Date: Sun, 17 Apr 2022 02:33:39 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164572

Branch: dunfell

New this week: 2 CVEs
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *

Removed this week: 1 CVEs
CVE-2019-1010238 (CVSS3: 9.8 CRITICAL): pango:pango-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010238 *

Full list:  Found 77 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-13754 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27821 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20295 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27918 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28966 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
CVE-2021-31525 (CVSS3: 5.9 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195 (CVSS3: 7.3 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2021-3409 (CVSS3: 5.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36221 (CVSS3: 5.9 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36368 (CVSS3: 3.7 LOW): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
CVE-2021-39293 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39293 *
CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-3981 (CVSS3: 3.3 LOW): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3981 *
CVE-2021-41771 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-44716 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717 (CVSS3: 4.8 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2022-0529 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 7.8 HIGH): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-27191 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *


