Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07008C83F2D
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 11:17:26 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
 by mx.groups.io with SMTP id smtpd.web10.25639.1693739836912898122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Sep 2023 04:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=kNd+dGnN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.50, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6bd0a96e63dso467385a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693739836; x=1694344636; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XsJ8nq0/gg41CdtvXmQ0/mRlo19b36ezHJKRJ63FSbM=;
        b=kNd+dGnNZdtusUtqAA65Gace+2Uh9IbDm0n5SWL++l+1s780x2ZFpTvmSzK2zPyViM
         3IZjuLPV0+0e15DLcgwyH4HQIsXLR9bnJG2Mh0kZNlJsdmLUlnFsSSXZf069Ayw1wSeX
         OPMwuZMDYt4cWH9mIECeobs+P8ZPyf4equaTFdmwgZvyIu+rhgQjT+hgERlGXu2/3yWQ
         ZVRKtxraJmrjQctR/Zd5mYSL/PBD8rQVx6q5/8BmI0XyIuFwFjXbqNvTtntiKWMdGO7e
         OkuUxb4EHysichmBxTKmIGebav87hs/EZqWTcl1zLV5bO14NdreO74w9xk6ewWN+OJPr
         U/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693739836; x=1694344636;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XsJ8nq0/gg41CdtvXmQ0/mRlo19b36ezHJKRJ63FSbM=;
        b=OEOIe/kq2ghsM+4uLgrVgUOFOpncHunbfP3IW+117J/qXsiacOtKbsX95gEtToQvTF
         0GDKhu2tndVFEjGMwHWhsHC4Sy4ijz3/EHcOAw41De076XSyK9LZS21PxbuIY79oJVKx
         wDT2y9nwKtcsJqGgi31WU8fdeveYMBq9JKBk05cb5VKVb0koDvLTtNm3OUz1IOUEQb+e
         Z3o3k5y3DhJG9Gr0Q7OG4xHxb/nAPmp9fwKyh4g1x1Rziaqd7SBceaia6wAZPyqVc3y/
         jYFvMk9GdaPbsxoEY9VfpIJRgCL2B4ehaF66sDieameGJa+OtNRJGEOKqRUC5s562IAP
         xGpg==
X-Gm-Message-State: AOJu0Yw5qqwA617Dnn4/Ew0KydMTr3CiTV/xC7EzQSZG890XKc2CR+bF
	XHP0qkrVK8nywQIQUjNLXqcaX4R9EaNikDYfAQbmqw==
X-Google-Smtp-Source: AGHT+IGZktonUrfsTzwjd0T6d8sHBbthNGAVWedhQ/LV4U0aqDbNU8zG4MYFiFxKF4RgGBAO3NPOdA==
X-Received: by 2002:a05:6358:52c4:b0:139:e7db:3f3f with SMTP id z4-20020a05635852c400b00139e7db3f3fmr8473080rwz.10.1693739835596;
        Sun, 03 Sep 2023 04:17:15 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id f1-20020a0ccc81000000b0063f822dae2csm2809555qvl.54.2023.09.03.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 04:17:14 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 1A7DE106AAD; Sun,  3 Sep 2023 01:17:13 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 03 Sep 2023 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  3 Sep 2023 01:17:13 -1000
Message-Id: <20230903111713.1A7DE106AAD@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Sep 2023 11:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187154

Branch: master

New this week: 3 CVEs
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4569 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4569 *
CVE-2023-4611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4611 *

Removed this week: 2 CVEs
CVE-2023-40303 (CVSS3: 7.8 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40303 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *

Full list:  Found 29 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0687 (CVSS3: 9.8 CRITICAL): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0687 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-28736 (CVSS3: 6.7 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28736 *
CVE-2023-28938 (CVSS3: 4.4 MEDIUM): mdadm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28938 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-3180 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3180 *
CVE-2023-3354 (CVSS3: 7.5 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3354 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-36664 (CVSS3: 7.8 HIGH): ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-36664 *
CVE-2023-3772 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3772 *
CVE-2023-3773 (CVSS3: 4.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3773 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-40030 (CVSS3: 6.1 MEDIUM): rust:rust-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40030 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4128 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4128 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-4569 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4569 *
CVE-2023-4611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4611 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

