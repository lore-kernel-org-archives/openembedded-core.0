Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C858C433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 15:04:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web09.21930.1644764697365407686
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 07:04:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zVsCidW4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id z16so3022834pfh.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Feb 2022 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ZWjH9+n2/cBwARD1bDW/4w4vtR4zn6HVs/cMuMpdasU=;
        b=zVsCidW4ydy+Zf7iTtYn+4RQqrNEVcR1BIii5ybJkqcgOwJdI845X5zLJ7Xbx1hWlJ
         wVdAwEENUbuiJl1fZ+u5GJ647DhYCo/rkomWNXs9hwInR7uPoZUcXBYX8SO/QPEyCCdz
         LFNJiAb2lADp1bFzj6l13nQxaEWdsfB6u84CdmipbriLS2YF27WRCUIIGJ3A51JH0UeX
         nw+pHxocMKXM3Iy8xR1HC1gGLosUXgM0SZ4YCgQKN1nv53sQwOuvmx4rYlK2BWepfBwS
         FkKlQATkDeRKuJLQZMlGWiPyCRz9ivwSpgtVL6APaIYkt8YQmvpNpoHNTStW7bCs/YJT
         dF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ZWjH9+n2/cBwARD1bDW/4w4vtR4zn6HVs/cMuMpdasU=;
        b=K5JvkJzL25cv3Etd4yz6qshRM52Z1zPr119EsgVFTUSCAZNrFxUC3y7C/PPSEi4xZ/
         dEmoTAcEX0GZNM552malxn+RxfQObVXH7B9FKbzfv91RKCW4ZdgupImjs6SWT7u+DJcw
         uIzK9PaZ3FN1ZadDjFfKYb/f/X2R3t3RvSB5r5+HUTbycV66TEb0kmT+UGWlexqhaSF0
         unB5y9CDh1krJ7ALtuzcKMhRq0xAYmFDMIynEs6uhRtBjazWTaOAHO1edyARuTzPf2Tc
         11dhw7ZXDFPefVAxExzvqXRtKMC0lHdZUX2tsVKxfXd2jtLGJDjIR16AFY0JcMS32n7u
         2iIw==
X-Gm-Message-State: AOAM531nZ8MKupXX5K/Dsmtt99MFWuJrDLnXNn+t97n4GLEYheuR/7G4
	J+w8i4euLVttdcBBRn6yxDwuzTsuT+0LRwDv
X-Google-Smtp-Source: 
 ABdhPJy5/pAseegc/sRJuEik26hZIRNpBQ9qfysKMyb0M4GCgEgerEwwWsR88iB07bOlNzj0Td3UvA==
X-Received: by 2002:a65:4c43:: with SMTP id l3mr8349875pgr.494.1644764696369;
        Sun, 13 Feb 2022 07:04:56 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 c3sm2969747pfd.129.2022.02.13.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Feb 2022 07:04:55 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 519EB96070B; Sun, 13 Feb 2022 05:04:54 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 13 Feb 2022 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220213150454.519EB96070B@nuc.router0800d9.com>
Date: Sun, 13 Feb 2022 05:04:54 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 15:04:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161685

Branch: hardknott

New this week: 1 CVEs
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *

Removed this week: 3 CVEs
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *

Full list:  Found 69 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
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
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

