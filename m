Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BD2ECAAD4
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 12:03:26 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.12782.1662293004127338687
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 05:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7vcM2ZJI;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id l65so6191639pfl.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 05:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=mHlY+YvNp1Mdj+C8BBE374HQ7MF78EiquuSGaC7y4sc=;
        b=7vcM2ZJIUbAowdvxvSP6w5T/0lSJrlgeHp93x/thJtYRg/NLP2L0jwYXTku2ENuG/w
         49Q7PFQKCz2tLjQiKLL+LEse3O8tTc30kx+a/5uYsymzfhfBwZJedYB1PUmRS6jlloUx
         pibOJjEzxJ1CWyJtWKwVirqM4OpOZMAhIwejQVNgvDMB+mUQwDFV+/qvHz7HOymA7S90
         j6I55kmH+0WqKABCfpQK8q+j0qXoVEyzkjNaphC9/ohKTElF7cctQMWBSvXmfC0L6BB9
         FtnDimGRebkqxXRAQuCHO/Ps9PRbj3dEAACqkS7k7qRkg4BfrefNzkiPs2EDmSh24di9
         d1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mHlY+YvNp1Mdj+C8BBE374HQ7MF78EiquuSGaC7y4sc=;
        b=Zv/zc1IJONm4vZY74w4WbTJL+KcppVUgjuVlSRC3qheQuV/FTFGH6hSlxrdr+wZ1J0
         nZzS2QmKllignGbTb4mgg9SygOXXecHkARCxELTuJIFcnj7sNNSQdsCokBIeUio58cEF
         fWvyrnDtHrY3MefCE22tx+rfPQrsM8JzGQ5idBvPfGIqREPHJg0/Iiv9TlqYG0LT4AX+
         6t3ST5rCCF4QPU0ay8HeguwLhocj0bCbpgsKnnVMrETSY/u1Fg0OJrVTIm4DzaUNGyNi
         hkFFS25ZjtlFpftaJZc2g7Ce7Jm7bb628kTDW6RWj+jll34lTIlHF76KxQO7k+I2swQl
         iJug==
X-Gm-Message-State: ACgBeo3I9Hv+R97ZEjJPR8BBvOr72ynbjTheukLdfjneInfQjWvY43n/
	wjvwKj9LLWGJwZ+Vwlg/UKNgbolLJcxoow2l
X-Google-Smtp-Source: 
 AA6agR6QK/Ioz8zJYhhC8rfKts36L9U5tkqfyh38Zgy2m1oj8SmnprDdg8LHlWtFSObFl3A68HAB9w==
X-Received: by 2002:a62:e815:0:b0:538:b74:6e4e with SMTP id
 c21-20020a62e815000000b005380b746e4emr37309678pfi.39.1662293002727;
        Sun, 04 Sep 2022 05:03:22 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w10-20020a65534a000000b0043014f9a4c9sm4544897pgr.93.2022.09.04.05.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 05:03:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id CAC2E9608F7; Sun,  4 Sep 2022 02:03:19 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 04 Sep 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220904120319.CAC2E9608F7@nuc.router0800d9.com>
Date: Sun,  4 Sep 2022 02:03:19 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 12:03:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170283

Branch: master

New this week: 8 CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3929 *
CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4158 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

Removed this week: 3 CVEs
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *

Full list:  Found 9 unpatched CVEs
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3929 *
CVE-2021-4158 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4158 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

