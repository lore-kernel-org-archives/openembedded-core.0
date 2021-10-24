Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0178C433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 15:03:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.19735.1635087783912464361
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 08:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=A0Ll+r8Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso2277650pjt.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Dqbs6ZbR7AKVTZ40zEKGKzEI4yftcO2lyogRyPmW/AQ=;
        b=A0Ll+r8ZCFGlfcK59j2BPN0oO7s8l4RelZ639G69FrabY8hOZZuY0UeJ/mkSBtsHyJ
         T8dRp3Bcz1cLTVO05bi0CiwF5mwajCajLQjFGEvERobkEKpBa6eYBU39iaE+BfS5qZWw
         Z7uuX/IMIo75CqR29CAb7Iym108QsfeVxcTMP0iYxSPkApvls38ekwfpoAbMlAmuGhQj
         s05+jBNnFbyFT4+d0KrVGq/MlbFEo5MS5yurWjlgdSPF1L3lLMZSUFohpWPwNSDhLLPX
         pjiUVmVS7XeJboLishhVVNGUVt1bqGakTzDJCvDKuheiHz3U6kTEJ2ozOtUV9z7SFF8J
         My+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Dqbs6ZbR7AKVTZ40zEKGKzEI4yftcO2lyogRyPmW/AQ=;
        b=5jlK95fa3fnc91nFykq4vfVxCPriXHQiAH1YsoPN7+DycHNJmerNEejdh4LsAju1Ft
         W+J0h31Zprpi/w7peRCnY/UWSAW5GzPUlQaPk01pDqUZmBkUmoqRXq+a7aKFPEsdXYmk
         AfbdnSeYlBLvh9osA86Bgfg8buuYYesEP8ltfQ0VUinC1H4eiCloJtOTQeBRq5xsfob0
         NFw1QlS/GUXgDNYJnijMa/Js1xCSzyOvKmvXXiansqSuDjvOffF8Twe/4ufTMV3cHUcS
         tHNn69L/bi+mhszI3F9kcgu6BYLQUz2UUahNueY1YKYPIVUIUOfJvEYCrrhvdQ/IOUh4
         /1Dg==
X-Gm-Message-State: AOAM532HhxephmqGIzs7YkQ/Q0zfUzzRFmoEhWJYGtoWKifTUEQe3Lw5
	G6hiOITmEZ/74aCZuCX836AvQ6UPShOtkvlr7yY=
X-Google-Smtp-Source: 
 ABdhPJwpgzotFVjRgGHepwUyaPBOdOYGNZY5YOwJDfvFPzn639EwUX3tw/macaqqttDZBItRpCTVnQ==
X-Received: by 2002:a17:90b:3ecd:: with SMTP id
 rm13mr14150612pjb.189.1635087782718;
        Sun, 24 Oct 2021 08:03:02 -0700 (PDT)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 g16sm11175567pfv.192.2021.10.24.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 08:03:02 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 79DD79602D9; Sun, 24 Oct 2021 05:02:53 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 24 Oct 2021 05:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211024150253.79DD79602D9@nuc.router0800d9.com>
Date: Sun, 24 Oct 2021 05:02:53 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 15:03:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157327

Branch: hardknott

New this week: 3 CVEs
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *

Removed this week: 0 CVEs

Full list:  Found 35 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-22945: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22945 *
CVE-2021-22946: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22946 *
CVE-2021-22947: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22947 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

