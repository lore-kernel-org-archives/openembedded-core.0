Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC14C43334
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 13:03:16 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web09.18743.1655643787262705970
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 06:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=sMLa9PXJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso7929498pjh.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 06:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=bF4Ie7h8OUDaLUu9la2skg41jspdnSodQPNheuNj5dI=;
        b=sMLa9PXJOLE6etlnq63u4b+4Tjrn3W/wnbdDFWklIik6Khi4DJvLcisykI1ntdOI4E
         sgJ3kdaOneootL+ygbg2wKfVbn8jZ5lX5D5V+qBQC9QxRle/xvbUx4NDMMKy8nYFkghF
         rW3uW596Rw+Pd+ZnSD7Fg2QwqjiMHBFY4zhSHLpJq5YyH7q6AGmE8btRvlwDkwgfJKWo
         zH2IZxYSYynYZtOHr4YPtAM8TdDGsp5VbVWWiaE5Ne2vVdLAVblwlsXphzWmWoFXFeP5
         5aU2vD0kEvF3grMEsRbUoEuiWuU/I3yKE60Ch2dP5VkuYyuUB20LAjAXtw2ULNfF28Gl
         YFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=bF4Ie7h8OUDaLUu9la2skg41jspdnSodQPNheuNj5dI=;
        b=tUrVOtTNKbxrMQ8DY7HOn5S5pbzCR6fGPmXrIKM5o9Ry4kbSqfJ+P61g5frQN9si30
         1nNK6Waq54CPvJa6trvb+IcPRd8OihifpbCGAVyjDIFcns8bLpvO64tGrD90mfShMg+9
         KZUrSV0D7sgnQNha7P2f8z+fksp6R/26c0MEYafuuHR4O7IDMh42sMzqVQWWZwQBBbGH
         RCJAzlSLkoZnMHiPOA7jqBqZfdNzO/3+VsQ+Lhl2yNQY4eOybZm8gLR3b+J6fx/3HS1u
         JehUsWVHuCXrsfm2soINO6W7E5as1km91jArJN0DcWu1slLcZt5Gb8/2elInBqpbZrk5
         EiSw==
X-Gm-Message-State: AJIora+ZBib+yO6KiwZEfENn6RQvAPMWW8+YtE2dxiy+Ab1HGvJDjh01
	cHsULFYkUT8j00m7yyMkMe1xT6YAnF/Sx16d
X-Google-Smtp-Source: 
 AGRyM1tKu0d/Vtyvxvaz9KKL2OR4EzfMLrreInbmI5Op4yC2Yxh8+dGTI0HxpeVVEiPySRCTwzyEsA==
X-Received: by 2002:a17:90a:b88c:b0:1ec:9449:219a with SMTP id
 o12-20020a17090ab88c00b001ec9449219amr5178663pjr.243.1655643786110;
        Sun, 19 Jun 2022 06:03:06 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a14-20020a63704e000000b00408c592db61sm7134081pgn.71.2022.06.19.06.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 06:03:05 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 85AB1962583; Sun, 19 Jun 2022 03:03:03 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 19 Jun 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220619130303.85AB1962583@nuc.router0800d9.com>
Date: Sun, 19 Jun 2022 03:03:03 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 13:03:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167036

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 1 CVEs
CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27778 *

Full list:  Found 13 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


