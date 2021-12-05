Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8944FC433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 15:33:07 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.38673.1638718383781012657
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 07:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=2W71AfiE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id r138so8019783pgr.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Gg4dlxwBdzuh6MglB6HSRncbiIlcTxt4fjxeqq4dCNE=;
        b=2W71AfiEa+b1MwkZ2/Q2o/4uGdr6/S7tZ1YL5/aE0sLjJuepMy6MZDjLrls3nnIhEB
         GT9//UFD0nV6hrJiHgpxEu3li+MCPTSwApBy/MAKioj9aarNq85C9I673eFUeJO7p/+v
         4QTZBaLjVGWJJKZBd0Od0u5mWaPxcu3mYwVCc1Ok36N4ZfR+hLHNLBQY8/x4UNAVSGBr
         Ex05dtwXdPoQUp30DQH6FcDYET8SX4VMa3RUhMDsRdivvDk7QxURGOJTag3Yx0R9d+2t
         Dm6ZLMRONoKQF5t/P6/VPDZzei3mFNlPalk7xMQdagVAMqPlXrjkxFHUwCFmFFHTWxwJ
         nxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Gg4dlxwBdzuh6MglB6HSRncbiIlcTxt4fjxeqq4dCNE=;
        b=X8jwhwJ31PeDb7H6/a0LESx2q4QetNa7MR06mkjELcwYyHyuTgkKjF3/Mk+HT4X/rI
         nZgkyw8dmt6VxsezarAigi9NY/xsJ/I/mnWY3D/0bsMHRN+RLIpk/pQHEylnYk6k7urm
         u3bDGTIPmlFqPV1i65yTmwy+XpjnNlQDAFRBKyQgeE7J2TSzPBJUGQTr83k3KrfzSS7A
         twKLnIYNb/uGpG0l/XnzAQhWLnzuRNu6/ZUqBYGAOwoGGf7Cwhvjl+GRlZFArawManjv
         CFc2luJbCclKmwRCJWhcrQ67M1/hMAK6Jwk853p4wp1Z2BLcj+VbhWQEqILLpsEP+dXG
         du+A==
X-Gm-Message-State: AOAM532o+pzqmFtjdfn1NjfP4OPHL0p0tTBjwD90sJGK/DtNs3IJPu8D
	ab7MhktjpcvdH5haU3jpPHNEUXrfIIKctbd02Ck=
X-Google-Smtp-Source: 
 ABdhPJysVffxpndkLg+Hh6ajRbdggz3mtm0Tn5HAmloBe4CKOVh/hflS+z4+G9Endp35J8k0xdO17A==
X-Received: by 2002:a65:51c1:: with SMTP id i1mr14706624pgq.600.1638718382672;
        Sun, 05 Dec 2021 07:33:02 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 p10sm9193601pff.173.2021.12.05.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 07:33:02 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 239E89604A6; Sun,  5 Dec 2021 05:33:00 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 05 Dec 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211205153300.239E89604A6@nuc.router0800d9.com>
Date: Sun,  5 Dec 2021 05:33:00 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 15:33:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159196

Branch: honister

New this week: 2 CVEs
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *

Removed this week: 1 CVEs
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *

Full list:  Found 25 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

