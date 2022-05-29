Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8BDC433F5
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 13:33:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.25106.1653831192883952520
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 06:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=DmTXTq6X;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id g67so324005pfb.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 06:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=ZUdUtmniVGHPkPTSQb/awzo0NiHfiRmmoBU72Fo6deE=;
        b=DmTXTq6XePp9uzzUWReolsqIFGkQ9OnwoRJzMtqax+Wro9WAei5MHoQaOHQSjsEcxJ
         Ky6j9TsKIheDo2Mejl6K9fdbQV7jG7SDX5d+mpOVzFl3XvFZ5LYA1LiUFnN59UbscdNf
         PbwsjgWkv+UIUCmWfBB9rIja97QoEKbddqYhULaNbGOJ66F49VxnA5kcujjj2CcZpcAR
         byTjZLpfd9N+jMCbjF9j+EzEymDtzbFca5zirj17vw3qhTuucg8tL0Hhny9wbVWRoJXH
         KIQNGuSKCRuhbW9fD9hvAa4qu4fI3qoBG7+z3xyYarsxgwn2G6xTTIjk49ct/CrjW7BJ
         NSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=ZUdUtmniVGHPkPTSQb/awzo0NiHfiRmmoBU72Fo6deE=;
        b=xKKQYr/g0qII6sqCqIYsE8S+QpmxKG6T9h2r7Z4QiwGE5x1KbFcude/ozit9s5Tdys
         kuAPy4LoHanmtK2vwsZzNDCTmeukk/WFCMyUKMQLlQpXO8bRZmlD2pg58FeTiM8lp0x1
         Is44O8brxvvdu5ZdQD4o/SbjAc2NAk1nCRM0/mMs0iA4NVD9iLtfq6GRWK4qS6c9yNcB
         4J2X9gMPOPwr+7cJqTSU3wploTZf9M9SBpOTwFli+1QglDc7or7R2+UTkMzw3ExYTEfH
         b+NxkfQCmoa7lvccqNWV7txOY7IzYVVzgq38nOPLtxyvP0hAF/9ntua6czAYY2ibMqOM
         fBEQ==
X-Gm-Message-State: AOAM533C7oVTjhbWu7S9/vfcim+Vv0r0QulO3tStT3rTRZFbwPqIMDND
	LWTQCP+WO5TMV+4gYMK+2h0qwuN4kTEV2Zz5
X-Google-Smtp-Source: 
 ABdhPJxKIk9y9LMBfkSNH1A6o9Ihi3yjHcHnctefxik8qzlIStuMmG4fr8UU55aXb3+AD063h4JiFg==
X-Received: by 2002:a62:e90e:0:b0:51b:3f85:c97c with SMTP id
 j14-20020a62e90e000000b0051b3f85c97cmr3825107pfh.86.1653831191607;
        Sun, 29 May 2022 06:33:11 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 b10-20020a1709027e0a00b0015e8d4eb2c2sm7136080plm.268.2022.05.29.06.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 06:33:10 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AB7B89626F3; Sun, 29 May 2022 03:33:08 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 29 May 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220529133308.AB7B89626F3@nuc.router0800d9.com>
Date: Sun, 29 May 2022 03:33:08 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 13:33:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166239

Branch: kirkstone

New this week: 8 CVEs
CVE-2022-1587 (CVSS3: 9.1 CRITICAL): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1587 *
CVE-2022-1674 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1674 *
CVE-2022-1733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1733 *
CVE-2022-1735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1735 *
CVE-2022-1769 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1769 *
CVE-2022-1771 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1771 *
CVE-2022-1785 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1785 *
CVE-2022-1796 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1796 *

Removed this week: 4 CVEs
CVE-2022-1622 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1622 *
CVE-2022-1623 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1623 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *

Full list:  Found 20 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
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
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *


