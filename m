Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2592DC433F5
	for <webhook@archiver.kernel.org>; Sun, 10 Oct 2021 16:30:36 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web09.317.1633883434792694963
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 09:30:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=18ynZfF4;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.47,
 mailfrom: steve@sakoman.com)
Received: by mail-io1-f47.google.com with SMTP id h196so4173563iof.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Oct 2021 09:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ZCdFgBnF0Vdt+AdhGzg49Qn2QtSk4B0qBhReD6jWwOM=;
        b=18ynZfF4Xc6PMWXkLh6uPvFsQIdL28owORbgwl1WdmhTFjMSF4sCzG6YkMOwn6kn01
         3c+ovoTVJmjipjKXHiOwEudVfapcsdbxOekUp/7JN6+BhTGB+xHJUhhjytxKXbL2WnK8
         BJgMnPffXRhSNzRq5ZSDXDYzrcHgPVZPtHoqnnDWtJEVOxiNbmRTQOQxd+cCEl6ZkOXf
         LzlUnJmkWh+o2dwy32bd3o00j0PZ6c+DmlC9K87jiH2Jz+PCf0r5miq1MlbK9ebRFmn9
         a8ltIfD37DoDt1FakrD4CeGXDetZ3rrn+xZqcUHGNC9qhnVEznloVQQqvdHnFFkhnTeQ
         qFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ZCdFgBnF0Vdt+AdhGzg49Qn2QtSk4B0qBhReD6jWwOM=;
        b=zeOV1wIr9ERyGi267SexiIv9vQEM3x5S3Nx0BjHA7USDjeEjknQaR9uatXqD18b1LJ
         YzH3X4e1OzD5C/ho8VmNq61cRUu1Idj+rIaVLEheGuk4uTVUABgUDovaKnLk6sPdBfh+
         J/r8g/RU2/DASepquvAB/Z0DC16FZAdGYQyuTxRqnolilK1EdcAIdvtHz15JRG8eDGnN
         SAytzpce5HBO0ADkQLnN64mRTAWEvJhrquONNFd5wF9akM5H+VWXjjoHTHPJRBMOHTSU
         QEDUn4WHx2G/BPA7wnZD7CMPDlPXnkE349M6+8fnCwjArIFMlhKf7hbil5sKwk6Ld2JP
         zAsQ==
X-Gm-Message-State: AOAM530J7WXsbvs9gGJTJDrQWPKGO0vTrr8Rd5ga1+S93UvtximjM1Ef
	DMcrwXQHB9OTuh2X/JSRWDiUFUjPY1W+8ZVvZa8=
X-Google-Smtp-Source: 
 ABdhPJwgujXaupMc9apclrNhRlw41u/crOI1MZA4XXn7aXUbqXhG4QnXtq4q3KYFXzYVsYe2YsB3bA==
X-Received: by 2002:a5e:d80a:: with SMTP id
 l10mr16110864iok.182.1633883433787;
        Sun, 10 Oct 2021 09:30:33 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 x13sm3007038ilu.86.2021.10.10.09.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 09:30:33 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A3F9C9601E8; Sun, 10 Oct 2021 06:30:30 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 10 Oct 2021 06:27:12 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211010163030.A3F9C9601E8@nuc.router0800d9.com>
Date: Sun, 10 Oct 2021 06:30:30 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Oct 2021 16:30:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156791

Branch: hardknott

New this week: 2 CVEs
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *

Removed this week: 2 CVEs
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *

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

