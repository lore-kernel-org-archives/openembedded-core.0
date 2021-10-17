Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFAFCC433F5
	for <webhook@archiver.kernel.org>; Sun, 17 Oct 2021 15:02:29 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.23892.1634482949052623539
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 08:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=xJxogA+d;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id f11so8849547pfc.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Oct 2021 08:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=1IXjtaRAusQFUqbwqdP4vRRNIbxffUVhivD5ghis2X0=;
        b=xJxogA+db0pgwtwvYXTYyG4SKy47krEjq/Kv9pXzihJMkm630sbOUosiOlbTzjVkeO
         q7UOgZJxn2Jjpx8zJchPtGlW5vbiZI0X9LaLQNqEpDeWvV2hreS7kbY7q1REyMKguJ1F
         t3Z5FLVXweDWwPSANw7UZ+YiKBvUSAMDAF+O2E9EdMe7NzZ51h7xa3oaWeW/Q6sqwsDq
         9q71Xj3pwPHVcKGnTtoEBendffyp5MQWIAkP07PREJwEFVCVQswjkV80Sp5v3a14FITp
         MRqmrNpM8FIx5VyMDwIJU7VODGtGFHK8+a6l34EhJqxjzAyB8uQtKO/0wnBuN7HDV84R
         D+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=1IXjtaRAusQFUqbwqdP4vRRNIbxffUVhivD5ghis2X0=;
        b=uvtijtFHYmN0TJYst4EwLddp+js70echFCt7ECgLJAQTQ4l7lvpy7+PG6y//DIX+Jf
         /+K16z+x0+PXjsqBWY6oGAkV6xrZSjBAnhUd0G5JZP0mX686VpEVD61xJCwIQRs6XksM
         k83hIgitvORefwYcFMESpI1QhNKc8cxU4L8jukHbEe0ibMICF9bvPTybF6tdwR/9qjAc
         QhmYI7QpytFQumA+0rfmJh1b1gGl3TrgWvMrGEcs19VMOC6krlVVKa94+XPcyREY+OMK
         xSzYwk2FEJ4X6X+hO+mgnqgGrxXYpKxl/SouMgX/lgglsvccSrpBvSqaPBV9pWWBfztJ
         58/A==
X-Gm-Message-State: AOAM532rL11nG5KMClt82tCSwB8I/r6fMyk+6oWlK55R7Ku4S7WB5Oh2
	szK5DtzA/018+ah3oWNe972JOJuGW3UdYld5
X-Google-Smtp-Source: 
 ABdhPJw7Arg0IWfsgurAKFBV5kiZHuZBVXbqYaS8CqNcU0IC4ZGBMbDADQDwgqv0nW6CdA1XZkYdGg==
X-Received: by 2002:a63:2d46:: with SMTP id t67mr18374027pgt.15.1634482947414;
        Sun, 17 Oct 2021 08:02:27 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 i2sm10305663pfa.34.2021.10.17.08.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 08:02:26 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A6DA4963004; Sun, 17 Oct 2021 05:02:16 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 17 Oct 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211017150216.A6DA4963004@nuc.router0800d9.com>
Date: Sun, 17 Oct 2021 05:02:16 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Oct 2021 15:02:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157044

Branch: hardknott

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 32 unpatched CVEs
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
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

