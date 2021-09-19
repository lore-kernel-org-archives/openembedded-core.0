Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.10985.1632060169317695397
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 07:02:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=IvI8KccT;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id j14so2195308plx.4
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=CV9CkRn5xPUJcJOgEImGkQ/u8P9VFyOlxgDlfXgo9yU=;
        b=IvI8KccTkOqkfjR6+kmWZAidL2hbodEpmRPFkGlt+oH0547Hyl6wBdVOUOIK1v6jdo
         AafRdzBGWhw8j16c1pJPBvpMcQYrD4ednnC2rqKaycHWlZupQJLet9lM1LS3ws0id/2M
         MYeVdFZLOO6bQ9CVUM7SMvLC3vyXMguEp1fJPiGsEFW/uJLCZo8ucRXvBIKPtHdAPzoi
         e+f8vP70Cim4Iq7G9j//+4A/8JOu0cMI+ZXW0FuDnSNSJ+a+cZ0oQN75OzC1RMqN3kk8
         UFwyez7TaP2LcbZANbzb8KmDJPQjaoZ/CwZ3rpZoNLAX0E24Mr7J+kDmJHYNKbUUj50B
         g0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=CV9CkRn5xPUJcJOgEImGkQ/u8P9VFyOlxgDlfXgo9yU=;
        b=VHTdM8YWP+qwpp1EYrJNXDJbDEr8G2JA1PSbWTG7g1K+bXBr2+i3l8HiU1K4goWMM9
         OzmUBEVpQuV9VE//sUK6VVpzc4zdDC4uqo+MREUxaEQbBtfcT2sRUyty+/9BVUDVJ8nc
         RkRL1oJRJ4S+7UrdQv/wL/cNu3oZGwBgYQ55UcP6vwaQTjNFdYID9fDzvEIw0+kgUrCE
         C4cVqZbBy0N90dvOZ+NrYh3TR8tGklDe90LCoHA89KZP3KwbjAj+bJFL4A6MB1mA88te
         BjV2lh+Cp6FO07uwIBNICzdcP0UdpRzgYgbW8paJU1OfbWD1s3Bu3LMuLaWaVPP7dXF1
         SyLw==
X-Gm-Message-State: AOAM533q2Nbbcrt3Ms+YICwwtAIifcpa0Gb/RJ55ck/X/QGyRng8jH9e
	Q5b5mTu1Bf5joL9LFLgYnaNjh9k6xWJM6GMFS70=
X-Google-Smtp-Source: ABdhPJwaNAQy24B9gOhjtP+LBB+LJJ3QHmtPzZBv6OOLwS4mKnX8JoXNrQ7lDyPRObh1XHGCNMPrOQ==
X-Received: by 2002:a17:90b:4f4d:: with SMTP id pj13mr32332892pjb.47.1632060167825;
        Sun, 19 Sep 2021 07:02:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x13sm11477168pfp.133.2021.09.19.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 07:02:47 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id F1E869602E4; Sun, 19 Sep 2021 04:02:44 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 19 Sep 2021 04:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210919140244.F1E869602E4@nuc.router0800d9.com>
Date: Sun, 19 Sep 2021 04:02:44 -1000 (HST)

Branch: master

New this week: 1 CVEs
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *

Removed this week: 3 CVEs
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *

Full list:  Found 12 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
