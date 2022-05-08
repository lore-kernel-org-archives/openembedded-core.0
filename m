Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0596BC433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 13:05:46 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.20142.1652015141187966771
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 06:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YJtkbEbT;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so10513190pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 06:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=fQswudhSIK2OKSK6VCtV346ZL2VE+3b/8UZ9/tv+ZjY=;
        b=YJtkbEbTSbtJLQIgefQFIpS6Mmj6Ot3EvtuiDEzl1/t2aeZgwp2x/0kYdRTYSyKkhz
         R1pN7/PChIjRP1KJOlFH+L/znDcK5sux8cty05IeFEitKdtnNf1cNThlWmoG92xXGunw
         ezg9apVhGqAyJ7utU7t7HLViqHBFo06j+jWQMJ4vR2379Z8q1x6RpH8YlV392A+n2PUT
         eX6116BUQ054ka6xmYPtdoie5uRyktpj9tAYXpA4AXS0VeFcyibm5pB5i0W23qREKwhp
         E5ob924K6gQqNOTZPu8+nrxDsURonP4Zxf6coLa39hU4Bb4vtCCniVvO+iMTXOYYFVNT
         uWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=fQswudhSIK2OKSK6VCtV346ZL2VE+3b/8UZ9/tv+ZjY=;
        b=LCdw8KJDNWylhl60zpSpz+5nTYti3wtDe8L9tR80Sw+dFwtC17LJvz7TJLiBvJfJSf
         iyUXCdcDgkpa85rMiNo5WFkP97GlUC619p7os5/3kf9W6gw8Oa69f4S7/vvMGoZXlq61
         prcSft3Q5XwqgURt7vQRKP2XO01WUTU+vRUeX8ls2zbrQIXEOEvW25BeroyQ6sLpI9C9
         KVJuNFi4zmVGiwzBroR0HU4rpbvPDl6f9MpRHsvPn31LrrBEO3nyF48j36JW/5RpMwE9
         BdgQYhRXzDmFZGf2Zhe4gDTgRe11+ri9dvd7SWhSpHI60jeiu0cU7hKqVrfxhM/J4oo8
         19Qg==
X-Gm-Message-State: AOAM531TvwB2cXFUhDPgvT4icQbk+sWFPsHlziJEP/jRmlpbjbq1EfgI
	2KIeUyDOK0z6Ap1cST6PJt5RB8eBB+XJpsR3
X-Google-Smtp-Source: 
 ABdhPJy4WdrUj9KQV6FnHPv/1kxW6OWDnuvv4PSUpnsOUOqEq5Qk0wYD57J5/vyk1uUh3oDscFSZCw==
X-Received: by 2002:a17:90b:78b:b0:1d9:6cd6:3f4c with SMTP id
 l11-20020a17090b078b00b001d96cd63f4cmr21397311pjz.240.1652015139714;
        Sun, 08 May 2022 06:05:39 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 ca15-20020a056a00418f00b0050dc76281b5sm6836339pfb.143.2022.05.08.06.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 06:05:38 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 67CDF9626EB; Sun,  8 May 2022 03:05:36 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 08 May 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220508130536.67CDF9626EB@nuc.router0800d9.com>
Date: Sun,  8 May 2022 03:05:36 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 13:05:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165375

Branch: hardknott

New this week: 5 CVEs
CVE-2022-0908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *

Removed this week: 0 CVEs

Full list:  Found 68 unpatched CVEs
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
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-0561 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
CVE-2022-0562 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
CVE-2022-0563 (CVSS3: 5.5 MEDIUM): util-linux:util-linux-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
CVE-2022-0908 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
CVE-2022-0943 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
CVE-2022-1160 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-23096 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097 (CVSS3: 9.1 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098 (CVSS3: 7.5 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304 (CVSS3: 9.8 CRITICAL): wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-24975 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
CVE-2022-25313 (CVSS3: 6.5 MEDIUM): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
CVE-2022-25314 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
CVE-2022-25315 (CVSS3: 9.8 CRITICAL): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-26488 (CVSS3: 7.0 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *


