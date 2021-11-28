Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE9C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 15:33:14 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web08.49087.1638113592969686738
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 07:33:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=l7f4XGC/;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id 8so14032222pfo.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 07:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=TNAUbuUDGoCjGqdVMYpaG7HXzEYZ6qA0mlvDTbwY2SA=;
        b=l7f4XGC/0w8eL7vU/iJD71yPPNMP399d+olVfhb211pXnhUBECh/3i5uNrwjUxlnz9
         lbXGWZeua5h5o54Y3gT5YikJ/CfVFKwqfVIb0AwE+l5Phuai/UHp+grDHq9zh/1AZ+yk
         mmRhHCHLd3GcVmBqTmOcoAI3UIpRb3TUs3zlAoscsOwK2n1bW90GUZVc4khbhVS9EAUa
         LRlHV3OL4qEiXRmG3/2bIvu3gZkUEVCDsDkJB1sZqGC9GpyNwdYHqTAWDCwe2D5zALA6
         O13suFmz7Wgkk88zJfJ6JW2iiY2XRPPB9408qLxeyfaA/Z9jm+NFXmfqipzwF5Yt55MR
         MJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=TNAUbuUDGoCjGqdVMYpaG7HXzEYZ6qA0mlvDTbwY2SA=;
        b=L8SDDaAABJiwb8EXj3ZmShXqPUJl0goPIYoU9GW28tht7oRHIu9Hc/hxSqa9Yd5EfO
         bm+m4ksfQD5qw7dJ7rFN276apjzon25iSXOxNN1aA6IZejW68c71L5Q3k8EejvpKYOby
         slq8wiw8rWL3Dt85DqPH7Ozie7SmL0y+tNm4n+O6FNeCIFR5bm4DgzakZ5GTD0UVkuzL
         KfxjEdGpRxEVtKdlTWtS5Pye6pLcmXqdxDNjhESctOGSvfXL9sTe7UlDH6C0N290JWxs
         oAfbz3mLjkFQ8XaaOjxyig4NU1Y/bTnO+vfxELkBr4lX0i38hIiZ8wHsnU0EnPXPKidW
         rBrw==
X-Gm-Message-State: AOAM532fvk24of1/ayD4aGA8OT+o9zybYd0nWCH1T1hjcghB2ZN9PzDx
	KUoYIa78QUx2pjB13nEHSY12LLmP8ExqQGbapAA=
X-Google-Smtp-Source: 
 ABdhPJx40f+co2CaG4C+jtwkYSyzfzW10ggyBTsNMOh7qUZp/2CxIX5rzaMogJpvbjT4wNVziUmQyA==
X-Received: by 2002:a63:ee53:: with SMTP id
 n19mr17198448pgk.593.1638113591644;
        Sun, 28 Nov 2021 07:33:11 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 nm13sm10718172pjb.56.2021.11.28.07.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 07:33:10 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 05E8B9603CD; Sun, 28 Nov 2021 05:33:02 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 28 Nov 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211128153302.05E8B9603CD@nuc.router0800d9.com>
Date: Sun, 28 Nov 2021 05:33:02 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 15:33:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158880

Branch: honister

New this week: 4 CVEs
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *

Removed this week: 1 CVEs
CVE-2021-43396: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43396 *

Full list:  Found 24 unpatched CVEs
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
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

