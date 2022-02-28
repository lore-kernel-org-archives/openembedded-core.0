Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54559C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 14:33:34 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.20266.1646058812960022659
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4jq5UODf;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f53.google.com with SMTP id x5so17840882edd.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Feb 2022 06:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vXrwDr0YFDwAtsK2tMZswu9M+BSg86apvchcrJCfjWA=;
        b=4jq5UODfb7MT9njrKDQsKzCdd+Hg6d+4pchKxGpJ0k8Dq0ofB3+ixQqi4umv6yQfbp
         wYPuEKGYbHxnsB7beVCW/UGrlfQJ0JG2QWAPxDfI5bbZektcsh8KXkoYqdFnkXuAFfve
         Yqy/Jyr6ZMPc/MvDhMF11zdmsT7qodIO4TY4uac/i8YHjtoWJdYdCrAgtHxaiQTqwcz6
         r1qKLo6A6B08kcuKlwYOFEELWlp5PQ38iDsMKtTofmIiB4ChfbISTqs664ZZMCWUOaIL
         U4dXHtBnh/J8AEaA9lLcg7Ly7rAf6EZ6KlZEOwvPS7ih2sKkBnADENePo1jY+QhsZ6bS
         SvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vXrwDr0YFDwAtsK2tMZswu9M+BSg86apvchcrJCfjWA=;
        b=O0XObSKI5D/DADA5/+rfFcTg1+0hMmlV8nOHvXN9CEuikwPcUoXIuNl5vzofHcmDge
         T9Dwm+0hH1Lr531qMkOXyo3n3Hz/WtHM1leKaVfNY6b2AR82AGr+paSMR47wf6qM0ss5
         hgS0pDt/bQmYzFG6U25lEWOLz928QY1SbXcAZGDFWaMQAEVkQmiBRnvu6Tt8mINK19+b
         /CZ2MP4DMAGqBj37nblLOrcqIM5SpbPoF/XGWDoyaet/Ec/8V72PMrF1b0zOK1H9dZON
         7mBmwl4Jt8d4I3+PKInIy6UrNL0SdK83uBfjGb+bXcoRZy2V00vjdNTw6xBLDTa546Kz
         M73g==
X-Gm-Message-State: AOAM5306m9wDFBkClvNqAxS14kKUxtng/23SwbzijTPOp7sX/Dh1bTrb
	KAHgFhqiLJb4Eglq8M+wTjP/i1T8KzUik7xstHCYlg==
X-Google-Smtp-Source: 
 ABdhPJxxVhcXv3QyNINlWC8mCyTI9ZgTk2bVXASTmIQ+omwMDd2forFHqSWFk41haFx0pgWUuzKkdv3yoE8FNPkdqMk=
X-Received: by 2002:a05:6402:4414:b0:408:4dc0:3ee9 with SMTP id
 y20-20020a056402441400b004084dc03ee9mr19766976eda.203.1646058810297; Mon, 28
 Feb 2022 06:33:30 -0800 (PST)
MIME-Version: 1.0
References: <16D7AB40BCEC638A.13349@lists.openembedded.org>
In-Reply-To: <16D7AB40BCEC638A.13349@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 28 Feb 2022 04:33:19 -1000
Message-ID: 
 <CAOSpxdasQ3kC+n=7U1-dR0GKtfKv+U+3o8zH=Zw9fSw-UqA+qw@mail.gmail.com>
Subject: Re: [OE-core] OE-core CVE metrics for dunfell on Sun 27 Feb 2022
 04:30:01 AM HST
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org,
	yocto-security@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 14:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162500

On Sun, Feb 27, 2022 at 4:34 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> Branch: dunfell
>
> New this week: 6 CVEs
> CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> CVE-2022-25235: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25235 *
> CVE-2022-25236: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25236 *
> CVE-2022-25313: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
> CVE-2022-25314: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
> CVE-2022-25315: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *

I'm working on fixes for the above expat CVEs

Steve


>
> Removed this week: 36 CVEs
> CVE-2020-15999: freetype:freetype-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15999 *
> CVE-2021-33833: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
> CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
> CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
> CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
> CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
> CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
> CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
> CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
> CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
> CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
> CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
> CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
> CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
> CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
> CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
> CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
> CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
> CVE-2022-0359: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0359 *
> CVE-2022-0361: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0361 *
> CVE-2022-0368: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0368 *
> CVE-2022-0392: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0392 *
> CVE-2022-0393: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0393 *
> CVE-2022-0407: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0407 *
> CVE-2022-0408: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0408 *
> CVE-2022-0413: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0413 *
> CVE-2022-0417: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0417 *
> CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *
> CVE-2022-0554: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0554 *
> CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
> CVE-2022-23096: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
> CVE-2022-23097: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
> CVE-2022-23098: connman https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
> CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
> CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
> CVE-2022-23990: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23990 *
>
> Full list:  Found 90 unpatched CVEs
> CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
> CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
> CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
> CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
> CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
> CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
> CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
> CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
> CVE-2020-16590: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
> CVE-2020-16591: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
> CVE-2020-16599: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
> CVE-2020-17380: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
> CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
> CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
> CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
> CVE-2020-27749: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
> CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
> CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
> CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
> CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
> CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
> CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
> CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
> CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
> CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
> CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
> CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
> CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
> CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
> CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
> CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
> CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
> CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
> CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
> CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
> CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
> CVE-2021-28966: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28966 *
> CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
> CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
> CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
> CVE-2021-33195: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33195 *
> CVE-2021-33198: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33198 *
> CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
> CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
> CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
> CVE-2021-3472: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3472 *
> CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
> CVE-2021-36221: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *
> CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
> CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
> CVE-2021-38297: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
> CVE-2021-39293: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39293 *
> CVE-2021-4008: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4008 *
> CVE-2021-4009: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4009 *
> CVE-2021-4010: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4010 *
> CVE-2021-4011: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4011 *
> CVE-2021-4145: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4145 *
> CVE-2021-4160: openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4160 *
> CVE-2021-41771: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
> CVE-2021-41772: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
> CVE-2021-41817: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41817 *
> CVE-2021-41819: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41819 *
> CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
> CVE-2021-44716: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44716 *
> CVE-2021-44717: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44717 *
> CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
> CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
> CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
> CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *
> CVE-2021-45481: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
> CVE-2021-45482: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
> CVE-2021-45483: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
> CVE-2021-45944: ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
> CVE-2021-45949: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45949 *
> CVE-2022-0529: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> CVE-2022-0530: unzip:unzip-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> CVE-2022-0561: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
> CVE-2022-0562: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
> CVE-2022-23772: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23772 *
> CVE-2022-23773: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23773 *
> CVE-2022-23806: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23806 *
> CVE-2022-24975: git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> CVE-2022-25235: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25235 *
> CVE-2022-25236: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25236 *
> CVE-2022-25313: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
> CVE-2022-25314: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
> CVE-2022-25315: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162435): https://lists.openembedded.org/g/openembedded-core/message/162435
> Mute This Topic: https://lists.openembedded.org/mt/89429163/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

