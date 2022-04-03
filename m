Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CC2C3E8A8
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.23804.1648999063704109111
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:17:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=uZnjeXBi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso6779540pjh.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Apr 2022 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=gQ6N1jmhR1IP4XAYbgpRnpj594Szo5Cy7+/WKtEE01s=;
        b=uZnjeXBiwvNcyTn8r8xuIhn3OgaYNkugL1R/2D0+ptxRbjaLXdq68BFFNdJ/ah0UBL
         N//0777Q2AdPZ1N4QZgDu4RJr7O8eFaYahHj5+l6Jw9V3cBlFGXzWbLsr1LIqnsUlPhs
         6y2MpvbocTZBcTJ6hvh8HExxWkJdpASY8qx0rAtN5m+TFjIh8pF0yykOV2MzTwB7DLUC
         EKp/3mQJeEiIY8qTYIxz+cw8ewQw+jodntmIKOduiWJP5A5vHvUWAdqMYwbTp1XI+Q3Y
         U3c7y7f3UDaU1ZSPNWxOdup6ka4luZ7WDky99JgA001OEW21RXTAVpQVQYRVFT0eh5jj
         uDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=gQ6N1jmhR1IP4XAYbgpRnpj594Szo5Cy7+/WKtEE01s=;
        b=t/xERCaqQAAABbVY3bmTdzH/E0j/z7SOqsm0pb27Gog8YlAAzcYgKXfOaTDrogoOyF
         GTHjPH6yf1OV8t6zivUXMfPFCfM7yGmhppAUhROGmGNgXNMkFrOVQtWd024aFWvhSqbd
         JULK6vriTWioFgxxBAlo8iScv/Fy38WxF92F4lqs7pUQ7mQs/J15gpJsKIDl+NdabWxQ
         pf+BSR1a99uqYmLvprARPbrT0G1lFzn7DsHigLCnHc7jzXrRJ3ZTvoxx0a7G8RvkOo+b
         EcbPUyp1y6kZzPypz6qwQI/uSSzdhN86ykdaMmgbBy6n31klGIv4EGAtL9aa36RPrHgy
         EmcA==
X-Gm-Message-State: AOAM533y5Gi7gEK/weYcRrQaccD7nNLb2zT3p7ADknHBAnhxVc2UnOA4
	Elwuo+Bur2Y+6J+gqHEOLQtmosZf0ZieKTJJedQ=
X-Google-Smtp-Source: 
 ABdhPJx610Xj7eSJ4rwebV0fW7Mvw88zCMcJKI+Ka7uGjGqdEgkaCU6/QzTtnul+BaFY7F/+ShpKvw==
X-Received: by 2002:a17:902:9345:b0:153:4d7a:53d9 with SMTP id
 g5-20020a170902934500b001534d7a53d9mr56530427plp.116.1648999062804;
        Sun, 03 Apr 2022 08:17:42 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g17-20020a056a0023d100b004faeed2dfaesm8821912pfc.180.2022.04.03.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 08:17:42 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3718796277B; Sun,  3 Apr 2022 05:17:40 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 03 Apr 2022 05:14:07 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220403151740.3718796277B@nuc.router0800d9.com>
Date: Sun,  3 Apr 2022 05:17:40 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163961

Branch: hardknott

New this week: 4 CVEs
CVE-2018-25032: zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-25220: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2022-0396: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-22623: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22623 *

Removed this week: 0 CVEs

Full list:  Found 66 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2018-25032: zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25220: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
CVE-2021-27645: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36368: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-3947: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-46705: grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
CVE-2022-0204: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
CVE-2022-0396: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-0563: util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0778: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0778 *
CVE-2022-0891: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0943: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-22623: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22623 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23308: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23308 *
CVE-2022-24921: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25313: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
CVE-2022-25314: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
CVE-2022-25315: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
CVE-2022-26354: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27191: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27191 *

