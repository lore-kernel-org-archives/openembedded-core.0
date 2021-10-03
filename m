Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98280C433F5
	for <webhook@archiver.kernel.org>; Sun,  3 Oct 2021 14:32:51 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web12.23181.1633271570904596447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 07:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Z42PZ/GA;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id u7so12251236pfg.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Oct 2021 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=w+/qFb7gTrpDaJytnlqU+neYPHmWe9BkWlAMkyvgw28=;
        b=Z42PZ/GAolRnfhnVafkvXsj0C6DcODCbsGdslQs9c8f7xmY6EzzzJOFFL8IPxTkjpe
         JMdGnfKjWt+3l1m6wXZnvZ6STZYTS9gCZOswbpWE37Y4pEhTNH6ZIlzCZ4Qru++5B4c/
         7ysNAEfefPKPXT/4+quyup77pfaNco6bG1sx3TRUPSMIrliRuRqze6ahn9HOuSfDw2Qz
         H7+BE1ElqdJPqLOdx1zwA9Swd+pG3fzKWQluCAWbObGHpsTTCmoj3Sc19dC5hwEsNqwm
         eNVAkJjMHL6YYeJV6tqnpvGJxU/VnB1HVRtHwHwkehWzU4t8dczR02Zr0JEY6UqweZYa
         3Zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=w+/qFb7gTrpDaJytnlqU+neYPHmWe9BkWlAMkyvgw28=;
        b=Wp22Y8Ax3QBgWRxOvXaNxv2Se38YuAeknxm1HncqA+znD6tFscoWw6+4DDvO41Vk6M
         HIEKlNEIuji4IqD+WXrjphVBpCEK2xZBz1C2/9a7ANF/rzD7t0x39vQwhJqAuZ6x1lLZ
         JO4u16Kcp0zlcNXKWKGT/rpxys9jilQ3anjRTZGkvzL406c/NaVwsY5I8j2KNkidrmyd
         SQaypYo8h5QR6zcKr7jYr8/JtHx0x5pV6u1R/TJgv21djPA6du0FLzS+iL5LpzwcUTva
         WI90u/qX04tR+fXqx9Q0OVywQjxWkygXTvcnK2ogQWQ/JqHhAANywCLUuy91P1JLXucp
         twLQ==
X-Gm-Message-State: AOAM532yXM/Ye0MG5RGUh4Ob35nija7NVNCAI2LRTrwrPjzMDAZXUjIE
	+PaJxFELSFuP41ol3+Da82GzwSDYA3Dew6VgVMk=
X-Google-Smtp-Source: 
 ABdhPJzcNyTAYlcEtoMRm3sm5ZzsnduVm/3Tw2wPNATPET6PbxbIF9XUmZ9eYyZH9gXzXXrHUwxDVg==
X-Received: by 2002:a62:800a:0:b0:447:b73e:6e18 with SMTP id
 j10-20020a62800a000000b00447b73e6e18mr20244082pfd.28.1633271569725;
        Sun, 03 Oct 2021 07:32:49 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 q19sm8625829pfg.40.2021.10.03.07.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Oct 2021 07:32:49 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 12B7E960398; Sun,  3 Oct 2021 04:32:47 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 03 Oct 2021 04:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211003143247.12B7E960398@nuc.router0800d9.com>
Date: Sun,  3 Oct 2021 04:32:47 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Oct 2021 14:32:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156554

Branch: dunfell

New this week: 6 CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-40330: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40330 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

Removed this week: 10 CVEs
CVE-2020-12829: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-3580: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3580 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-37701: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37701 *
CVE-2021-3770: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3770 *
CVE-2021-37712: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37712 *
CVE-2021-37713: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37713 *

Full list:  Found 76 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14372: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
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
CVE-2020-27779: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-36254: dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-36254 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27218: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27218 *
CVE-2021-27219: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27219 *
CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28041: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28041 *
CVE-2021-28153: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28153 *
CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
CVE-2021-33928: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
CVE-2021-33929: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
CVE-2021-33930: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
CVE-2021-33938: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36221: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3778: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3778 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-40330: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40330 *
CVE-2021-40491: inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40491 *
CVE-2021-40528: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-40528 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *

