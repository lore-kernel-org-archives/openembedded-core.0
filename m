Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D65C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 14:03:43 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.19206.1635084221677485861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 07:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=ybPoOEYe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id v16so723813ple.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 07:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=t0e+d+Gep1gL6LW9Lfxpf9/zsRYnjROCFtD8MCl70M8=;
        b=ybPoOEYe4KgZKQc+h7uGKWApQjxNeFAKd7QHdkNxZQX2zTQ+QMC1aT0WwNtVxDJ46u
         kyxXq4jblQbJsCh8lk3KrUb7RQhawiYLosJ5e+0MOliVJpHjad11H+KWcZwbAzJThyQ7
         MZLzuQfZOK22FPymCDU4Ums60p2A+LKAeantFQDaXc5RIUFjd4nMKBPkegIDE//8lEdL
         T72GePeBULJ/katJ1H1JfEHSfEofIZprmAx8wt+O/lT9mpibL3l2Ca9NmQINZ1t392XX
         xUuBhYya8Y4hpUKu7tePix7izDibry/emBuut7aBg3XvRKyiX2g9LqHxL7sE90nMsqnX
         ibLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=t0e+d+Gep1gL6LW9Lfxpf9/zsRYnjROCFtD8MCl70M8=;
        b=fGtMhbIGbl7P5hZGjzqVQXBBRctvzI3uj01A/+493yOqazzQjY2M00KW7TSfMSTb2D
         sA1bGXhOkfCmcKi8U5zm0h5rOHT43r7lnSqkuh8g/0/zWih3Loblk7VFvRUn/LfUqPwE
         QaWIcaXvtQKa9HI1GVk7BJIAHJTBUwGHE+shwMtz8UuhRhuJ23UdLligQQopAaI8jnNM
         DcgqQnYntPZCaK+S/8eQVjc7785q9hqYdDHfkOGmrfYv8VF5JmsNgC4lcDTceYZvFM8c
         ppY39F+HlOdINa4PWOOcQ/S1xWyEFZA1kQG/3gzqZN16UNiYWZmWbbQOI/JHMos2RwRu
         XnXQ==
X-Gm-Message-State: AOAM533wPxWyPTImXWRq3kw1sxu/fC/JcF8JExhuWXCicrDzO2/fUjlV
	FkmT4YlKpJTO0r6usGgzEB7GenOQkJDhhPaTikk=
X-Google-Smtp-Source: 
 ABdhPJzR8XJIln2J/7S9c+CwLfvntkgcoHyryV03BU2wyuCV0WSNqedvMX7ogthRtIA9JRdXJzUf8w==
X-Received: by 2002:a17:90a:7b85:: with SMTP id
 z5mr6102886pjc.147.1635084220380;
        Sun, 24 Oct 2021 07:03:40 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 f7sm4674399pfv.152.2021.10.24.07.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 07:03:39 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 47CB09602D9; Sun, 24 Oct 2021 04:03:31 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 24 Oct 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211024140331.47CB09602D9@nuc.router0800d9.com>
Date: Sun, 24 Oct 2021 04:03:31 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 14:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157325

Branch: master

New this week: 3 CVEs
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *

Removed this week: 2 CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

Full list:  Found 12 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *

