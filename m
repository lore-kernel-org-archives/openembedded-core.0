Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AB4C25B08
	for <webhook@archiver.kernel.org>; Sun,  7 Aug 2022 21:21:03 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com
 [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.web10.18224.1659907262240306377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 14:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LZTcum4k;
 spf=pass (domain: gmail.com, ip: 209.85.128.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-31f445bd486so63238407b3.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 14:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=ReWqFfq+3s571O50TspR9522Kr3OTyD3q2W0vP7CxFQ=;
        b=LZTcum4k6J+2x6HTxgcjxj4qW0OHyPePYVIcydVKIBh5vtUExXU5It4Ohoiw5J1iCc
         HaNTASe6YzSKrDsDZnra/4TDg142Wn1CBbzsLWpsD3kUam4swwDYtns+CNDzdikBOmEl
         yDC3W7Pg/frmLO35v7NXoypVWoR4rKgH+g6BcauGnVT1haYJ+fMqOYRnfz9NaxeLC1Ey
         z5rcqJzb0TaIefkrxGJLRhZG3X3Mxw1kStAskwRgeB8y2cXhgIgoyWCgwxhU+AL1v02s
         qGkZtwn1t+RH8t/6LIQu0wOcghExsTcn+/ISIS2yRVw7NO5r2D1doFwG9AlvvZ6HFBtf
         d7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=ReWqFfq+3s571O50TspR9522Kr3OTyD3q2W0vP7CxFQ=;
        b=qkEXw1UaQga8si7hz2bGPawYdPCal69FTXQHErElkZQAmyO57jihlz0FX5vG/VR2FL
         pq6Z8YBuoQvkbOaTd6MeF83Upz/de2nauYjNJz4YFljR0S+tWB5R673+iJu6WRiKO1v9
         7EJEClkaNPI2aQPXvo9Iz6osJGhIrdKnPr9PEdS/GnEqQcDOFfqrheP8nKTUF9L3RHKF
         oSy2F4j4EPVY1He1qZFb1vY6IcWPEMDQ8ARtDvt63som5OvFjQU5X7DwDyxLSPzY1kUf
         oJNY6rlzosB5uGeYsDd5PRs9wbYTaK5CPwEwQOB+u6hjyeLM2OC6AGSawRoLStAsbmbo
         wtpg==
X-Gm-Message-State: ACgBeo1G50qR1rsIA52k7hMXwMS+p/j18wonr/e7Tu6TFcdpADC9cdg9
	EpRYkmR4Se/XXoNpf4gxr8yr8aOIWsDH3WJ1wHY=
X-Google-Smtp-Source: 
 AA6agR6xFTNU1DAaVT6LVr/NWWJ0/6rdtL7R0jS+9j6anhnLDy+KB2/Jidz62hPW2FjTQqfx4QDmmYng3qQSBVFTCP4=
X-Received: by 2002:a81:490d:0:b0:324:5fe9:d637 with SMTP id
 w13-20020a81490d000000b003245fe9d637mr15071990ywa.162.1659907261314; Sun, 07
 Aug 2022 14:21:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220807160629.2112131-1-raj.khem@gmail.com>
 <CA+chaQcHJX84EmQgpRD3S+LS3ohPXSkET5u=drA1tU7RaPy6vw@mail.gmail.com>
 <CAMKF1spY8cyJSv1jDWF4taAn-dYGXKa==8jUML=z34qkqd+b9g@mail.gmail.com>
 <CA+chaQe3DB+oQokk5TNpxiyBWg60zP6DAV7m4zRCM7M=E7Bj8Q@mail.gmail.com>
In-Reply-To: 
 <CA+chaQe3DB+oQokk5TNpxiyBWg60zP6DAV7m4zRCM7M=E7Bj8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 7 Aug 2022 14:20:34 -0700
Message-ID: 
 <CAMKF1sp-u+7i3XTVVD29KKcp8dKoJgqOij7pSoeHcGGVApK8Tw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] binutils: Upgrade to 2.39 release
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Aug 2022 21:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169006

On Sun, Aug 7, 2022 at 12:00 PM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Thanks Khem,
>
> v3 builds fine with gprofng enabled again.
>
> Tested-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> any idea why binutils-2.39 v3 version isn't visible on patchwork yet?
> https://patchwork.yoctoproject.org/project/oe-core/list/?series=&submitter=&state=*&q=binutils&archive=&delegate=
> it's almost 1,5 hour since you sent it to ML https://lists.openembedded.org/g/openembedded-core/message/169001
>
> Usually patchwork doesn't have such long delay (v2 was there shortly after I've noticed it in my mbox).
>

I am not sure, sometimes patchwork chokes on largish patches, and this
patch is large, especially v3 has bigger 0008-Use-libtool-2.4.patch
grew to 1.2M from 1M in v2. Perhaps it crossed some sort of size
boundary perhaps.

> On Sun, Aug 7, 2022 at 7:37 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Sun, Aug 7, 2022 at 9:41 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>> >
>> >
>> >
>> > On Sun, Aug 7, 2022 at 6:06 PM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> Details of changes [1]
>> >>
>> >> [1] https://sourceware.org/pipermail/binutils/2022-August/122246.html
>> >>
>> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> >> ---
>> >> v2: Remove trailing .0 from PV
>> >>
>> >>  meta/conf/distro/include/tcmode-default.inc   |    2 +-
>> >>  .../{binutils-2.38.inc => binutils-2.39.inc}  |   26 +-
>> >>  ....38.bb => binutils-cross-canadian_2.39.bb} |    0
>> >>  ...38.bb => binutils-cross-testsuite_2.39.bb} |    0
>> >>  ...s-cross_2.38.bb => binutils-cross_2.39.bb} |    0
>> >>  ...ssdk_2.38.bb => binutils-crosssdk_2.39.bb} |    0
>> >>  ...s-crosssdk-Generate-relocatable-SDKs.patch |    2 +-
>> >>  ...o-not-generate-linker-script-directo.patch |    2 +-
>> >>  ...dk-Search-for-alternative-ld.so.conf.patch |   16 +-
>> >>  ...004-Point-scripts-location-to-libdir.patch |   10 +-
>> >>  ...tro-compiler-point-to-the-wrong-ins.patch} |    2 +-
>> >>  ...system-directories-when-cross-linki.patch} |   42 +-
>> >>  ...ct-assembling-for-ppc-wait-mnemonic.patch} |    8 +-
>> >>  ...l-2.4.patch => 0008-Use-libtool-2.4.patch} | 2131 ++++++++---------
>> >>  ...-in-libtool-when-sysroot-is-enabled.patch} |    2 +-
>> >>  ...> 0010-sync-with-OE-libtool-changes.patch} |    2 +-
>> >>  ...r-clang-before-checking-gcc-version.patch} |   10 +-
>> >>  ...RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} |   17 +-
>> >>  .../0013-Avoid-as-info-race-condition.patch   |   75 -
>> >>  .../binutils/0014-CVE-2019-1010204.patch      |   49 -
>> >>  .../{binutils_2.38.bb => binutils_2.39.bb}    |    0
>> >>  21 files changed, 1129 insertions(+), 1267 deletions(-)
>> >>  rename meta/recipes-devtools/binutils/{binutils-2.38.inc => binutils-2.39.inc} (60%)
>> >>  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.38.bb => binutils-cross-canadian_2.39.bb} (100%)
>> >>  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.38.bb => binutils-cross-testsuite_2.39.bb} (100%)
>> >>  rename meta/recipes-devtools/binutils/{binutils-cross_2.38.bb => binutils-cross_2.39.bb} (100%)
>> >>  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.38.bb => binutils-crosssdk_2.39.bb} (100%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0006-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch => 0005-don-t-let-the-distro-compiler-point-to-the-wrong-ins.patch} (94%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0007-warn-for-uses-of-system-directories-when-cross-linki.patch => 0006-warn-for-uses-of-system-directories-when-cross-linki.patch} (91%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0008-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch => 0007-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch} (85%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0009-Use-libtool-2.4.patch => 0008-Use-libtool-2.4.patch} (95%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0010-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch => 0009-Fix-rpath-in-libtool-when-sysroot-is-enabled.patch} (96%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0011-sync-with-OE-libtool-changes.patch => 0010-sync-with-OE-libtool-changes.patch} (97%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0012-Check-for-clang-before-checking-gcc-version.patch => 0011-Check-for-clang-before-checking-gcc-version.patch} (84%)
>> >>  rename meta/recipes-devtools/binutils/binutils/{0005-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch => 0012-Only-generate-an-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch} (70%)
>> >>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-Avoid-as-info-race-condition.patch
>> >>  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2019-1010204.patch
>> >>  rename meta/recipes-devtools/binutils/{binutils_2.38.bb => binutils_2.39.bb} (100%)
>> >
>> >
>> > I'm seeing bunch of libtool erros with this applied, see:
>> > http://errors.yoctoproject.org/Errors/Details/664878/
>>
>> yes. gprofng is a new tool and I have forgotten to upgrade it to use
>> libtool 2.4 since I have it disabed in my testing. I have done so now
>> and sent a v3. Try it out.

