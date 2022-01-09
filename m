Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36251C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 19:03:08 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web10.21516.1641754987572410161
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=dCtFrrUI;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182,
 mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id d14so9546956ila.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ZiK3b08ZDfdD9tjuNtv9uPL7OsUfA/nL/kNLdWffGAc=;
        b=dCtFrrUIuXxe4q8skr1SQW0ss/mz1KebeiYO5b/IqleLvBiFpWetIt3B71YTCEW0jC
         FMejKXRfk91FDvuWdaemYazPiqP2Eynqspd6ZISBisTjaRWs4+uU8NDYdcCfpIN20LxQ
         84/1iuG3eveRRGe1bpEeHqkLqpWfLHZRHUnal2CxWk0pY/69YcE+iJSrQUIjn/soiTeR
         AF2aQHsChnjnjxJN4LbIFamLKNn7DJiabf57koZFzvH5jXyyrVqGX06y83zmc41a+j6U
         qpf827xoKsf139+C1onfoH3Q2hFzWYs3egI8cy+MwnQqN18yGAZA50vTOwUlF3cbMQJZ
         MmbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ZiK3b08ZDfdD9tjuNtv9uPL7OsUfA/nL/kNLdWffGAc=;
        b=6wT+EWFDepvHn312Ba4xI+C6VtN8TxvH43UsSTa/9+1BWvlsISm9VzIikS7eznIL7D
         sB7c4S8i+YGrduGYW2cdY0DrTGpL8GztGVOEyvI1viCYhQFJq97l6GRQfbLpeb3BU8+x
         l6GLCYGR91vvTakxUpUV3GzWhQwd6GhrcDENu9JHzPpRLHRHsnLQ20SLTx8F0YW9PYpr
         0MBPhVl/h4phDfZoby5WGecwL2oGRwXbpsFjv+llbRrdyOTlOCmCmwzpsbXTDqP7+P6C
         jLick+F1Ogdl0zfO3M+3fzObtrC6sT95YekfUb2dvlZQEtfmJSb+esLrlF1q7O1Yk1X6
         SLRA==
X-Gm-Message-State: AOAM531Bc+lgLjfyziviz5Q4/rsWPBDxcZn5GaBQjxjcz500C2Lo116f
	OpVN5GamtxQmNmVBxl0p6My3njtSPf6xlMrxHaU=
X-Google-Smtp-Source: 
 ABdhPJxTQkEW0c27LxQXaSRKdWzTGGCFqUOgEymHQkxyA79oKyumS82gvX+2f1VCyy5uwiinqxOnBA==
X-Received: by 2002:a92:cda2:: with SMTP id g2mr30200752ild.16.1641754986542;
        Sun, 09 Jan 2022 11:03:06 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 e16sm3021324iom.51.2022.01.09.11.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 11:03:06 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A82E49607F9; Sun,  9 Jan 2022 09:02:56 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 09 Jan 2022 09:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220109190256.A82E49607F9@nuc.router0800d9.com>
Date: Sun,  9 Jan 2022 09:02:56 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 19:03:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160286

Branch: hardknott

New this week: 12 CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2013-6424: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *

Removed this week: 19 CVEs
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-42373: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42373 *
CVE-2021-42374: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42374 *
CVE-2021-42375: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42375 *
CVE-2021-42377: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42377 *
CVE-2021-42378: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42378 *
CVE-2021-42379: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42379 *
CVE-2021-42380: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42380 *
CVE-2021-42381: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42381 *
CVE-2021-42382: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42382 *
CVE-2021-42383: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42383 *
CVE-2021-42384: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42384 *
CVE-2021-42385: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42385 *
CVE-2021-42386: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42386 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *

Full list:  Found 51 unpatched CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2013-6424: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
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
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38604: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42376: busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *

