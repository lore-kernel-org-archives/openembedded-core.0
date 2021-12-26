Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2924C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Dec 2021 14:02:57 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.16566.1640527376753693434
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 06:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Yp54eM4j;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id
 o63-20020a17090a0a4500b001b1c2db8145so15946866pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 06:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=MO6eEMzHKy4HDPQmIJHku5uR4AGtMSRWwpt3pKSjb+4=;
        b=Yp54eM4jtdcOYYL8YNx50WlEsOWDBBjtzWsCIi+7twI3+Rxyr/o3o5ojnwDDjPCZRr
         j+JUJUhYWn2VD1TDQDovVG5zBugFTYtZCP8pbu6lEkhkewGqi3wBpVsxa0iUJV292L+L
         gsIN/QWm8sXtNjtU3HHmwL01M6XtXJT/YZ5abAfOP/DQRtf6tAW6u+U29/nmw7jR3uuu
         U9GQ65+XIr2o02ax0pcER5qrng4I9UbS61gr74Ci2tAOWKwPDOt7rq1CvoOdRjzz1FPg
         oUiIlEMg+BrNMwYVvMETw1UsbkAByBKtj7l/grFF8Z8RZilVJe6rrtMvL+KehXsNUmX6
         isMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=MO6eEMzHKy4HDPQmIJHku5uR4AGtMSRWwpt3pKSjb+4=;
        b=PMeRPnKt4BHXoMC+BphiuohO7vAiYWe3jSa5j43ypdHdQAwKo59aWO54exBiNXzcn6
         LqDJiffdk5kmgiAAhZ7LF3BupS0biqRqWFd2OkezgMsjfuFnRmRNxAdsMzitXRuaRSOS
         kJAluOAPRmQAAzgglIsSP1jhegvm5vNxMkRlMgqFGa8yv2JWm16qYIqqlg3XIy9dAlL7
         aALXQad2HIgmL9JGEB/QNP9yQArUvPR9erD2ZCdJG38rze6syT1QA2yKHUYDBPCUMj0J
         4qMDuq6FDCHlzTTsYgsQN/hEYePSBbWLSx7+rP66S8AjCT0w6JyP3A98heDVjkYBqM/A
         n7sw==
X-Gm-Message-State: AOAM531wamb9jM8kSam8nnK+00ble5MAe2SMjiw9w3v7pk7HZqnSE6II
	0Jo7JTSyMXrxI1gdtpv49gP1CXu/KbPEq6Ex
X-Google-Smtp-Source: 
 ABdhPJyILzDA6xB2QFdENzYe0zqw/0tAu52t33cw5ScCvZEc/KYBktbPDd40VkFsr5BnsWVQwz2qug==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr16459249pjb.129.1640527375332;
        Sun, 26 Dec 2021 06:02:55 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 z2sm15040756pfe.93.2021.12.26.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 06:02:54 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7B774960468; Sun, 26 Dec 2021 04:02:52 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Dec 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211226140252.7B774960468@nuc.router0800d9.com>
Date: Sun, 26 Dec 2021 04:02:52 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Dec 2021 14:02:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160012

Branch: master

New this week: 1 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *

Removed this week: 2 CVEs
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

