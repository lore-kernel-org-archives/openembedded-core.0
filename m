Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA31EC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 12:02:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.59931.1656849767959640611
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=pn7lbRMf;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id l6so6240686plg.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=9K9w47Q99HQCqYk/RWTSujyfLZRI9vDUjwYh+QzsEV0=;
        b=pn7lbRMfCK4Ftdh+1x8bupKBPv8e8KOenNE7EhRviq00AC1B6upA5F9IUfWq/psMRY
         vWStCO9xUXZCOztMYVfx1mrypSM2QMgVsEfukn4MnWIPH2MgNDldfWQKd9Bof8WfnsYM
         4xhnH1koP2+89rFXdMt+RwESj/q6K4HqdYvEy/IQ1Z4Pwf2SiVpQYgtkQPKvJ143EwqZ
         +hxMvyr5BqyC+oDY01d6w3lKW04gcxpYo5L7GoAy7GcBQEqkCqBQZg58yE202C79LdCQ
         FFxfvqOs7e4tTrcsQldfbZrXK8KbL9exHVJIqtiw33ahzi6wA3nnfpwFd4+W0FTzphXN
         UqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=9K9w47Q99HQCqYk/RWTSujyfLZRI9vDUjwYh+QzsEV0=;
        b=Ul7taFtJtrqSNzaHgShRb7HBbBqdyMQFFPh+gL86yDZinf0GYnwmNOKdnikQYxECXj
         g4Tw9AswdujcdiwO9tsDRMTDOP0rjVD729DUil2MFfJf6fkkQbcARs0nqyBYhQ6IzNKC
         STp9baKoksObQ+HqBcTRbANFewE4yn1UyWoxYagun0M6OLY+xOJ1WKZUuAU/MJAskmnw
         xB+PFCIq0Lf4FYXPDWkbqiIhTgDznFHC01eC0XZAJ5cyf4eMiSWj6y2u0/c+dcZpuQVS
         iQKBx0Ji/5KLxTVKucyuz4C/8sehLwCJtVQO5PRCFYv8Zsnxy3nagfGrXKD6L+GFjkor
         7GyQ==
X-Gm-Message-State: AJIora8X/pP/sRyB+NlOqy3yNinxsSJ5uj32yWwVUmqpJJV9avm1TLvN
	wivPYRqtr0RcOqGoP8k6umYuDuV51nKyOrvK
X-Google-Smtp-Source: 
 AGRyM1tMtQ5cR/ukxQY3ZyQBGSR+oy3SQwAWbVf05XzriEoQTY7TL26wTUTBBphhewc0r3/j1flv5g==
X-Received: by 2002:a17:902:7582:b0:16a:307a:5965 with SMTP id
 j2-20020a170902758200b0016a307a5965mr30787149pll.159.1656849766768;
        Sun, 03 Jul 2022 05:02:46 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 c8-20020a62e808000000b00525386c17bbsm18982787pfi.79.2022.07.03.05.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 05:02:45 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AB4BD962530; Sun,  3 Jul 2022 02:02:43 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 03 Jul 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220703120243.AB4BD962530@nuc.router0800d9.com>
Date: Sun,  3 Jul 2022 02:02:43 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 12:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167556

Branch: master

New this week: 0 CVEs

Removed this week: 6 CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *

Full list:  Found 0 unpatched CVEs


