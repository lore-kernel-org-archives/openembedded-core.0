Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69810C433EF
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 14:02:46 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.20673.1652018558856918892
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 07:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=B2AOxirx;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id iq10so11017964pjb.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=644zahevasDdI6Scj+n91208MB0k/FKcIcMDWXyNpgI=;
        b=B2AOxirxRBXLisuty/f6Q6XiqRbNhYgC4coD91N7e5+e9YAGmm2HCPc7K7QKW74Cdg
         zoKqCqmRi5+fEzWdsg2wy4zFybICveMdX0VY8G+nrNYshzgnp4gQkijmCcsQ9Qqs9sP9
         5JKjBTktFAeKA3moPsVuoW7mZc1qa3AHhyC0t+bwG/lZrxtUun1hriBFjFY9SabcKGcL
         60kE6dpBt7EakBDUTKTmN5K665VwZnYZ/BxTbeu9IrBbSatczuEaK6xsGOJrnw1oy0e3
         llS7T8/+C5xAv06NXZ/5AEBWxTXxHkdEr+A+VkEmvJOCGMf13mc3oLsffrTP+y3KCW7y
         VPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=644zahevasDdI6Scj+n91208MB0k/FKcIcMDWXyNpgI=;
        b=JgCKT8L4F8lnVnF+rBsSgNnbU+p+K7o8JAHxb/BzhYZ/LLAyFDEZK3+aXic9a48Z66
         ydG1xjmflIYKbgoACvoK2PreiS7AZt+kJb8NBmvJeWBEthwHv1KFuFgt29KjiCUIEPZ9
         0ONSU2Oa+Kxq/QggW/BEUlHGp+PCUiU29vjIDLmLgiv78JXuagxr8+OtAogRD81ocKeW
         /uPj8ayLj4EjsD/L9ZYPJWODIzaxRpG+8JN05KPYuC8F2Q6uG0/i7qRrF1rWBZTBZVwH
         Hy1kpwhZKKt0Zj2jLmw9f/sckeawN3STZVFK+3J/kzvbX7cPpkOHOIcqX0C0F9uKcdAO
         5vXw==
X-Gm-Message-State: AOAM5324ws9tRzt+Vinpvk1EvwNWw2wvN+bQM5+1HEuLBOFLXnsxt+qr
	0Im8Hlay+uk461xZ1PzWis2cJjZvEXbuQ6je
X-Google-Smtp-Source: 
 ABdhPJwGj5kzeFJptBvm84WvW3m82qLIqUgE/3pskBJf9Hg5wcIGrayWPcI9PJz+N6N4BghJKiPW7A==
X-Received: by 2002:a17:90a:cc6:b0:1d2:9a04:d29e with SMTP id
 6-20020a17090a0cc600b001d29a04d29emr13419342pjt.136.1652018557230;
        Sun, 08 May 2022 07:02:37 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a1709029f8800b0015edc07dcf3sm5148365plq.21.2022.05.08.07.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 07:02:36 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 237869626EB; Sun,  8 May 2022 04:02:34 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 08 May 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220508140234.237869626EB@nuc.router0800d9.com>
Date: Sun,  8 May 2022 04:02:34 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 14:02:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165377

Branch: kirkstone

New this week: 3 CVEs
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *

Removed this week: 3 CVEs
CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2022-1304 (CVSS3: 7.8 HIGH): e2fsprogs:e2fsprogs-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1304 *

Full list:  Found 15 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1210 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1210 *
CVE-2022-1381 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *


