Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9BBC433F5
	for <webhook@archiver.kernel.org>; Sun, 21 Nov 2021 14:02:52 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.10781.1637503370822862118
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 06:02:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oUvMF56P;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id r130so13681619pfc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 06:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=lLXReNEqunPDObkI6zkEqpYCn6vY7A6cy5nq1PipmU4=;
        b=oUvMF56PSrkavcsfcq1B5SBMZazSluE4zvmvhXaJC5jf21gEwCTChBAzdHttXZz7Zq
         fjtTNGKDlxR3v4blA1epsYICGuVz1qPEHS0L5OsCbWh3jfyJiICpxC915j6t7mIp1/xh
         bp5vYcfr+iVxLX3NtdB61VsNjrV2YFAUyVVXmIfgUfjTCup/PEoDrEV5I3PMQL1PG6gC
         /THxdXQGXjfTYiwy7W5sEU+teICD7ADbM/iHyQQ0nltm5nJ55RebYt1rV7a3lHWBblnX
         KToosxrJ4vtGpK3JdvLS+nH8zLgp8ubW75xy5B34Pyyl8aasEPp1aFXnM1wYpqLj7ZdR
         DwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=lLXReNEqunPDObkI6zkEqpYCn6vY7A6cy5nq1PipmU4=;
        b=RrprUohHr9gMxf8PeUU7gBy+kuSOHyPK04JqEwWjYNsU5MVDqVrXVlLJ/jpJodkwaM
         5Wrc+x2OwqgC19yASLbpXB6GsR0UYukz06jPHhDBLWTAGQeveoDeY7xQbUPEDvdD02q7
         x9s226A55BbGBMPm2OZ84XqR9idI65cXWAq2flC0FWI9KUavokVZMg9Z+ghU5k9ZH1Z8
         ViwsW06dJb2lj+xoN/qVor1DGzJgtLC6YD3R1/saMg4o4fcln3V1ttpzJhSFL2WpcUix
         XSLbZGJbxHYBmNB7JSAs1nL7PBkiPTmyHaZyBx5CJtV3fjbhprqwsoglpPWXgpu+FFhX
         8YOg==
X-Gm-Message-State: AOAM531oNnyvoAumfelz0jSOeAEczQ9OS+uskE7ayQSyx+VpIdeueO+O
	z8oF1DM3wjHn5lZQOJnDrydO9iydS9ZRVUEeuow=
X-Google-Smtp-Source: 
 ABdhPJzWU+mXll2+Mzzvm6DIp+w9LQdcbLSzN4PS4FFNYD+h44i24DbN5S+mZOIOM/CssWrIvpSxcw==
X-Received: by 2002:a63:1a4e:: with SMTP id
 a14mr27558417pgm.273.1637503369754;
        Sun, 21 Nov 2021 06:02:49 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 f21sm6194929pfc.191.2021.11.21.06.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 06:02:49 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CA9B2962D6D; Sun, 21 Nov 2021 04:02:46 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 21 Nov 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211121140246.CA9B2962D6D@nuc.router0800d9.com>
Date: Sun, 21 Nov 2021 04:02:46 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Nov 2021 14:02:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158532

Branch: master

New this week: 1 CVEs
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

Removed this week: 5 CVEs
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *
CVE-2021-43519: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43519 *

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

