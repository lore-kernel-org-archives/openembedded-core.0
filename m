Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF897C433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 15:32:19 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web12.31778.1635694338566340013
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7zo9ndNy;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id j9so6766053pgh.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Oct 2021 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=R516kOOzvgM45X1ZxAcB6fFCXLINVZNaSEMXO8rOJOM=;
        b=7zo9ndNy4UrgVLNTz/f0t0yul7/WZMd6AqilQfVLgg+o6lBDDcPeOgnIjx5vo+WLAF
         MMhR85iOgagyUtOR7cxMWltULjUhuEBTX0UC8wSZiHVhmxyYmYKs1RKhZ8oTAv4IwKY8
         ItgHfaOw9qZIB2cU6IePsw24hd5iQLvj6/rIA77VrQ7J2EVgPbqpYIXBO13qVRj96dDo
         s/2XIKhtve+WTcc6+1b9YmtnuKn60xur+kToB3YuV25Mkt1qh5gfpZoz72KOX6cvttw7
         fKr5rzqgSXyFhUJ47JEWLtBeKgACqwUDFz4YMW935OuGzARKh9MJrgJmjF5DMYWIBPSs
         9MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=R516kOOzvgM45X1ZxAcB6fFCXLINVZNaSEMXO8rOJOM=;
        b=ZPHvl+bFzw6MgK5Qh6A+wfDEK8RcRhOEEKCFLr57H+SdEO7tB7bKfCxwTLk1NeJ6bm
         nQM0eJVRfjPmvMl4y3BM9TtVyZYmMPM/CE/kEA9sWZTcAiXtwwMsgtXXgoA3+JEjsOl6
         qRppBgr+15hXenG7Q4bNuoj/Wf6SyrjTx3JdYwW/Y17NfHkMTSbHkZP42aHnXdjhSLnv
         yFnvpZ2monqMfjYbcJgAOtNJbTiDoCpNjt5f6vWxKtDCpIuUm7U01x8tEFtx2N3OjO+u
         iKS5NnwuK0VQAxHjrDR6GwYuF2qjSpFb6Wva8WEnVoolEUrkTn1E9pm1lrsT9NSfugXr
         yD5A==
X-Gm-Message-State: AOAM530EQPQQHfUfWogWQnW7f1cjwxrOPqVmxB9sc0clB5y2setiuIMF
	CgNECYMOwbYtI3AmTdEr6RQtirV526Yim+L60fs=
X-Google-Smtp-Source: 
 ABdhPJzBb86kbAi5yMi8+UXsAq/OvwW16ciNtNzRLsBNEUwbBy2hO/6St9dKEOJ5ga1E99oWfi+jtA==
X-Received: by 2002:a63:91ca:: with SMTP id
 l193mr6065826pge.134.1635694337512;
        Sun, 31 Oct 2021 08:32:17 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 fv9sm16041081pjb.26.2021.10.31.08.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 08:32:16 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 6079F960464; Sun, 31 Oct 2021 05:32:08 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 31 Oct 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211031153208.6079F960464@nuc.router0800d9.com>
Date: Sun, 31 Oct 2021 05:32:08 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 15:32:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157656

Branch: honister

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 16 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *

