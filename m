Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BFC7C05027
	for <webhook@archiver.kernel.org>; Sun, 19 Feb 2023 14:24:59 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.33215.1676816694672710484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Feb 2023 06:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WWp6sn1o;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.44, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f44.google.com with SMTP id d21-20020a17090abf9500b0023127b2d602so711902pjs.2
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 06:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+8U9NhBJd3I9n+/KWXAGoVriMzG1Yju+Z660J8Gf/0=;
        b=WWp6sn1odLhujzAxmTZMDwI2gdzFcfcS3l/44hiH7X80dHdcY4bVgPVdfJBc4dcXG3
         i7X1+zx/qC6tXpLFtGl0QvA6P5rbWnChewksSBFfldzNNAi22G8ec6EeOMuDwj0HmkjV
         xp+uvNWZYNILukT+WvfulTzOQtXr56PexvXzlVkB5kFEML6b49crLOBHVj5vfD8ADzKo
         FgLjFY7KGUrQN0L0Jm3Ln5OuuwuBmaJRYFuC1Pk7u7X1SvxXe+Sn08VNMEGKY8wTbMOz
         R6WdGgENrzaYlTp7s2UNJFGjyMak5z50o81vHE7xv6gbAR5L6zpGx/FAQCus3DwTft6N
         P3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R+8U9NhBJd3I9n+/KWXAGoVriMzG1Yju+Z660J8Gf/0=;
        b=vBEhUrSdidAcBdbGgm0jDG9/Z4w9qGE8+r6tkIeJMiE4l2xHPS4cMhXlbz62wDyEmM
         5gB06rkV605WDd8hLfX3CtaHeS9KworRQY61WEDf/uOHSgA/ACZbSeFWPj2lPZhapLhq
         mm5f30F9oizLbASJgVuNdDYs7hIR2DbVQIxzj5dgxLiUyHOk2j8DP7SL0HTVuV6HapCn
         Bm4MdA/pyUkDLYC54UzipBdnJCF0bF71B1CTVpISrm38MDGzD4pkMSL+kG4oVehV5gg2
         xIXs9mCPIOus0xTPYVUF0zf0XhaTJGD3nYYewvL+JdQsUinh3ZMU9OfRt/zS3uFm+a3w
         iBOw==
X-Gm-Message-State: AO0yUKWU0ZizQdPZ89K/lUILFQzWK1UumxfLZAewXy0UDR9bRPHnGlyI
	MACrPFq7DwWAt6pEIh2uc2W0XrO2truwk7XM6qM=
X-Google-Smtp-Source: AK7set/7fxnUfo2z1dbV+jQ2GcEOLkK5wTtUshpjRLmkx8viR3mifTZid01gHxoq1OVLumpL3qpeYQ==
X-Received: by 2002:a05:6a20:440d:b0:c0:d8e1:82b6 with SMTP id ce13-20020a056a20440d00b000c0d8e182b6mr10031533pzb.36.1676816693007;
        Sun, 19 Feb 2023 06:24:53 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n14-20020aa7904e000000b005aa60d8545esm906423pfo.61.2023.02.19.06.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:24:52 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id BD22D9602F3; Sun, 19 Feb 2023 04:24:50 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 19 Feb 2023 04:21:20 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 19 Feb 2023 04:24:50 -1000
Message-Id: <20230219142450.BD22D9602F3@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Feb 2023 14:24:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177330

Branch: kirkstone

New this week: 22 CVEs
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 9.1 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-0800 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0800 *
CVE-2023-0801 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0801 *
CVE-2023-0802 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0802 *
CVE-2023-0803 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0803 *
CVE-2023-0804 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0804 *
CVE-2023-22795 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22795 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

Removed this week: 3 CVEs
CVE-2022-23521 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23521 *
CVE-2022-41903 (CVSS3: 9.8 CRITICAL): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41903 *
CVE-2022-41953 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41953 *

Full list:  Found 41 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-3094 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3094 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3736 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3736 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3924 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3924 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-41720 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41720 *
CVE-2022-4450 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4450 *
CVE-2022-44617 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44617 *
CVE-2022-46285 (CVSS3: 7.5 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46285 *
CVE-2022-46663 (CVSS3: 7.5 HIGH): less https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46663 *
CVE-2022-4743 (CVSS3: 7.5 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4743 *
CVE-2022-48281 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48281 *
CVE-2022-48303 (CVSS3: 7.8 HIGH): tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48303 *
CVE-2022-4883 (CVSS3: 8.8 HIGH): libxpm https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4883 *
CVE-2023-0215 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0215 *
CVE-2023-0216 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0216 *
CVE-2023-0217 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0217 *
CVE-2023-0286 (CVSS3: 9.1 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0286 *
CVE-2023-0401 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0401 *
CVE-2023-0433 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0433 *
CVE-2023-0512 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0512 *
CVE-2023-0795 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0795 *
CVE-2023-0796 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0796 *
CVE-2023-0797 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0797 *
CVE-2023-0798 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0798 *
CVE-2023-0799 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0799 *
CVE-2023-0800 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0800 *
CVE-2023-0801 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0801 *
CVE-2023-0802 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0802 *
CVE-2023-0803 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0803 *
CVE-2023-0804 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0804 *
CVE-2023-22742 (CVSS3: 5.9 MEDIUM): libgit2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22742 *
CVE-2023-22795 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-22795 *
CVE-2023-25193 (CVSS3: 7.5 HIGH): harfbuzz:harfbuzz-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25193 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

