Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C1BC433EF
	for <webhook@archiver.kernel.org>; Sun, 12 Jun 2022 13:02:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.15754.1655038978520014317
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 06:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=osgSow6h;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id
 y13-20020a17090a154d00b001eaaa3b9b8dso660520pja.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Jun 2022 06:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=iFgqmrKRF0VE4AODD+vLOtjcNOit5XhedYht+hu7oBg=;
        b=osgSow6h9EkwQNGVro63TvScao3s6NhV+elxHTJieYC47UkWFWUB1wmVJfbmb7WqIU
         l3N8U7sPPwUHjmf/+hEGmGmJ8ZBZzv+2+UI1OQCDwI2ILAHwjrRFuTKNtr8wUSEAQVlm
         +9Yj3E0p9BAk02xgY3GPFwvcmyQbOwkDza1J2vWlf9MQOG4rCZWdm8C7F/iRggrBjARJ
         NpD/2n+K6i8STureMKWSD8mqm+4XBP0VnFjvU6LgrccKy3sBu6Xxr6pz0d4ny3iPln0W
         n78FpasOWeNxOUmgoWgw95VIB+X+WrwwEkEh2mvgE8T2OQErSJdBlPTZaXWcAjeRdV82
         HVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=iFgqmrKRF0VE4AODD+vLOtjcNOit5XhedYht+hu7oBg=;
        b=PZwtfoHBkCxL8lVaE75ZcPdBGQa43OyYljSRqX4jGd3vRWZtxBuXHoR/9aKMzKplb+
         9XNfgCLwM0ceJLNdkBAMeXa1F06mjNJi/FEb4Ds036ngzRUCIOZL+QiXWdcO8dEnM/Qu
         oGh4PM19XMzl81cmuf0qnknmyEqXUlskyA1YfzsKPQ7JkXivkk3OmlesUKUavYotMZ0n
         AsFCOSc28VrmH8Z/g9DrBcLXKA2DbCZsGzNkhpor7o5bln7DWNfcaXFcpAR51rukwMb8
         x6eyMaSEGDBquobLkmSWFth/hNMrr/eFdUXCobeki+8p0amxygKJt3KPynVS1EVXUMEp
         T5VQ==
X-Gm-Message-State: AOAM530I6/rJ9VYstZBSJaxwWqWx6H9YmF6ZwPBP/j8j7w7a31WUEqET
	craE+YI/SZwgWjBa+NwpQCT0de45IveKCSZd
X-Google-Smtp-Source: 
 ABdhPJyAr9yuKRnnIerJEJMkOz5Qk2NkKmFVoAAwvxv3WrbwldmB6Ir8UTVF6+sPs1Ta+p8tGP6lnA==
X-Received: by 2002:a17:90b:1651:b0:1e8:3f13:5cb9 with SMTP id
 il17-20020a17090b165100b001e83f135cb9mr10224466pjb.20.1655038977466;
        Sun, 12 Jun 2022 06:02:57 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 j8-20020aa79288000000b005183f333721sm3210747pfa.87.2022.06.12.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 06:02:56 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 06F2D96054A; Sun, 12 Jun 2022 03:02:55 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 12 Jun 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220612130255.06F2D96054A@nuc.router0800d9.com>
Date: Sun, 12 Jun 2022 03:02:55 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Jun 2022 13:02:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166824

Branch: kirkstone

New this week: 5 CVEs
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-1927 (CVSS3: 9.8 CRITICAL): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1927 *
CVE-2022-1942 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1942 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27778 *

Removed this week: 16 CVEs
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

Full list:  Found 14 unpatched CVEs
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
CVE-2022-27778 (CVSS3: 8.1 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27778 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


