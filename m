Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D4A0C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Feb 2022 14:26:28 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.12337.1645021587455274405
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:26:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TuyYETbo;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id vz16so5094375ejb.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Feb 2022 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KTC3fYP0AtoUWDKowfI3j6kxpGsapvzT04FcQFQUoxk=;
        b=TuyYETboCmEqBKN+4zu5PTztinvSCGkQZQJd4FznZPnOUeGZgughY8HwKLXYRqTJqB
         Cj0rERVlwayCuJhTgDlVYuDpjKhjf3mBwnA6UqRxXCFRHcZTCP9GjGd01N0fRAZX1wMW
         vyHgnMynjQvLA17wbLBtLT/DX7rBuLQny63ZcRBiR3JLke5Fm58plifdxeXxt/5KfvZp
         NI8tEgRmkZ6dmxr1uc4/pUf2ETGeq3TORlY8gNoyVnniAOqEW0oRyqCcWhotpJBMg8UP
         9tT1FgJNxCq10fS/hOjlYdh77SIg4P+63pe6JY+DrXvl96RYUDDF7ZE2IJ0VUUjG0ed6
         rBjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KTC3fYP0AtoUWDKowfI3j6kxpGsapvzT04FcQFQUoxk=;
        b=rZqWowO7TYIXQ3RtCGUu31uaR7RXUR31JHzy6dIG6kgj1V/PGtdUiDne69lXV0oQ0T
         2scQtzuFxW7sCD+Df+WIO+IhphjBoV2XkiAzTedQDy/FZHmXazljHffAe9DpLW0PAhRC
         5V2C3/36XXPYaqeO/87gwNImPfsXuX/ZNqLrCZZ90XqqMQDzazqY6JmzxX/oHbonI7Fp
         p8398R2OEqjz5vkSZ6fHZEm6/k3e5M2Dv6JwbHkRF71WLJB5QxNBY1u8Yu/i5isAjlx3
         SpVJYf6eftDzoIz2m5+Acj+qfTu5A7wn+YCzQXazUix6wHBsv4opcADH39Rd6D/8ClU3
         p88A==
X-Gm-Message-State: AOAM5335ES1c2+6DuMhe4Lgj7UnoOyNyI+TAykIxXBx/bYo88Baq1gA9
	fJA1+Bmer09DXxhOJ5d06UKmTQcoENP0ZzLaZBcT2w==
X-Google-Smtp-Source: 
 ABdhPJzys6mjmNV+wSZj7hU0Qx9gpZZ6VkzUpGNMni0QI7F7wpqkALThbGm2E1DuLQFBSjRY3zD85wmqar+Zkw0r+qE=
X-Received: by 2002:a17:906:6d09:b0:6b9:2e0e:5bdd with SMTP id
 m9-20020a1709066d0900b006b92e0e5bddmr2395058ejr.246.1645021585495; Wed, 16
 Feb 2022 06:26:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644946036.git.steve@sakoman.com>
 <CACpMEhN3+9xDYLdyNfoBEnS6kEt+AvOr1ovb3iq9GD8uzu__NA@mail.gmail.com>
In-Reply-To: 
 <CACpMEhN3+9xDYLdyNfoBEnS6kEt+AvOr1ovb3iq9GD8uzu__NA@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 16 Feb 2022 04:26:14 -1000
Message-ID: 
 <CAOSpxdYaZmzDPeaX45YBQpEu7E1TzZ_OZ6gwa4+K2ZresWV6bg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 00/20] Pull request (cover letter only)
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Feb 2022 14:26:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161779

On Tue, Feb 15, 2022 at 9:34 PM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> May I know by when this will be available on dunfell branch?

It should be available now!

Steve

> On Tue, 15 Feb, 2022, 10:59 pm Steve Sakoman, <steve@sakoman.com> wrote:
>>
>> The following changes since commit f3be01483b01c88f8c4ba24ca73ccf1bcc33665c:
>>
>>   build-appliance-image: Update to dunfell head revision (2022-01-27 16:16:08 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
>>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next
>>
>> Alexander Kanavin (1):
>>   libusb1: correct SRC_URI
>>
>> Joshua Watt (5):
>>   tzdata: Remove BSD License specifier
>>   e2fsprogs: Use specific BSD license variant
>>   glib-2.0: Use specific BSD license variant
>>   shadow: Use specific BSD license variant
>>   libcap: Use specific BSD license variant
>>
>> Marek Vasut (1):
>>   binutils: Backport Include members in the variable table used when
>>     resolving DW_AT_specification tags.
>>
>> Marta Rybczynska (2):
>>   grub: add a fix for CVE-2020-25632
>>   grub: add a fix for CVE-2020-25647
>>
>> Minjae Kim (1):
>>   ghostscript: fix CVE-2021-45949
>>
>> Peter Kjellerstedt (1):
>>   sstate: A third fix for for touching files inside pseudo
>>
>> Purushottam Choudhary (1):
>>   systemd: Fix CVE-2021-3997
>>
>> Ranjitsinh Rathod (1):
>>   util-linux: Fix for CVE-2021-3995 and CVE-2021-3996
>>
>> Ross Burton (2):
>>   lsof: correct LICENSE
>>   shadow-sysroot: sync license with shadow
>>
>> Rudolf J Streif (1):
>>   linux-firmware: Add CLM blob to linux-firmware-bcm4373 package
>>
>> Steve Sakoman (4):
>>   glibc: update to lastest 2.31 release HEAD
>>   expat: fix CVE-2022-23852
>>   expat: add missing Upstream-status, CVE tag and sign-off to
>>     CVE-2021-46143.patch
>>   common-licenses: add Spencer-94
>>
>>  meta/classes/sstate.bbclass                   |  14 +-
>>  meta/files/common-licenses/Spencer-94         |  12 +
>>  .../grub/files/CVE-2020-25632.patch           |  90 +++++
>>  .../grub/files/CVE-2020-25647.patch           | 119 +++++++
>>  meta/recipes-bsp/grub/grub2.inc               |   2 +
>>  .../expat/expat/CVE-2021-46143.patch          |   6 +
>>  .../expat/expat/CVE-2022-23852.patch          |  33 ++
>>  meta/recipes-core/expat/expat_2.2.9.bb        |   1 +
>>  meta/recipes-core/glib-2.0/glib.inc           |   2 +-
>>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>>  meta/recipes-core/glibc/glibc_2.31.bb         |   1 +
>>  .../systemd/systemd/CVE-2021-3997-1.patch     |  65 ++++
>>  .../systemd/systemd/CVE-2021-3997-2.patch     | 101 ++++++
>>  .../systemd/systemd/CVE-2021-3997-3.patch     | 266 +++++++++++++++
>>  ...-fsync-after-removing-directory-tree.patch |  35 ++
>>  ...children-split-out-body-of-directory.patch | 318 ++++++++++++++++++
>>  meta/recipes-core/systemd/systemd_244.5.bb    |   5 +
>>  .../util-linux/util-linux/CVE-2021-3995.patch | 139 ++++++++
>>  .../util-linux/util-linux/CVE-2021-3996.patch | 226 +++++++++++++
>>  ...ude-strutils-cleanup-strto-functions.patch | 270 +++++++++++++++
>>  .../util-linux/util-linux_2.35.1.bb           |   3 +
>>  .../binutils/binutils-2.34.inc                |   1 +
>>  ...in-the-variable-table-used-when-reso.patch |  32 ++
>>  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
>>  .../ghostscript/CVE-2021-45949.patch          |  65 ++++
>>  ...tack-limits-after-function-evalution.patch |  51 +++
>>  .../ghostscript/ghostscript_9.52.bb           |   2 +
>>  meta/recipes-extended/lsof/lsof_4.91.bb       |   2 +-
>>  .../shadow/shadow-sysroot_4.6.bb              |   2 +-
>>  meta/recipes-extended/shadow/shadow.inc       |   2 +-
>>  meta/recipes-extended/timezone/timezone.inc   |   2 +-
>>  .../linux-firmware/linux-firmware_20211216.bb |   1 +
>>  meta/recipes-support/libcap/libcap_2.32.bb    |   2 +-
>>  meta/recipes-support/libusb/libusb1_1.0.22.bb |   4 +-
>>  34 files changed, 1863 insertions(+), 15 deletions(-)
>>  create mode 100644 meta/files/common-licenses/Spencer-94
>>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25632.patch
>>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2020-25647.patch
>>  create mode 100644 meta/recipes-core/expat/expat/CVE-2022-23852.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-1.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-2.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/CVE-2021-3997-3.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-optionally-fsync-after-removing-directory-tree.patch
>>  create mode 100644 meta/recipes-core/systemd/systemd/rm-rf-refactor-rm-rf-children-split-out-body-of-directory.patch
>>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3995.patch
>>  create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2021-3996.patch
>>  create mode 100644 meta/recipes-core/util-linux/util-linux/include-strutils-cleanup-strto-functions.patch
>>  create mode 100644 meta/recipes-devtools/binutils/binutils/0018-Include-members-in-the-variable-table-used-when-reso.patch
>>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2021-45949.patch
>>  create mode 100644 meta/recipes-extended/ghostscript/ghostscript/check-stack-limits-after-function-evalution.patch
>>
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#161757): https://lists.openembedded.org/g/openembedded-core/message/161757
>> Mute This Topic: https://lists.openembedded.org/mt/89166126/6360406
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ranjitsinhrathod1991@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

