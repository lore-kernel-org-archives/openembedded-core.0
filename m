Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F23DCC433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Sep 2021 14:02:50 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web09.18879.1632664970149832825
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 07:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=78BjfjWN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ot1-f45.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so20588572otj.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Sep 2021 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=cxwQki2Jh+jEuVYdLoSoFUKRBDFLgkp7gpnG52T4w9s=;
        b=78BjfjWNyPMKtsTOYlZQNn3omJJBBFyn07LRYMCdRwl2wRDhTiZvuWycvh6U2rtJVj
         15LacCj7bqhBWS67/UqSR/L4LuH18O69ZgcsV9MH7A/zh3FzXbkYQx8GwMxH/9T1hbXW
         qNM2XBrvhvKcAeA8UwNohwqI7HIdzCIbG65rOs7UUSFOS3d4CpqUunXr+6UMDmajAlYV
         0Fv2AY/3Z0wHot4IQ/nYdDDhN4kJy7wNDZZQNjuwIH55umOAm4HnhYQPhB5mjh/yhgux
         vHnEVVw5s1ptvPjaVHYQGDDVbH9Z5qyvN8a5bapdp2zdA5AOKpZ4sM+p5+JQoWap9BIC
         +tsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=cxwQki2Jh+jEuVYdLoSoFUKRBDFLgkp7gpnG52T4w9s=;
        b=OJsAVJOwANUx+FApwBab1ZtHtjyLfT34NAo88wuBkVX/XmLLxFfPJ1VJ+aGS/XREnI
         lxknAx52SjzV56faGh7mhoZWomP1RijuXyIUF6MEpTOu2IrklyNxwUvpi/xH2g8BMs+9
         xaJ+5kPMc2vYIA/PLqpEhqtDSzR3Mm6rHq15cBH5GxgQGW0j0/O1MiBLDHeRwAEVMjss
         ytUW6vOKyMMH1sHLoVAiZg1UoC0V4aSVSgcBTBdYYK7bOaLwDI/S0c5+rrrWQpOyBRQ5
         SN5P80xxEhMAsfHnB9wgFPe5jQz5KlMB3KVwOZ5td8gETyBJpRVMBT8ZyQb4s9EtmJ2j
         XX3g==
X-Gm-Message-State: AOAM530W1JOCbYVeebjeWTgoyQVwkeTdJpqzKxvSV8uP+HBYnYXUZSEX
	62vQl0ib5kzcy33spiVbtzBd4y8ZRVw0Cx3MSME=
X-Google-Smtp-Source: 
 ABdhPJzdfjaRxe6zSV8K30xvhJc33bkjGEWVMuHjLjGUptljdpF5o0lP2wvdxaT2nRijnnZhK0TpJg==
X-Received: by 2002:a9d:75d1:: with SMTP id
 c17mr13361635otl.168.1632664969008;
        Sun, 26 Sep 2021 07:02:49 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 k15sm3529379ooh.41.2021.09.26.07.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 07:02:48 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 712B8960222; Sun, 26 Sep 2021 04:02:38 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Sep 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210926140238.712B8960222@nuc.router0800d9.com>
Date: Sun, 26 Sep 2021 04:02:38 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Sep 2021 14:02:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156363

Branch: master

New this week: 1 CVEs
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *

Removed this week: 4 CVEs
CVE-2021-36690: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36690 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *

Full list:  Found 9 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *

