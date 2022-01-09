Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79601C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 19:32:36 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web12.21816.1641756754377961021
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:32:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jYHQRBNq;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.175,
 mailfrom: steve@sakoman.com)
Received: by mail-il1-f175.google.com with SMTP id h5so1241375ilq.12
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 11:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=A/VX6rYMUzF3kOH4B4vRPVSvhvo/QyhNSbCSwdJ/kZs=;
        b=jYHQRBNqkj4MT1TNIIQ8F4LtOm0QNJ9endN3xLWjNcVL70/1Ag8tjy5VozjcvkAeTa
         irw+rgEqhF3nJGDY2Bcjpkn32GSE1bICI91EC/LEw0FgM3Sre/3uwMFZpV0jUpbdlm08
         pDb/VOFA2bdGVPm0LhE4xgRE6+z9ndmI1hLBR7I5fmNhd7DM54iiKKRUFtP2mloJf194
         vg+WWU48fG0qcepj80mNdunWOgte4fkZlNy1LIHJgE7ebEdYAtSH+hkOhfKbZsMhzrpM
         HbPszpFRGeNiI9MnAZHn6XXdJXfAi6ubzeDEQktYPJZyU0jKAG5xVzm0FJPr1SFENTzu
         eFWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=A/VX6rYMUzF3kOH4B4vRPVSvhvo/QyhNSbCSwdJ/kZs=;
        b=fzUciOCoxE6voxWmw2IqPGuWaCr/m8PoLqrRo1hleNcxlW2oh5E/SxgjfRln7uLDHx
         cQLI4d+2og58BicIy/gexkrAHDo2MPb4mi5qT95CJWsaWTODbQrSe5dOVqaTCUbupTaC
         EKPOTmj1y9t8TDFSNRx/MhwJrg5bV9CwMainpEW7ZStAddFX0ysciZcjoLTzlbONVypb
         6vszvxnZyegJxRpmvOyxy53t0JP2sYu5lgO3gozmnM1T1CV3thlVDJjjN/4ih0sx7+AP
         odBSPR/G3qmG7gyk/ZF6/A+3Z1w08URWshxRjy/LrKO1lNNVUgp/4Goid1byTMp4rnz6
         Mc8A==
X-Gm-Message-State: AOAM531/8IPb1KlaM75Fss9RDDBh/W44U4sI5ZSZ+/PysKh8xYpT2aLa
	NebxXL3k/DGo7bnERnKJW9yhVCu3VKBIQdPV6u4=
X-Google-Smtp-Source: 
 ABdhPJzXRbRYSXRvTXxakONFnz6q6r5QRNOZdWp+ICbwpyox7WoYAepSZnVkjR2wsYR060rENw6pZQ==
X-Received: by 2002:a05:6e02:1bc5:: with SMTP id
 x5mr33935805ilv.255.1641756753434;
        Sun, 09 Jan 2022 11:32:33 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 n5sm2969862ilk.44.2022.01.09.11.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 11:32:32 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 27E529607F9; Sun,  9 Jan 2022 09:32:23 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 09 Jan 2022 09:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220109193223.27E529607F9@nuc.router0800d9.com>
Date: Sun,  9 Jan 2022 09:32:23 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 19:32:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160290

Branch: honister

New this week: 8 CVEs
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *

Removed this week: 0 CVEs

Full list:  Found 29 unpatched CVEs
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
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *

