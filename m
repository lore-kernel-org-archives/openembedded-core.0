Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFD63C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 14:34:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.9210.1644158048241186184
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 06:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Vry8mjGS;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id e6so9458800pfc.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 06:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=/kMRkpOXV3nahoxXUnIWdYSTGWmidyoACXhXydX6SIU=;
        b=Vry8mjGS3kqbId4EooVjAJfCHvkJv1g+0XZ5CfWFvTIp7AMxIw+Mtem2eH/s8hNZCJ
         2v6JHJ+H++f2dWW3lTGN6JfeFN60tELRVl5cc9afsQWyIzqC1Ve9L/mYrb40FmIoWguE
         ugNoxdi2yKlNJnRa3aIPzrQMLciDqReISWyannw5gcvQ8wgY0ePRuYivrTrnAqxEsRtR
         uBy6FxeKUcVzGE+h9kC8ECCDuRRPqDsWMTMSS2pHcjtpOvhQwiLVZa9QJ7qSnY+tLlV1
         quNUi3dmm+R26U8gAtFDxp4zRnykDaqJMYmGSmGbH6Idih5bzugRmwREoppIhxfVMpTR
         Bh7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=/kMRkpOXV3nahoxXUnIWdYSTGWmidyoACXhXydX6SIU=;
        b=K1pcV6Gt5nBcgn/ngjRWolt9rwyP99MQ+LnNbloJHGUJ+lVOWmcgI9SuVKst7K6TrJ
         0/7Qn9nsh10UNnNaKTWo/46UuheEYT9B/u5LjZZZniostKWjOX9YekohNCgYKB7F+r5r
         YzrKOm56pPJJfWT3yqEa3Kspy1LY6sBNg/dCxfe6g1kDLZpVTneGyqtWj0ch2WlQCLX8
         exS7HepG5ULAmepqat45Tlyik3qhHE2/Xp0tiQd2c9mekCnJmlAdSv79j2hq8Ukzisxn
         66nAiJMviJQDL2xU67tgpdfe5TaPX6/E9v9p8GzpTY3TwRHR3i41EZINIKtUAW7PBm0U
         YMow==
X-Gm-Message-State: AOAM532yCABafyqCNVg/8CABY6t6yRQfCuIIPn2T2jF7RKTfDOdVTJls
	WQ0dhhaQEnusRR8fPOnzF4UPlRqWzXCVolII
X-Google-Smtp-Source: 
 ABdhPJz5jFojf9zHMrNod0dnZ6CA3QvyAFLA6uw+I2MD0GTKWuDb9Y9R2FaOPpQntIjBcwsZgHRzLA==
X-Received: by 2002:a63:1645:: with SMTP id 5mr6269145pgw.96.1644158046705;
        Sun, 06 Feb 2022 06:34:06 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ip5sm19408422pjb.13.2022.02.06.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 06:34:06 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id BFC00962C30; Sun,  6 Feb 2022 04:34:03 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 06 Feb 2022 04:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220206143403.BFC00962C30@nuc.router0800d9.com>
Date: Sun,  6 Feb 2022 04:34:03 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 14:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161399

Branch: dunfell

New this week: 15 CVEs
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

Removed this week: 0 CVEs

Full list:  Found 116 unpatched CVEs
CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-15999: freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15999 *
CVE-2020-16590: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
CVE-2020-16591: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
CVE-2020-16599: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
CVE-2020-17380: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25632: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27749: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3472: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3472 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36221: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-38297: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-39293: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39293 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4008: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4008 *
CVE-2021-4009: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4009 *
CVE-2021-4010: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4010 *
CVE-2021-4011: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4011 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-41771: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-44716: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-44717: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2021-45949: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
CVE-2022-23218: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
CVE-2022-23219: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *
CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *

