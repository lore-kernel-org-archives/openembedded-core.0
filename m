Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 508FBC433F5
	for <webhook@archiver.kernel.org>; Mon,  8 Nov 2021 22:15:44 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.3791.1636409743171410320
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 14:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DTWudtwP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id b13so17196835plg.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Nov 2021 14:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=PjfVyMXxIf9CbDSVaD2HiTfLhp5UoYwRGCOdys3sYx0=;
        b=DTWudtwPob3rGJ+adfeaYUN4jyirbLc1auASwvbnRAcbRa3aTRoARu3yZf7kdiUX1F
         OhvXJJkCYrOCsO/E7GoAsqeIaZzX9lvmpmBPdzXDrUYHd0lPdjW2oBodX2xlaAKTCYrg
         8V7YQS3TZJtWyM1hrq8xNSwf0ZCkguDesSFU6fFaKMRBpQzZop7aiD9SEkrtb4dBxh5N
         3+f6CMpi997sjfsnmDfUcJ6ddj6+rwxl4xDOf6kHeor9Twyz1QVMqm3pYm+p9V2riU04
         95BUf0bYW6KTXK26P6aIVX/NnFw/CQU4PEDwr+Yu5HxHsNU1bI6qRhJKS/sWW1eSicnf
         yXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=PjfVyMXxIf9CbDSVaD2HiTfLhp5UoYwRGCOdys3sYx0=;
        b=iUJZRCljBABc8QLwj8F5KwDOZ7Nw05av9eowlJkupbNpRcWdYGtOUXU6L6kgRxpgae
         Tr7PQ5TgCfPg9uQxNG82dU27d65gsex5JTFIKlapqD9MJDg9b9ULkNsGLYT0ak903o6y
         mRGfE9w8piB5fVNe2hLmwN22RRs8HTX1Cuk0azCBOU32Hk/g0bXNAPkpqTGgVi3nvEQ+
         tAkOg1rW/qbDaqT7VWOjzdfUMXlarG0dvw23D8N8DrEq2PqwKD+JUBJwckNDQESwoWXE
         ESp+n0HsKcaR33sbVx4zzVl6gNJ2ObOiadJzUVoEb/aMgZasHk0dKiwD6ZrzhJBFluJc
         qCBA==
X-Gm-Message-State: AOAM531UVfSCj0mr4h6VXNzHzSXiilZ5katqlqqC3VklB+0E3g1gVpOY
	loFDuX5kumQw22PJT7kWgck1lrt4AtVUZgJynYY=
X-Google-Smtp-Source: 
 ABdhPJyUXzfIhx7Pygl+rCo/x3rqoqg7MJGgyiFaAhK9paEms9Jg/CXI+H1qiXZmpTFBPX+OOFwgtw==
X-Received: by 2002:a17:90a:1190:: with SMTP id
 e16mr1768389pja.209.1636409741826;
        Mon, 08 Nov 2021 14:15:41 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id m15sm83380pjc.35.2021.11.08.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 14:15:41 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A2A0D960387; Mon,  8 Nov 2021 12:15:32 -1000 (HST)
Subject: OE-core CVE metrics for master on Mon 08 Nov 2021 12:10:50 PM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211108221532.A2A0D960387@nuc.router0800d9.com>
Date: Mon,  8 Nov 2021 12:15:32 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Nov 2021 22:15:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157990

Branch: master

New this week: 1 CVEs
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *

Removed this week: 0 CVEs

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
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *

