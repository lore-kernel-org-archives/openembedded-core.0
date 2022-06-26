Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF32C433EF
	for <webhook@archiver.kernel.org>; Sun, 26 Jun 2022 13:02:31 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web12.29783.1656248541310807125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 06:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=NGc3QJTU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id x8so2055798pgj.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jun 2022 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=/KJ1DwRoc7T5YtTM3fUi6ZZyiHL0Ra27ZLtn3I1jSZU=;
        b=NGc3QJTUptXvWorVM6/k0Rtwv6K8W3QWRT89fczSWJI5Bn85C5ZX/g6toRgQ9Bdv6Q
         bcKtGjUhlGzzYVt3BVLwu4KX4WcNNJdh4rT+hxdbqrcFwFsLHpVBa4hvYHiaE9yuz/R7
         ABgqWFmSqdJCifY9Qu0anw96sVAEPa4Z/49zWuViWb3Et4lO/FrA33UxZ1zygUvgJbor
         9p6pyyf+9+YowcQXXrfklSlbJw2Ysw8h4E4hy62drYDrvbKh63UisbLMVZrfkqbYEemC
         dt/SZQL98e1GBIMPfDglLE81kLUbTfpdkIRJFLvbptUNWd3UivuUny5uji+T2ogiI/q9
         3pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=/KJ1DwRoc7T5YtTM3fUi6ZZyiHL0Ra27ZLtn3I1jSZU=;
        b=mE0/7tJqrYBv66oUZb3gFMqCNgUeu90tuSh07QD6s7yMdsrmFfGulmZ6g+/Hqv5xbg
         YEg/6eZ/XgQpc5rpegkvBIvWo7oby0K3o5QQyxG/UATzBrOezZzAGT6u3XiyvQFl+HD6
         u2P29DIku27PyCO5KzcAOhWAz81BHa7Q7S+GNorrUBLJUjfWYkQDcvpE9u+/6xfkXbLo
         BQHsunrnpmqzyXZeWA2gWTxKAe+aFvrmxd5Xy9FW3i7A62T5fgsV6MkAvINpW8uJsbHW
         n+0SXZ6ErGAw1xKxkgBKQIhED10CrVeUNbHfjN1McGWiEfXRkytk/78iQ6/aUKUsrUeX
         f58w==
X-Gm-Message-State: AJIora/gb+fPfXshSfa4937ZF1dorWk46EpKoc8ickJQhITWje6n2G72
	/91QRKaNi+4XZd1k/Agwk9jx5d0uNbW3nQKr
X-Google-Smtp-Source: 
 AGRyM1tHIU3cG2OutRcOlWRD4Ey3BIhKG54eqBIsDZmPokG41d2x+srj9DBNg1MWW5fFDYFwdqG6ng==
X-Received: by 2002:aa7:90c4:0:b0:521:2cd6:bd3e with SMTP id
 k4-20020aa790c4000000b005212cd6bd3emr9357827pfk.19.1656248539890;
        Sun, 26 Jun 2022 06:02:19 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 b184-20020a62cfc1000000b0050dc762816asm5266394pfg.68.2022.06.26.06.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 06:02:19 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 52C1A962544; Sun, 26 Jun 2022 03:02:17 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 26 Jun 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220626130217.52C1A962544@nuc.router0800d9.com>
Date: Sun, 26 Jun 2022 03:02:17 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jun 2022 13:02:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167311

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 2 CVEs
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *

Full list:  Found 11 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


