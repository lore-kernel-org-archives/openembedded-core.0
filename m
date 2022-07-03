Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0888BC43334
	for <webhook@archiver.kernel.org>; Sun,  3 Jul 2022 13:03:14 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.60552.1656853384964345192
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 06:03:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mf2Jmglg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id c13so2596377pla.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Jul 2022 06:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=jbjaYeIchSY93XAWMjBvuC/BgrinVGis0K4Upda1QRY=;
        b=mf2Jmglg6oaWqBFriVOyAL18Kk/ERPdPicNOb4DtHa4tL9xakQ/BHMwD2stneQVE5V
         fwLKglDqxXTaLVKN+eVLwRAgdUe8wUoNn0qCilNFr61Fqj44bcLETMr3iBko2xripeuV
         F4Yzacuzh/uYo1tK5T3zmJhtUQCT3Rhtiyqt72xxwHw+f1tPZL4Hdhttu0onKextDVBJ
         niTc8Vx/tn2BY3yZ/KXiu9i+HAXLbOA3FE2OxzXsPWjyw4nwJd6uB7iMNyjrpRAizrFz
         WQ+a2kvCu1pIb7RDGuwSTONkIgL5c3MlyESirUAPINYxDEdnz9iPlycWlh/6V6uQp6pY
         xzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=jbjaYeIchSY93XAWMjBvuC/BgrinVGis0K4Upda1QRY=;
        b=b7ccmFr0xVUtRT7APhe/OEaLB9uJy6+DPQcjkwi1A5Ft499e6l/0cQq0B8YkZf4yry
         uD0DRXQUUr8JCu/NgC/COQxxSA7R2VMF46ExNrkWCccgxoBCdUrAcIsvoJ2LMyoeYABO
         /QIkyS34tqYNz/utFJb4TMyhiTMMr7DPLobFl/lXaeMPtBZvOnCv2CK7KPejiptIa2JJ
         i09OaQCiRgSfXGqvcK9RvR5w1jVd4gjgWCdxrA7qVXpQDzxNjlyO6PsRJl946Adg8bC/
         Epo17hoPQ6RrEfloyMK9GaSJAlTLkcM/vNvND9TxxJaH4xa1sRwGgXUAevhVYWFHC3eA
         oelw==
X-Gm-Message-State: AJIora8+yps7DiwGqTiU3lSbEMYVnPf7nB1FyglW+DGky74A5iUogdHR
	H4LpiicRrUgUQ4bA3TP8+uL6wBB7JSrRJ9kI
X-Google-Smtp-Source: 
 AGRyM1vzyz6a63nHO/7dJeBqEEz7FgDfW5CCf+BIxmMFzyBUrEch7uQysRrK35kyckvPcA7LrjkYCg==
X-Received: by 2002:a17:90a:4cc3:b0:1ec:7bda:2e68 with SMTP id
 k61-20020a17090a4cc300b001ec7bda2e68mr31315183pjh.33.1656853383762;
        Sun, 03 Jul 2022 06:03:03 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 ct8-20020a056a000f8800b005251c3e7ac5sm18869688pfb.166.2022.07.03.06.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 06:03:02 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 70FE1962530; Sun,  3 Jul 2022 03:03:00 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 03 Jul 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220703130300.70FE1962530@nuc.router0800d9.com>
Date: Sun,  3 Jul 2022 03:03:00 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Jul 2022 13:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167558

Branch: kirkstone

New this week: 9 CVEs
CVE-2022-2068 (CVSS3: 9.8 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2068 *
CVE-2022-2085 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2085 *
CVE-2022-2124 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2124 *
CVE-2022-2125 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2125 *
CVE-2022-2126 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2126 *
CVE-2022-2129 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2129 *
CVE-2022-2175 (CVSS3: 8.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2175 *
CVE-2022-2182 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2182 *
CVE-2022-2183 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2183 *

Removed this week: 0 CVEs

Full list:  Found 20 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1183 (CVSS3: 7.5 HIGH): bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1183 *
CVE-2022-1664 (CVSS3: 9.8 CRITICAL): dpkg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1664 *
CVE-2022-2068 (CVSS3: 9.8 CRITICAL): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2068 *
CVE-2022-2085 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2085 *
CVE-2022-2124 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2124 *
CVE-2022-2125 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2125 *
CVE-2022-2126 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2126 *
CVE-2022-2129 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2129 *
CVE-2022-2175 (CVSS3: 8.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2175 *
CVE-2022-2182 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2182 *
CVE-2022-2183 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2183 *
CVE-2022-26691 (CVSS3: 6.7 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26691 *
CVE-2022-30065 (CVSS3: 7.8 HIGH): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30065 *


