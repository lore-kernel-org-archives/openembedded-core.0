Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADE74C433F5
	for <webhook@archiver.kernel.org>; Sun,  8 May 2022 14:50:36 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.21207.1652021434119734979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 07:50:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=cY7r5Uf7;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id c12so6128826edv.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 08 May 2022 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1rAFlHdAGF8tfmvm5bZMS/KA+MFOGMG9N/LtRG93etE=;
        b=cY7r5Uf7Vge8/5XM/dFSkhyWKOeLiOzxlNyMhTN8zqGbxFFOxtX5D6sdLmg7nKQVdB
         EqOuCSViJQfAlt8msW6GTc3TBNfTDR8tR+XnMhSlZJXT7FASGauH7Uee1pxROYi7z3ZX
         s5N2z1Tc8LvEpY4aYDMGGOowwfVtgWVb2d7czhV0ZJfagxyckTgliQQtYMD/i2tQn41E
         ukGZdrMOrZudshbxyJI8/AsJLe/L3mscsW79d37WD5fsR37L4RD1CFLrlUSEbW0/BVvi
         BZuFX4WenhdFyaXvgoXev6/pGteucGsd/GJNoOb6BD27E35Lb7Ax0KBeuKiEbFrUpN3V
         rDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1rAFlHdAGF8tfmvm5bZMS/KA+MFOGMG9N/LtRG93etE=;
        b=DdtKDwbBl+tfTcxWJVsUyuTJs1Pz+vvyiLIy764h7l74E56jbyqm3ARCblQpQOShRy
         +Qqa0tGCd1xHAfENRouzGuXlnBST6eMT3NCIdhlXcm6v6JorpYY3aqNE9eVSqSAhU5tk
         aARO+qUsQdel6IGETAia7JfZ0Oyi1Y/DAyR5JVKilgRrRIX6dzezRuqbcfQk+Wz9fIb3
         9qrff7K6Rhcl+fxe9WMy/0BXsTZEAqJkzWXSg4lqnSSpALoildUH1vP7BKoHplVcX4bm
         6ri1Qf3jEExqmuucoHGOgO+v1Gfxg6vfizL3tB4gasXRvP1LZLKUDGgnEg84lVqcvJmR
         a3VA==
X-Gm-Message-State: AOAM531KVmeQU3yKybhMkQX3bjQR3QwG0aXgcFG2tjxXrJmdaNfcWf/4
	4jBYdP5NQFkeuwFvEx4OO7kTjzBnQsMGh1Ap9f/Oaw==
X-Google-Smtp-Source: 
 ABdhPJzJ6lo/32W8BHqfICeNYOH1RQVgXNHXTDcFQUTFM10f9P2V38tMynZZaoXaQI8c9FnIF6pGXQlolp308Ghw2ao=
X-Received: by 2002:a05:6402:2309:b0:41f:a5a9:fe13 with SMTP id
 l9-20020a056402230900b0041fa5a9fe13mr12956606eda.123.1652021432236; Sun, 08
 May 2022 07:50:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220508130536.67CDF9626EB@nuc.router0800d9.com>
 <526c4e703df04fe4610401bf97759488c2cb8921.camel@intel.com>
In-Reply-To: <526c4e703df04fe4610401bf97759488c2cb8921.camel@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 8 May 2022 04:50:20 -1000
Message-ID: 
 <CAOSpxdZbT1gcrEjaFCMgtiHMX0_SV27FfQzJELgbFY=eKgtHQg@mail.gmail.com>
Subject: Re: [yocto-security] OE-core CVE metrics for hardknott on Sun 08 May
 2022 03:00:01 AM HST
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"yocto-security@lists.yoctoproject.org"
 <yocto-security@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 May 2022 14:50:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165379

On Sun, May 8, 2022 at 4:35 AM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> Should we stop tracking numbers for hardknott since it's no longer
> maintained?

Yes, this will be the last one.

Steve

> On Sun, 2022-05-08 at 03:05 -1000, Steve Sakoman wrote:
> > Branch: hardknott
> >
> > New this week: 5 CVEs
> > CVE-2022-0908 (CVSS3: 5.5 MEDIUM): tiff
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
> > CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
> > CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
> > CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
> > CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
> >
> > Removed this week: 0 CVEs
> >
> > Full list:  Found 68 unpatched CVEs
> > CVE-2013-0340 (CVSS3: N/A): expat:expat-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
> > CVE-2015-20107 (CVSS3: 9.8 CRITICAL): python3:python3-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-20107 *
> > CVE-2016-20012 (CVSS3: 5.3 MEDIUM): openssh
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
> > CVE-2019-12067 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
> > CVE-2020-18974 (CVSS3: 3.3 LOW): nasm:nasm-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
> > CVE-2020-35503 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
> > CVE-2021-20255 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
> > CVE-2021-25220 (CVSS3: 8.6 HIGH): bind
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25220 *
> > CVE-2021-27645 (CVSS3: 2.5 LOW): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27645 *
> > CVE-2021-28544 (CVSS3: 4.3 MEDIUM): subversion
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28544 *
> > CVE-2021-31879 (CVSS3: 6.1 MEDIUM): wget
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
> > CVE-2021-33574 (CVSS3: 9.8 CRITICAL): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
> > CVE-2021-33657 (CVSS3: 8.8 HIGH): libsdl2:libsdl2-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33657 *
> > CVE-2021-33833 (CVSS3: 9.8 CRITICAL): connman
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33833 *
> > CVE-2021-33928 (CVSS3: 7.5 HIGH): libsolv
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33928 *
> > CVE-2021-33929 (CVSS3: 7.5 HIGH): libsolv
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33929 *
> > CVE-2021-33930 (CVSS3: 7.5 HIGH): libsolv
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33930 *
> > CVE-2021-33938 (CVSS3: 7.5 HIGH): libsolv
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33938 *
> > CVE-2021-3445 (CVSS3: 7.5 HIGH): libdnf
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
> > CVE-2021-3507 (CVSS3: 6.1 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
> > CVE-2021-36368 (CVSS3: 3.7 LOW): openssh
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36368 *
> > CVE-2021-3638 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3638 *
> > CVE-2021-38604 (CVSS3: 7.5 HIGH): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38604 *
> > CVE-2021-3947 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-
> > native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3947 *
> > CVE-2021-42376 (CVSS3: 5.5 MEDIUM): busybox
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376 *
> > CVE-2021-45481 (CVSS3: 6.5 MEDIUM): webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45481 *
> > CVE-2021-45482 (CVSS3: 6.5 MEDIUM): webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45482 *
> > CVE-2021-45483 (CVSS3: 6.5 MEDIUM): webkitgtk
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45483 *
> > CVE-2021-45944 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45944 *
> > CVE-2021-46705 (CVSS3: 5.5 MEDIUM): grub:grub-efi:grub-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46705 *
> > CVE-2022-0204 (CVSS3: 8.8 HIGH): bluez5
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0204 *
> > CVE-2022-0396 (CVSS3: 5.3 MEDIUM): bind
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0396 *
> > CVE-2022-0529 (CVSS3: 5.5 MEDIUM): unzip:unzip-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0529 *
> > CVE-2022-0530 (CVSS3: 5.5 MEDIUM): unzip:unzip-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0530 *
> > CVE-2022-0561 (CVSS3: 5.5 MEDIUM): tiff
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0561 *
> > CVE-2022-0562 (CVSS3: 5.5 MEDIUM): tiff
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0562 *
> > CVE-2022-0563 (CVSS3: 5.5 MEDIUM): util-linux:util-linux-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0563 *
> > CVE-2022-0891 (CVSS3: 7.1 HIGH): tiff
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0891 *
> > CVE-2022-0908 (CVSS3: 5.5 MEDIUM): tiff
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0908 *
> > CVE-2022-0943 (CVSS3: 7.8 HIGH): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0943 *
> > CVE-2022-1050 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1050 *
> > CVE-2022-1154 (CVSS3: 9.8 CRITICAL): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1154 *
> > CVE-2022-1160 (CVSS3: 7.8 HIGH): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1160 *
> > CVE-2022-1381 (CVSS3: 7.8 HIGH): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1381 *
> > CVE-2022-1420 (CVSS3: 5.5 MEDIUM): vim
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1420 *
> > CVE-2022-23096 (CVSS3: 9.1 CRITICAL): connman
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23096 *
> > CVE-2022-23097 (CVSS3: 9.1 CRITICAL): connman
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23097 *
> > CVE-2022-23098 (CVSS3: 7.5 HIGH): connman
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23098 *
> > CVE-2022-23218 (CVSS3: 9.8 CRITICAL): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23218 *
> > CVE-2022-23219 (CVSS3: 9.8 CRITICAL): glibc
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23219 *
> > CVE-2022-23303 (CVSS3: 9.8 CRITICAL): wpa-supplicant
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
> > CVE-2022-23304 (CVSS3: 9.8 CRITICAL): wpa-supplicant
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
> > CVE-2022-24070 (CVSS3: 7.5 HIGH): subversion
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24070 *
> > CVE-2022-24675 (CVSS3: 7.5 HIGH): go
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24675 *
> > CVE-2022-24765 (CVSS3: 7.8 HIGH): git
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24765 *
> > CVE-2022-24975 (CVSS3: 7.5 HIGH): git
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-24975 *
> > CVE-2022-25313 (CVSS3: 6.5 MEDIUM): expat:expat-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25313 *
> > CVE-2022-25314 (CVSS3: 7.5 HIGH): expat:expat-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25314 *
> > CVE-2022-25315 (CVSS3: 9.8 CRITICAL): expat:expat-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-25315 *
> > CVE-2022-26354 (CVSS3: 3.2 LOW): qemu:qemu-native:qemu-system-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26354 *
> > CVE-2022-26488 (CVSS3: 7.0 HIGH): python3:python3-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-26488 *
> > CVE-2022-27404 (CVSS3: 9.8 CRITICAL): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27404 *
> > CVE-2022-27405 (CVSS3: 7.5 HIGH): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27405 *
> > CVE-2022-27406 (CVSS3: 7.5 HIGH): freetype:freetype-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-27406 *
> > CVE-2022-28327 (CVSS3: 7.5 HIGH): go
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28327 *
> > CVE-2022-28391 (CVSS3: 9.8 CRITICAL): busybox
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-28391 *
> > CVE-2022-29458 (CVSS3: 7.1 HIGH): ncurses:ncurses-native
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29458 *
> > CVE-2022-29536 (CVSS3: 7.5 HIGH): epiphany
> > https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-29536 *
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#584):
> > https://lists.yoctoproject.org/g/yocto-security/message/584
> > Mute This Topic: https://lists.yoctoproject.org/mt/90969695/3616702
> > Group Owner: yocto-security+owner@lists.yoctoproject.org
> > Unsubscribe:
> > https://lists.yoctoproject.org/g/yocto-security/unsub [anuj.mittal@intel.com
> > ]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

