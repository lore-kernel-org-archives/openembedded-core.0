Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E37EECAAD4
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 04:06:53 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web12.66879.1661746007696115136
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 21:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zx36Bblv;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id 202so6602106pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 21:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=HjC3yiHsqanJsAG95roDmrC332eH+P5kp8YPwBj/r54=;
        b=Zx36Bblvhz17mkSBlXiBz4FJNKQtMU0wqpGv9/6+ZcoDjjFoNpsP3mV4ReAYJUr9dJ
         F8LAUQcxXYqZTPh6f4ZOJMZhRZH/iFs9LzGc1MZgBJOVp04koCt2MDLIlDALwz96snIH
         Aut0Si+raG50OM3IaHb3Ttcl5s4yPalV4BRobkW0QrUiaISMxSJc3U099SnOPaqu93Ls
         HHoR9gT4xpHNZ5ZVsFivLUlzMOzlPUAc8B/xCWeL+BNK+QEgHC/MrI9Dq33b4CP3M8Xo
         Z7zME7dqo6cEmLpnO+uyJOEt8i2YzZH+QR+rdloDA7P71qHenaKewFB20Yeb4WcCtNMD
         q/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=HjC3yiHsqanJsAG95roDmrC332eH+P5kp8YPwBj/r54=;
        b=cTLuJm7R83mgP9Y0Gi8M7vXHMy5ZhmxWzhtAB0yD+VM7N/e3AUxfartpXaHpCcP9WJ
         HH6OO82pWfipCELrj76OhGaGx36ZUoGfOv4KuO+NT+CZdWsaUC2lpABRtXaA92Co0EBd
         Jy9K+Y10osGsE2VU3/LSz90m+vWk92yxeor0xKm0OITYy+IlAu3B1eeBHDupLN9/8Kxk
         HURM3c/pKmLorNA3Tks/G+f5h7PwLtWkQOyRcBvWufF6omNzvljRzccTNHf840KHNC9g
         u3p2pMXP7E4wUqmnUbGbM/rbd8d8/RaYV63zMHKajSmlzU6r2WW+GdKEZXQkBgDPmhIg
         DEIg==
X-Gm-Message-State: ACgBeo0eyBUh9qPEBKZ2uzEfctnRPTFOsWH6vLoR39Mt3XpZJNaQqu6/
	1+AOGHtPiNYlYVMVZKlg/TVQA1Esu7d5GiZ3g5QCkSQ/
X-Google-Smtp-Source: 
 AA6agR4ZG5p4HwDbdrt3BobwkQ97j8Mu0lc/ZCDTmCOTmqO3A5r/9V4148z2rkaYNN3fnGwFk76xzKrdzaLGSppp/Lw=
X-Received: by 2002:a05:6a00:2185:b0:520:7276:6570 with SMTP id
 h5-20020a056a00218500b0052072766570mr14906455pfi.84.1661746006664; Sun, 28
 Aug 2022 21:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220828123446.D1E8D9623B1@nuc.router0800d9.com>
In-Reply-To: <20220828123446.D1E8D9623B1@nuc.router0800d9.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 28 Aug 2022 21:06:35 -0700
Message-ID: 
 <CANx9H-AdR=SinLmtUSvYqNhGG2UvSKvqHanpD6mC8YPLFc2Hng@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for dunfell on Sun 28 Aug
 2022 02:30:01 AM HST
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000006f2d1205e7596407"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Aug 2022 04:06:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170005

--0000000000006f2d1205e7596407
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 28, 2022 at 5:34 AM Steve Sakoman <steve@sakoman.com> wrote:

> Branch: dunfell
>
> New this week: 8 CVEs
> CVE-2021-23177 (CVSS3: 7.8 HIGH): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-23177 *
> CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-28861 *


Did this get flagged as =E2=80=9Cnew this week=E2=80=9D because the CVE was=
 updated? It is
NOT new.


> CVE-2021-31566 (CVSS3: 7.8 HIGH): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31566 *
> CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3521 *
> CVE-2022-2923 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2923 *
> CVE-2022-2946 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2946 *
> CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2980 *
> CVE-2022-2982 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2982 *
>
> Removed this week: 14 CVEs
> CVE-2020-27821 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27821 *
> CVE-2022-2288 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2288 *
> CVE-2022-2289 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2289 *
> CVE-2022-2304 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2304 *
> CVE-2022-2343 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2343 *
> CVE-2022-2344 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2344 *
> CVE-2022-2345 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2345 *
> CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2509 *
> CVE-2022-2522 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2522 *
> CVE-2022-2571 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2571 *
> CVE-2022-2580 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2580 *
> CVE-2022-2581 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2581 *
> CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2598 *
> CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-37434 *
>
> Full list:  Found 118 unpatched CVEs
> CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2016-3709 *
> CVE-2020-13754 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-13754 *
> CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15469 *
> CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15705 *
> CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15859 *
> CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-17380 *
> CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-25742 *
> CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-25743 *
> CVE-2020-27661 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27661 *
> CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27749 *
> CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29510 *
> CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29623 *
> CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35503 *
> CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35504 *
> CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35505 *
> CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35506 *
> CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9948 *
> CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9951 *
> CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9952 *
> CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1765 *
> CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1789 *
> CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1799 *
> CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1801 *
> CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1870 *
> CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20225 *
> CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20233 *
> CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20295 *
> CVE-2021-23177 (CVSS3: 7.8 HIGH): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-23177 *
> CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-27097 *
> CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-27138 *
> CVE-2021-27918 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-27918 *
> CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-28544 *
> CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-28861 *
> CVE-2021-31566 (CVSS3: 7.8 HIGH): libarchive:libarchive-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31566 *
> CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31879 *
> CVE-2021-33194 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-33194 *
> CVE-2021-33195 (CVSS3: 7.3 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-33195 *
> CVE-2021-33198 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-33198 *
> CVE-2021-3409 (CVSS3: 5.7 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3409 *
> CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3418 *
> CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3445 *
> CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3507 *
> CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3521 *
> CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3611 *
> CVE-2021-36221 (CVSS3: 5.9 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-36221 *
> CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3638 *
> CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3713 *
> CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3748 *
> CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3750 *
> CVE-2021-39293 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-39293 *
> CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3930 *
> CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3947 *
> CVE-2021-41771 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-41771 *
> CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-41772 *
> CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4206 *
> CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4207 *
> CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-42762 *
> CVE-2021-44716 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-44716 *
> CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45085 *
> CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45086 *
> CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45087 *
> CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45088 *
> CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45481 *
> CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45482 *
> CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45483 *
> CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45944 *
> CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1050 *
> CVE-2022-1705 (CVSS3: 6.5 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1705 *
> CVE-2022-1920 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1920 *
> CVE-2022-1921 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1921 *
> CVE-2022-1922 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1922 *
> CVE-2022-1923 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1923 *
> CVE-2022-1924 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1924 *
> CVE-2022-1925 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1925 *
> CVE-2022-1962 (CVSS3: 5.5 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1962 *
> CVE-2022-2122 (CVSS3: 7.8 HIGH): gstreamer1.0
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2122 *
> CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2294 *
> CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-23773 *
> CVE-2022-24765 (CVSS3: 7.8 HIGH): git
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-24765 *
> CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-24921 *
> CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26354 *
> CVE-2022-28131 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-28131 *
> CVE-2022-2816 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2816 *
> CVE-2022-2817 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2817 *
> CVE-2022-2819 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2819 *
> CVE-2022-28327 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-28327 *
> CVE-2022-2845 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2845 *
> CVE-2022-2849 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2849 *
> CVE-2022-2862 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2862 *
> CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2867 *
> CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2868 *
> CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2869 *
> CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2874 *
> CVE-2022-2889 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2889 *
> CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29154 *
> CVE-2022-2923 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2923 *
> CVE-2022-2946 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2946 *
> CVE-2022-29526 (CVSS3: 5.3 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29526 *
> CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29536 *
> CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2980 *
> CVE-2022-29804 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29804 *
> CVE-2022-2982 (CVSS3: 7.8 HIGH): vim
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2982 *
> CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30293 *
> CVE-2022-30580 (CVSS3: 7.8 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30580 *
> CVE-2022-30629 (CVSS3: 3.1 LOW): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30629 *
> CVE-2022-30630 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30630 *
> CVE-2022-30631 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30631 *
> CVE-2022-30632 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30632 *
> CVE-2022-30633 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30633 *
> CVE-2022-30634 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30634 *
> CVE-2022-30635 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30635 *
> CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30767 *
> CVE-2022-32148 (CVSS3: 6.5 MEDIUM): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32148 *
> CVE-2022-32189 (CVSS3: 7.5 HIGH): go:go-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32189 *
> CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32292 *
> CVE-2022-32293 (CVSS3: 8.1 HIGH): connman
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32293 *
> CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-34835 *
> CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-35737 *
>
> For further information see:
> https://autobuilder.yocto.io/pub/non-release/patchmetrics/
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#648):
> https://lists.yoctoproject.org/g/yocto-security/message/648
> Mute This Topic: https://lists.yoctoproject.org/mt/93305881/924729
> Group Owner: yocto-security+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000006f2d1205e7596407
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 28, 2022 at 5:34 AM Steve Sakoman &lt;<a href=
=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">Branch: dunfell<br>
<br>
New this week: 8 CVEs<br>
CVE-2021-23177 (CVSS3: 7.8 HIGH): libarchive:libarchive-native <a href=3D"h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-23177" rel=3D"no=
referrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-2021-23177</a> *<br>
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native <a href=3D"https:/=
/web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-28861" rel=3D"noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2021-28861</a> *</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">Did this get flagged as =E2=80=9Cnew this week=E2=80=9D because the CVE w=
as updated? It is NOT new.</div><div dir=3D"auto"><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex" dir=3D"auto"><br>
CVE-2021-31566 (CVSS3: 7.8 HIGH): libarchive:libarchive-native <a href=3D"h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31566" rel=3D"no=
referrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-2021-31566</a> *<br>
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native <a href=3D"https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3521" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3=
521</a> *<br>
CVE-2022-2923 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2923" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2923</a> *<b=
r>
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2946" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2946</a> *<br>
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2980" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2980</a> *<b=
r>
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2982" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2982</a> *<br>
<br>
Removed this week: 14 CVEs<br>
CVE-2020-27821 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27821" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-27821</a> *<br>
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2288" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2288</a> *<br>
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2289" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2289</a> *<br>
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2304" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2304</a> *<br>
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2343" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2343</a> *<br>
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2344" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2344</a> *<br>
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2345" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2345</a> *<br>
CVE-2022-2509 (CVSS3: 7.5 HIGH): gnutls:gnutls-native <a href=3D"https://we=
b.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2509" rel=3D"noreferrer" =
target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
22-2509</a> *<br>
CVE-2022-2522 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2522" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2522</a> *<br>
CVE-2022-2571 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2571" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2571</a> *<br>
CVE-2022-2580 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2580" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2580</a> *<br>
CVE-2022-2581 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2581" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2581</a> *<br>
CVE-2022-2598 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2598" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2598</a> *<b=
r>
CVE-2022-37434 (CVSS3: 9.8 CRITICAL): zlib:zlib-native <a href=3D"https://w=
eb.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-37434" rel=3D"noreferrer=
" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-=
2022-37434</a> *<br>
<br>
Full list:=C2=A0 Found 118 unpatched CVEs<br>
CVE-2016-3709 (CVSS3: 6.1 MEDIUM): libxml2:libxml2-native <a href=3D"https:=
//web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2016-3709" rel=3D"noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2016-3709</a> *<br>
CVE-2020-13754 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-13754" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-13754</a> *<br>
CVE-2020-15469 (CVSS3: 2.3 LOW): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15469" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-15469</a> *<br>
CVE-2020-15705 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15705" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-15705</a> *<br>
CVE-2020-15859 (CVSS3: 3.3 LOW): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-15859" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-15859</a> *<br>
CVE-2020-17380 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-17380" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-17380</a> *<br>
CVE-2020-25742 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-25742" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-25742</a> *<br>
CVE-2020-25743 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-25743" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-25743</a> *<br>
CVE-2020-27661 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27661" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-27661</a> *<br>
CVE-2020-27749 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-27749" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2020-27749</a> *<br>
CVE-2020-29510 (CVSS3: 5.6 MEDIUM): go:go-native <a href=3D"https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29510" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-2=
9510</a> *<br>
CVE-2020-29623 (CVSS3: 3.3 LOW): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2020-29623" rel=3D"noreferrer" target=3D"=
_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-29623</=
a> *<br>
CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35503" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-35503</a> *<br>
CVE-2020-35504 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35504" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-35504</a> *<br>
CVE-2020-35505 (CVSS3: 4.4 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35505" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-35505</a> *<br>
CVE-2020-35506 (CVSS3: 6.7 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-35506" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2020-35506</a> *<br>
CVE-2020-9948 (CVSS3: 8.8 HIGH): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2020-9948" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9948</a>=
 *<br>
CVE-2020-9951 (CVSS3: 8.8 HIGH): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2020-9951" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9951</a>=
 *<br>
CVE-2020-9952 (CVSS3: 7.1 HIGH): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2020-9952" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2020-9952</a>=
 *<br>
CVE-2021-1765 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-1765" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1765</=
a> *<br>
CVE-2021-1789 (CVSS3: 8.8 HIGH): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2021-1789" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1789</a>=
 *<br>
CVE-2021-1799 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-1799" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1799</=
a> *<br>
CVE-2021-1801 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-1801" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-1801</=
a> *<br>
CVE-2021-1870 (CVSS3: 9.8 CRITICAL): webkitgtk <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-1870" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-187=
0</a> *<br>
CVE-2021-20225 (CVSS3: 6.7 MEDIUM): grub:grub-efi:grub-efi-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20225" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-20225</a> *<br>
CVE-2021-20233 (CVSS3: 8.2 HIGH): grub:grub-efi:grub-efi-native <a href=3D"=
https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20233" rel=3D"n=
oreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2021-20233</a> *<br>
CVE-2021-20295 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a =
href=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-20295" =
rel=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/det=
ail?vulnId=3DCVE-2021-20295</a> *<br>
CVE-2021-23177 (CVSS3: 7.8 HIGH): libarchive:libarchive-native <a href=3D"h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-23177" rel=3D"no=
referrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-2021-23177</a> *<br>
CVE-2021-27097 (CVSS3: 7.8 HIGH): u-boot <a href=3D"https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2021-27097" rel=3D"noreferrer" target=3D"_b=
lank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-27097</a>=
 *<br>
CVE-2021-27138 (CVSS3: 7.8 HIGH): u-boot <a href=3D"https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2021-27138" rel=3D"noreferrer" target=3D"_b=
lank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-27138</a>=
 *<br>
CVE-2021-27918 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-27918" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-279=
18</a> *<br>
CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-28544" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-285=
44</a> *<br>
CVE-2021-28861 (CVSS3: 7.4 HIGH): python3:python3-native <a href=3D"https:/=
/web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-28861" rel=3D"noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2021-28861</a> *<br>
CVE-2021-31566 (CVSS3: 7.8 HIGH): libarchive:libarchive-native <a href=3D"h=
ttps://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31566" rel=3D"no=
referrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnI=
d=3DCVE-2021-31566</a> *<br>
CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget <a href=3D"https://web.nvd.nist.go=
v/view/vuln/detail?vulnId=3DCVE-2021-31879" rel=3D"noreferrer" target=3D"_b=
lank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-31879</a>=
 *<br>
CVE-2021-33194 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-33194" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-331=
94</a> *<br>
CVE-2021-33195 (CVSS3: 7.3 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-33195" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-331=
95</a> *<br>
CVE-2021-33198 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-33198" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-331=
98</a> *<br>
CVE-2021-3409 (CVSS3: 5.7 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3409" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3409</a> *<br>
CVE-2021-3418 (CVSS3: 6.4 MEDIUM): grub:grub-efi:grub-efi-native <a href=3D=
"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3418" rel=3D"n=
oreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vuln=
Id=3DCVE-2021-3418</a> *<br>
CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf <a href=3D"https://web.nvd.nist.gov=
/view/vuln/detail?vulnId=3DCVE-2021-3445" rel=3D"noreferrer" target=3D"_bla=
nk">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3445</a> *<=
br>
CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3507" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3507</a> *<br>
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native <a href=3D"https://web.nv=
d.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3521" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3=
521</a> *<br>
CVE-2021-3611 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3611" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3611</a> *<br>
CVE-2021-36221 (CVSS3: 5.9 MEDIUM): go:go-native <a href=3D"https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-36221" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3=
6221</a> *<br>
CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3638" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3638</a> *<br>
CVE-2021-3713 (CVSS3: 7.4 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3713" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-3713</a> *<br>
CVE-2021-3748 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3748" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-3748</a> *<br>
CVE-2021-3750 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3750" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-3750</a> *<br>
CVE-2021-39293 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-39293" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-392=
93</a> *<br>
CVE-2021-3930 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3930" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3930</a> *<br>
CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native <a h=
ref=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-3947" re=
l=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detai=
l?vulnId=3DCVE-2021-3947</a> *<br>
CVE-2021-41771 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-41771" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-417=
71</a> *<br>
CVE-2021-41772 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-41772" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-417=
72</a> *<br>
CVE-2021-4206 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4206" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-4206</a> *<br>
CVE-2021-4207 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-4207" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-4207</a> *<br>
CVE-2021-42762 (CVSS3: 5.3 MEDIUM): webkitgtk <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2021-42762" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-427=
62</a> *<br>
CVE-2021-44716 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2021-44716" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-447=
16</a> *<br>
CVE-2021-45085 (CVSS3: 6.1 MEDIUM): epiphany <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-45085" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-450=
85</a> *<br>
CVE-2021-45086 (CVSS3: 6.1 MEDIUM): epiphany <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-45086" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-450=
86</a> *<br>
CVE-2021-45087 (CVSS3: 6.1 MEDIUM): epiphany <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-45087" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-450=
87</a> *<br>
CVE-2021-45088 (CVSS3: 6.1 MEDIUM): epiphany <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2021-45088" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-450=
88</a> *<br>
CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2021-45481" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-454=
81</a> *<br>
CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2021-45482" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-454=
82</a> *<br>
CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2021-45483" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-454=
83</a> *<br>
CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native <a href=
=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2021-45944" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2021-45944</a> *<br>
CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1050" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2022-1050</a> *<br>
CVE-2022-1705 (CVSS3: 6.5 MEDIUM): go:go-native <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1705" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-170=
5</a> *<br>
CVE-2022-1920 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1920" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
0</a> *<br>
CVE-2022-1921 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1921" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
1</a> *<br>
CVE-2022-1922 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1922" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
2</a> *<br>
CVE-2022-1923 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1923" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
3</a> *<br>
CVE-2022-1924 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1924" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
4</a> *<br>
CVE-2022-1925 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-1925" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-192=
5</a> *<br>
CVE-2022-1962 (CVSS3: 5.5 MEDIUM): go:go-native <a href=3D"https://web.nvd.=
nist.gov/view/vuln/detail?vulnId=3DCVE-2022-1962" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-196=
2</a> *<br>
CVE-2022-2122 (CVSS3: 7.8 HIGH): gstreamer1.0 <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-2122" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-212=
2</a> *<br>
CVE-2022-2294 (CVSS3: 8.8 HIGH): webkitgtk <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2022-2294" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2294</a>=
 *<br>
CVE-2022-23773 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-23773" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-237=
73</a> *<br>
CVE-2022-24765 (CVSS3: 7.8 HIGH): git <a href=3D"https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-24765" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-24765</a> *<=
br>
CVE-2022-24921 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-24921" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-249=
21</a> *<br>
CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native <a hre=
f=3D"https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-26354" rel=
=3D"noreferrer" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail=
?vulnId=3DCVE-2022-26354</a> *<br>
CVE-2022-28131 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-28131" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-281=
31</a> *<br>
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2816" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2816</a> *<br>
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2817" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2817</a> *<br>
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2819" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2819</a> *<br>
CVE-2022-28327 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-28327" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-283=
27</a> *<br>
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2845" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2845</a> *<br>
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2849" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2849</a> *<br>
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2862" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2862</a> *<br>
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff <a href=3D"https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-2867" rel=3D"noreferrer" target=3D"_blank=
">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2867</a> *<br=
>
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff <a href=3D"https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-2868" rel=3D"noreferrer" target=3D"_blank=
">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2868</a> *<br=
>
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff <a href=3D"https://web.nvd.nist.gov/v=
iew/vuln/detail?vulnId=3DCVE-2022-2869" rel=3D"noreferrer" target=3D"_blank=
">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2869</a> *<br=
>
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2874" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2874</a> *<b=
r>
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2889" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2889</a> *<br>
CVE-2022-29154 (CVSS3: 7.4 HIGH): rsync:rsync-native <a href=3D"https://web=
.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29154" rel=3D"noreferrer" =
target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-20=
22-29154</a> *<br>
CVE-2022-2923 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2923" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2923</a> *<b=
r>
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2946" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2946</a> *<br>
CVE-2022-29526 (CVSS3: 5.3 MEDIUM): go:go-native <a href=3D"https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29526" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2=
9526</a> *<br>
CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany <a href=3D"https://web.nvd.nist.=
gov/view/vuln/detail?vulnId=3DCVE-2022-29536" rel=3D"noreferrer" target=3D"=
_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-29536</=
a> *<br>
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim <a href=3D"https://web.nvd.nist.gov/=
view/vuln/detail?vulnId=3DCVE-2022-2980" rel=3D"noreferrer" target=3D"_blan=
k">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2980</a> *<b=
r>
CVE-2022-29804 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-29804" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-298=
04</a> *<br>
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim <a href=3D"https://web.nvd.nist.gov/vi=
ew/vuln/detail?vulnId=3DCVE-2022-2982" rel=3D"noreferrer" target=3D"_blank"=
>https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-2982</a> *<br>
CVE-2022-30293 (CVSS3: 7.5 HIGH): webkitgtk <a href=3D"https://web.nvd.nist=
.gov/view/vuln/detail?vulnId=3DCVE-2022-30293" rel=3D"noreferrer" target=3D=
"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-30293<=
/a> *<br>
CVE-2022-30580 (CVSS3: 7.8 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30580" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-305=
80</a> *<br>
CVE-2022-30629 (CVSS3: 3.1 LOW): go:go-native <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-30629" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
29</a> *<br>
CVE-2022-30630 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30630" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
30</a> *<br>
CVE-2022-30631 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30631" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
31</a> *<br>
CVE-2022-30632 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30632" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
32</a> *<br>
CVE-2022-30633 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30633" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
33</a> *<br>
CVE-2022-30634 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30634" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
34</a> *<br>
CVE-2022-30635 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-30635" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-306=
35</a> *<br>
CVE-2022-30767 (CVSS3: 9.8 CRITICAL): u-boot <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-30767" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-307=
67</a> *<br>
CVE-2022-32148 (CVSS3: 6.5 MEDIUM): go:go-native <a href=3D"https://web.nvd=
.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32148" rel=3D"noreferrer" targ=
et=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-3=
2148</a> *<br>
CVE-2022-32189 (CVSS3: 7.5 HIGH): go:go-native <a href=3D"https://web.nvd.n=
ist.gov/view/vuln/detail?vulnId=3DCVE-2022-32189" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-321=
89</a> *<br>
CVE-2022-32292 (CVSS3: 9.8 CRITICAL): connman <a href=3D"https://web.nvd.ni=
st.gov/view/vuln/detail?vulnId=3DCVE-2022-32292" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-322=
92</a> *<br>
CVE-2022-32293 (CVSS3: 8.1 HIGH): connman <a href=3D"https://web.nvd.nist.g=
ov/view/vuln/detail?vulnId=3DCVE-2022-32293" rel=3D"noreferrer" target=3D"_=
blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-32293</a=
> *<br>
CVE-2022-34835 (CVSS3: 9.8 CRITICAL): u-boot <a href=3D"https://web.nvd.nis=
t.gov/view/vuln/detail?vulnId=3DCVE-2022-34835" rel=3D"noreferrer" target=
=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-348=
35</a> *<br>
CVE-2022-35737 (CVSS3: 7.5 HIGH): sqlite3:sqlite3-native <a href=3D"https:/=
/web.nvd.nist.gov/view/vuln/detail?vulnId=3DCVE-2022-35737" rel=3D"noreferr=
er" target=3D"_blank">https://web.nvd.nist.gov/view/vuln/detail?vulnId=3DCV=
E-2022-35737</a> *<br>
<br>
For further information see: <a href=3D"https://autobuilder.yocto.io/pub/no=
n-release/patchmetrics/" rel=3D"noreferrer" target=3D"_blank">https://autob=
uilder.yocto.io/pub/non-release/patchmetrics/</a><br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#648): <a href=3D"https://lists.yoctoproject.org/g/yocto=
-security/message/648" rel=3D"noreferrer" target=3D"_blank">https://lists.y=
octoproject.org/g/yocto-security/message/648</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/93305881/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt/=
93305881/924729</a><br>
Group Owner: <a href=3D"mailto:yocto-security%2Bowner@lists.yoctoproject.or=
g" target=3D"_blank">yocto-security+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/yocto-security/uns=
ub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/y=
octo-security/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" target=3D"_b=
lank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000006f2d1205e7596407--

