Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299ABECAAD3
	for <webhook@archiver.kernel.org>; Sun, 11 Sep 2022 14:35:03 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.10460.1662906901708696653
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 07:35:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Tp8ULV5K;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id x1so6223332plv.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Sep 2022 07:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date;
        bh=/+PEIOnCIv28SdaUKJBHGpsy5UAk5sDhgI6zWtsv30Y=;
        b=Tp8ULV5Kdygu+TN0o4GkJUcFD+YJqhlHVfKb/pPwUYo7wnS29X97CT8BkLtQP+zLBp
         R5ulcfcUI7MkfcsfBoPxvH8jrZOSrKfBAC5wcwXietqI5zDo92gB3YrHjtSUormsV4nd
         blRpl4DFUNw9h19HUGY01E8qnM3lD3c6BZxmcJn5tqnNGqfObJ6ng4HcH8leBPnl21po
         RmdBaqZQfgMfBqjJi38dD4zyc8yO5GRBzTYafSSn8PPBOmPUrmGKLOCiVi2jmxZaiJW2
         eru0BUK4UFpgI6SY4uo9AffjtD4m9K5MF6i/KNoRNXPMxMIkAv/C3SSK2u9BDAFp3HcW
         MvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/+PEIOnCIv28SdaUKJBHGpsy5UAk5sDhgI6zWtsv30Y=;
        b=NlsP6e3VOyB7aVdti0m3hBFvwGK9X6ZhkUlV+2/LKciqPaRYck/KB4uF70dyBU7Fyq
         W6n/Hlq41TzVoI1W9luh5E88n1fvfWCmGiVb8+QHuDf5mzYkWYjNKypSOaGMFIQ7lDhC
         IuCSv77Sdj8DJudqdlGuiZBx30PMrOJU9pmUC4Gl1oOR1i7v9DHco2yfo3Q2/j2SZokd
         HKBltxGWno1lB991Fv6SLCKqC5KFUUWC00YY/w9I7KDEAg79uwZQ8VryXX9BIJx6Oq4+
         /3Hk4nvpU33TMUK7v25soFNogZ3Wf7ACX9eaQNzQmciESpr0FRuRqfLrHI2+6ijDEq4c
         8zSw==
X-Gm-Message-State: ACgBeo2CKbA4Do/IsZMrZ9Owi1K12/JUNKJJh80JU1FegZl+ngYNeawX
	V/9zvDk7/BXBeUl+zrA0Oqat4yR21UaTc5w+
X-Google-Smtp-Source: 
 AA6agR630M3S13fvkmvhmlvDEXcDKmygSMcRUaQji3jVb7NoC5qNCglTXdYOUxdzIrd59YV9o1vnWA==
X-Received: by 2002:a17:90b:380f:b0:1fe:4437:4b32 with SMTP id
 mq15-20020a17090b380f00b001fe44374b32mr19505902pjb.170.1662906900327;
        Sun, 11 Sep 2022 07:35:00 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 l72-20020a63914b000000b00419ab8f8d2csm3764848pge.20.2022.09.11.07.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 07:34:59 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B37BC96238B; Sun, 11 Sep 2022 04:34:57 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 11 Sep 2022 04:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220911143457.B37BC96238B@nuc.router0800d9.com>
Date: Sun, 11 Sep 2022 04:34:57 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Sep 2022 14:35:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170519

Branch: dunfell

New this week: 10 CVEs
CVE-2020-35525 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35525 *
CVE-2020-35527 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35527 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-39176 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39176 *
CVE-2022-39177 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39177 *

Removed this week: 0 CVEs

Full list:  Found 126 unpatched CVEs
CVE-2020-13754 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-35525 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35525 *
CVE-2020-35527 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35527 *
CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9948 *
CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9951 *
CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9952 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20223 (CVSS3: 9.8 CRITICAL): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20223 *
CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20295 *
CVE-2021-23177 (CVSS3: 7.8 HIGH): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23177 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27918 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28861 *
CVE-2021-31566 (CVSS3: 7.8 HIGH): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31566 *
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33195 (CVSS3: 7.3 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
CVE-2021-33198 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
CVE-2021-3409 (CVSS3: 5.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3611 *
CVE-2021-36221 (CVSS3: 5.9 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3748 *
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3750 *
CVE-2021-3800 (CVSS3: 7.5 HIGH): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3800 *
CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3929 *
CVE-2021-39293 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39293 *
CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3930 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-41771 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4206 *
CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4207 *
CVE-2021-4209 (CVSS3: 6.5 MEDIUM): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4209 *
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-44716 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
CVE-2022-0135 (CVSS3: 7.8 HIGH): virglrenderer https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0135 *
CVE-2022-0216 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0216 *
CVE-2022-0358 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0358 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1354 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1354 *
CVE-2022-1355 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1355 *
CVE-2022-1705 (CVSS3: 6.5 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1705 *
CVE-2022-1920 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1920 *
CVE-2022-1921 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1921 *
CVE-2022-1922 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1922 *
CVE-2022-1923 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1923 *
CVE-2022-1924 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1924 *
CVE-2022-1925 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1925 *
CVE-2022-1962 (CVSS3: 5.5 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1962 *
CVE-2022-2122 (CVSS3: 7.8 HIGH): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2122 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-27664 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27664 *
CVE-2022-28131 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28131 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-29526 (CVSS3: 5.3 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29526 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-29804 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29804 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *
CVE-2022-3016 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3016 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-3037 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3037 *
CVE-2022-30580 (CVSS3: 7.8 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30580 *
CVE-2022-30630 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30630 *
CVE-2022-30634 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30634 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *
CVE-2022-3099 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3099 *
CVE-2022-3134 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3134 *
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32292 *
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32293 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34835 *
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35737 *
CVE-2022-38533 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38533 *
CVE-2022-39028 (CVSS3: 7.5 HIGH): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39028 *
CVE-2022-39176 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39176 *
CVE-2022-39177 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39177 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

