Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4832FC433F5
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:34:03 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.24605.1653827636371602446
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:33:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=YpKhNrf+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id w3so8000992plp.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 29 May 2022 05:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=t874WrWjDh+drPVX81AqcYh/uga5Ybg2rh9ujGZRiOM=;
        b=YpKhNrf+YnM0qvP0l2z0vJsMy4jbU7SVzBLNyaXm5zO2ztnPwGyLrbrjzcklXfBCcA
         ZJf7lFDNSO2DzYuBHs+qtI3YDUuQQz7P+WXTUJCeawDyEUWYIjeD1JnwsGC1HEbCyVeT
         IPdWr4wrEony8+lFRxi2lR5rsDWSt0N1oJFB31zSxNkcdAku4e8AZTaqvwE7smqzQ8n6
         kOrdWCAs1Hz5jWo5WwTp8TXjDHfKF4/Ih1rNIAFrFd+kpuiONxLvHS/b9A5JqBSqPSWB
         hcbbE0GMxNLjHb5XyJaX0jItJes518R+9RrMLVuRIry+0LpNdMRhQKuGRYe1Aq1YpjL9
         /bSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=t874WrWjDh+drPVX81AqcYh/uga5Ybg2rh9ujGZRiOM=;
        b=4MvjmZXv4Twk6WEBv122ANk4X1Jm+D+yb4BAdHbRXf3jgOQa9tMHxFTw2WcvgKp69V
         g8Qx4lCt9/G0uJC49QLqS7XylefcG5UgWSINBvVu8jCyk1p+rK1hX+azrSiWiUIhcpqL
         SeBFDAyvezjTfqOLvwIOB3urVIEwjbYPBWLuqTjF2VgsfcycYp0eyYzCII0x9MXNCQ2e
         ++5fmz7AQlOo1pEHoGIII/ttcb5U59YYORTkxGOp2v80BOl+6k/6XH6xxM6RgTyWak4l
         Oi8Jp4GboTlN+luJQsbLu4lb+eXnIfxpzqZhsoFjqYiixBkWb8k/WgtdledX6cCjBMC+
         Rvnw==
X-Gm-Message-State: AOAM530jo3r8TXWWKSVkDbCfjVLPVhTr2F3R6zlpnCod+nmZ6cxJv6S1
	cg8g53NDlANft6yKTsl9G/1qDMTrwCS/keeH
X-Google-Smtp-Source: 
 ABdhPJzKNqSlb2heCMZDzB2zYIIPlWiBRlLr6Yca1MwLFrzNxSnFVNHDq3rL4nIAsoSMIK9amKizAA==
X-Received: by 2002:a17:90a:fa5:b0:1e2:ee1b:8f85 with SMTP id
 34-20020a17090a0fa500b001e2ee1b8f85mr1760413pjz.216.1653827635121;
        Sun, 29 May 2022 05:33:55 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 f23-20020a635557000000b003c2f9540127sm6528586pgm.93.2022.05.29.05.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 05:33:54 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B94649626F3; Sun, 29 May 2022 02:33:51 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 29 May 2022 02:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220529123351.B94649626F3@nuc.router0800d9.com>
Date: Sun, 29 May 2022 02:33:51 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 May 2022 12:34:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166236

Branch: dunfell

New this week: 9 CVEs
CVE-2022-1587 (CVSS3: 9.1 CRITICAL): libpcre2:libpcre2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1587 *
CVE-2022-1674 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1674 *
CVE-2022-1733 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1733 *
CVE-2022-1735 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1735 *
CVE-2022-1769 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1769 *
CVE-2022-1771 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1771 *
CVE-2022-1785 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1785 *
CVE-2022-1796 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1796 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *

Removed this week: 0 CVEs

Full list:  Found 95 unpatched CVEs
CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-13754 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27821 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20295 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27918 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2021-28966 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
CVE-2021-30560 (CVSS3: 8.8 HIGH): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-30560 *
CVE-2021-31525 (CVSS3: 5.9 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195 (CVSS3: 7.3 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
CVE-2021-3409 (CVSS3: 5.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-36221 (CVSS3: 5.9 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36368 (CVSS3: 3.7 LOW): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-39293 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39293 *
CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-3981 (CVSS3: 3.3 LOW): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3981 *
CVE-2021-41771 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4206 *
CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4207 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-44716 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717 (CVSS3: 4.8 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
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
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24675 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-28739 (CVSS3: 7.5 HIGH): ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28739 *
CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
CVE-2022-29824 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native:libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29824 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30294 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30294 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *


