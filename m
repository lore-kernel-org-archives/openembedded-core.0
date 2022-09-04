Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A242EECAAD3
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 13:03:36 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web09.13106.1662296609753258010
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wmEiwzrU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id 73so5971376pga.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Sep 2022 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=cisEAGWnZ2hHweHjFy/83lN7Rn1lkjDmlWu1g8hPhkI=;
        b=wmEiwzrU1+qWKtvY9fCi+YbTwzwBslA1kzfPiKtCTDYjb+V6ren/XizD+bo/tt/z2A
         OzUs3uFYDSROMESWhpLbr1nPBmC6Qv64sanIkpymh53k2eIQPUuiG+v4WqHM+kBxyprT
         S4OKvpvXqlgkJMhQZkJP5+2dxxGDGCA5viB7jn08T08nwXzzlhHvBgGS1k+4FG4q8n/f
         C6PmlHqC0fGju9lbkzNCYtSGDYAAqmxcINKYJutLv3MZYPsDJMCvtXVunMHt+NgLgbk+
         5jSSnMI5U/JneOl2dJTHjJc0ZEHCBAbdvtrx8CTdF969S6pZpf18nsN8GWWeNjU9kGId
         F51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cisEAGWnZ2hHweHjFy/83lN7Rn1lkjDmlWu1g8hPhkI=;
        b=WfJJCMcc83rwxThgNq4mK8IMj+Wd5L9SXQA67Klf6E8RH2HCGrQpowwA+554iRrage
         8au08YBVlMXOXRGrB7bNR+JIX6/uXdfSQ3uySo40xNItHbeTn+/pztsjujroOqsB48tV
         gpj0xRRO4LHCQgF7fVH7WTiZ9LZhOnmgl0cWKY/Wm6lUz4TdfNNNnNETPhQIWTNwvEq1
         31xXS/bRM/odHlQBLHbKY7eGhw317/fNpYTcJdWEn/P0NP8YxUZ9aUV1E0URnpcCdL1R
         E3suiIcrByjRdW347zx/DmIRGI+vUYJXjas3/UcgLy8bJ6WoWamOJhu+vq9KDbjoSPW3
         Iy/w==
X-Gm-Message-State: ACgBeo1gQcUYz0UhRn/O2cM/2fLz/jvUrAaCv3rR0J03EWcxqimqNO76
	9hmzADRFlOsOCJbPjMj9fpD3QXvAs4jAoNRS
X-Google-Smtp-Source: 
 AA6agR7MsBOQYvumKaLGnOgazi0QGz0pH7VxZ6s2Eyi5MCvQD67LrVDWfNabq9NqoSqsMv9NmCjO3A==
X-Received: by 2002:a63:560a:0:b0:42a:7b1d:4e08 with SMTP id
 k10-20020a63560a000000b0042a7b1d4e08mr38434536pgb.594.1662296608407;
        Sun, 04 Sep 2022 06:03:28 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 z27-20020aa7991b000000b005385e2e86eesm4887408pff.18.2022.09.04.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 06:03:27 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9957E9608F7; Sun,  4 Sep 2022 03:03:24 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 04 Sep 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220904130324.9957E9608F7@nuc.router0800d9.com>
Date: Sun,  4 Sep 2022 03:03:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Sep 2022 13:03:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170285

Branch: kirkstone

New this week: 8 CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-3016 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3016 *
CVE-2022-3037 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3037 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

Removed this week: 0 CVEs

Full list:  Found 19 unpatched CVEs
CVE-2018-25032 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-25032 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *
CVE-2022-3016 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3016 *
CVE-2022-3037 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3037 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

