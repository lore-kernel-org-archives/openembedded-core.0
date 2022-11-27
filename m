Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F212AC4708C
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:33:12 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.90617.1669552390378871827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=xKfQmwv0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id a22-20020a17090a6d9600b0021896eb5554so11504623pjk.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 04:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RfYh/Glrw8DVZcQstVHgWW9PaBvpJ08U67qTQd3DHCc=;
        b=xKfQmwv0Qr+XneY2MwcNN8FYkcTl5akBhdukq7PFjydO8AbTuqODSNMkGjR9mtRZhf
         xcMCosx0lZC8p2k4pdm2B/gArQoSC9wkbv7/6VI+Oik6CW/NeXj8o459JV18dJjoOfX1
         CQH247P9oBnOp5wtTkEfsGi+McgGsjkIT7jo86ZRnlxt7nV5vRY6eoYKQ6vc91AD1qcR
         nniXnZx+NRpJ7iF13NHtiqEoPaE1+EYjZvbm/OYDrP1Q+9Xh0CO08afXwT+xsuBl/bYI
         vdIR8qxkOROV2hIoOBRMlhCFqsDajRX3iHlypIitvUU2d6QX5qDgEK6ZAxEv3a//Tpoj
         ldhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RfYh/Glrw8DVZcQstVHgWW9PaBvpJ08U67qTQd3DHCc=;
        b=YUaKYcUiuGcGSmtVsy0ZqXm3b+PJT8V3dg1AtkjkaVzg0lGbeLEAOm0RVcSOLKfRH2
         NmTnknvoLzIZc+PDud3wyr1xOPKUCbJiTvvaE19/lRPVR4nvd2EWFmOP61FWqZWEqmps
         NyhzdadXLvYDIhzo74MiZ6E+VBJr34XDmObBE93aVPYx2HgOdNLpdyY+lrvnJB1QaucC
         udDSDNjsq4ptymbYTcibiYOsWufazEvDDx0zEscfRDWQQL9VLs4205c7hFjPihLFx17D
         lT9UAkFJbWpj1RZhthSe7TbmIji7q6yQVXKf9mOKZx+6vBHrI9UOaklFkGiM++LYPRgD
         5ltg==
X-Gm-Message-State: ANoB5pl5liNUcsAbmkL7qPtx7cjoYxjJthQQTgP2qgJOwlWdka1RjrQl
	ynwYVmxFeEdnvRkSfYO1Mq1nQqwpXkFX1c8xWL8=
X-Google-Smtp-Source: AA0mqf60qW8PhVTZX9O+GuAxkTLdpDCsE751dorZCpuCVQ5M8QJw350V9fq/2eO/LmgQtovdEuxxkg==
X-Received: by 2002:a17:902:d4c8:b0:188:a40b:47cd with SMTP id o8-20020a170902d4c800b00188a40b47cdmr27823307plg.72.1669552388870;
        Sun, 27 Nov 2022 04:33:08 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id t9-20020a17090a3b4900b002135e8074b1sm7816798pjf.55.2022.11.27.04.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:33:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 919F99602F7; Sun, 27 Nov 2022 02:33:06 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 27 Nov 2022 02:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221127123306.919F99602F7@nuc.router0800d9.com>
Date: Sun, 27 Nov 2022 02:33:06 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 12:33:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173840

Branch: dunfell

New this week: 1 CVEs
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *

Removed this week: 0 CVEs

Full list:  Found 103 unpatched CVEs
CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27918 (CVSS3: 7.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27918 *
CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9948 *
CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9951 *
CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-9952 *
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20269 (CVSS3: 5.5 MEDIUM): kexec-tools https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20269 *
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20295 *
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
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
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2021-3800 (CVSS3: 7.5 HIGH): glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3800 *
CVE-2021-3929 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3929 *
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
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
CVE-2021-46848 (CVSS3: 9.1 CRITICAL): libtasn1:libtasn1-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46848 *
CVE-2022-0358 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0358 *
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
CVE-2022-1705 (CVSS3: 6.5 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1705 *
CVE-2022-1962 (CVSS3: 5.5 MEDIUM): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1962 *
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2294 *
CVE-2022-2347 (CVSS3: 7.1 HIGH): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2347 *
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
CVE-2022-24765 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24921 *
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
CVE-2022-28131 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28131 *
CVE-2022-28327 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29154 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
CVE-2022-2962 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2962 *
CVE-2022-29804 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29804 *
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30293 *
CVE-2022-30580 (CVSS3: 7.8 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30580 *
CVE-2022-30630 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30630 *
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-30767 *
CVE-2022-32893 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-32893 *
CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-34835 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3570 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39177 (CVSS3: 8.8 HIGH): bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39177 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-44638 (CVSS3: 8.8 HIGH): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44638 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

