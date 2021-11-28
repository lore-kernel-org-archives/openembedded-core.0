Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2600C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 14:03:41 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.47704.1638108220606332768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 06:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wRGnY/Ou;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 71so13117440pgb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 06:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=kACRJAb6/6gmqzMXGTEuV/V/MGdwC4cu/Eoc+h8unV0=;
        b=wRGnY/OuUAcBxFSWybDd5Ga5RbL7LbIjfPjE3IRAS/1/66im8wdyab5m2RPJSE9em7
         kpD6+DO50Nv5UZFhy+MVQm9ybdeuhDLz818D76E9GZtDCefEjzOpeZMSDQwQzQLBYDYt
         3aFfTBfSmjH4SiHeeqEazWqbbTQaa80rezNPWMWKKkXLBFVqy8Rd8TXARIGDZGsAIJjO
         vCsND5l8KbeX/F372QxRPG4BKLqgsUhtZHY6kqUa7i+9cqSCW8xBEppgmvzN2y+2T//a
         sXbHrztzXEZJatMx2TMm/tyIRI0BQ5CCQLPDXBhw1/FSqLtKQC8VcgJXA50ZPx8qlnzB
         Gfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=kACRJAb6/6gmqzMXGTEuV/V/MGdwC4cu/Eoc+h8unV0=;
        b=AWx5DvwIuOq6HZjIdsHdeGxtM3jyjJImo0p/gGXHGD2E6/ugRlJKp9LqSVlW97XV1a
         9cEATa1yTB082b8NjQf0aPDtI0vF+zFhrpn1fwUM0/zOOPhlWZneC8I9mkXPi3LTIdvG
         AYt9aVf3kxu4sAbty5dJVqrwZ2chj6nS2i5gNTmmjSCnD5eSOtAz7shAsWNMXR3dAtAA
         NnMvA7ENd5yioBpntqL3WC0yjBKeQzSLdX/nxRc77L5ZKwiG5V9cg3ZbxFISXMKIucHz
         pl9/xnUvaQ6qNgMbnNGhSMpH4X/FcL4hoYWXucFCtDB5zPzn9JCx167aFG49rtMBiiMT
         xgWg==
X-Gm-Message-State: AOAM531PqjYT7x+txhFPAW0HLBX8Ih3839VGM4MjFEPjpA+J/zDIL2Bp
	aFewGazyrsoyb8szjSgb3SPEqzkf7cIyt6c9b3Y=
X-Google-Smtp-Source: 
 ABdhPJwClq0v6Ln5P2igY6fELVMLDo+vm0hoXPDFcHelGWDGaW8p17na7pe9L8KFNQ2hyOEaeMmNeA==
X-Received: by 2002:a65:5688:: with SMTP id v8mr30149802pgs.304.1638108219175;
        Sun, 28 Nov 2021 06:03:39 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 q9sm14763796pfj.114.2021.11.28.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 06:03:36 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 31E449603CD; Sun, 28 Nov 2021 04:03:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Nov 2021 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211128140323.31E449603CD@nuc.router0800d9.com>
Date: Sun, 28 Nov 2021 04:03:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 14:03:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158877

Branch: master

New this week: 3 CVEs
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *

Removed this week: 3 CVEs
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *

Full list:  Found 10 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-3968: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3968 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *

