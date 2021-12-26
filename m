Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0DEC433F5
	for <webhook@archiver.kernel.org>; Sun, 26 Dec 2021 15:32:31 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web08.17265.1640532750627989950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 07:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IY6LTqLX;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.174,
 mailfrom: steve@sakoman.com)
Received: by mail-il1-f174.google.com with SMTP id x15so10289369ilc.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Dec 2021 07:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=wgcYt/TgwWEEMMwZkY4Bv3i2W9Hk38cn59S2XZ53wmE=;
        b=IY6LTqLXwwWV6PO3LZ5Av4FxNONu6ejP5CHWJlcWz125+HlhoKwlnNgui62eos78Ch
         rbdxL6barUzge5ae8IRhBgja71E/+ef/XvJ5Ys93hYnhgw/RD0hsCDTaQzB1SRnADjqy
         R7eb65T8DNNXeL8VcdtpaecquocfaN7YZYR+nnl7wzHPItpyFhqfoGLMdV6KirwC+e7h
         9yO+9ZBztxfrrSLJSqocbHhEjRUN07OQScP0hfsgihcq1e0o09Hk15+H5NQr+z3m1IHL
         3bU5kNX4xICC+hYGKGYSNB3ntChOxEW1vsrZlw0iy9Y3y07nWc/dXRucdmm9laoltn85
         S8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=wgcYt/TgwWEEMMwZkY4Bv3i2W9Hk38cn59S2XZ53wmE=;
        b=HtKNTs6czWLTfdJC+VvnuzUUbV9lbvDzymxz2Au7BPM7MeV1L06LhTRUNPWO+PhJ1N
         o06swl26XgIiDJVCjIeiiPdnRP2Q0pX8ColgoD4oeBw72IzOeMQ8nlABBBThSiBIfJIZ
         eSkas6q6Yx/z2IltKzt7LqqcYwLIGm+1xrfDsFSQQ8xGeWQG1G7c0KUwD+MHA0r9QpSW
         haLiYWWuIfYQ5I1HDK4NZES9SPPvthmB33Iw+i4bLhtd11MMdS0TLwzRx/3ca68dRplB
         dQO3kMgI2ZAAJkywrdelJIP1mg32SLKRuwZsqS9zxJHaaBPJt8DPr8/ObOhfsni0ZIb/
         ljvA==
X-Gm-Message-State: AOAM531OMcnItzAz9Jux1q2wZ0LKfxs8//0bfi7LLwtdzuZI9rjt2JIx
	pFv9vsmmYSJCcB9lC7Fkt09u6/2Z1HAF/mbL
X-Google-Smtp-Source: 
 ABdhPJxFOWV4YZ4Q4vp9BdIMPqA0oBV0WBZSwIJA1nprt2l0sIuKUTu5NCh37r2peWZG4guVYIENBA==
X-Received: by 2002:a05:6e02:110f:: with SMTP id
 u15mr5737831ilk.140.1640532749435;
        Sun, 26 Dec 2021 07:32:29 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b5sm1118081ilj.9.2021.12.26.07.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Dec 2021 07:32:29 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7A33F960468; Sun, 26 Dec 2021 05:32:26 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 26 Dec 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211226153226.7A33F960468@nuc.router0800d9.com>
Date: Sun, 26 Dec 2021 05:32:26 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Dec 2021 15:32:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160015

Branch: honister

New this week: 1 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *

Removed this week: 0 CVEs

Full list:  Found 20 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

