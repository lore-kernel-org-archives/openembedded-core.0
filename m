Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52087C433EF
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 14:03:26 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.22962.1633269805534755920
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 07:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jLOFxVwu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id c4so9373584pls.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 07:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=bigh4r0uAyhj1xNQC7jaiQQYT0Zv5if7KoXYpNGEVlc=;
        b=jLOFxVwu1nmQAGYnqgPimTh35KUtY7VsCad4FCDjenDU0J4BxSshuUX8AjmXG32Ly3
         ylQDFhmhCxC3JHQ2EqNGgeNidv+ynDCZfezHEY+RhemubgYS2xQDWNh+MVhXwjH66E/D
         PvGs1c51P2peOuEPooLyLxiO6C+FlBcjvdHGjdCMcnizHTRpn9pOfSr6IEUGMyjXBppU
         +Ai7YXmBeXMvNpFgZmA2+7Mex/Vsxc81rhiKKc/03ozdWdtyZ2eO0rXDN0pGTjH17BDL
         8DWMCPUGHbN52FII6SoEIjS3b2ektTwSCzwrWEipKIJb8OG7epOG4A/y/5qiGP6Bqjes
         ROMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=bigh4r0uAyhj1xNQC7jaiQQYT0Zv5if7KoXYpNGEVlc=;
        b=2JQoaN24KJR/qQqVAA1EHFqyUU5pIGWN4UjQ3Cc/Bh2LUlyy9JE1/RvUPszNM2RfJ4
         OFYw03rZugim5BSJNhUZy5tP2IhoQsMU/egO9yTNzomDJ6ka30ehOwvspQlKqA2ygcpX
         Ev1TYJEBLnqbPoL/owfH8ErM/4D3NjOQ1M4jVNwVSj3Xn3tZBCZSJsXym+KB8tRp6Nz7
         Tdck9dEiW5LRJivhlGb/qJPRCYCV9AcprMuRK53TpSc6UE9Yq16xHMmQvutX9Wtm9Sbb
         u5VI3wxEMfQnAprc33ha/U+byiKcavnfOcVNokwuzMHw7E5/fnBY/5US1lkDngxCyCdD
         ZkoA==
X-Gm-Message-State: AOAM532YuK5OvQdzjsedHmgNkbzuvuxrpebPmqrPKu6wzr354jcuAm3Y
	gCX4pjkfnNEYwX9UU79ag9gmYjVZFZLS1YEp22M=
X-Google-Smtp-Source: 
 ABdhPJy3M71K7cCoC04kvbaosZEE5ebu/Q4ATS9eYQKVntvmOxvaLtJkf3nXeoeehdFMjN0sz5jQSg==
X-Received: by 2002:a17:90a:fc1:: with SMTP id
 59mr31506625pjz.233.1633269804135;
        Sun, 03 Oct 2021 07:03:24 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 x4sm5654527pfu.54.2021.10.03.07.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 07:03:23 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id E427C960398; Sun,  3 Oct 2021 04:03:20 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 03 Oct 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211003140320.E427C960398@nuc.router0800d9.com>
Date: Sun,  3 Oct 2021 04:03:20 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 14:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156553

Branch: master

New this week: 4 CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

Removed this week: 1 CVEs
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *

Full list:  Found 12 unpatched CVEs
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
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

