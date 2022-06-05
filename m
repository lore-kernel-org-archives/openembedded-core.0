Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E05C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 12:02:47 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web08.19858.1654430557907524400
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4CDdjBGs;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id
 o6-20020a17090a0a0600b001e2c6566046so15698396pjo.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 05:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=XZBOek/CRO6exLwXBcxnMfXeHbB6E+dr4V5QpY7UVTE=;
        b=4CDdjBGsi90J5/D1aVHvofmbESZ06i7qm8C8BVxqjtLVMORFzCwep3gG/dljvwguNV
         OCAnsJoTxFC9TTpAUbvbHPkJj34EJx9/ZgrALFDqVRn8RlWiuq4GVXxwwFI0t/OgnaiH
         XYwbWcno45e85FmVVxntqdlfiTY/JIyjqtytiLSPH+nyjACT96XGNhKOOK/tY/4yOb+m
         2mn0JzY8pLusDGdh5DqjskDczkZHyM0WLpBAzKhtpzK/guvsPi3zz/jtNVMfUaXii5Gt
         jlzftY5NxcF39PSDNEu0RlSJ4NVmzH4j6Ah5l+5iOvZWpKMicZ9yJSsnQzIcWfSYOZB5
         tMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=XZBOek/CRO6exLwXBcxnMfXeHbB6E+dr4V5QpY7UVTE=;
        b=MrJfEoDOYv0/f7mX3Wnv/QRedIXSLB2dCcpLe2PNb7mwO0b46Vz2I2fq8KVOmX/dCe
         gJXjnQR5ommtaPMy1O0431R+fKhC6JN0cDWJvgejDpJHEJzmNreYAcZkkeQtPqaNMggj
         1vrnpVHmXJbeg2Td3pzxkWy+4mz1p83kXPMF3c9cOEl30ZwLDDJ0CYyETw13GYMnq1jE
         JswsZJCEplyYmQYaaqtK/L+GnxCV+3hNj6rEmW0zAiNMrSLiK8upl8gr+gL71Esc66WY
         xyM8oOa8iGIboXTer+QzUhbL8sIoDBbTyvmLC4kxktubhjnQUiku+tiScr96RuABeuBi
         ry5w==
X-Gm-Message-State: AOAM531OMOx/o6FwbrL4mmcqgOSVsDw1IAg4Le0NomVXapByAy6eHWkG
	9bijmMAOYfNsya8m5Zv7hY28MvQN+Y7kjMZv
X-Google-Smtp-Source: 
 ABdhPJxUkPbLXrZQ9/wGJTISK2TfmY3mRdV0n2coevbsjYLHXi5k8SjL3+LK9ciwN5RNLv7FKJC9eg==
X-Received: by 2002:a17:90b:3506:b0:1e0:51a1:a8ee with SMTP id
 ls6-20020a17090b350600b001e051a1a8eemr20572554pjb.112.1654430556861;
        Sun, 05 Jun 2022 05:02:36 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fa23-20020a17090af0d700b001e2ff3a1221sm8079459pjb.33.2022.06.05.05.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 05:02:35 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id F3BBE960B07; Sun,  5 Jun 2022 02:02:33 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 05 Jun 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220605120233.F3BBE960B07@nuc.router0800d9.com>
Date: Sun,  5 Jun 2022 02:02:33 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 12:02:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166574

Branch: master

New this week: 1 CVEs
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *

Removed this week: 0 CVEs

Full list:  Found 7 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


