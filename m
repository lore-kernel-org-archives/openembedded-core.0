Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D69C43334
	for <webhook@archiver.kernel.org>; Sun,  5 Jun 2022 13:02:47 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web09.20238.1654434165165567156
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 06:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=HyamRWHB;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id c18so2547201pgh.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jun 2022 06:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=N+nE2rGBCcMKuHHnZxDAEqjkv1qeTsck2JOxQF2D7/U=;
        b=HyamRWHBMRJJ6XbpsqzOWCurkoiM7wt0GtuiJe78eRO3o4b4fML7EnJn5lzehiuVkr
         +X4XIinVe+iqitx7ry4XQbXdR2h6wYdWprLdg1Rp+qvnwFxcVLomJqG0VYVs/U3dzVOw
         mTIvcFriwnKMpRJ6gHa3+6FwTp/BjJntuYCCDBnG1AwH+m4Y0qwQwVRtdVJ6/CGxaK0W
         /iZxWffbh4ZanH/0i36I25zKkwT6RTaXJQBgg4EIKsey11qmK4CIXqy9LjeBzCnGP7yL
         SHiHG79qrE34DdAprGGzCAyaZeItMDhyKaQaALvOmrkC4nKPqDiuNjcxIkRKhwo5shpA
         oKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=N+nE2rGBCcMKuHHnZxDAEqjkv1qeTsck2JOxQF2D7/U=;
        b=tv9YsnMaZTO+PPmKkYCYozVk0S3Q2cjXqDk5wrX7nR5Vx77GPp0VCPSXeNlYJzDFpu
         OzLjID3YzZ1v7zGEfkviPx/Z4vMQilvQSBdCCijaNovFDiKnZ1IjK+lTdLHDgnW6/aN2
         aHj1WAh4cPsO19T0FeswoxWksEqDamYA/hGiLUVutDifn2FFUmEmQlPngSKDDH+58qxv
         y4s5PzEBoBUTbkFw8BU03zM5hGMZylOQTRyslz2TSYhp1S4fTDmr47bIEdE7x0jhSdy6
         OrygENYbBgVz+ooEC3p+z+7uZumXDvmq2AUO5ExvZT4qRbKzXk9YVF8Kn20dLxSjPxni
         hwZA==
X-Gm-Message-State: AOAM5317wQa4X8gnbCn6YsJe3nymA6DxS9GXGSOZ1byPCgej20Rnp3ma
	9pVvrG8nmwcldEtaDccdzbj8kqEs64dWDowF
X-Google-Smtp-Source: 
 ABdhPJwarJ9YvS4RMa57vj6UTJnohnvTnZRd7wEDofqOJRuNV8axZ8/uTBouN/A5/OfY7weBwNJaIg==
X-Received: by 2002:a05:6a00:cc7:b0:51c:22b:b657 with SMTP id
 b7-20020a056a000cc700b0051c022bb657mr4882102pfv.56.1654434163848;
        Sun, 05 Jun 2022 06:02:43 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g25-20020aa78199000000b0051844f3f637sm8739852pfi.40.2022.06.05.06.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 06:02:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 7024A960B07; Sun,  5 Jun 2022 03:02:41 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 05 Jun 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220605130241.7024A960B07@nuc.router0800d9.com>
Date: Sun,  5 Jun 2022 03:02:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jun 2022 13:02:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166580

Branch: kirkstone

New this week: 5 CVEs
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1851 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1851 *
CVE-2022-1886 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1886 *
CVE-2022-1898 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1898 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *

Removed this week: 0 CVEs

Full list:  Found 25 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1587 (CVSS3: 9.1 CRITICAL): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1587 *
CVE-2022-1621 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1621 *
CVE-2022-1629 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1629 *
CVE-2022-1674 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1674 *
CVE-2022-1733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1733 *
CVE-2022-1735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1735 *
CVE-2022-1769 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1769 *
CVE-2022-1771 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1771 *
CVE-2022-1785 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1785 *
CVE-2022-1796 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1796 *
CVE-2022-1851 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1851 *
CVE-2022-1886 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1886 *
CVE-2022-1898 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1898 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


